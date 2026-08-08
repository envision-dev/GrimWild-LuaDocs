---Hand-written reference for the parts of the scripting API that the generators cannot describe.
---Manually exported C++ functions carry no parameter names and no comments, so their generated
---stubs are unusable on their own and this file fills the gap.
---@class UnLua
local UnLua = {}

---Add or find a manual reference to a UObject, preventing Unreal from garbage collecting it.
---Keep the returned proxy. Discarding it makes the call close to useless: the proxy becomes
---unreachable immediately and the pin lasts only until the next Lua collection. The failure is
---silent.
---Storing the proxy on the script's table ties its lifetime to the script's, but release still
---waits for a collection rather than happening at unload. A proxy that reaches _G, or is handed to
---another script, outlives its creator entirely and is only released by UnLua.Unref.
---Delegate listeners do not work this way: they are removed deterministically when a script
---unloads, with no collection involved.
---@param Object UObject
---@return userdata @Proxy holding the reference. The reference is released when Lua collects the proxy.
function UnLua.Ref(Object) end

---Force remove every manual reference to a UObject, whatever proxies still exist.
---@param Object UObject
function UnLua.Unref(Object) end

_G.UnLua = UnLua

--UObject

---Get the UClass a type name stands for. Kept for compatibility with older scripts: the type name
---itself already resolves to its UClass, so APawn and APawn.StaticClass() are interchangeable
---everywhere, including as a call target (APawn:GetDefaultObject()) and as an argument.
---Called on an instance it returns that instance's class, which is what GetClass does.
---@return UClass
function UObject.StaticClass() end

---Load an object by its UE reference path. Example: UObject.Load("/Game/Core/Data/DT_Items.DT_Items").
---Note: no _C at the end of the path.
---Raises an error when the path resolves to nothing, and when it resolves to a class: the latter
---names UClass.Load as the call to use instead.
---@param ObjectPath string
---@return UObject
function UObject.Load(ObjectPath) end

---Test validity of an object. False once the object has been destroyed.
---@return boolean
function UObject:IsValid() end

---Get the name of an object (with no path information)
---@return string
function UObject:GetName() end

---Get the UObject this object resides in
---@return UObject
function UObject:GetOuter() end

---Get the UClass that defines the fields of this object
---@return UClass
function UObject:GetClass() end

---Get the UWorld this object is contained within
---@return UWorld
function UObject:GetWorld() end

---Test whether this object is of the specified class. The type name is accepted directly:
---Pawn:IsA(APawn).
---@param Class UClass
---@return boolean
function UObject:IsA(Class) end

---Return this object if it is of the specified class, otherwise nil. Structs have no Cast.
---Casting is only for asking about a type: calling a method never requires one.
---@param Class UClass
---@return UObject|nil
function UObject:Cast(Class) end

--

---@class TArray<TElement>
local TArray = {}

---Get the number of items in an array
---@return integer
function TArray:Num() end

---Add item to array
---@param NewItem TElement @The item to look for
---@return integer @The index of the newly added item
function TArray:Add(NewItem) end

---Add item to array (unique)
---@param NewItem TElement @The item to add to the array
---@return integer @The index of the newly added item, or INDEX_NONE if the item is already present in the array
function TArray:AddUnique(NewItem) end

---Finds the index of the first instance of the item within the array
---@param ItemToFind TElement @The item to look for
---@return integer @The index the item was found at, or -1 if not found
function TArray:Find(ItemToFind) end

---Insert item at the given index into the array.
---@param NewItem TElement @The item to insert into the array
---@param Index integer @The index at which to insert the item into the array
function TArray:Insert(NewItem, Index) end

---Remove item at the given index from the array.
---@param IndexToRemove integer @The index into the array to remove from
function TArray:Remove(IndexToRemove) end

---Remove all instances of item from array.
---@param Item TElement @The item to remove from the array
---@return boolean @True if one or more items were removed
function TArray:RemoveItem(Item) end

---Clear the array, removes all content
function TArray:Clear() end

---Reserve space for N elements
---@param Size integer @Size
---@return boolean @whether the operation succeed
function TArray:Reserve(Size) end

---Resize Array to specified size. 
---@param Size integer @The new size of the array
function TArray:Resize(Size) end

---Get address of the i'th element
---@param Index integer @the index
---@return lightuserdata @the address of the i'th element
function TArray:GetData(Index) end

---Given an array and an index, returns a copy of the item found at that index.
---Writing into that copy does not change the array; use Set or GetRef for that.
---@param Index integer @The index in the array to get an item from
---@return any @A copy of the item stored at the index
function TArray:Get(Index) end

---Given an array and an index, returns a reference of the item found at that index
---@param Index integer @The index in the array to get an item from
---@return TElement @A reference of the item stored at the index
function TArray:GetRef(Index) end

---Given an array and an index, assigns the item to that array element
---@param Index integer @The index to assign the item to
---@param Item TElement @The item to assign to the index of the array
function TArray:Set(Index, Item) end

---Swaps the elements at the specified positions
---If the specified positions are equal, invoking this method leaves the array unchanged
---@param FirstIndex integer @The index of one element to be swapped
---@param SecondIndex integer @The index of the other element to be swapped
function TArray:Swap(FirstIndex, SecondIndex) end

---Shuffle (randomize) the elements
function TArray:Shuffle() end

---Get the last valid index
---@return integer @The last valid index of the array
function TArray:LastIndex() end

---Tests whether IndexToTest addresses an element of this array.
---@param IndexToTest integer @The Index, that we want to test for being valid
---@return boolean
function TArray:IsValidIndex(IndexToTest) end

---Returns true if the array contains the given item
---@param ItemToFind any @The item to look for
---@return boolean @True if the item was found within the array
function TArray:Contains(ItemToFind) end

---Append an array to another array
---@param OtherArray TArray @The array to add
function TArray:Append(OtherArray) end

---Get a lua table copy of this array. Changing the table does not change the array.
---@return table
function TArray:ToTable() end

---@type fun(ElementType:any):TArray
UE.TArray = TArray

---@class TMap<TKey,TValue>
local TMap = {}

---Determines the number of entries in map
---@return integer
function TMap:Num() end

---Adds a key and value to the map. If something already uses the provided key it will be overwritten with the new value.
---After calling Key is guaranteed to be associated with Value until a subsequent mutation of the Map.
---@param Key TKey @The key that will be used to look the value up
---@param Value TValue @The value to be retrieved later
function TMap:Add(Key, Value) end

---Removes a key and its associated value from the map.
---@param Key any @The key that will be used to look the value up
---@return boolean @True if an item was removed (False indicates nothing in the map uses the provided key)
function TMap:Remove(Key) end

---Finds the value associated with the provided Key. Returns a copy.
---@param Key any @The key that will be used to look the value up
---@return any @The value associated with the key
function TMap:Find(Key) end

---Finds the value associated with the provided Key. Returns the value itself, not a copy.
---@param Key any @The key that will be used to look the value up
---@return any @The reference value associated with the key
function TMap:FindRef(Key) end

---Clears all entries, resetting it to empty
function TMap:Clear() end

---Outputs an array of all keys present in the map
---@return TArray @All keys present in the map
function TMap:Keys() end

---Outputs an array of all values present in the map
---@return TArray @All values present in the map
function TMap:Values() end

---Get a lua table copy of this map. Changing the table does not change the map.
---@return table
function TMap:ToTable() end

---@type fun(KeyType:any,ValueType:any):TMap
UE.TMap = TMap

---@class TSet<TElement>
local TSet = {}

---Get the number of items in set.
---@return integer
function TSet:Num() end

---Adds item to set
---@param NewItem TElement @The item to add to the set
function TSet:Add(NewItem) end

---Remove item from set
---@param Item TElement @The item to remove from the set
---@return boolean @True if an item was removed (False indicates no equivalent item was present)
function TSet:Remove(Item) end

---Returns true if the set contains the given item.
---@param ItemToFind any @The item to look for
---@return boolean @True if the item was found within the set
function TSet:Contains(ItemToFind) end

---Clear the set, removes all content.
function TSet:Clear() end

---Outputs an Array containing copies of the entries of a Set.
---@return TArray @Array
function TSet:ToArray() end

---Get a lua table copy of this set. Changing the table does not change the set.
---@return table
function TSet:ToTable() end

---@type fun(ElementType:any):TSet
UE.TSet = TSet

---@class UClass
local UClass = {}

---Load a class by its UE reference path. Example: UClass.Load("/Game/Core/Blueprints/AICharacter.AICharacter_C").
---Note: there is a _C at the end of the path.
---Raises an error when the path resolves to nothing, and when it resolves to something that is not
---a class: the latter names UObject.Load as the call to use instead.
---@param Path string @UE reference path to the class
---@return UClass
function UClass.Load(Path) end

---Test whether this class is a child of another class. Both the type name and the UClass it stands
---for work as the call target and as the argument: AGPlayerPawn:IsChildOf(APawn).
---@param TargetClass UClass @target class
---@return boolean @true if this class derives from the target class.
function UClass:IsChildOf(TargetClass) end

---Get default object of a class. Called on the class, not on an instance: an instance raises
---"invalid source class".
---@return UObject @class default object
function UClass:GetDefaultObject() end

UE.UClass = UClass

---Single-cast delegate. Holds at most one listener.
---Reached through a field of a live object: a delegate obtained from a function that returns a
---struct is part of a copy, and a listener attached to it never fires.
---A callback must not take a first parameter named 'self', which also rules out defining it with
---a colon.
---@class Delegate
local Delegate = {}

---Bind a callback to the delegate, replacing any previous listener. Nothing reports that a previous
---listener was displaced, so two scripts binding to the same delegate is not a case either of them
---can detect.
---@param Function function @callback
function Delegate:Bind(Function) end

---Unbind the callback from the delegate. Binding again afterwards is legitimate.
function Delegate:Unbind() end

---Returns true if a listener is bound (from Lua or from native code).
---@return boolean
function Delegate:IsBound() end

---Remove the listener if a script created it, leaving a C++ or Blueprint listener attached.
---@return integer @number of removed listeners
function Delegate:RemoveLuaListeners() end

---Invoke the bound callback with the given arguments.
---Variable argument list (look for target delegate signature).
function Delegate:Execute(...) end

---Multicast delegate. Holds any number of listeners.
---Reached through a field of a live object: a delegate obtained from a function that returns a
---struct is part of a copy, and a listener attached to it never fires.
---A callback must not take a first parameter named 'self', which also rules out defining it with
---a colon.
---Every method here refuses to run once the object owning the delegate has been destroyed.
---@class MulticastDelegate
local MulticastDelegate = {}

---Add a listener. Takes the callback alone; the upstream (Object, Function) form is rejected.
---Adding the same function twice from the same script produces one listener, not two.
---@param Function function @callback
---@return table @handle with a :Remove() method
function MulticastDelegate:Add(Function) end

---Remove a specific listener. The function reference must match the one passed to Add.
---@param Function function @callback (must be the same reference passed to Add)
---@return integer @number of removed listeners
function MulticastDelegate:Remove(Function) end

---Remove every listener on this delegate, including those created by C++ and by Blueprints, and
---return nothing. The same delegate carries listeners belonging to the game and to other mods, so
---emptying it disables logic that has nothing to do with the calling script. Prefer the handle
---returned by Add, Remove, or the module-scoped methods on the script table.
function MulticastDelegate:RemoveAll() end

---Remove every script-created listener on this delegate, whichever script created it, leaving
---C++ and Blueprint listeners attached. A development tool for clearing script listeners before
---testing something, rather than everyday practice.
---@return integer @number of removed listeners
function MulticastDelegate:RemoveLuaListeners() end

---Broadcast: invoke all listeners with the given arguments.
---Variable argument list (look for target delegate signature).
function MulticastDelegate:Broadcast(...) end

---Returns true if there is at least one listener (Lua or native).
---@return boolean
function MulticastDelegate:IsBound() end

---------- Persistent script module

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

---------- Global getters

---Get Unreal Engine World object
---@return UWorld 
function GetWorld() end

---Get in-game Player Controller (use inside GameMap)
---@return AGPlayerController 
function GetPlayerController() end

---Get in-menu Player Controller (use inside MainMenu map)
---@return AGMenuPlayerController 
function GetMenuPlayerController() end

---Get in-game player pawn (use inside GameMap)
---@return AGPlayerPawn 
function GetPlayerPawn() end

---Get in-menu Player Pawn (use inside MainMenu map)
---@return AGMenuPlayerPawn 
function GetMenuPlayerPawn() end

---Get in-game Game Mode (use inside GameMap)
---@return AGGameMode
function GetGameMode() end

---Get in-menu Game Mode (use inside MainMenu map)
---@return AGMenuGameMode 
function GetMenuGameMode() end

--- Get in-game Game World (use inside GameMap)
--- @return UGameWorld 
function GetGameWorld() end

---Get Asset Manager singleton (an object used to handle runtime asset loading and management)
---@return UGAssetManager 
function GetAssetManager() end

---Get Game Options singleton (player-set option values)
---@return UGameOptions 
function GetGameOptions() end

---------- Script management

--- Returns true if a script with this require path is currently loaded as a persistent module.
---@param path string
---@return boolean
function IsScriptLoaded(path) end

--- Unloads a persistent module by require path. Logs a warning and does nothing if the path is a
--- one-shot script or is not currently loaded.
---@param path string
---@return boolean @whether a module was loaded at that path when the call was made
function UnloadScript(path) end

--- Atomically reloads a persistent module by require path: the old generation dies and a fresh
--- load runs in the same call. Logs a warning and does nothing if the path is a one-shot script or
--- is not currently loaded.
---@param path string
---@return boolean @whether the reload succeeded
function ReloadScript(path) end

---------- Log

---Log an info (note) message to the game log
---@param Msg string
function LogInfo(Msg) end

---Log a warning message to the game log
---@param Msg string
function LogWarn(Msg) end

---Log an error message to the game log
---@param Msg string
function LogError(Msg) end

---------- Flags

---Add bitmask flags to a flag value
---@param Flags integer
---@param FlagsToAdd integer
---@return integer 
function AddFlags(Flags, FlagsToAdd) end

---Remove bitmask flags from a flag value
---@param Flags integer
---@param FlagsToRemove integer
---@return integer 
function RemoveFlags(Flags, FlagsToRemove) end

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
