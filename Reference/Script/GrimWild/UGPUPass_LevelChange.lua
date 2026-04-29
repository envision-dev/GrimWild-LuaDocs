---@class UGPUPass_LevelChange : UGPUPass
---@field public Type ELevelChangeType
---@field public Noise_LF UTexture @Low-frequency Perlin, RGB channels with different seeds. //Keeping a strong reference to the texture loaded from the GPUPass creation time
---@field public Noise_MF UTexture @Mid-frequency Perlin, RGB channels with different seeds
---@field public Noise_HF UTexture @High-frequency Perlin, RGB channels with different seeds
UGPUPass_LevelChange = {}

