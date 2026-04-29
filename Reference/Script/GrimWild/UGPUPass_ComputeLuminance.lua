---Game-thread wrapper for FComputeLuminanceCS.
---Reads RT_LocalLight (intensity in .a channel) and SunlightReach,
---then writes the final Luminance value to RenderTarget (the Luminance
---buffer's data render target, which is CPU-downloaded by the sync system).
---SunlightIntensity is fetched from Owner at CapturePass() time so
---SetSunlightIntensity() changes take effect on the next sync without
---re-creating the work object.
---@class UGPUPass_ComputeLuminance : UGPUPass
---@field public RT_LocalLight UTexture @RT_LocalLight from MergeLocalLight / LightBounce. Intensity in .a channel.
---@field public SunlightReachRT UTexture @SunlightReach buffer data render target.
---@field public Owner ULightManager @Used to read SunlightIntensity at CapturePass() time.
UGPUPass_ComputeLuminance = {}

