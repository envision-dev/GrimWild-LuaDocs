---Used to determine how we should handle mouse wheel input events when someone scrolls.
---@class EConsumeMouseWheel
---@field public WhenScrollingPossible EConsumeMouseWheel [0] Only consume the mouse wheel event when we actually scroll some amount.
---@field public Always EConsumeMouseWheel [1] Always consume mouse wheel event even if we don't scroll at all.
---@field public Never EConsumeMouseWheel [2] Never consume the mouse wheel
EConsumeMouseWheel = {}
