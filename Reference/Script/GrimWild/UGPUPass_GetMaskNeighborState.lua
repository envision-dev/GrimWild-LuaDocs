---For each pixel, extracts a single bit from the packed bitmask input texture,
---samples all 8 neighbors, and outputs their bit-states packed into a single byte
---encoded as float / 255 (bit0=N, bit1=NE, bit2=E, bit3=SE, bit4=S, bit5=SW, bit6=W, bit7=NW).
---Input:  any float4 texture with byte-packed bitmask data.
---Output: single-channel float render target (R8 / R32F).
---@class UGPUPass_GetMaskNeighborState : UGPUPass
---@field public InputTexture UTexture @Source texture containing packed bitmask data.
---@field public BitIndex integer @Which bit to extract from the packed texture. Bits 0-7: byte 0 (R channel), 8-15: byte 1 (G), 16-23: byte 2 (B), 24-31: byte 3 (A).
---@field public OutOfBoundsValue boolean @Value returned for pixels that fall outside texture bounds. False = 0 (open surface — no neighbor wall assumed). True  = 1 (solid wall — level borders treated as walls).
UGPUPass_GetMaskNeighborState = {}

