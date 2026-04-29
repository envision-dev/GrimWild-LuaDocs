---UGPUPass_DrawTexture — game-thread UObject.
---Draws TextureToDraw onto RenderTarget at a given Position/Size
---using the specified blend and filter modes.
---Output field is UGPUPass::RenderTarget.
---TextureToDraw is the source texture drawn onto the output.
---@class UGPUPass_DrawTexture : UGPUPass
---@field public TextureToDraw UTexture @Source texture to draw onto the output render target.
---@field public Filter ECellBufferTextureFilter @Filtering applied when sampling TextureToDraw. Does not affect the render target.
---@field public Position FVector2D @Normalized [0,1] position of the top-left corner of the drawn region in output space.
---@field public Size FVector2D @Normalized [0,1] width and height of the drawn region. (1,1) = fill entire output.
---@field public ColorBlendMode EDrawTextureBlendMode @Blend mode applied to the RGB channels of TextureToDraw.
---@field public AlphaBlendMode EDrawTextureBlendMode @Blend mode applied to the Alpha channel of TextureToDraw independently.
UGPUPass_DrawTexture = {}

