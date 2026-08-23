---@meta
---Fully custom widget slot — bind all delegates before InitializeProperty is called.
---Use AddUniqueDynamic() to avoid double-binding during PIE restarts.
---@class UPropertySlotStyle_Custom : UPropertySlotStyle
---@field public CreateWidgetFunc MulticastDelegate|fun(InParent: UPropertySlotWidget, OutWidget: UWidget)
---@field public ApplyStyleFunc MulticastDelegate|fun(TargetWidget: UWidget)
---@field public GetWidgetValueFunc MulticastDelegate|fun(TargetWidget: UWidget, OutValue: string)
---@field public SetWidgetValueFunc MulticastDelegate|fun(TargetWidget: UWidget, InValue: string)
UPropertySlotStyle_Custom = {}

---@param TargetWidget UWidget
function UPropertySlotStyle_Custom:PropertySlotCustom_ApplyStyle__DelegateSignature(TargetWidget) end

---@param InParent UPropertySlotWidget
---@param OutWidget UWidget @[out, modified in place]
function UPropertySlotStyle_Custom:PropertySlotCustom_CreateWidget__DelegateSignature(InParent, OutWidget) end

---@param TargetWidget UWidget
---@return string OutValue
function UPropertySlotStyle_Custom:PropertySlotCustom_GetWidgetValue__DelegateSignature(TargetWidget) end

---@param TargetWidget UWidget
---@param InValue string
function UPropertySlotStyle_Custom:PropertySlotCustom_SetWidgetValue__DelegateSignature(TargetWidget, InValue) end

