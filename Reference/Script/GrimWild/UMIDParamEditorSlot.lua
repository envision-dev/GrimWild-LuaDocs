---@class UMIDParamEditorSlot : UUserWidget
---@field public TB_ParamName UGTextBlock
---@field public B_Content UBorder
---@field private ScalarSpinBox UGSpinBox
---@field private VectorSpinBox UGSpinBox_Vector4
---@field private TextureImage UImage
UMIDParamEditorSlot = {}

---@return UMaterialInstanceDynamic
function UMIDParamEditorSlot:GetDynamicMaterialInstance() end

---@param InValue number
function UMIDParamEditorSlot:OnScalarChanged(InValue) end

---@param InValue FLinearColor
function UMIDParamEditorSlot:OnVectorChanged(InValue) end

---@param SearchString string
---@return boolean
function UMIDParamEditorSlot:MatchesTextFilter(SearchString) end

