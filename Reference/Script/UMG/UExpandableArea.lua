---@class UExpandableArea : UWidget
---@field public Style FExpandableAreaStyle
---@field public BorderBrush FSlateBrush
---@field public BorderColor FSlateColor
---@field public bIsExpanded boolean
---@field public MaxHeight number @The maximum height of the area
---@field public HeaderPadding FMargin
---@field public AreaPadding FMargin
---@field public OnExpansionChanged MulticastDelegate|fun(Area: UExpandableArea, bIsExpanded: boolean) @A bindable delegate for the IsChecked.
---@field protected HeaderContent UWidget
---@field protected BodyContent UWidget
UExpandableArea = {}

---@return boolean
function UExpandableArea:GetIsExpanded() end

---@param IsExpanded boolean
function UExpandableArea:SetIsExpanded(IsExpanded) end

---@param IsExpanded boolean
function UExpandableArea:SetIsExpanded_Animated(IsExpanded) end

