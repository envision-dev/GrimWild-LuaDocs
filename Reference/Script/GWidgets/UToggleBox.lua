---Enforces single selection across UGButton children.
---Automatically detects UGButton children added in designer or at runtime and binds to their clicks.
---@class UToggleBox : UHorizontalBox
---@field protected SelectedIndex integer @Current selected index (-1 = none)
---@field public SecondPressDeselectsIndex boolean @false = pressing the same button again doesn't do anything true = pressing the same button again switches the selection off to -1
---@field public ActiveColorStyle FWidgetColorStyle
---@field public PassiveColorStyle FWidgetColorStyle
---@field public OnSelectionChanged MulticastDelegate|fun(Index: integer)
UToggleBox = {}

---@return integer
function UToggleBox:GetSelectedIndex() end

function UToggleBox:OnAnyButtonPressed() end

function UToggleBox:OnAnyButtonStyleApplied() end

---Programmatically set selected index (will update visuals). If index out-of-range, selection becomes -1.
---@param NewIndex integer
function UToggleBox:SetSelectedIndex(NewIndex) end

function UToggleBox:UpdateButtonsWidgetStyle() end

