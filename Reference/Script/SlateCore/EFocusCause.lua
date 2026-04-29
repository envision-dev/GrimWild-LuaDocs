---Context for focus change
---@class EFocusCause
---@field public Mouse EFocusCause [0] Focus was changed because of a mouse action.
---@field public Navigation EFocusCause [1] Focus was changed in response to a navigation, such as the arrow keys, TAB key, controller DPad, ...
---@field public SetDirectly EFocusCause [2] Focus was changed because someone asked the application to change it.
---@field public Cleared EFocusCause [3] Focus was explicitly cleared via the escape key or other similar action.
---@field public OtherWidgetLostFocus EFocusCause [4] Focus was changed because another widget lost focus, and focus moved to a new widget.
---@field public WindowActivate EFocusCause [5] Focus was set in response to the owning window being activated.
EFocusCause = {}
