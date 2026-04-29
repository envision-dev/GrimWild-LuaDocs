---A single developer console item. Represents one configurable control shown in the Dev Console window.
---@class UDevConsoleItem : UGAssetBase
---@field public Category FPrimaryAssetId
---@field public Priority number @Determines the order in which all widgets are placed in the Window
UDevConsoleItem = {}

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UDevConsoleItem:GatherDebugData(DebugString) end

