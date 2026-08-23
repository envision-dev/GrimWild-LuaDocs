---@meta
---Asset defining a UI category with its icon, priority and color styling.
---@class UCategoryData : UGAssetBase
---@field public Icon FPrimaryAssetId
---@field public Priority number
---@field public ColorStyle FWidgetColorStyle
UCategoryData = {}

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function UCategoryData:GatherDebugData() end

