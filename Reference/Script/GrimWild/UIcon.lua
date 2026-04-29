---Texture for a User Interface icon that is part of the Slate texture atlas.
---Made an asset for automatic packaging, scanning, referring by ID and registry storage.
---Raw and non-const pointers to Icons can be stored safely (async loading does not apply here).
---@class UIcon : UGAssetBase
---@field protected SourceTexture UTexture2D
---@field protected StartUV FVector2D
---@field protected SizeUV FVector2D
---@field protected CurrentIndex integer @Index of the cell in Atlas. @@see GenerateUV()
---@field protected IconSize integer @XY size of cells in atlas. @@see GenerateUV()
UIcon = {}

---Allows us to create transient icons in Blueprints
---@param NewTexture UTexture2D
---@param NewStartUV FVector2D
---@param NewSizeUV FVector2D
function UIcon:ConstructFromManualData(NewTexture, NewStartUV, NewSizeUV) end

---Generated StartUV and SizeUV using other EditorOnly properties
function UIcon:GenerateUV() end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UIcon:GatherDebugData(DebugString) end

