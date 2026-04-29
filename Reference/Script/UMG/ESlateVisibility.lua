---Is an entity visible?
---@class ESlateVisibility
---@field public Visible ESlateVisibility [0] Visible and hit-testable (can interact with cursor). Default value.
---@field public Collapsed ESlateVisibility [1] Not visible and takes up no space in the layout (obviously not hit-testable).
---@field public Hidden ESlateVisibility [2] Not visible but occupies layout space (obviously not hit-testable).
---@field public HitTestInvisible ESlateVisibility [3] Visible but not hit-testable (cannot interact with cursor) and children in the hierarchy (if any) are also not hit-testable.
---@field public SelfHitTestInvisible ESlateVisibility [4] Visible but not hit-testable (cannot interact with cursor) and doesn't affect hit-testing on children (if any).
ESlateVisibility = {}
