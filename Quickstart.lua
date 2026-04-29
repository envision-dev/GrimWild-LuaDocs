-------------------- Helpful info for better Lua scripting. --------------------

--C++ entry points can be accessed by using global getters like:
local World = GetWorld()
local PlayerController = GetPlayerController()
-- See more getters in GlobalFunctions.lua

---------- LIBRARIES

---C++ classes ending with "-Lib", "-Library", "-Statics" or "-Utils" contain static methods.
---You don't need an object to call them. 
local PlatformName = UGameplayStatics.GetPlatformName()

--UGameplayStatics is a library for accessing engine stuff from Lua  
--UEnvisionStatics is a library for game-related framework code

--Useful libs:
--UKismetRenderingLibrary, UKismetMathLibrary, UKismetSystemLibrary, UWidgetBlueprintLibrary

--Useful widget-related libs:
--UWidgetLayoutLibrary (engine)
--UWidgetBlueprintLibrary (engine)
--USlateBlueprintLibrary (engine)
--UWidgetLib (game)

-- Creating UUserWidget: UWidgetLib.CreateUserWidget()
-- Creating UWidget-based widget: UWidgetLib.CreateButton()...

--Some functions require "WorldContext" or "WorldContextObject" parameter. You can safely pass GetWorld() there.

--Find more Lua documentation in Reference/UnLua.lua file.

---------- EVENT BINDING

--- To bind a C++ event to a Lua listener, use delegates:
---@type Delegate: single-cast delegate (1 listener)
---@type MulticastDelegate: multi-cast delegate (multiple listeners)

local PlayerPawn = GetPlayerPawn()
local LuaFunction = function() LogInfo("ESC pressed.") end
PlayerPawn.OnEscapeAction:Add(LuaFunction) --Added Lua function to a C++ event
PlayerPawn.OnEscapeAction:Remove(LuaFunction) --Removed Lua function from C++ event processing

---------- LOGGING

--LogInfo(msg) == print(msg), both work
--LogWarn(msg)
--LogError(msg) 

---------- C++ OUT PARAMETERS

-- Lua does not have pass-by-reference for variables.

--WORKS:
--local Canvas, Size, Context = UKismetRenderingLibrary.BeginDrawCanvasToRenderTarget(GetWorld(), UCellBufferLib.GetDataRenderTarget(Buffer))

--DOES NOT WORK:
--local Canvas --Stays nil
--local Size
--local Context
--UKismetRenderingLibrary.BeginDrawCanvasToRenderTarget(GetWorld(), UCellBufferLib.GetDataRenderTarget(Buffer), Canvas, Size, Context)

----------





---------- Get  UClass (Or TSubclassOf) from Lua:

--works
-- NOTE: Path format is: {Path}/Name.Name_C 
--local Actor = UGameplayStatics.GetActorOfClass(GetWorld(), UE.UClass.Load("/Game/Tests/GW8/Intro/BP_GW8_Intro.BP_GW8_Intro_C"))
--print(Actor)

--also works; APlaytestScene = UE class name, also a table name in Lua documentation "APlaytestScene = {}"
--local Actor = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene.StaticClass())
--print(Actor)

--- Get any UDeveloperSettings-derived object:
--local Settings = UGDevSettings:GetDefaultObject()
---OR
--local Settings = UGDevSettings:Get()

--Get any asset from Content Browser
--local Sound = UE.USoundCue.Load("/Game/Tests/Audio/Gameplaywav.Gameplaywav")





---------- Delays:
-- Delay: UKismetSystemLibrary.Delay(GetWorld(), DURATION)
-- Delay one game frame: UKismetSystemLibrary.DelayUntilNextTick(GetWorld())
-- Retriggerable delay (trigger again to reset time): UKismetSystemLibrary.RetriggerableDelay(GetWorld(), DURATION)




---------- TODO: TSubclassOf, TSoftClassPtr, TSoftObjectPtr