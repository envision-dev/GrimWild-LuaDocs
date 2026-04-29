---@class FPlaytestSurfaceInstance
---@field public PlaneComponent UStaticMeshComponent
---@field public SurfaceMaskMaker UGPUPass_MakeValueRangeMask @SurfaceMask render target = buffer's RT_Data
---@field public RT_Borders UTextureRenderTarget2D @Size = x2 of the LevelSize
---@field public BorderMaker UGPUPass_GetMaskNeighborState
FPlaytestSurfaceInstance = {}
