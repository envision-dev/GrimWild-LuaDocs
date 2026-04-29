---The different directions that text can flow within a paragraph of text.
---@class ETextFlowDirection
---@field public Auto ETextFlowDirection [0] Automatically detect the flow direction for each paragraph from its text
---@field public LeftToRight ETextFlowDirection [1] Force text to be flowed left-to-right
---@field public RightToLeft ETextFlowDirection [2] Force text to be flowed right-to-left
---@field public Culture ETextFlowDirection [3] Uses the set culture to determine if text should flow left-to-right or right-to-left.  By comparison, Auto will use the text itself to determine it.
ETextFlowDirection = {}
