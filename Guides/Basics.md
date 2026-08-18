# Basics

Grim Wild runs Lua 5.4.3 inside Unreal Engine 5.3.2. A script reads and changes the running game through the same C++ API the game itself uses.

This page covers what a script file looks like, how the engine loads and unloads it, where scripts live and what they can see of one another, how to reach the C++ side, and how to react to events. The other pages go deeper on one subject each and are listed at the end.

## Terminology

| Term | Meaning |
| --- | --- |
| Script | One `.lua` file. |
| Module | A persistent Script that is currently loaded, together with the table it returns. |
| Owner | The base game, the dev scripts, or one mod. Every Script has one, and it decides where the file lives, how it is addressed, and which other Scripts share globals with it. |

## The Two Kinds of Script

### One-Shot Scripts

Also called Fire-And-Forget, or FAF.

A One-Shot Script is a file the engine runs and then discards. It never joins the list of loaded Modules, and the engine never calls into it again.

```lua
-- ReportPawnClass.lua, a complete one-shot script, in Content/Lua/DevScripts/

local PlayerPawn = GetPlayerPawn()

if PlayerPawn then
    LogInfo("Player pawn class: " .. PlayerPawn:GetClass():GetName())
else
    LogWarn("No player pawn in this world")
end
```

There is no `return` at the end. A One-Shot Script returns nothing, and that is what tells the engine which kind it is.

Running the file again runs it from the start, and nothing from the earlier run is reused.

#### Typing One Straight Into the Console

The console command `lua.do <code>` runs what you type as a One-Shot Script owned by `Dev`. It is that and nothing else: the only difference from the files above is that there is no file on disk.

```
lua.do LogInfo(GetPlayerPawn():GetClass():GetName())
```

Everything this page says about a One-Shot Script holds for it. It sees the same globals a Dev script sees and nothing more. A listener it attaches stays attached after the command has finished, with nothing left to take it back. An error in it is reported the way an error in a Dev script file is. It is a whole script and not an expression, so `lua.do 2+2` is a syntax error, exactly as a file containing `2+2` would be. A value it returns is discarded with a warning, because there is no require path for it to become a Module under.

### Persistent Scripts

A persistent Script builds a table, fills it in, and returns it. The engine keeps that table in its list of loaded Modules, and other Scripts can reach everything in it.

This is the whole of what a persistent Script can offer the engine:

```lua
-- MyScript.lua, a complete persistent script template

local This = {}

---Whether OnTick starts running immediately after OnConstruct().
This.StartWithTickEnabled = false

---Runs once, right after this file has been loaded.
function This:OnConstruct()
end

---Runs once per frame, while ticking is enabled.
---@param DeltaTime number seconds since the previous frame
function This:OnTick(DeltaTime)
end

---Runs once, just before this Module gets unloaded.
function This:OnDestruct()
end

return This
```

`local This = {}` and `return This` are what make the file a persistent Script. The field and the three functions are each optional.

The table is always called `This`.

#### This:OnConstruct()

Purpose: everything the Script has to set up before anything else uses it.

Runs once, immediately after the file has been loaded, before the Module becomes reachable to anyone. A reload calls it again on the new table.

#### This:OnDestruct()

Purpose: undo what setup did.

Runs once, just before the Module is taken out of the loaded list: after `Unload()`, during a `Reload()`, and when the mod owning it is disabled.

Every delegate listener the Module added is removed by the engine. Everything else the Script created is yours to undo: widgets you added to the interface, actors you spawned, values you wrote into `_G`.

Fields of `This` and locals of the file do not survive a reload, because a reload produces a new table and runs the file from scratch. Anything that has to outlive one belongs outside the Script. For a mod, that place is the mod's own Dynamic State, which `DynamicState.md` covers.

[TEMPORARY] A mod does not have a Dynamic State of its own yet. Until it does, data that must outlive a reload goes onto an object in the world.

#### Ticking

A tick is one pass of the game's main loop, run once per frame. If the Module has an `OnTick()`, the engine calls it every frame while ticking is enabled.

```lua
local This = {}

This.StartWithTickEnabled = true

local ElapsedTime = 0

function This:OnTick(DeltaTime)
    ElapsedTime = ElapsedTime + DeltaTime

    if ElapsedTime >= 5.0 then
        LogInfo("Five seconds since load")
        This:SetTickEnabled(false) -- stop OnTick() execution
    end
end

return This
```

Write `StartWithTickEnabled` explicitly, `true` or `false`, in every Script that has an `OnTick()`. It costs one line and puts the state of the tick in front of whoever opens the file.

Turn ticking off with `This:SetTickEnabled(false)` once there is nothing left to do each frame. The engine pays the cost of reaching your `OnTick()` every frame whether the function does anything or not, and turning ticking off is what removes that cost.

#### The Methods the Engine Adds

The engine writes these onto your table. They are available anywhere in the Script, and you never define them yourself.

| Method | What it does |
| --- | --- |
| `This:Unload()` | Removes this Module. `OnDestruct()` runs, the automatic cleanup runs, and the Module leaves the list. |
| `This:Reload()` | Re-reads the file from disk and loads it again. |
| `This:SetTickEnabled(bEnabled)` | Turns `OnTick()` on or off. |
| `This:RemoveModuleListeners()` | Removes every listener this Module added, on every delegate. Returns how many. |
| `This:RemoveModuleListenersFrom(Delegate)` | The same, narrowed to one delegate. Returns how many. |

## Which Script Kind To Write

Answer these to pick a kind for the Script you are about to write.

| Condition | Script Kind |
| --- | --- |
| The work is over by the time the last line has run | One-Shot Script |
| It is a one-off action you trigger by hand while developing | One-Shot Script |
| It needs ticking | Persistent Script |
| It needs delegate listeners | Persistent Script |
| Another Script needs to call your functions | Persistent Script, as a library |
| You want to unload or reload it while the game is running | Persistent Script |

## Dots and Colons

Define your own functions with a dot. The three the engine calls are the exception, and they take a colon:

```lua
function This:OnConstruct() end
function This:OnTick(DeltaTime) end
function This:OnDestruct() end
```

A colon adds a hidden first parameter called `self`. The engine calls those three with the Module table, which is what fills that parameter. A callback is called with the delegate's own arguments instead, so the hidden parameter takes the place of the first one and every argument after it shifts along.

```lua
function This:OnOverlap(OtherActor)
end

-- WRONG: the colon adds a hidden self parameter, which swallows the first argument
GetPlayerPawn().OnActorBeginOverlap:Add(This.OnOverlap)
```

The engine refuses this version rather than letting it run, and the message names the shape it found. This applies everywhere a Script passes a function to the engine, not only to `Add()`.

```lua
function This.OnOverlap(OverlappedActor, OtherActor)
end

-- CORRECT: the first parameter is the first argument the delegate actually sends
GetPlayerPawn().OnActorBeginOverlap:Add(This.OnOverlap)
```

## Loading, Requiring and Unloading

Loading a Script means the engine compiles the file and runs it. For a persistent Script it then calls `OnConstruct()` and puts the Module in its list. Unloading a Module means taking it back out: `OnDestruct()` runs, the automatic cleanup runs, and the table is gone. One-Shot Scripts are never in the list, so there is nothing about them to unload.

`require()` loads any Script by its require path and runs it.

```lua
local CommonLib = require("Dev.Lib.CommonLib")
```

Persistent Scripts get cached. The first `require()` runs the file and its `OnConstruct()`; every later `require()` gives back the same table without running anything again. One-Shot Scripts are never cached, so every `require()` runs the file again in full.

Three global functions act on a Script other than the one calling them, addressed by require path.

```lua
if IsScriptLoaded("Mod_MyMod.Systems.Weather") then
    ReloadScript("Mod_MyMod.Systems.Weather")
end
```

| Function | Returns |
| --- | --- |
| `IsScriptLoaded(Path)` | whether a Module is loaded at that path |
| `UnloadScript(Path)` | whether the Module was loaded when the call was made |
| `ReloadScript(Path)` | whether the reload succeeded |

`UnloadScript()` and `ReloadScript()` work on loaded persistent Modules. Given the path of a One-Shot Script, or of something that is not loaded, they write a warning to the log and do nothing.

`ScriptLifecycle.md` covers load order, the reload cascade and the failure cases in full.

## Owners

Every Script has one Owner, and the Owner is the first part of its require path.

| Owner | Prefix | Scripts live in | What it is for | Require path example |
| --- | --- | --- | --- | --- |
| The base game | `Base` | `Content/Lua/Scripts/` | Scripts the game runs during normal play | `Base.Robots.Brain` |
| Dev scripts | `Dev` | `Content/Lua/DevScripts/` | Debugging the game and mods | `Dev.TraceUnwantedObjects` |
| A mod | `Mod_<mod id>` | that mod's own `Scripts/` folder | Everything the mod ships | `Mod_MyMod.Main` |

`Mod_` is put in front of the mod id when the path is built. It is not part of any folder name on disk.

### Require Paths

A require path is the Owner prefix, then the path inside that Owner's script folder, with folders written as dots and `.lua` left off. A file at `<mod folder>/Scripts/Systems/Weather.lua`, in a mod whose id is `MyMod`, is:

```lua
local Weather = require("Mod_MyMod.Systems.Weather")
```

`require()` ignores case, so a path copied out of a log message works as well as one typed to match the folder names.

Do not put a dot in the name of a script file, or of a folder inside a script folder. Dots separate the parts of a path, and a file named that way is skipped.

### Requiring Another Owner's Scripts

You can require Scripts belonging to another Owner. A mod can use a library published by another mod, or one of the game's own. Two things to know before relying on it.

Dev scripts ship with the game and can be required, but they exist for developing and debugging it. Their contents, and the Scripts themselves, may change between game versions without notice.

A mod you require has to be enabled. If the player has turned it off, your `require()` finds nothing.

### Variables and Who Can See Them

Three ways to declare something:

```lua
local PrivateCounter = 0   -- accessible to this script only
SharedCounter = 0          -- accessible to every script of this Owner
_G.GlobalCounter = 0       -- accessible to every script in the game
```

An assignment without `local` is not an ordinary Lua global. It goes into your Owner's own table of globals, so the other Scripts of the same Owner can see it and nobody else can. Requiring another Owner's library does not give you its globals, and does not give it yours.

`_G.Name = value` is the deliberate way out. Anything in `_G` is visible to every mod, to the dev scripts and to the game, and the last write wins. There is one Lua state for the whole game and no sandbox around an Owner; what is separated is names, nothing more. Publish under a name carrying your mod id, and do not trust a global you did not write.

The other way across is the table a `require()` hands back. A function published there still runs against its own Owner's globals, so it can hand out a value the caller could never read directly.

```lua
-- CounterLib.lua, a complete persistent script, in some other mod's Scripts/ folder

local This = {}

SharedCounter = 0

function This.Increment()
    SharedCounter = SharedCounter + 1
    return SharedCounter
end

return This
```

```lua
local CounterLib = require("Mod_SomeOtherMod.CounterLib")

-- SharedCounter belongs to the other Owner and is unreachable by name from here
LogInfo("Counter is now " .. tostring(CounterLib.Increment()))
```

## Reaching the C++ Side

### Global Getters

Global functions return the engine-side objects a Script starts from.

```lua
local World = GetWorld()
local Pawn = GetPlayerPawn()
local Options = GetGameOptions()
```

Several come in pairs, one for the game map and one for the main menu: `GetPlayerController()` and `GetMenuPlayerController()`, `GetPlayerPawn()` and `GetMenuPlayerPawn()`. The full list is in `Reference/UnLua.lua`, and it is the place to start when you are looking for a way in.

### Engine Name Prefixes

Every Unreal type name starts with a letter naming what kind of type it is. Lua uses the same names the C++ side does, so the prefixes are what you type.

| Prefix | What it is |
| --- | --- |
| `U` | an object, derived from `UObject` |
| `A` | an actor, derived from `AActor` |
| `F` | a struct, a plain value with fields |
| `T` | a container or template, such as `TArray` |
| `E` | an enum |
| `I` | an interface |

### Calling C++ Methods

If a C++ method is exported to Lua, you can call it on any object that has it. Lua holds objects without a static type, so what the variable was declared as on the C++ side makes no difference: a value that arrived as an `AActor` still answers the methods of the class it really is.

```lua
-- GetActorOfClass returns AActor, and GetGameLevel belongs to APlaytestScene
local Scene = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene)
local Level = Scene:GetGameLevel()
```

Nothing had to be converted first. `Cast()` exists for asking what class an object is, not for making a call possible.

In exchange, nothing is checked. A misspelled method name is caught nowhere and surfaces as an error when the line finally runs.

Call a function the way the API Reference writes it. A dot means the function belongs to the class itself and needs no object.

```lua
---Get Settings object
---@return UGDevSettings
function UGDevSettings.Get() end
```

```lua
local Settings = UGDevSettings.Get()
```

A colon means it needs one.

```lua
---@param InCurrentZoom number
function AGPlayerPawn:SetCurrentZoom(InCurrentZoom) end
```

```lua
GetPlayerPawn():SetCurrentZoom(0.5)
```

### UObjects

`UObject` is the C++ base class the engine builds nearly everything on. Actors, widgets, managers and settings are all `UObject`s, and so is almost anything a global getter hands back.

| Method | Returns |
| --- | --- |
| `IsValid()` | whether the object still exists |
| `GetName()` | its name, with no path in front |
| `GetClass()` | the `UClass` it belongs to |
| `GetOuter()` | the object it lives inside |
| `GetWorld()` | the world it belongs to |
| `IsA(Class)` | whether it is of that class |
| `Cast(Class)` | the same object when it is of that class, otherwise `nil` |

```lua
local Target = GetPlayerPawn()

-- IsA answers yes for the object's own class and for every class it derives from
if Target:IsA(AActor) then
    LogInfo("The player pawn is an actor")
end

local MenuPawn = Target:Cast(AGMenuPlayerPawn)
```

### UClasses

A `UClass` is a class the Script can hold and pass around. Writing the class name gives you one: `APawn` is a `UClass`, and it goes wherever the game asks for a class.

| Method | Returns |
| --- | --- |
| `GetName()` | the class name |
| `IsChildOf(Class)` | whether this class derives from that one |
| `GetDefaultObject()` | the template object holding the class defaults |

```lua
-- AGPlayerPawn derives from APawn, so this is true
local bDerives = AGPlayerPawn:IsChildOf(APawn)

-- The defaults a fresh pawn of this class would start with
local Defaults = APawn:GetDefaultObject()
```

Comparing two classes with `==` does not behave the way it looks. `UnrealConcepts.md` explains why and what to use instead.

Structs are neither, and have none of the methods above.

### Loading Content by Path

`UObject.Load(...)` loads an object asset. `UClass.Load(...)` loads a class.

```lua
-- A class. Its path ends in _C.
local WindowClass = UClass.Load("/Game/UserInterface/Dev/WBP_UPropertyViewer.WBP_UPropertyViewer_C")

-- An asset: a texture, a material, a sound, a data table.
local Sound = UObject.Load("/Game/Tests/Audio/TestSound.TestSound")
```

What goes in the quotes is a Reference Path, Unreal's own way of naming content. It is not a path on disk: shipped content lives inside `.pak` files and has no folders to browse. Copy a Reference Path from the editor rather than assembling one by hand. `UnrealConcepts.md` explains the `_C` suffix and why a class and an asset are not interchangeable.

### Creating Structs

Some structs take constructor arguments, and some are created empty and filled in field by field.

```lua
-- A constructor with arguments: one line is enough
local Position = FVector2D(10, 56)

-- A constructor without arguments: every field is filled in by hand
local Text = FEText()
Text.InlineText = "Hello"
```

[TEMPORARY] TODO: the API Reference does not list struct constructors, so there is no way to look up which structs take arguments and what those arguments are. Until it does, the math types are the ones that take them and everything else is created empty.

### A Field Is the Original, a Returned Value Is a Copy

Reading a field of a `UObject` reaches the original. A value handed back by a function is a copy of what the C++ side holds, so writing into it changes nothing there. That only matters for structs, because they are the values with fields you would want to write into.

```lua
local Size = UWidgetLayoutLibrary.GetViewportSize(GetWorld())
Size.X = 1280 -- WRONG: the returned struct is a copy, so the viewport is unaffected

local Button = UWidgetLib.CreateButton(GetPlayerController():GetGameHUD())
Button.WidgetColorStyle.Emphasis = EWidgetEmphasis.High -- CORRECT: the field is the original
Button:ApplyStyle()
```

The wrong version reports nothing and has no effect.

Objects are the exception: they are never copied. Two variables that received the same actor reach that same actor, and a change made through one is visible through the other. Values passed between your own Lua functions are not copied either.

`ObjectsAndValues.md` covers the rule in full, including arrays and maps and the delegate this mistake is easiest to make on.

### The WorldContext Parameter

Some functions belong to no object but still have to know which world they are acting on. You will spot them by a parameter called `WorldContext` or `WorldContextObject`. Pass `GetWorld()` into it.

```lua
local Scene = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene)

local ViewportSize = UWidgetLayoutLibrary.GetViewportSize(GetWorld())
```

Do not store the world. Call `GetWorld()` again where you need it. The game discards its world and creates a new one when it moves between the main menu and a game level, and a stored one does not survive that.

### Prefer the Game's Own Functions

Where the game and the engine both offer a way to do something, use the game's. `GetPlayerPawn()` rather than the engine's generic way of finding a pawn. `LogInfo()` rather than Lua's own printing. `UWidgetLib` rather than assembling widgets by hand.

The game's versions do the surrounding bookkeeping the engine's do not. Use an engine function where the game offers no equivalent.

### Useful Libraries

C++ classes whose names end in `Lib`, `Library`, `Statics` or `Utils` hold nothing but static functions, so everything on them is called with a dot and needs no object.

The game's own:

| Library | What it covers |
| --- | --- |
| `UEnvisionStatics` | game framework code |
| `UWidgetLib` | creating the game's own widgets |

The engine's:

| Library | What it covers |
| --- | --- |
| `UGameplayStatics` | general engine access |
| `UKismetMathLibrary` | vectors, rotators, interpolation, random numbers |
| `UKismetSystemLibrary` | general system utilities |
| `UKismetRenderingLibrary` | render targets and drawing into them |
| `UWidgetLayoutLibrary` | viewport size, screen positions, slot layout |
| `UWidgetBlueprintLibrary` | engine-side widget helpers |
| `USlateBlueprintLibrary` | UI geometry and coordinate conversion |

### Writing to the Log

```lua
LogInfo("Something happened")
LogWarn("Something looks wrong")
LogError("Something is broken")
```

These write to the game's own log, which you can open while playing.

## Events

A delegate is a field on a game object that the game broadcasts when something happens. A listener is a function a Script attaches to one, and that function is called the callback. Adding a listener is how a Script joins in with logic that already exists.

### What a Callback Receives

The API Reference lists a delegate as a field on its class, and the type of the field carries the argument list.

```lua
---@field public OnEscapeAction MulticastDelegate|fun(Event: integer)
```

The `fun(...)` part is what the game calls your callback with. This one sends a single argument.

### Multicast Delegates: Several Listeners

Most delegates are of this kind. The API Reference names the type `MulticastDelegate`.

`Add()` attaches a callback and hands back a `MulticastDelegateHandle`. Its only job is to take that one listener back later, so keep it when you intend to remove the listener and ignore it when you do not.

```lua
local PlayerPawn = GetPlayerPawn()

-- What we want to run when the game broadcasts the delegate
local function OnEscape(Event)
    if Event == EInputEvent.IE_Pressed then
        LogInfo("Escape pressed")
    end
end

-- The pawn already had C++ listeners on this delegate. Ours joins them, and all of them run.
local EscapeHandle = PlayerPawn.OnEscapeAction:Add(OnEscape)
```

| Method | What it does |
| --- | --- |
| `Add(Callback)` | Attaches a listener. Returns a `MulticastDelegateHandle`. |
| `Remove(Callback)` | Removes that callback's listener. Returns how many were removed. |
| `Broadcast(...)` | Calls every listener, with the arguments the signature calls for. |
| `IsBound()` | Whether anything is listening. |

The same function value added twice produces one listener, not two, and one broadcast calls it once. Running a One-Shot Script twice is a different case: each run builds a new function value, so the delegate ends up with two listeners.

A listener with a name can be taken back by that name.

```lua
PlayerPawn.OnEscapeAction:Remove(OnEscape)
```

The handle removes the same listener without needing the name.

```lua
EscapeHandle:Remove()
```

A callback written inline has no name to pass to `Remove()`, so the handle is the only way back to it.

```lua
local Button = UWidgetLib.CreateButton(GetPlayerController():GetGameHUD())

local ClickHandle = Button.OnClicked:Add(function() LogWarn("Clicked the button!") end)

ClickHandle:Remove()
```

`Remove()` on a handle whose listener is already gone does nothing and reports nothing, so a Script can call it without checking first.

### Single-Cast Delegates: Only One Listener

Some delegates hold only one listener. The API Reference names the type `Delegate`.

`Bind()` hands back no handle. `Unbind()` is the only way to take the listener back.

```lua
SomeObject.OnFinished:Bind(This.OnFinished)  -- attach the listener
SomeObject.OnFinished:Unbind()               -- remove it
```

| Method | What it does |
| --- | --- |
| `Bind(Callback)` | Attaches the callback, replacing any previous listener. |
| `Unbind()` | Removes the bound callback. |
| `IsBound()` | Whether a listener is attached. |
| `Execute(...)` | Calls the listener. The single-listener counterpart of `Broadcast()`. |

### Listeners and Unloading

Unloading a Module removes every listener it added, so `OnDestruct()` does not have to. `Delegates.md` lists every way to remove a listener by hand, and which of them reach listeners you did not add.

### Listeners From a One-Shot Script

A One-Shot Script can attach listeners, and they stay attached after the run has ended. It has no Module table, so `RemoveModuleListeners()` is not among the things it can call, and nothing takes its listeners back for it.

```lua
-- LogEscape.lua, a complete one-shot script, in Content/Lua/DevScripts/

GetPlayerPawn().OnEscapeAction:Add(function(Event)
    if Event == EInputEvent.IE_Pressed then
        LogInfo("Escape pressed")
    end
end)
```

```lua
require("Dev.LogEscape")
require("Dev.LogEscape")
```

Each `require()` runs the file again and builds a new function value, so the delegate now carries two listeners and one press of Escape writes two lines.

That makes a One-Shot Script a way to try something out while developing, not a way to build anything that has to be turned off again. Write a persistent Script for that.

## Limits

### The Lua Standard Library

Part of it is not present.

| Library | What is there |
| --- | --- |
| `io` | nothing |
| `load`, `loadstring`, `loadfile`, `dofile` | nothing |
| `package` | `loadlib` is removed, `path` and `cpath` are empty |
| `os` | `time`, `clock`, `date`, `difftime` |
| `debug` | `traceback` |
| `coroutine` | nothing; reading or writing any field raises an error naming `Routine` |

### Time and Depth

The engine times every call it makes into script code, because a Script that never stops would freeze the game with no way out. When one runs too long, the player gets a dialog offering to keep waiting or to stop the Script. Spread long work across frames in `OnTick()` rather than doing it in one call.

The engine also refuses a script call that nests too deep. This happens without a loop anywhere in your code: your Script changes a value, the game broadcasts the change, another Script's listener runs and changes a value of its own, and the chain grows. When it gets too deep the innermost call is refused.

Both limits are configurable and their values change between game versions. Do not write a Script that depends on a particular number.

## Style

The project follows Unreal's conventions rather than the ones usual in Lua.

- PascalCase for variables and functions.
- Booleans named for what being true means, with a `b` in front when they mirror an engine field.
- Require paths written the way the folders and files are actually named. `require()` ignores case either way, but a path that matches the file system is one you can check by looking.

Annotate your own functions the same way the API Reference does.

```lua
---Returns how many items the container currently holds.
---@param Container UInventoryContainer
---@return integer
function This.CountItems(Container)
```

The annotation format is the one Lua Language Server reads, so an IDE with that extension installed checks your calls against the API Reference as you type.

Annotations matter more here than in ordinary Lua. Most values crossing into C++ are not type-checked, so a wrong one is not always refused, and the failure can arrive far from the line that caused it. The annotations are what lets your IDE warn you before the code runs at all.

## The API Reference Folder

`Reference/` holds the C++ API as Lua stubs: every class, struct, enum and library reachable from Lua, with the arguments each function takes. Start at `Reference/UnLua.lua`, which lists the global functions, because those are the way into everything else.

Not everything the engine has is there. An Unreal class or function missing from `Reference/` is one the game does not intend Scripts to use.

### Reading a Signature

| Annotation | What it means |
| --- | --- |
| `@return` | a value handed back, in the order the lines appear |
| `[out, modified in place]` | the argument you pass is filled in, and is not among the returned values |
| `?` on a parameter name | optional parameter, can be left out |
| `[default: ...]` | optional parameter: what is used when it is left out |

A parameter marked `?` can be left out, and the value in `[default: ...]` is what the function uses instead.

```lua
---@param NewLocation FVector2D
---@param bTeleport? boolean @[default: false]
function AGPlayerPawn:SetCameraLocation(NewLocation, bTeleport) end
```

```lua
GetPlayerPawn():SetCameraLocation(FVector2D(10, 56))
```

Several returned values come back the way Lua returns several values.

```lua
---@return boolean
---@return number LocationX
---@return number LocationY
function APlayerController:GetMousePosition() end
```

```lua
local bOk, MouseX, MouseY = GetPlayerController():GetMousePosition()
```

An Out Parameter is the other case: you create the value yourself, pass it in, and the function fills it.

```lua
---@param LightSourceId integer
---@param OutLightSource FLightSource @[out, modified in place]
---@return boolean
function ULightManager:GetLightSource(LightSourceId, OutLightSource) end
```

```lua
local OutLight = FLightSource()

if LightManager:GetLightSource(Id, OutLight) then
    LogInfo(tostring(OutLight.Intensity))
end
```

Give an Out Parameter a variable of the right type, never `nil` and never a plain Lua table.

## See Also

- `UnrealConcepts.md`: what you need to know about Unreal itself before writing anything past a first script. `UObject`s and `UClass`es, Blueprints and the `_C` suffix, actors, components, widgets, worlds and settings.
- `ObjectsAndValues.md`: how long a value stays usable, what is copied and what is not, and how to keep an object from being collected.
- `ScriptLifecycle.md`: loading order, reloads, and what is cleaned up when a Module goes away.
- `Delegates.md`: events in full.
- `DynamicState.md`: the properties that live on game objects.
- `UserInterface.md`: widgets, buttons and text.
