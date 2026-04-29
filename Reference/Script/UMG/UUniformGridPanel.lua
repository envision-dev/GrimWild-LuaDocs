---A panel that evenly divides up available space between all of its children.
---@class UUniformGridPanel : UPanelWidget
---@field public SlotPadding FMargin @Padding given to each slot
---@field public MinDesiredSlotWidth number @The minimum desired width of the slots
---@field public MinDesiredSlotHeight number @The minimum desired height of the slots
UUniformGridPanel = {}

---@param Content UWidget
---@param InRow? integer @[default: 0]
---@param InColumn? integer @[default: 0]
---@return UUniformGridSlot
function UUniformGridPanel:AddChildToUniformGrid(Content, InRow, InColumn) end

---@param InMinDesiredSlotHeight number
function UUniformGridPanel:SetMinDesiredSlotHeight(InMinDesiredSlotHeight) end

---@param InMinDesiredSlotWidth number
function UUniformGridPanel:SetMinDesiredSlotWidth(InMinDesiredSlotWidth) end

---@param InSlotPadding FMargin
function UUniformGridPanel:SetSlotPadding(InSlotPadding) end

