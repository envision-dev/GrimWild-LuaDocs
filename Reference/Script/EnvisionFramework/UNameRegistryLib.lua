---@class UNameRegistryLib : UBlueprintFunctionLibrary
UNameRegistryLib = {}

---TODO; Don't add -1 value manually. -1 means invalid value in the context of name registries.
---@param Registry FNameRegistry @[out]
---@param Name string
---@param Value integer
function UNameRegistryLib.Add(Registry, Name, Value) end

---
---@param Registry FNameRegistry @[out]
---@param Name string
---@return integer
function UNameRegistryLib.AddAutoValue(Registry, Name) end

---TODO
---@param Registry FNameRegistry
---@param Name string
---@return boolean
function UNameRegistryLib.ContainsName(Registry, Name) end

---TODO
---@param Registry FNameRegistry
---@param Value integer
---@return boolean
function UNameRegistryLib.ContainsValue(Registry, Value) end

---TODO
---@param Registry FNameRegistry
---@param Value integer
---@return string
function UNameRegistryLib.GetName(Registry, Value) end

---TODO
---@param Registry FNameRegistry
---@param Value integer
---@return string
function UNameRegistryLib.GetNameChecked(Registry, Value) end

---TODO
---@param Registry FNameRegistry
---@return TMap<string, integer>
function UNameRegistryLib.GetNamesToValues(Registry) end

---TODO
---@param Registry FNameRegistry
---@param Name string
---@return integer
function UNameRegistryLib.GetValue(Registry, Name) end

---TODO
---@param Registry FNameRegistry @[out]
---@param Name string
---@return integer
function UNameRegistryLib.GetValueChecked(Registry, Name) end

---TODO
---@param Registry FNameRegistry @[out]
---@param Name string
---@return boolean
function UNameRegistryLib.RemoveName(Registry, Name) end

---TODO
---@param Registry FNameRegistry @[out]
---@param Value integer
---@return boolean
function UNameRegistryLib.RemoveValue(Registry, Value) end

