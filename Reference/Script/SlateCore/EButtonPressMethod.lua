---Enumerates different methods that a button can be triggered with keyboard/controller. Normally, DownAndUp is appropriate.
---@class EButtonPressMethod
---@field public DownAndUp EButtonPressMethod [0] User must press the button, then release while the button has focus to trigger the click. This is the most common type of button.
---@field public ButtonPress EButtonPressMethod [1] Click will be triggered immediately on button press.
---@field public ButtonRelease EButtonPressMethod [2] Click will always be triggered when a button release occurs on the focused button, even if the button wasn't pressed while focused.
EButtonPressMethod = {}
