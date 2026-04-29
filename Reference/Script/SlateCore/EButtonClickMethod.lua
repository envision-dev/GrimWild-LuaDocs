---Enumerates different methods that a button click can be triggered. Normally, DownAndUp is appropriate.
---@class EButtonClickMethod
---@field public DownAndUp EButtonClickMethod [0] User must press the button, then release while over the button to trigger the click. This is the most common type of button.
---@field public MouseDown EButtonClickMethod [1] Click will be triggered immediately on mouse down, and mouse will not be captured.
---@field public MouseUp EButtonClickMethod [2] Click will always be triggered when mouse button is released over the button, even if the button wasn't pressed down over it.
---@field public PreciseClick EButtonClickMethod [3] Inside a list, buttons can only be clicked with precise tap. Moving the pointer will scroll the list, also allows drag-droppable buttons.
EButtonClickMethod = {}
