---Builds composite textures by packing multiple channel textures into a single texture at runtime.
---@class UCompositeTextureBuilder : UObject
UCompositeTextureBuilder = {}

---
---@param InRawTextures TMap<ECompositeTextureChannel, FCompositeTextureRawChannel>
---@return UTexture2D
function UCompositeTextureBuilder.Build(InRawTextures) end

