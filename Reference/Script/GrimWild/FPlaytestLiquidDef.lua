---@class FPlaytestLiquidDef
---@field public Name string
---@field public Material UMaterialInterface
---@field public GlowRadius integer @Glow spread radius in cells. 0 means no glow.
---@field public GlowColor FColor @RGB glow color. Alpha is ignored.
---@field public GlowIntensity number @Normalized glow intensity [0, 1]. Passed directly to SetCellGlow.
FPlaytestLiquidDef = {}
