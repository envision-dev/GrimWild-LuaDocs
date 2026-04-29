---The Slot for the UBorderSlot, contains the widget displayed in a border's single slot
---@class UBorderSlot : UPanelSlot
---@field protected Padding FMargin @The padding area between the slot and the content it contains.
---@field protected HorizontalAlignment integer @The alignment of the object horizontally.
---@field protected VerticalAlignment integer @The alignment of the object vertically.
UBorderSlot = {}

---@param InHorizontalAlignment integer
function UBorderSlot:SetHorizontalAlignment(InHorizontalAlignment) end

---@param InPadding FMargin
function UBorderSlot:SetPadding(InPadding) end

---@param InVerticalAlignment integer
function UBorderSlot:SetVerticalAlignment(InVerticalAlignment) end

