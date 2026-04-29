---@class UGSpinBox_Vector4 : UGSpinBoxVectorBase
---@field public Value FLinearColor
---@field public OnValueChanged MulticastDelegate
---@field public OnValueCommitted MulticastDelegate
UGSpinBox_Vector4 = {}

---@return FLinearColor
function UGSpinBox_Vector4:GetValue() end

---@param NewValue FLinearColor
function UGSpinBox_Vector4:SetValue(NewValue) end

---@param InW number
function UGSpinBox_Vector4:SetW(InW) end

---@param InX number
function UGSpinBox_Vector4:SetX(InX) end

---@param InY number
function UGSpinBox_Vector4:SetY(InY) end

---@param InZ number
function UGSpinBox_Vector4:SetZ(InZ) end

---@param NewValue FLinearColor
function UGSpinBox_Vector4:UpdateValue(NewValue) end

---@param InW number
function UGSpinBox_Vector4:UpdateW(InW) end

---X, Y, Z, W map to R, G, B, A respectively.
---@param InX number
function UGSpinBox_Vector4:UpdateX(InX) end

---@param InY number
function UGSpinBox_Vector4:UpdateY(InY) end

---@param InZ number
function UGSpinBox_Vector4:UpdateZ(InZ) end

function UGSpinBox_Vector4:ApplyStyle() end

