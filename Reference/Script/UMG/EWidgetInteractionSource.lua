---The interaction source for the widget interaction component, e.g. where do we try and
---trace from to try to find a widget under a virtual pointer device.
---@class EWidgetInteractionSource
---@field public World EWidgetInteractionSource [0] Sends traces from the world location and orientation of the interaction component.
---@field public Mouse EWidgetInteractionSource [1] Sends traces from the mouse location of the first local player controller.
---@field public CenterScreen EWidgetInteractionSource [2] Sends trace from the center of the first local player's screen.
---@field public Custom EWidgetInteractionSource [3] Sends traces from a custom location determined by the user.  Will use whatever FHitResult is set by the call to SetCustomHitResult.
EWidgetInteractionSource = {}
