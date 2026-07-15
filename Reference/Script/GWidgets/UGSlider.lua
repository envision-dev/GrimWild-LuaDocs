---Stylized USlider wrapper with Envision color style support.
---@class UGSlider : USlider
---@field public BarColorStyle FWidgetColorStyle
UGSlider = {}

function UGSlider:HandleCaptureBegin() end

function UGSlider:HandleCaptureEnd() end

---@param NewStyle FWidgetColorStyle
function UGSlider:SetBarColorStyle(NewStyle) end

---Data -> Widget sync. Does not trigger OnValueChanged. Defers while the user is dragging.
---@param NewValue number
function UGSlider:UpdateValue(NewValue) end

function UGSlider:ApplyStyle() end

