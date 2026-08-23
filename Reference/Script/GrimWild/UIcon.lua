---@meta
---Texture for a User Interface icon that is part of the Slate texture atlas.
---Made an asset for automatic packaging, scanning, referring by ID and registry storage.
---Raw and non-const pointers to Icons can be stored safely (async loading does not apply here).
---@class UIcon : UGAssetBase
---@field protected SourceTexture UTexture2D
---@field protected StartUV FVector2D
---@field protected SizeUV FVector2D
UIcon = {}

---Allows us to create transient icons in Blueprints
---@param NewTexture UTexture2D
---@param NewStartUV FVector2D
---@param NewSizeUV FVector2D
function UIcon:ConstructFromManualData(NewTexture, NewStartUV, NewSizeUV) end

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function UIcon:GatherDebugData() end

