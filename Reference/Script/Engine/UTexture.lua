---@meta
---@class UTexture : UStreamableRenderAsset
---@field private LightingGuid FGuid @Unique ID for this material, used for caching during distributed lighting
---@field public LevelIndex integer @Level scope index of this texture. It is used to reduce the amount of lookup to map a texture to its level index. Useful when building texture streaming data, as well as when filling the texture streamer with precomputed data. It relates to FStreamingTextureBuildInfo::TextureLevelIndex and also the index in ULevel::StreamingTextureGuids. Default value of -1, indicates that the texture has an unknown index (not yet processed). At level load time, -2 is also used to indicate that the texture has been processed but no entry were found in the level table. After any of these processes, the LevelIndex is reset to INDEX_NONE. Making it ready for the next level task.
---@field public LODBias integer @A bias to the index of the top mip level to use.  That is, number of mip levels to drop when cooking.
---@field public CompressionSettings integer @Compression settings to use when building the texture.
---@field public Filter integer @The texture filtering mode to use when sampling this texture.
---@field public MipLoadOptions ETextureMipLoadOptions @The texture mip load options.
---@field public CookPlatformTilingSettings integer @If the platform supports it, tile the texture when cooking, or keep it linear and tile it when it's actually submitted to the GPU.
---@field public LODGroup integer @Texture group this texture belongs to
---@field public Downscale FPerPlatformFloat @Downscale source texture, applied only to 2d textures without mips 0.0 - use scale value from texture group 1.0 - do not scale texture > 1.0 - scale texure
---@field public DownscaleOptions ETextureDownscaleOptions @Texture downscaling options
---@field public SRGB boolean @Whether Texture and its source are in SRGB Gamma color space.  Can only be used with 8-bit and compressed formats.  This should be unchecked if using alpha channels individually as masks.
---@field public bNoTiling boolean @If true, the RHI texture will be created using TexCreate_NoTiling
---@field public VirtualTextureStreaming boolean @Is this texture streamed in using VT
---@field public CompressionYCoCg boolean @If true the texture stores YCoCg. Blue channel will be filled with a precision scale during compression.
---@field public bNotOfflineProcessed boolean @If true, the RHI texture will be created without TexCreate_OfflineProcessed. This controls what format the data will be uploaded to RHI. Offline processed textures may have platform specific tiling applied, and/or have their mip tails pre-combined into a single mip's data. If NotOffline, then it will expect data to be uploaded in standard per-mip layouts.
---@field private bAsyncResourceReleaseHasBeenStarted boolean @Whether the async resource release process has already been kicked off or not
---@field protected AssetUserData TArray<UAssetUserData> @Array of user data stored with the asset
UTexture = {}

---Gets the memory size of the texture, in bytes.
---This is the size in GPU memory of the built platformdata, accounting for LODBias, etc.
---Returns zero for error.
---@return integer
function UTexture:Blueprint_GetMemorySize() end

---Gets the memory size of the texture source top mip, in bytes, and the size on disk of the asset, which may be compressed.
---Uses texture source, not available in runtime games.
---Does not cause texture source to be loaded, queries cached values.
---Returns zero for error.
---@return integer OutDiskSize
---@return integer OutMemorySize
function UTexture:Blueprint_GetTextureSourceDiskAndMemorySize() end

---Scan the texture source pixels to compute the min & max values of the RGBA channels.
---Uses texture source, not available in runtime games.
---Causes texture source data to be loaded, is computed by scanning pixels when called.
---Will set Min=Max=zero and return false on failure
---@param OutColorMin FLinearColor @[out, modified in place]
---@param OutColorMax FLinearColor @[out, modified in place]
---@return boolean
function UTexture:ComputeTextureSourceChannelMinMax(OutColorMin, OutColorMax) end

