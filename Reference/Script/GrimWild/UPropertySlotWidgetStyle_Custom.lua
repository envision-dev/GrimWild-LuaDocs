---Bind all delegates before property slot widget initialization start.
---NOTE: Use AddUniqueDynamic() to avoid UE Editor problems (binding multiple times at PIE begin play).
---NOTE 2: The logic works as long as widget's Style instance is alive.
---@class UPropertySlotWidgetStyle_Custom : UPropertySlotStyleBase
---@field public CreateWidgetFunc MulticastDelegate|fun(InParent: UPropertySlotWidget, OutWidget: UWidget) @Binding this to BP function is possible! Just make a "Create Event" node and select "Create a matching function" button. NOTE: BPs will give the "no value will be returned by reference" Warning, but in reality it works perfectly.
---@field public ApplyStyleFunc MulticastDelegate|fun(TargetWidget: UWidget)
---@field public GetWidgetValueFunc MulticastDelegate|fun(TargetWidget: UWidget, OutValue: string)
---@field public SetWidgetValueFunc MulticastDelegate|fun(TargetWidget: UWidget, InValue: string)
UPropertySlotWidgetStyle_Custom = {}

---@param TargetWidget UWidget
function UPropertySlotWidgetStyle_Custom:PropertySlotWidgetStyleCustom_ApplyStyle__DelegateSignature(TargetWidget) end

---"Why multicast?": can't mark props as BlueprintAssignable without it
---@param InParent UPropertySlotWidget
---@param OutWidget UWidget @[out]
function UPropertySlotWidgetStyle_Custom:PropertySlotWidgetStyleCustom_CreateWidget__DelegateSignature(InParent, OutWidget) end

---@param TargetWidget UWidget
---@param OutValue string @[out]
function UPropertySlotWidgetStyle_Custom:PropertySlotWidgetStyleCustom_GetWidgetValue__DelegateSignature(TargetWidget, OutValue) end

---@param TargetWidget UWidget
---@param InValue string
function UPropertySlotWidgetStyle_Custom:PropertySlotWidgetStyleCustom_SetWidgetValue__DelegateSignature(TargetWidget, InValue) end

