---@meta
---This struct holds data about how a texture is sampled within a material.
---@class FMaterialTextureInfo : Struct
---@field public SamplingScale number @The scale used when sampling the texture
---@field public UVChannelIndex integer @The coordinate index used when sampling the texture
---@field public TextureName string @The texture name. Used for debugging and also to for quick matching of the entries.
FMaterialTextureInfo = {}
