---Returns 1 if the pixel value is inside the selected range of min/max values,
---or 0 otherwise. Outputs into an R8 render target.
---@class UGPUPass_MakeValueRangeMask : UGPUPass
---@field public WorldHeight UTextureRenderTarget2D @Height map render target. The R channel is used as the height value.
---@field public MinHeight number @Minimum height (inclusive) of the surface band.
---@field public MaxHeight number @Maximum height (exclusive) of the surface band.
UGPUPass_MakeValueRangeMask = {}

