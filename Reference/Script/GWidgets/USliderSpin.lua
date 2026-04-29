---@class USliderSpin : UWidget
---@field public BarColorStyle FWidgetColorStyle
---@field public OnValueChanged MulticastDelegate
---@field public OnValueCommitted MulticastDelegate
---@field protected Value number
---@field protected MinValue number
---@field protected MaxValue number
---@field protected DeltaValue number
---@field protected DisplayFormat EGSpinBoxDisplayFormat
---@field protected bSliderUsesMouseSteps boolean
---@field protected MinFractionalDigits integer
---@field protected MaxFractionalDigits integer
---@field protected SpinBoxFillWidth number @1.0 = takes 50% of widget horizontal space. 0.5 = 33.3%
USliderSpin = {}

---@return number
function USliderSpin:GetDeltaValue() end

---@return integer
function USliderSpin:GetMaxFractionalDigits() end

---@return number
function USliderSpin:GetMaxValue() end

---@return integer
function USliderSpin:GetMinFractionalDigits() end

---@return number
function USliderSpin:GetMinValue() end

---@return boolean
function USliderSpin:GetSliderUsesMouseSteps() end

---@return number
function USliderSpin:GetValue() end

---@param NewStyle FWidgetColorStyle
function USliderSpin:SetBarColorStyle(NewStyle) end

---@param InValue number
function USliderSpin:SetDeltaValue(InValue) end

---@param InValue integer
function USliderSpin:SetMaxFractionalDigits(InValue) end

---@param InValue number
function USliderSpin:SetMaxValue(InValue) end

---@param InValue integer
function USliderSpin:SetMinFractionalDigits(InValue) end

---@param InValue number
function USliderSpin:SetMinValue(InValue) end

---@param bNewValue boolean
function USliderSpin:SetSliderUsesMouseSteps(bNewValue) end

---@param NewFormat EGSpinBoxDisplayFormat
function USliderSpin:SetSpinBoxDisplayFormat(NewFormat) end

---@param NewValue number
function USliderSpin:SetValue(NewValue) end

function USliderSpin:ApplyStyle() end

