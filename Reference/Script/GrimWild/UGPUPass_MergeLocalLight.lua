---Game-thread wrapper for FMergeLocalLightCS.
---Sums the three intermediate accumulators (static, dynamic, cell glow)
---into the final RT_LocalLight render target.
---RenderTarget (base) = RT_LocalLight (output).
---@class UGPUPass_MergeLocalLight : UGPUPass
---@field public RT_SpreadStaticLight UTexture @Intermediate accumulator from SpreadStaticLight.
---@field public RT_SpreadDynamicLight UTexture @Intermediate accumulator from SpreadDynamicLight.
---@field public RT_SpreadCellGlow UTexture @Intermediate accumulator from SpreadCellGlow.
UGPUPass_MergeLocalLight = {}

