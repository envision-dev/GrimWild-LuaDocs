---Conductivity-weighted heat diffusion pass.
---Each dispatch runs Steps iterations of explicit-Euler diffusion, reading from
---InputMap (or RenderTarget when InputMap is null) and writing the result to RenderTarget.
---Internal ping-pong buffers ensure no read-write hazard even when input == output.
---ConductivityMap is optional. When null, uniform conductance (1.0 everywhere)
---is assumed. When supplied, its R channel controls per-pixel conductance:
---lower values impede heat flow across that cell's boundaries.
---Input/Output: RenderTarget (R32F) — by default used as both source and destination.
---Optionally supply InputMap to read heat values from a separate texture instead of RenderTarget.
---@class UGPUPass_Diffusion : UGPUPass
---@field public Steps integer @Number of diffusion iterations executed per Dispatch() call.
---@field public ConductivityMap UTexture @Optional per-pixel conductivity map (R channel, range 0..1). When null, all conductance are treated as 1.0 (uniform diffusion).
---@field public Alpha number @Diffusion rate (explicit-Euler alpha). Values near 0 diffuse slowly; values too large trigger the per-pixel stability clamp and may cause slight heat non-conservation.
---@field public InputMap UTexture @Optional separate source texture (R32F) for reading heat values. When null, RenderTarget is used as both input and output (in-place diffusion).
UGPUPass_Diffusion = {}

