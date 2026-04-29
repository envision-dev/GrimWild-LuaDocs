---Computes per-pixel neighbor differences for a single channel of an input texture.
---Input: texture (float channels) and a single channel to sample.
---Output R = north neighbor diff, G = east, B = south, A = west.
---0 for invalid neighbors out of texture bounds.
---@class UGPUPass_ValueDiff : UGPUPass
---@field public InputTexture UTextureRenderTarget2D
---@field public InputTextureChannel ECellBufferTextureChannel @Channel to sample from the input texture. Must be a single channel (R, G, B, or A).
UGPUPass_ValueDiff = {}

