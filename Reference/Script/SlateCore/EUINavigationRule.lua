---@class EUINavigationRule
---@field public Escape EUINavigationRule [0] Allow the movement to continue in that direction, seeking the next navigable widget automatically.
---@field public Explicit EUINavigationRule [1] Move to a specific widget.
---@field public Wrap EUINavigationRule [2] Wrap movement inside this container, causing the movement to cycle around from the opposite side, if the navigation attempt would have escaped.
---@field public Stop EUINavigationRule [3] Stops movement in this direction
---@field public Custom EUINavigationRule [4] Custom navigation handled by user code.
---@field public CustomBoundary EUINavigationRule [5] Custom navigation handled by user code if the boundary is hit.
---@field public Invalid EUINavigationRule [6] Invalid Rule
EUINavigationRule = {}
