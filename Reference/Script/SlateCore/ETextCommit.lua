---Additional information about a text committal
---@class ETextCommit
---@field public Default ETextCommit [0] Losing focus or similar event caused implicit commit
---@field public OnEnter ETextCommit [1] User committed via the enter key
---@field public OnUserMovedFocus ETextCommit [2] User committed via tabbing away or moving focus explicitly away
---@field public OnCleared ETextCommit [3] Keyboard focus was explicitly cleared via the escape key or other similar action
ETextCommit = {}
