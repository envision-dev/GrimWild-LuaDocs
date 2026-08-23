---@meta
---@class UObjectData : UGAssetBase
UObjectData = {}

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function UObjectData:GatherDebugData() end

