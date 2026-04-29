---Game-thread wrapper for FSpreadStaticLightCS.
---Dispatched only when static lights change (dirty-triggered, not every frame).
---CapturePass() calls Owner->BuildStaticGPUArray() to obtain the current
---static light list.
---Clears and writes RT_SpreadStaticLight (rgb = color, a = intensity).
---When the array is empty the shader still dispatches to clear stale data.
---@class UGPUPass_SpreadStaticLight : UGPUPass
---@field public Owner ULightManager @Used to call BuildStaticGPUArray().
---@field public CellRestrictionsRT UTexture @CellRestrictions buffer data render target.
UGPUPass_SpreadStaticLight = {}

