---Compute shader pass base class. Subclasses define specific operations applied to a render target.
---Creating new subclasses:
---  1. Override CapturePass(): capture game-thread state into an FCapturedGPUPass subclass.
---  2. Implement FCapturedGPUPass::AddPass() in the captured struct to dispatch the shader via RDG.
---See UGPUPass_Fill for implementation reference.
---@class UGPUPass : UGPUWorkBase
---@field public RenderTarget UTextureRenderTarget2D @Render target this pass writes to.
UGPUPass = {}

