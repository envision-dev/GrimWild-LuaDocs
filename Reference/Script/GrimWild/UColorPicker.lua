---@class UColorPicker : UDraggableWindow
---@field public OnColorCommitted MulticastDelegate|fun(Color: FLinearColor)
---@field public OnColorChangedByInput MulticastDelegate|fun(Color: FLinearColor)
---@field protected InitialColor FLinearColor
---@field protected bReadOnly boolean
---@field protected bDestroyInsteadOfHiding boolean
---@field protected CanvasSizeBox USizeBox @---- Canvas ----
---@field protected ColorCanvas UCanvasPanel
---@field protected RetainerBox_198 URetainerBox
---@field protected SVCrosshair UImage
---@field protected SVCanvasButton UButton
---@field protected FinalColor UImage @---- Swatches ----
---@field protected InitialColorSwatch UImage
---@field protected I_Hue_1 UImage @---- Gradient images ----
---@field protected I_Lightness UImage
---@field protected S_Hue USlider @---- Hue ----
---@field protected SB_Hue UGSpinBox
---@field protected S_Saturation USlider @---- Saturation ----
---@field protected SB_Saturation UGSpinBox
---@field protected S_Lightness USlider @---- Value ----
---@field protected SB_Lightness UGSpinBox
---@field protected Hex UGEditableTextBox @---- Hex / RGB ----
---@field protected R UGSpinBox
---@field protected G UGSpinBox
---@field protected B UGSpinBox
---@field protected Confirm UGButton @---- Buttons ----
---@field protected Cancel UGButton
---@field protected SaturationGradientMaterial UMaterialInterface @---- Material parents (assign in details panel) ----
---@field protected LightnessGradientMaterial UMaterialInterface
---@field protected SaturationGradientMID UMaterialInstanceDynamic @---- Runtime MIDs ----
---@field protected LightnessGradientMID UMaterialInstanceDynamic
---@field protected CurrentHue number @---- HSV state ----
---@field protected CurrentSaturation number
---@field protected CurrentValue number
UColorPicker = {}

---@return FLinearColor
function UColorPicker:GetSelectedColor() end

---@param InInitialColor FLinearColor
---@param bInReadOnly boolean
function UColorPicker:Init(InInitialColor, bInReadOnly) end

---@param InValue number
function UColorPicker:OnBlueSpinBoxChanged(InValue) end

function UColorPicker:OnCancelPressed() end

function UColorPicker:OnCanvasButtonPressed() end

function UColorPicker:OnCanvasButtonReleased() end

function UColorPicker:OnConfirmPressed() end

---@param InValue number
function UColorPicker:OnGreenSpinBoxChanged(InValue) end

---@param Text string
---@param CommitMethod integer
function UColorPicker:OnHexTextCommitted(Text, CommitMethod) end

------- Delegate handlers ----
---@param Value number
function UColorPicker:OnHueSliderChanged(Value) end

---@param InValue number
function UColorPicker:OnHueSpinBoxChanged(InValue) end

---@param InValue number
function UColorPicker:OnRedSpinBoxChanged(InValue) end

---@param Value number
function UColorPicker:OnSaturationSliderChanged(Value) end

---@param InValue number
function UColorPicker:OnSaturationSpinBoxChanged(InValue) end

---@param Value number
function UColorPicker:OnValueSliderChanged(Value) end

---@param InValue number
function UColorPicker:OnValueSpinBoxChanged(InValue) end

function UColorPicker:PostInit() end

