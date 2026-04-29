---@class UGSpinBox_Vector2 : UGSpinBoxVectorBase
---@field public Value FVector2D
---@field public OnValueChanged MulticastDelegate|fun(Value: FVector2D)
---@field public OnValueCommitted MulticastDelegate|fun(Value: FVector2D)
UGSpinBox_Vector2 = {}

---@return FVector2D
function UGSpinBox_Vector2:GetValue() end

---@param NewValue FVector2D
function UGSpinBox_Vector2:SetValue(NewValue) end

---@param InX number
function UGSpinBox_Vector2:SetX(InX) end

---@param InY number
function UGSpinBox_Vector2:SetY(InY) end

---@param NewValue FVector2D
function UGSpinBox_Vector2:UpdateValue(NewValue) end

---@param InX number
function UGSpinBox_Vector2:UpdateX(InX) end

---@param InY number
function UGSpinBox_Vector2:UpdateY(InY) end

function UGSpinBox_Vector2:ApplyStyle() end

