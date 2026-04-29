---NOTE: 1 Style instance = 1 property, NOT 1 property slot widget.
---We can potentially have multiple slot widgets representing the same property.
---Please, don't store Slot-specific data here.
---@class UPropertySlotStyleBase : UObject
---@field public bReadOnly boolean
---@field public bAllowReset boolean
UPropertySlotStyleBase = {}

---@param TargetWidget UWidget
function UPropertySlotStyleBase:ApplyStyle(TargetWidget) end

---Creates an internal widget and binds its events to the given Parent Property Widget
---@param InParent UPropertySlotWidget
---@return UWidget
function UPropertySlotStyleBase:CreateWidget(InParent) end

---@return EPropertySlotType
function UPropertySlotStyleBase:GetWidgetType() end

---@param TargetWidget UWidget
---@param OutValue string @[out]
function UPropertySlotStyleBase:GetWidgetValue(TargetWidget, OutValue) end

---@param TargetWidget UWidget
---@param InValue string
function UPropertySlotStyleBase:SetWidgetValue(TargetWidget, InValue) end

