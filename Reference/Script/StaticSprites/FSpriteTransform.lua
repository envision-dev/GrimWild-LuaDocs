---A struct responsible for sprite transform.
---Unit suffix convention: when a method name carries a unit suffix (_TPX, _SPX, _UU),
---the suffix describes the coordinate space of the Location component only.
---Rotation is always in degrees; Scale is always a dimensionless multiplier.
---@class FSpriteTransform
---@field public Location FVector2D @XY location
---@field public Rotation number @Rotation along the Z axis, 0..360
---@field public Scale FVector2D @XY scale
FSpriteTransform = {}
