---@class FLightSource
---@field public Position FVector2D @Integer part = cell index, fractional part = in-cell UV offset (0..1). Example: (10.3, 5.7) means cell (10,5), offset (0.3, 0.7) within that cell.
---@field public Color FColor
---@field public Intensity number
---@field public Radius number
---@field public CosHalfAngle number @Static lights only. Ignored for dynamic lights. Precomputed cos(HalfAngle). -1.0 = omni (no cone restriction). Can be modified via SetLightSourceConeWidth().
---@field public Direction FVector2D @Static lights only. Ignored for dynamic lights. Normalised direction for spotlight. Ignored when CosHalfAngle == -1.0. Can be modified via SetLightSourceFacingAngle().
---@field public bDynamic boolean @If true, this light is recomputed every frame (dynamic). Otherwise static (recomputed on dirty only).
---@field public bEnabled boolean
FLightSource = {}
