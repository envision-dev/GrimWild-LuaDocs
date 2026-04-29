---Ways in which touch interactions trigger a "Clicked" event.
---@class EButtonTouchMethod
---@field public DownAndUp EButtonTouchMethod [0] Most buttons behave this way.
---@field public Down EButtonTouchMethod [1] Click will be triggered immediately on touch down, and touch will not be captured.
---@field public PreciseTap EButtonTouchMethod [2] Inside a list, buttons can only be clicked with precise tap. Moving the pointer will scroll the list.
EButtonTouchMethod = {}
