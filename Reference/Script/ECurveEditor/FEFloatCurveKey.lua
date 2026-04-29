---@class FEFloatCurveKey
---@field public Time number
---@field public Value number
---@field public InterpMode EEFloatCurveInterp
---@field public ArriveTangent number @Slopes (dy/dx), not angles — matches FRichCurveKey convention
---@field public LeaveTangent number
---@field public ArriveTangentWeight number
---@field public LeaveTangentWeight number
---@field public bBreakTangents boolean @When true, arrive and leave tangents are independent
FEFloatCurveKey = {}
