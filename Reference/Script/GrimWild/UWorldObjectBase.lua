---@meta
---Handles all the technical details of world objects
---@class UWorldObjectBase : UObject
UWorldObjectBase = {}

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function UWorldObjectBase:GatherDebugData() end

