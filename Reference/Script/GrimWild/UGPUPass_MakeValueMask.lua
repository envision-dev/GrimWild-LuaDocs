---For each pixel, reads the R channel of LiquidsTexture and outputs 1.0 (white / 255)
---if the stored value matches TargetId/255.0 within a half-step tolerance, or 0.0 otherwise.
---Input:  LiquidsTexture — R8 uint8 render target holding per-cell liquid ids.
---Output: R8 render target — binary mask for a single liquid type.
---TargetId must be >= 1. Id 0 is reserved as the no-liquid sentinel.
---@class UGPUPass_MakeValueMask : UGPUPass
---@field public LiquidsTexture UTextureRenderTarget2D @Shared R8 liquids buffer render target. The R channel holds per-cell liquid ids.
---@field public TargetId integer @Id of the liquid to extract. Must be >= 1; 0 is the no-liquid sentinel and is invalid.
UGPUPass_MakeValueMask = {}

