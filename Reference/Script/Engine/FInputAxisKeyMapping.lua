---@meta
---Defines a mapping between an axis and key
---@class FInputAxisKeyMapping : Struct
---@field public AxisName string @Friendly name of axis, e.g "MoveForward"
---@field public Scale number @Multiplier to use for the mapping when accumulating the axis value
---@field public Key FKey @Key to bind it to.
FInputAxisKeyMapping = {}
