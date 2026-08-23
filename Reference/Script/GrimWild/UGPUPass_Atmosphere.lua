---@meta
---Lerps each cell's current atmosphere value toward TargetValue using LerpAlpha.
---Cells with the ROOF_BIT_INDEX bit set in CellFeaturesTexture are left unchanged.
---Used for heat and air atmosphere propagation.
---Input/Output: RenderTarget (R32F) — by default used as both source and destination.
---CellFeaturesTexture — R8 packed bit flags (bit index selects roof check).
---Optionally supply InputMap to read atmosphere values from a separate texture instead of RenderTarget.
---@class UGPUPass_Atmosphere : UGPUPass
---@field public CellFeaturesTexture UTexture @Packed bit flags texture (R8, normalized). Bit at ROOF_BIT_INDEX signals a roof.
---@field public TargetValue number @Value that open (non-roof) cells converge toward.
---@field public LerpAlpha number @Lerp alpha controlling convergence speed per dispatch.
---@field public ConductivityMap UTexture @Optional per-pixel conductivity map (R channel, range 0..1) that scales LerpAlpha for non-roof cells. When null, LerpAlpha is applied unweighted (uniform conductance).
---@field public InputMap UTexture @Optional separate source texture (R32F) for reading current atmosphere values. When null, RenderTarget is used as both input and output (in-place update).
UGPUPass_Atmosphere = {}

