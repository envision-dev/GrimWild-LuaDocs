---The different states of pixel snapping a widget can be in.
---@class EWidgetPixelSnapping
---@field public Inherit EWidgetPixelSnapping [0] Inherits the snapping method set by the parent widget.
---@field public Disabled EWidgetPixelSnapping [1] Draws the widget without snapping. Useful during animations or moving indicators.
---@field public SnapToPixel EWidgetPixelSnapping [2] Draws the widget at the nearest pixel. Improves sharpness of widgets.
EWidgetPixelSnapping = {}
