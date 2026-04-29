---@class UToggleBoxVertical : UVerticalBox
---@field protected SelectedIndex integer @Current selected index (-1 = none)
---@field public SecondPressDeselectsIndex boolean @false = pressing the same button again doesn't do anything true = pressing the same button again switches the selection off to -1
---@field public ActiveColorStyle FWidgetColorStyle
---@field public PassiveColorStyle FWidgetColorStyle
---@field public OnSelectionChanged MulticastDelegate|fun(Index: integer)
UToggleBoxVertical = {}

---@return integer
function UToggleBoxVertical:GetSelectedIndex() end

function UToggleBoxVertical:OnAnyButtonPressed() end

function UToggleBoxVertical:OnAnyButtonStyleApplied() end

---Programmatically set selected index (will update visuals). If index out-of-range, selection becomes -1.
---@param NewIndex integer
function UToggleBoxVertical:SetSelectedIndex(NewIndex) end

function UToggleBoxVertical:UpdateButtonsWidgetStyle() end

