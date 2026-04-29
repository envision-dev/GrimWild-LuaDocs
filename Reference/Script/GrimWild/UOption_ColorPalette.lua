---Default palette = Empty value; Custom palette = absolute path to the JSON palette file.
---Note: Custom Palettes are Transient. We don't modify Config value of ColorStyle in WidgetSettings.
---The color palette value in Cfg stays default
---@class UOption_ColorPalette : UOptionData
UOption_ColorPalette = {}

---@return TArray<string>
function UOption_ColorPalette:GetKnownPalettes() end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UOption_ColorPalette:GatherDebugData(DebugString) end

