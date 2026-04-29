---@class EWidgetTimingPolicy
---@field public RealTime EWidgetTimingPolicy [0] The widget will tick using real time. When not ticking, real time will accumulate and be simulated on the next tick.
---@field public GameTime EWidgetTimingPolicy [1] The widget will tick using game time, respecting pausing and time dilation.
EWidgetTimingPolicy = {}
