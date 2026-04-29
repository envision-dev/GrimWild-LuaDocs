---TODO;
---@class EDrawTextureBlendMode
---@field public None EDrawTextureBlendMode [0] Don't update pixels. Value = OldValue
---@field public Overwrite EDrawTextureBlendMode [1] Set to a new value. Value = NewValue
---@field public Add EDrawTextureBlendMode [2] Value += NewValue
---@field public Subtract EDrawTextureBlendMode [3] Value -= NewValue
---@field public Multiply EDrawTextureBlendMode [4] Value *= NewValue
---@field public AlphaComposite EDrawTextureBlendMode [5] ALPHA CHANNEL ONLY. Blends the source over the destination using the source's own alpha as a mask. Fully opaque pixels overwrite, fully transparent pixels leave the destination unchanged, values in between interpolate. Use this when drawing sprites or any texture with shaped transparency on top of existing content.
EDrawTextureBlendMode = {}
