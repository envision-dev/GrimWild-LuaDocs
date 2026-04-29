---Data to animate one particular axis of the element
---@class FAnimationCurve
---@field public Curve UCurveFloat
---@field public Amplitude number @Value (not time) multiplier
---@field public TimeMultiplier number @Defines the curve evaluation speed. E.g. CurrentTime = 1, TimeMultiplier = 1 -> sampling at time 1.0; CurrentTime = 1, TimeMultiplier = 2 -> sampling at time 2.0.
---@field public bClampTime boolean @Defines the curve sampling behavior when sampling outside of the time boundaries. Default: wrapping (bClampTime == false). Clamping adds extra logic, so only use it when necessary.
FAnimationCurve = {}
