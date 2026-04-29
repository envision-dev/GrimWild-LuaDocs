---Game-thread wrapper for FLightBounceCS.
---Applies multi-step secondary bounce light to RT_LocalLight in-place
---using an internal ping-pong pattern.
---RenderTarget (base) = RT_LocalLight (input and output).
---@class UGPUPass_LightBounce : UGPUPass
---@field public CellRestrictionsRT UTexture @CellRestrictions buffer data render target.
---@field public Steps integer @Number of bounce iterations.
---@field public BounceRadius integer @Square neighbourhood radius for gathering re-emitters (cells).
---@field public BounceStrength number @Bounce contribution multiplier.
UGPUPass_LightBounce = {}

