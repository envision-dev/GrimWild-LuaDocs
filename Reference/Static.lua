---@meta
---Single-cast delegate. Holds at most one listener.
---Reached through a field of a live object: a delegate obtained from a function that returns a
---struct is part of a copy, and a listener attached to it never fires.
---A callback must not take a first parameter named 'self', which also rules out defining it with
---a colon.
---@class Delegate
Delegate = {}

---Bind a callback to the delegate, replacing any previous listener. Nothing reports that a previous
---listener was displaced, so two scripts binding to the same delegate is not a case either of them
---can detect.
---Returns no handle: Unbind is the only way to take the listener back.
---@param Function function @callback
function Delegate:Bind(Function) end

---Unbind the callback from the delegate. Binding again afterwards is legitimate.
function Delegate:Unbind() end

---Invoke the bound callback with the given arguments.
---Variable argument list (look for target delegate signature).
---@param ... any
function Delegate:Execute(...) end

---Returns true if a listener is bound (from Lua or from native code).
---@return boolean
function Delegate:IsBound() end

---Remove the listener if a script created it, leaving a C++ or Blueprint listener attached.
---@return integer @number of removed listeners
function Delegate:RemoveLuaListeners() end

---@class EKeys
EKeys = {}

---@type FKey
EKeys.AnyKey = nil

---@type FKey
EKeys.MouseX = nil

---@type FKey
EKeys.MouseY = nil

---@type FKey
EKeys.Mouse2D = nil

---@type FKey
EKeys.MouseScrollUp = nil

---@type FKey
EKeys.MouseScrollDown = nil

---@type FKey
EKeys.MouseWheelAxis = nil

---@type FKey
EKeys.LeftMouseButton = nil

---@type FKey
EKeys.RightMouseButton = nil

---@type FKey
EKeys.MiddleMouseButton = nil

---@type FKey
EKeys.ThumbMouseButton = nil

---@type FKey
EKeys.ThumbMouseButton2 = nil

---@type FKey
EKeys.BackSpace = nil

---@type FKey
EKeys.Tab = nil

---@type FKey
EKeys.Enter = nil

---@type FKey
EKeys.Pause = nil

---@type FKey
EKeys.CapsLock = nil

---@type FKey
EKeys.Escape = nil

---@type FKey
EKeys.SpaceBar = nil

---@type FKey
EKeys.PageUp = nil

---@type FKey
EKeys.PageDown = nil

---@type FKey
EKeys.End = nil

---@type FKey
EKeys.Home = nil

---@type FKey
EKeys.Left = nil

---@type FKey
EKeys.Up = nil

---@type FKey
EKeys.Right = nil

---@type FKey
EKeys.Down = nil

---@type FKey
EKeys.Insert = nil

---@type FKey
EKeys.Delete = nil

---@type FKey
EKeys.Zero = nil

---@type FKey
EKeys.One = nil

---@type FKey
EKeys.Two = nil

---@type FKey
EKeys.Three = nil

---@type FKey
EKeys.Four = nil

---@type FKey
EKeys.Five = nil

---@type FKey
EKeys.Six = nil

---@type FKey
EKeys.Seven = nil

---@type FKey
EKeys.Eight = nil

---@type FKey
EKeys.Nine = nil

---@type FKey
EKeys.A = nil

---@type FKey
EKeys.B = nil

---@type FKey
EKeys.C = nil

---@type FKey
EKeys.D = nil

---@type FKey
EKeys.E = nil

---@type FKey
EKeys.F = nil

---@type FKey
EKeys.G = nil

---@type FKey
EKeys.H = nil

---@type FKey
EKeys.I = nil

---@type FKey
EKeys.J = nil

---@type FKey
EKeys.K = nil

---@type FKey
EKeys.L = nil

---@type FKey
EKeys.M = nil

---@type FKey
EKeys.N = nil

---@type FKey
EKeys.O = nil

---@type FKey
EKeys.P = nil

---@type FKey
EKeys.Q = nil

---@type FKey
EKeys.R = nil

---@type FKey
EKeys.S = nil

---@type FKey
EKeys.T = nil

---@type FKey
EKeys.U = nil

---@type FKey
EKeys.V = nil

---@type FKey
EKeys.W = nil

---@type FKey
EKeys.X = nil

---@type FKey
EKeys.Y = nil

---@type FKey
EKeys.Z = nil

---@type FKey
EKeys.NumPadZero = nil

---@type FKey
EKeys.NumPadOne = nil

---@type FKey
EKeys.NumPadTwo = nil

---@type FKey
EKeys.NumPadThree = nil

---@type FKey
EKeys.NumPadFour = nil

---@type FKey
EKeys.NumPadFive = nil

---@type FKey
EKeys.NumPadSix = nil

---@type FKey
EKeys.NumPadSeven = nil

---@type FKey
EKeys.NumPadEight = nil

---@type FKey
EKeys.NumPadNine = nil

---@type FKey
EKeys.Multiply = nil

---@type FKey
EKeys.Add = nil

---@type FKey
EKeys.Subtract = nil

---@type FKey
EKeys.Decimal = nil

---@type FKey
EKeys.Divide = nil

---@type FKey
EKeys.F1 = nil

---@type FKey
EKeys.F2 = nil

---@type FKey
EKeys.F3 = nil

---@type FKey
EKeys.F4 = nil

---@type FKey
EKeys.F5 = nil

---@type FKey
EKeys.F6 = nil

---@type FKey
EKeys.F7 = nil

---@type FKey
EKeys.F8 = nil

---@type FKey
EKeys.F9 = nil

---@type FKey
EKeys.F10 = nil

---@type FKey
EKeys.F11 = nil

---@type FKey
EKeys.F12 = nil

---@type FKey
EKeys.NumLock = nil

---@type FKey
EKeys.ScrollLock = nil

---@type FKey
EKeys.LeftShift = nil

---@type FKey
EKeys.RightShift = nil

---@type FKey
EKeys.LeftControl = nil

---@type FKey
EKeys.RightControl = nil

---@type FKey
EKeys.LeftAlt = nil

---@type FKey
EKeys.RightAlt = nil

---@type FKey
EKeys.LeftCommand = nil

---@type FKey
EKeys.RightCommand = nil

---@type FKey
EKeys.Semicolon = nil

---@type FKey
EKeys.Equals = nil

---@type FKey
EKeys.Comma = nil

---@type FKey
EKeys.Underscore = nil

---@type FKey
EKeys.Hyphen = nil

---@type FKey
EKeys.Period = nil

---@type FKey
EKeys.Slash = nil

---@type FKey
EKeys.Tilde = nil

---@type FKey
EKeys.LeftBracket = nil

---@type FKey
EKeys.Backslash = nil

---@type FKey
EKeys.RightBracket = nil

---@type FKey
EKeys.Apostrophe = nil

---@type FKey
EKeys.Ampersand = nil

---@type FKey
EKeys.Asterix = nil

---@type FKey
EKeys.Caret = nil

---@type FKey
EKeys.Colon = nil

---@type FKey
EKeys.Dollar = nil

---@type FKey
EKeys.Exclamation = nil

---@type FKey
EKeys.LeftParantheses = nil

---@type FKey
EKeys.RightParantheses = nil

---@type FKey
EKeys.Quote = nil

---@type FKey
EKeys.A_AccentGrave = nil

---@type FKey
EKeys.E_AccentGrave = nil

---@type FKey
EKeys.E_AccentAigu = nil

---@type FKey
EKeys.C_Cedille = nil

---@type FKey
EKeys.Section = nil

---@type FKey
EKeys.Invalid = nil

---The settings a spawn can be given, gathered into one value for SpawnActorEx. Every field may be left as it is.
---@class FActorSpawnParameters
---@field public Name string @Name to give the spawned actor. Left as None, a name of the form [Class]_[Number] is generated.
---@field public Template AActor @Actor to copy the property values of into the spawned actor. Left unset, the class default object is copied instead.
---@field public Owner AActor @The actor that spawned this one. May be left unset.
---@field public Instigator APawn @The pawn answerable for damage the spawned actor does. May be left unset.
---@field public OverrideLevel ULevel @Level to spawn into, which becomes the actor's outer. Left unset, the owner's level is used, and the persistent level when there is no owner.
---@field public OverrideParentComponent UChildActorComponent @The child actor component the spawned actor belongs to, for an actor spawned as another actor's child actor. Left unset for an ordinary spawn.
---@field public SpawnCollisionHandlingOverride ESpawnActorCollisionHandlingMethod @What to do when the actor would be spawned inside something. Undefined leaves the decision to the actor's own setting.
---@field public bNoFail boolean @Whether to spawn anyway in the cases that would otherwise refuse: a class marked static, and a template whose class is not the class being spawned.
---@field public bDeferConstruction boolean @Whether to leave the construction script unrun, for a caller that wants to write properties before it runs. Only applies to an actor spawned from a Blueprint.
---@field public bAllowDuringConstructionScript boolean @Governs whether a spawn is refused while a construction script is running. Which way round the test goes is not stated here: the engine's comment on the field and the field's own name disagree, and nothing in this project spawns an actor from script during a construction script.
FActorSpawnParameters = {}

---Whether this actor is being spawned on a client because the server replicated it. Set by the networking code, never by script.
---@return boolean
function FActorSpawnParameters:IsRemoteOwned() end

---A reference by the unique identifier recorded on the object rather than by pointer, so it still finds the
---object after the level holding it has been unloaded and loaded again. Resolving one costs a lookup that a
---weak reference does not.
---@class FLazyObjectPtr
FLazyObjectPtr = {}

---Whether the object this reference names is loaded and alive.
---@return boolean
function FLazyObjectPtr:IsValid() end

---Makes this reference name nothing.
function FLazyObjectPtr:Reset() end

---Points this reference at an object.
---@param Object UObject 
function FLazyObjectPtr:Set(Object) end

---The object, or nil when it is not loaded or has been destroyed.
---@return UObject
function FLazyObjectPtr:Get() end

---A reference to an asset by path rather than by pointer. The asset does not have to be loaded for the
---reference to name it: Get is nil until something loads it, and LoadSynchronous loads it there and then.
---This is what a property declared as TSoftObjectPtr or TSoftClassPtr arrives as.
---@class FSoftObjectPtr
FSoftObjectPtr = {}

---Whether the asset is loaded and reachable through this reference.
---@return boolean
function FSoftObjectPtr:IsValid() end

---Whether this reference names nothing at all, which is not the same as naming an asset that is not loaded.
---@return boolean
function FSoftObjectPtr:IsNull() end

---Whether this reference names an asset that is not loaded yet.
---@return boolean
function FSoftObjectPtr:IsPending() end

---Makes this reference name nothing.
function FSoftObjectPtr:Reset() end

---Points this reference at an object, recording the path of that object.
---@param Object UObject 
function FSoftObjectPtr:Set(Object) end

---The name of the asset alone, without its path.
---@return string
function FSoftObjectPtr:GetAssetName() end

---The package path of the asset, without the asset name.
---@return string
function FSoftObjectPtr:GetLongPackageName() end

---The object, or nil while it is not loaded. Loads nothing.
---@return UObject
function FSoftObjectPtr:Get() end

---The object, loading it first and waiting for it if it is not loaded yet.
---@return UObject
function FSoftObjectPtr:LoadSynchronous() end

---A reference that does not keep the object alive. Get is nil once the object has been destroyed, where an
---ordinary reference would still name freed memory. The cheapest of the three reference types to resolve.
---@class FWeakObjectPtr
FWeakObjectPtr = {}

---Makes this reference name nothing.
function FWeakObjectPtr:Reset() end

---Points this reference at an object.
---@param Object UObject 
function FWeakObjectPtr:Set(Object) end

---The object, or nil once it has been destroyed.
---@return UObject
function FWeakObjectPtr:Get() end

---Whether the object is still alive.
---@return boolean
function FWeakObjectPtr:IsValid() end

---Multicast delegate. Holds any number of listeners.
---Reached through a field of a live object: a delegate obtained from a function that returns a
---struct is part of a copy, and a listener attached to it never fires.
---A callback must not take a first parameter named 'self', which also rules out defining it with
---a colon.
---Every method here refuses to run once the object owning the delegate has been destroyed.
---@class MulticastDelegate
MulticastDelegate = {}

---Add a listener. Takes the callback alone; the upstream (Object, Function) form is rejected.
---Adding the same function twice from the same script produces one listener, not two.
---@param Function function @callback
---@return MulticastDelegateHandle
function MulticastDelegate:Add(Function) end

---Remove a specific listener. The function reference must match the one passed to Add.
---@param Function function @callback (must be the same reference passed to Add)
---@return integer @number of removed listeners
function MulticastDelegate:Remove(Function) end

---Broadcast: invoke all listeners with the given arguments.
---Variable argument list (look for target delegate signature).
---@param ... any
function MulticastDelegate:Broadcast(...) end

---Returns true if there is at least one listener (Lua or native).
---@return boolean
function MulticastDelegate:IsBound() end

---Clear the delegate: every listener goes, whichever script, C++ or Blueprint created it, and
---nothing is returned. The same delegate carries listeners belonging to the game and to other mods,
---so clearing it disables logic that has nothing to do with the calling script. Prefer the handle
---returned by Add, Remove, or the module-scoped methods on the script table.
function MulticastDelegate:RemoveAll() end

---Remove every script-created listener on this delegate, whichever script created it, leaving
---C++ and Blueprint listeners attached. A development tool for clearing script listeners before
---testing something, rather than everyday practice.
---@return integer @number of removed listeners
function MulticastDelegate:RemoveLuaListeners() end

---Add a listener. Takes the callback alone; the upstream (Object, Function) form is rejected.
---Adding the same function twice from the same script produces one listener, not two.
---@param Function function @callback
---@return MulticastDelegateHandle
function MulticastDelegate:Add(Function) end

---Remove a specific listener. The function reference must match the one passed to Add.
---@param Function function @callback (must be the same reference passed to Add)
---@return integer @number of removed listeners
function MulticastDelegate:Remove(Function) end

---Broadcast: invoke all listeners with the given arguments.
---Variable argument list (look for target delegate signature).
---@param ... any
function MulticastDelegate:Broadcast(...) end

---Returns true if there is at least one listener (Lua or native).
---@return boolean
function MulticastDelegate:IsBound() end

---A dynamic array whose elements all have the same type, fixed when the array is created.
---Indices start at 1. Reading one that is out of range warns and hands back nil rather than raising.
---Assigning an array to a second variable gives that variable the same array, not a copy: use Copy for an
---independent one.
---'pairs' walks the elements; 'ipairs' does not work.
---@class TArray
---@overload fun(ElementType: any): TArray @Creates an empty array of the given element type.
TArray = {}

---@return integer
function TArray:Num() end

---Adds an item to the end of the array.
---@param NewItem any
---@return integer @Index of the added item.
function TArray:Add(NewItem) end

---Adds an item to the end of the array unless it is already present.
---@param NewItem any
---@return integer @Index of the added item, or -1 when it was already present.
function TArray:AddUnique(NewItem) end

---Index of the first item equal to the given one.
---@param ItemToFind any
---@return integer @The index it was found at, or -1.
function TArray:Find(ItemToFind) end

---Inserts an item at the given index, moving the rest along. One past the last index appends.
---@param NewItem any
---@param Index integer
function TArray:Insert(NewItem, Index) end

---Removes the item at the given index. RemoveItem removes by value instead.
---@param IndexToRemove integer
function TArray:Remove(IndexToRemove) end

---Removes every item equal to the given one.
---@param Item any
---@return boolean @True when at least one item was removed.
function TArray:RemoveItem(Item) end

function TArray:Clear() end

---Makes room for the given number of items without adding any, so Num is unchanged.
---@param Size integer
---@return boolean
function TArray:Reserve(Size) end

---Grows or shrinks the array to the given size. Growing adds default constructed items.
---@param Size integer
function TArray:Resize(Size) end

---Address of the item at the given index. For passing to a C++ API that expects one.
---@param Index integer
---@return lightuserdata
function TArray:GetData(Index) end

---A copy of the item at the given index. Writing into the copy leaves the array as it is; use Set or GetRef for that.
---@param Index integer
---@return any
function TArray:Get(Index) end

---A reference to the item at the given index. Writing into it writes into the array.
---@param Index integer
---@return any
function TArray:GetRef(Index) end

---Assigns an item to the given index.
---@param Index integer
---@param Item any
function TArray:Set(Index, Item) end

---Exchanges the items at two indices. Two equal indices leave the array as it is.
---@param FirstIndex integer
---@param SecondIndex integer
function TArray:Swap(FirstIndex, SecondIndex) end

---Puts the items in a random order.
function TArray:Shuffle() end

---@return integer
function TArray:LastIndex() end

---@param IndexToTest integer
---@return boolean
function TArray:IsValidIndex(IndexToTest) end

---@param ItemToFind any
---@return boolean
function TArray:Contains(ItemToFind) end

---Adds every item of another array to the end of this one.
---@param OtherArray TArray @An array of another element type is an error.
function TArray:Append(OtherArray) end

---A new array holding the same items. The two are independent from then on.
---@return TArray
function TArray:Copy() end

---Replaces every item of this array with the items of another one.
---@param OtherArray TArray @An array of another element type is an error.
---@return TArray @This array.
function TArray:CopyFrom(OtherArray) end

---A copy of the array as a Lua table, indexed from one. Changing the table leaves the array as it is.
---@return table
function TArray:ToTable() end

---An association from keys to values, with the key and value types fixed when the map is created.
---Assigning a map to a second variable gives that variable the same map, not a copy: use Copy for an
---independent one.
---'pairs' walks the entries; 'ipairs' does not work.
---@class TMap
---@overload fun(KeyType: any, ValueType: any): TMap @Creates an empty map of the given key and value types.
TMap = {}

---@return integer
function TMap:Num() end

---Associates a value with a key, replacing whatever the key held before.
---@param Key any
---@param Value any
function TMap:Add(Key, Value) end

---Removes a key and the value it holds.
---@param Key any
---@return boolean @True when the key was there to remove.
function TMap:Remove(Key) end

---A copy of the value a key holds, or nil. Writing into the copy leaves the map as it is; use Add or FindRef for that.
---@param Key any
---@return any
function TMap:Find(Key) end

---A reference to the value a key holds. Writing into it writes into the map.
---@param Key any
---@return any
function TMap:FindRef(Key) end

function TMap:Clear() end

---A new map holding the same entries. The two are independent from then on.
---@return TMap
function TMap:Copy() end

---Replaces every entry of this map with the entries of another one.
---@param OtherMap TMap @A map of other key or value types is an error.
---@return TMap @This map.
function TMap:CopyFrom(OtherMap) end

---A new array of the keys, in no particular order.
---@return TArray
function TMap:Keys() end

---A new array of the values, in no particular order.
---@return TArray
function TMap:Values() end

---A copy of the map as a Lua table. Changing the table leaves the map as it is.
---@return table
function TMap:ToTable() end

---An unordered collection of unique elements, whose type is fixed when the set is created.
---Assigning a set to a second variable gives that variable the same set, not a copy: use Copy for an
---independent one.
---'pairs' walks the elements; 'ipairs' does not work.
---@class TSet
---@overload fun(ElementType: any): TSet @Creates an empty set of the given element type.
TSet = {}

---@return integer
function TSet:Num() end

---Adds an element, doing nothing when an equal one is already present.
---@param NewItem any
function TSet:Add(NewItem) end

---Removes an element.
---@param Item any
---@return boolean @True when an equal element was there to remove.
function TSet:Remove(Item) end

---@param ItemToFind any
---@return boolean
function TSet:Contains(ItemToFind) end

function TSet:Clear() end

---A new set holding the same elements. The two are independent from then on.
---@return TSet
function TSet:Copy() end

---Replaces every element of this set with the elements of another one.
---@param OtherSet TSet @A set of another element type is an error.
---@return TSet @This set.
function TSet:CopyFrom(OtherSet) end

---A new array holding copies of the elements.
---@return TArray
function TSet:ToArray() end

---A copy of the set as a Lua table, indexed from one. Changing the table leaves the set as it is.
---@return table
function TSet:ToTable() end

---The table a persistent script returns. It is always named This inside the file, because the
---engine's error messages say This.
---OnConstruct, OnTick and OnDestruct are the only functions defined with a colon; everything else
---in a script, and every callback, is defined with a dot.
---Unload, Reload, SetTickEnabled, RemoveModuleListeners and RemoveModuleListenersFrom are installed
---by the engine. A script that defines a field of any of these five names is refused, with the
---error naming the field.
---@class Module
local This = {}

---Whether OnTick starts running immediately. Write it explicitly, true or false, in every script
---that has an OnTick, so that the state of the tick is visible in the file.
---@type boolean
This.StartWithTickEnabled = false

---Runs once, right after the file has been loaded.
function This:OnConstruct() end

---Runs once per frame, while ticking is enabled.
---@param DeltaTime number @seconds since the previous frame
function This:OnTick(DeltaTime) end

---Runs once, just before this module is removed from the loaded module list. Listeners and tick
---registration are already gone by then; this is for everything else the script created.
function This:OnDestruct() end

---Unload this module. Safe to call from inside the script's own code, including from a listener
---or from OnTick: the teardown waits until the call that reached the script has returned.
function This:Unload() end

---Re-read this file from disk and load it again. Atomic: a file that fails to compile or errors
---while loading leaves the currently loaded version working. Modules that required this one are
---reloaded as well.
function This:Reload() end

---Enable or disable OnTick.
---@param bEnabled boolean
function This:SetTickEnabled(bEnabled) end

---Remove every listener this module added, on every delegate. Listeners added by other scripts are
---left alone. Returns zero when called from OnDestruct, where the automatic cleanup has already run.
---@return integer @number of removed listeners
function This:RemoveModuleListeners() end

---Remove every listener this module added to one delegate. Passing nil is an error; it never means
---"remove everything".
---@param Delegate MulticastDelegate|Delegate
---@return integer @number of removed listeners
function This:RemoveModuleListenersFrom(Delegate) end

---The value MulticastDelegate:Add returns. Its only job is to remove the one listener that the Add
---call created. Removing twice, or removing after the listener was taken back some other way, does
---nothing and reports nothing.
---Single-cast delegates do not produce one.
---@class MulticastDelegateHandle
local MulticastDelegateHandle = {}

---Remove the listener this handle came from.
function MulticastDelegateHandle:Remove() end

---What every struct can do. Not a type you create.
---Assigning a struct to a second variable gives that variable the same object, not a copy: after 'local B = A', writing to B.X changes A.X as well. Use Copy when an independent value is wanted.
---@class Struct
local Struct = {}

---An independent copy. Writing to it leaves this struct as it is.
---@generic T
---@param self T
---@return T
function Struct:Copy() end

---Replaces the contents of this struct with another's and returns this struct, without creating a new object. The two are independent afterwards.
---@generic T
---@param self T
---@param Other T
---@return T
function Struct:CopyFrom(Other) end

---What SetTimer and Routine hand back. Not the engine's FTimerHandle.
---Cancelling twice, or cancelling something that has already fired or went with the module that
---created it, does nothing and reports nothing.
---@class TimerHandle
local TimerHandle = {}

---Stop the timer or routine this handle came from.
function TimerHandle:Cancel() end

---Whether the timer or routine this handle came from is still scheduled.
---@return boolean
function TimerHandle:IsPending() end

---A reference to a T by the identifier recorded on it. In Lua the reference is already resolved: a property declared this way hands back the object itself, or nil when it is not loaded.
---@class TLazyObjectPtr<T> : UObject

---An object that implements the interface T. In Lua this is the object itself; the interface functions are called on it directly.
---@class TScriptInterface<T> : UObject

---A reference by path to the class of T. In Lua this is an ordinary FSoftObjectPtr; the type parameter records what the class is.
---@class TSoftClassPtr<T> : FSoftObjectPtr

---A reference to an asset of type T by path. In Lua this is an ordinary FSoftObjectPtr; the type parameter records what the asset is.
---@class TSoftObjectPtr<T> : FSoftObjectPtr

---A UClass restricted to subclasses of T. In Lua this is an ordinary UClass; the type parameter records what the API will accept.
---@class TSubclassOf<T> : UClass

---A reference to a T that does not keep it alive. In Lua the reference is already resolved: a property declared this way hands back the object itself, or nil once it has been destroyed.
---@class TWeakObjectPtr<T> : UObject

---Add bitmask flags to a flag value
---@param Flags integer 
---@param FlagsToAdd integer 
---@return integer
function AddFlags(Flags, FlagsToAdd) end

---Get Asset Manager singleton (an object used to handle runtime asset loading and management)
---@return UGAssetManager
function GetAssetManager() end

---Get in-game Game Mode (use inside GameMap)
---@return AGGameMode
function GetGameMode() end

---Get Game Options singleton (player-set option values)
---@return UGameOptions
function GetGameOptions() end

---Get in-game Game World (use inside GameMap)
---@return UGameWorld
function GetGameWorld() end

---Get in-menu Game Mode (use inside MainMenu map)
---@return AGMenuGameMode
function GetMenuGameMode() end

---Get in-menu Player Controller (use inside MainMenu map)
---@return AGMenuPlayerController
function GetMenuPlayerController() end

---Get in-menu Player Pawn (use inside MainMenu map)
---@return AGMenuPlayerPawn
function GetMenuPlayerPawn() end

---Get in-game Player Controller (use inside GameMap)
---@return AGPlayerController
function GetPlayerController() end

---Get in-game player pawn (use inside GameMap)
---@return AGPlayerPawn
function GetPlayerPawn() end

---Get Unreal Engine World object
---@return UWorld
function GetWorld() end

---Check whether every tested bitmask flag is set
---@param Flags integer 
---@param TestFlags integer 
---@return boolean
function HasAllFlags(Flags, TestFlags) end

---Check whether at least one tested bitmask flag is set
---@param Flags integer 
---@param TestFlags integer 
---@return boolean
function HasAnyFlags(Flags, TestFlags) end

---Log an error message to the game log
---@param Msg string 
function LogError(Msg) end

---Log an info (note) message to the game log
---@param Msg string 
function LogInfo(Msg) end

---Log a warning message to the game log
---@param Msg string 
function LogWarn(Msg) end

---Remove bitmask flags from a flag value
---@param Flags integer 
---@param FlagsToRemove integer 
---@return integer
function RemoveFlags(Flags, FlagsToRemove) end

---Returns the version of a loaded mod, or nil if the mod is not loaded or its version is invalid.
---@param ModId string
---@return string|nil
function GetModVersion(ModId) end

---Returns true only if the mod is enabled AND its scripts loaded successfully. A mod that is enabled
---but failed to load cannot be interoperated with.
---@param ModId string
---@return boolean
function IsModEnabled(ModId) end

---Returns true if a script with this require path is currently loaded as a persistent module.
---@param path string
---@return boolean
function IsScriptLoaded(path) end

---Add or find a manual reference to a UObject, preventing Unreal from garbage collecting it.
---Keep the returned proxy. Discarding it makes the call close to useless: the proxy becomes
---unreachable immediately and the pin lasts only until the next Lua collection. The failure is
---silent.
---Storing the proxy on the script's table ties its lifetime to the script's, but release still
---waits for a collection rather than happening at unload. A proxy that reaches _G, or is handed to
---another script, outlives its creator entirely and is only released by UnrefObject.
---Delegate listeners do not work this way: they are removed deterministically when a script
---unloads, with no collection involved.
---@param Object UObject
---@return userdata @Proxy holding the reference. The reference is released when Lua collects the proxy.
function RefObject(Object) end

---Atomically reloads a persistent module by require path: the old generation dies and a fresh
---load runs in the same call. Logs a warning and does nothing if the path is a one-shot script or
---is not currently loaded.
---@param path string
---@return boolean @whether the reload succeeded
function ReloadScript(path) end

---Runs a function on a coroutine that can pause itself with Wait.
---The body starts before this call returns, so everything ahead of its first Wait has already run by
---the time the handle arrives.
---The routine belongs to the module the body was defined in and goes with it: a script that unloads
---or reloads leaves none of its routines running.
---@param Function function
---@return TimerHandle
function Routine(Function) end

---Calls a function once the delay has passed, and again every delay while it loops.
---The timer belongs to the module the callback was defined in and goes with it: a script that
---unloads or reloads leaves none of its timers running.
---@param Seconds number @Delay before the call, and the interval between calls while looping. A negative number is an error.
---@param Function function
---@param Looping? boolean @Repeats until cancelled. Anything that is neither a boolean nor nothing is an error.
---@return TimerHandle
function SetTimer(Seconds, Function, Looping) end

---Unloads a persistent module by require path. Logs a warning and does nothing if the path is a
---one-shot script or is not currently loaded.
---@param path string
---@return boolean @whether a module was loaded at that path when the call was made
function UnloadScript(path) end

---Force remove every manual reference to a UObject, whatever proxies still exist.
---@param Object UObject
function UnrefObject(Object) end

---Pauses the running routine and continues it once the delay has passed.
---Only valid inside a body passed to Routine; anywhere else it raises an error.
---@param Seconds number @A negative number is an error.
function Wait(Seconds) end

