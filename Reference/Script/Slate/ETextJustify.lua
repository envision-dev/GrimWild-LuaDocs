---@class ETextJustify
---@field public Left ETextJustify [0] Justify the text logically to the left. When text is flowing left-to-right, this will align text visually to the left. When text is flowing right-to-left, this will align text visually to the right.
---@field public Center ETextJustify [1] Justify the text in the center. Text flow direction has no impact on this justification mode.
---@field public Right ETextJustify [2] Justify the text logically to the right. When text is flowing left-to-right, this will align text visually to the right. When text is flowing right-to-left, this will align text visually to the left.
---@field public InvariantLeft ETextJustify [3] Always justify the text to the left, regardless of the flow direction of the current culture.
---@field public InvariantRight ETextJustify [4] Always justify the text to the right, regardless of the flow direction of the current culture.
ETextJustify = {}
