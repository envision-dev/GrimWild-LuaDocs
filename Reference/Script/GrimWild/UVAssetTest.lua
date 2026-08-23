---@meta
---@class UVAssetTest : UGAssetBase
---@field public One integer
---@field public Two string
---@field public TransientField string
UVAssetTest = {}

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function UVAssetTest:GatherDebugData() end

