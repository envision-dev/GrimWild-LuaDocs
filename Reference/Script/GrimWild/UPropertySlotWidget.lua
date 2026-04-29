---Property viewer and editor. Used in Options, Dynamic State Viewer, Dev Console and more.
---Usage:
---1) Create this widget and call InitializeProperty(), providing basic info and style (widget content is created based on Style class).
---2) Bind delegates to OnPropertyValueChanged and OnPropertyValueReset
---@class UPropertySlotWidget : UUserWidget
---@field protected SlotStyle UPropertySlotStyleBase @Important note: Style does not belong to us individually. Multiple widgets can use the same style object. We can only refer to its const functions because of this.
---@field protected DynamicStateHolder TScriptInterface<UDynamicStateHolder> @Option: FGameOptions wrapper Dynamic State Viewer: custom wrapper or state's owner Note: Options: wrapper is only used for reading. Writing's done from UOptionData with custom rules. TODO: For Dynamic State Viewer, writing should be implemented by connecting this::OnPropertyValueChanged with the wrapper's custom function
---@field public Overlay UOverlay
---@field public TB_Name UGTextBlock
---@field public Content UBorder
---@field public B_Reset UButton
---@field public MyPriority number
---@field public OnPropertyValueChanged MulticastDelegate|fun(NewValue: string)
UPropertySlotWidget = {}

---We're forced to create UFUNCTIONs for each possible type of internal widget (CheckBox, SpinBox...),
---because we need to bind their delegates to something from here. We cannot use one universal method, we need the correct signatures.
---@param bNewState boolean
function UPropertySlotWidget:CheckBox_OnCheckStateChanged(bNewState) end

---Color
---@param Color FLinearColor
function UPropertySlotWidget:Color_OnColorCommitted(Color) end

---@param SelectedItem string
---@param SelectionType integer
function UPropertySlotWidget:ComboBoxName_OnItemSelected(SelectedItem, SelectionType) end

---@param SelectedItem string
---@param SelectionType integer
function UPropertySlotWidget:ComboBoxString_OnItemSelected(SelectedItem, SelectionType) end

---@return UWidget
function UPropertySlotWidget:GetContentWidget() end

---
---@param InPropertyId FStatePropertyId
---@param InPropertyHolder TScriptInterface<UDynamicStateHolder>
---@param InVisibleName FEText
---@param InDescription FEText
---@param InStyle UPropertySlotStyleBase
---@param InPriority? number @[default: 0.000000]
function UPropertySlotWidget:InitializeProperty(InPropertyId, InPropertyHolder, InVisibleName, InDescription, InStyle, InPriority) end

---@param SelectedKey FInputChord
function UPropertySlotWidget:InputKeySelector_OnItemSelected(SelectedKey) end

---Note: yes, we're copying the value. It's totally fine, since in the call stack this very copy gets modified and eventually applied.
---@param NewValue string
function UPropertySlotWidget:OnNewValueSet_Func(NewValue) end

function UPropertySlotWidget:OnValueReset_Func() end

function UPropertySlotWidget:Slider_OnValueCommitted() end

---@param NewValue number
function UPropertySlotWidget:SliderSpin_OnValueCommitted(NewValue) end

---@param NewValue number
---@param CommitMethod integer
function UPropertySlotWidget:SpinBox_OnValueCommitted(NewValue, CommitMethod) end

---Sets the visual value based on real in-memory value. Called when our property changes from any source (UI/code)
function UPropertySlotWidget:SyncVisualValue() end

---@param Text string
---@param CommitMethod integer
function UPropertySlotWidget:TextBox_OnTextCommitted(Text, CommitMethod) end

---@param InValue number
---@param CommitMethod integer
function UPropertySlotWidget:Vector2DComponent_OnCommitted(InValue, CommitMethod) end

---@param InValue number
---@param CommitMethod integer
function UPropertySlotWidget:VectorComponent_OnCommitted(InValue, CommitMethod) end

---@param SearchString string
---@return boolean
function UPropertySlotWidget:MatchesTextFilter(SearchString) end

