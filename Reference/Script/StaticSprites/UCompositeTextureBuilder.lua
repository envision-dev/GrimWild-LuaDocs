---@meta
---Builds composite textures by packing multiple channel textures into a single texture at runtime.
---@class UCompositeTextureBuilder : UObject
UCompositeTextureBuilder = {}

---
---@param InRawTextures TMap<ECompositeTextureChannel, FCompositeTextureRawChannel> @all channels for the composite texture. Only Albedo texture is necessary, other channels might be empty
---@return UTexture2D
function UCompositeTextureBuilder.Build(InRawTextures) end

