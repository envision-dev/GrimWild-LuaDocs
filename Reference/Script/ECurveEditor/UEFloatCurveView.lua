---@class UEFloatCurveView : UWidget
---@field public InitialCurve FEFloatCurve @----------------------------------------------------------------- properties
---@field public ViewStyle FEFloatCurveViewStyle
---@field public ViewMinTime number
---@field public ViewMaxTime number
---@field public ViewMinValue number
---@field public ViewMaxValue number
---@field public OnCurveChanged MulticastDelegate @----------------------------------------------------------------- events
---@field public OnCurveCommitted MulticastDelegate
---@field public OnViewChanged MulticastDelegate
UEFloatCurveView = {}

---@return FEFloatCurve
function UEFloatCurveView:GetCurve() end

---@return integer
function UEFloatCurveView:GetSelectedKeyIndex() end

-------------------------------------------------------------------- curve API
---@param NewCurve FEFloatCurve
function UEFloatCurveView:SetCurve(NewCurve) end

-------------------------------------------------------------------- view API
---@param MinTime number
---@param MaxTime number
---@param MinValue number
---@param MaxValue number
function UEFloatCurveView:SetViewBounds(MinTime, MaxTime, MinValue, MaxValue) end

-------------------------------------------------------------------- style API
---@param NewStyle FEFloatCurveViewStyle
function UEFloatCurveView:SetViewStyle(NewStyle) end

---@param KeyIndex integer
---@param NewKey FEFloatCurveKey
function UEFloatCurveView:UpdateKeyData(KeyIndex, NewKey) end

---@param KeyIndex integer
---@param NewTime number
---@return integer
function UEFloatCurveView:UpdateKeyTime(KeyIndex, NewTime) end

