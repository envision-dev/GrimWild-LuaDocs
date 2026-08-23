---@meta
---@class UPropertySlotWidget : UUserWidget
---@field protected DataBinding TScriptInterface<UPropertySlotDataBinding>
---@field protected SlotStyle UPropertySlotStyle
---@field public Overlay UOverlay @── Existing layout widgets ───────────────────────────────────────────────
---@field public TB_Name UGTextBlock
---@field public Content UBorder
---@field public B_Reset UButton
---@field public NameContainer UBorder @── Structural containers ─────────────────────────────────────────────────
---@field public ResetContainer UBorder
---@field public ActionsContainer UHorizontalBox
---@field public IndentSpacer USpacer
---@field public VB_Outer UVerticalBox
---@field public B_CollapseToggle UButton @── Group / container controls ────────────────────────────────────────────
---@field public B_Add UButton
---@field public B_Clear UButton
---@field public VB_Body UVerticalBox
---@field public Mode EPropertySlotMode @── Mode & depth ─────────────────────────────────────────────────────────
---@field public SlotDepth integer
---@field public MyPriority number
---@field public OnPropertyValueChanged MulticastDelegate|fun(NewValue: string)
---@field private HostWidget TWeakObjectPtr<UUserWidget>
UPropertySlotWidget = {}

---/ Internal widget commit callbacks
---@param bNewState boolean
function UPropertySlotWidget:CheckBox_OnCheckStateChanged(bNewState) end

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

---@return string
function UPropertySlotWidget:GetVisibleTypeName() end

---@param InDataBinding TScriptInterface<UPropertySlotDataBinding>
---@param InVisibleName FEText
---@param InDescription? FEText @[default: ()]
---@param OverriddenStyle? UPropertySlotStyle @[default: None]
---@param bForceReadOnly? boolean @[default: false]
---@param InPriority? number @[default: 0.000000]
function UPropertySlotWidget:InitializeProperty(InDataBinding, InVisibleName, InDescription, OverriddenStyle, bForceReadOnly, InPriority) end

---@param SelectedKey FInputChord
function UPropertySlotWidget:InputKeySelector_OnItemSelected(SelectedKey) end

function UPropertySlotWidget:OnAddClicked() end

function UPropertySlotWidget:OnClearClicked() end

function UPropertySlotWidget:OnCollapseToggleClicked() end

---@param bWasPaste boolean
function UPropertySlotWidget:OnCopyPasteFlash(bWasPaste) end

---@param NewValue string
function UPropertySlotWidget:OnNewValueSet_Func(NewValue) end

function UPropertySlotWidget:OnValueReset_Func() end

---@param InDepth integer
function UPropertySlotWidget:SetSlotDepth(InDepth) end

function UPropertySlotWidget:Slider_OnValueCommitted() end

---@param NewValue number
function UPropertySlotWidget:SliderSpin_OnValueCommitted(NewValue) end

---@param NewValue number
function UPropertySlotWidget:SpinBox_OnValueChanged(NewValue) end

---@param NewValue number
---@param CommitMethod integer
function UPropertySlotWidget:SpinBox_OnValueCommitted(NewValue, CommitMethod) end

function UPropertySlotWidget:SyncVisualValue() end

---@param Text string
---@param CommitMethod integer
function UPropertySlotWidget:TextBox_OnTextCommitted(Text, CommitMethod) end

---@param Value FVector2D
function UPropertySlotWidget:Vector2D_OnValueCommitted(Value) end

---@param Value FLinearColor
function UPropertySlotWidget:Vector4_OnValueCommitted(Value) end

---@param Value FVector
function UPropertySlotWidget:Vector_OnValueCommitted(Value) end

---@param SearchString string
---@return boolean
function UPropertySlotWidget:MatchesTextFilter(SearchString) end

