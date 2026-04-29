---@class UGSpinBox_Vector : UGSpinBoxVectorBase
---@field public Value FVector
---@field public OnValueChanged MulticastDelegate|fun(Value: FVector)
---@field public OnValueCommitted MulticastDelegate|fun(Value: FVector)
UGSpinBox_Vector = {}

---@return FVector
function UGSpinBox_Vector:GetValue() end

---@param NewValue FVector
function UGSpinBox_Vector:SetValue(NewValue) end

---@param InX number
function UGSpinBox_Vector:SetX(InX) end

---@param InY number
function UGSpinBox_Vector:SetY(InY) end

---@param InZ number
function UGSpinBox_Vector:SetZ(InZ) end

---@param NewValue FVector
function UGSpinBox_Vector:UpdateValue(NewValue) end

---@param InX number
function UGSpinBox_Vector:UpdateX(InX) end

---@param InY number
function UGSpinBox_Vector:UpdateY(InY) end

---@param InZ number
function UGSpinBox_Vector:UpdateZ(InZ) end

function UGSpinBox_Vector:ApplyStyle() end

