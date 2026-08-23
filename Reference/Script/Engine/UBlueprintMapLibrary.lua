---@meta
---@class UBlueprintMapLibrary : UBlueprintFunctionLibrary
UBlueprintMapLibrary = {}

---Adds a key and value to the map. If something already uses the provided key it will be overwritten with the new value.
---After calling Key is guaranteed to be associated with Value until a subsequent mutation of the Map.
---@param TargetMap TMap<integer, integer> @The map to add the key and value to
---@param Key integer @The key that will be used to look the value up
---@param Value integer @The value to be retrieved later
function UBlueprintMapLibrary.Map_Add(TargetMap, Key, Value) end

---Clears a map of all entries, resetting it to empty
---@param TargetMap TMap<integer, integer> @The map to clear
function UBlueprintMapLibrary.Map_Clear(TargetMap) end

---Checks whether key is in a provided Map
---@param TargetMap TMap<integer, integer> @The map to perform the lookup on
---@param Key integer @The key that will be used to lookup
---@return boolean
function UBlueprintMapLibrary.Map_Contains(TargetMap, Key) end

---Finds the value associated with the provided Key
---@param TargetMap TMap<integer, integer> @The map to perform the lookup on
---@param Key integer @The key that will be used to look the value up
---@return boolean
---@return integer Value @The value associated with the key, default constructed if key was not found
function UBlueprintMapLibrary.Map_Find(TargetMap, Key) end

---Check if the map does not have any entires
---@param TargetMap TMap<integer, integer> @The map to check
---@return boolean
function UBlueprintMapLibrary.Map_IsEmpty(TargetMap) end

---Check if the map has any entries
---@param TargetMap TMap<integer, integer> @The map to check
---@return boolean
function UBlueprintMapLibrary.Map_IsNotEmpty(TargetMap) end

---Outputs an array of all keys present in the map
---@param TargetMap TMap<integer, integer> @The map to get the list of keys from
---@param Keys TArray<integer> @[out, modified in place] All keys present in the map
function UBlueprintMapLibrary.Map_Keys(TargetMap, Keys) end

---Determines the number of entries in a provided Map
---@param TargetMap TMap<integer, integer> @The map in question
---@return integer
function UBlueprintMapLibrary.Map_Length(TargetMap) end

---Removes a key and its associated value from the map.
---@param TargetMap TMap<integer, integer> @The map to remove the key and its associated value from
---@param Key integer @The key that will be used to look the value up
---@return boolean
function UBlueprintMapLibrary.Map_Remove(TargetMap, Key) end

---Outputs an array of all values present in the map
---@param TargetMap TMap<integer, integer> @The map to get the list of values from
---@param Values TArray<integer> @[out, modified in place] All values present in the map
function UBlueprintMapLibrary.Map_Values(TargetMap, Values) end

---Not exposed to users. Supports setting a map property on an object by name.
---@param Object UObject
---@param PropertyName string
---@param Value TMap<integer, integer>
function UBlueprintMapLibrary.SetMapPropertyByName(Object, PropertyName, Value) end

