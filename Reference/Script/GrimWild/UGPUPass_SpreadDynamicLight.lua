---Game-thread wrapper for FSpreadDynamicLightCS.
---Dispatched every frame as long as there are dynamic light sources.
---CapturePass() calls Owner->BuildDynamicGPUArray() to obtain the current
---dynamic light list.
---Clears and writes RT_SpreadDynamicLight (rgb = color, a = intensity).
---When the array is empty, uses AddClearUAVPass and skips dispatch.
---@class UGPUPass_SpreadDynamicLight : UGPUPass
---@field public Owner ULightManager @Used to call BuildDynamicGPUArray().
---@field public CellRestrictionsRT UTexture @CellRestrictions buffer data render target.
UGPUPass_SpreadDynamicLight = {}

