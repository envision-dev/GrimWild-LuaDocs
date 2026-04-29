---Computes a per-cell sky-light influence value that fades inward from roof boundaries.
---For each cell under a roof, a Bresenham ray march searches within BlurRadius cells
---for the nearest unoccluded open-sky neighbour. The found distance is converted to a
---[0, 1] influence value through the selected falloff curve:
---  1.0 = open sky or at the roof edge  (full sunlight)
---  0.0 = enclosed / deep under roof    (no sunlight)
---Input:  RoofMap and RestrictionMap textures with byte-packed bitmask data.
---Output: single-channel r8 render target.
---@class UGPUPass_SunlightReach : UGPUPass
---@field public RoofMap UTexture @Texture whose R channel encodes roofed-cell bitmask data.
---@field public RestrictionMap UTexture @Texture whose R channel encodes light-blocked-cell bitmask data.
---@field public RoofBitIndex integer @Bit index in RoofMap that marks a cell as roofed (0..7). e.g. 5 means bit (1<<5) = 0b00100000.
---@field public LightBlockedBitIndex integer @Bit index in RestrictionMap that marks a cell as blocking light (0..7). e.g. 0 means bit (1<<0) = 0b00000001.
---@field public BlurRadius number @Fade distance in cells from the roof edge inward. Clamped to a maximum of 32.
---@field public MaxRoofEdgeInfluence number @Scales the peak sunlight influence at the roof edge (0..1). Cells deeper under the roof fade to 0. Open-sky cells are unaffected.
UGPUPass_SunlightReach = {}

