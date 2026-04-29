---This does not correspond to bit positions. For example, Albedo Alpha channel occupies a custom amount of bits
---@class ECompositeTextureChannel
---@field public Albedo ECompositeTextureChannel [0] Color (RGB) + Alpha (N bits, defined in CompositeTextureBuilder.cpp file)
---@field public Tint ECompositeTextureChannel [1] 1 bit mask
---@field public Metallic ECompositeTextureChannel [2] 1 bit mask
---@field public Test0 ECompositeTextureChannel [3]
---@field public Test1 ECompositeTextureChannel [4]
---@field public NUM ECompositeTextureChannel [5] WARNING: the total amount of elements here should be (CustomChannels.Num + BitsOccupiedForAlpha <= 8). If we occupy 4 bits for Alpha, only 4 custom channels can present. If we have incorrect values, mask bit shifting will be negative.
ECompositeTextureChannel = {}
