---Game-thread wrapper for FSunlightReachBounceCS.
---Applies multi-step secondary bounce to the SunlightReach (R8_UNORM) buffer in-place
---using an internal ping-pong pattern. Mirrors UGPUPass_LightBounce but operates on
---the scalar sunlight reach channel rather than RGBA local light.
---RenderTarget (base) = SunlightReachRT (input and output).
---@class UGPUPass_SunlightReachBounce : UGPUPass
---@field public CellRestrictionsRT UTexture @CellRestrictions buffer data render target.
---@field public RoofMap UTexture @CellFeatures buffer data render target (used as RoofMap).
---@field public Steps integer @Number of bounce iterations.
---@field public BounceRadius integer @Square neighbourhood radius for gathering re-emitters (cells).
---@field public BounceStrength number @Bounce contribution multiplier.
---@field public LightBlockedBitIndex integer @Bit index in CellRestrictions marking light-blocked cells.
---@field public RoofBitIndex integer @Bit index in RoofMap marking roofed cells (e.g. 5 = bit 1<<5).
UGPUPass_SunlightReachBounce = {}

