---If the list panel is arranging items as tiles, this enum dictates how the items should be aligned (basically, where any extra space is placed)
---@class EListItemAlignment
---@field public EvenlyDistributed EListItemAlignment [0] Items are distributed evenly along the line (any extra space is added as padding between the items)
---@field public EvenlySize EListItemAlignment [1] Items are distributed evenly along the line (any extra space is used to scale up the size of the item proportionally.)
---@field public EvenlyWide EListItemAlignment [2] Items are distributed evenly along the line, any extra space is used to scale up width of the items proportionally.)
---@field public LeftAligned EListItemAlignment [3] Items are left aligned on the line (any extra space is added to the right of the items)
---@field public RightAligned EListItemAlignment [4] Items are right aligned on the line (any extra space is added to the left of the items)
---@field public CenterAligned EListItemAlignment [5] Items are center aligned on the line (any extra space is halved and added to the left of the items)
---@field public Fill EListItemAlignment [6] Items are evenly stretched to distribute any extra space on the line
EListItemAlignment = {}
