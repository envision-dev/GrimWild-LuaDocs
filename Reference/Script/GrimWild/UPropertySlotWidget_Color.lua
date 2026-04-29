---@class UPropertySlotWidget_Color : UUserWidget
---@field public OnColorCommitted MulticastDelegate|fun(Color: FLinearColor)
UPropertySlotWidget_Color = {}

---@return UUserWidget
function UPropertySlotWidget_Color:GetColorPickerFullscreenWindow() end

---@return string
function UPropertySlotWidget_Color:GetWidgetValue() end

---@param NewWidget UUserWidget
function UPropertySlotWidget_Color:SetColorPickerFullscreenWindow(NewWidget) end

---@param bReadOnly boolean
function UPropertySlotWidget_Color:SetReadOnly(bReadOnly) end

---@param InValue string
function UPropertySlotWidget_Color:SetWidgetValue(InValue) end

