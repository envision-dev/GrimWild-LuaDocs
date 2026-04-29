---Stylized UExpandableArea wrapper with Envision color style support.
---@class UGExpandableArea : UWidget
---@field public WidgetColorStyle FWidgetColorStyle
---@field public Style FExpandableAreaStyle
---@field public BorderBrush FSlateBrush
---@field public BorderColor FSlateColor
---@field public bIsExpanded boolean
---@field public MaxHeight number @The maximum height of the area
---@field public HeaderPadding FMargin
---@field public AreaPadding FMargin
---@field public OnExpansionChanged MulticastDelegate @A bindable delegate for the IsChecked.
---@field protected HeaderContent UWidget
---@field protected BodyContent UWidget
UGExpandableArea = {}

---@return boolean
function UGExpandableArea:GetIsExpanded() end

---@param IsExpanded boolean
function UGExpandableArea:SetIsExpanded(IsExpanded) end

---@param NewStyle FWidgetColorStyle
function UGExpandableArea:SetWidgetColorStyle(NewStyle) end

function UGExpandableArea:ApplyStyle() end

