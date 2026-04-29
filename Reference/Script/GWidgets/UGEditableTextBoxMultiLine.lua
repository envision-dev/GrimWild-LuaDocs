---Stylized multi-line editable text box with Envision color style and translation support.
---@class UGEditableTextBoxMultiLine : UMultiLineEditableTextBox
---@field public EHintText FEText @Priority: 1) HintText field 2) this field. It means that if HintText is not empty, this text won't be visible. Use EText for automatic translation and HintText for FText formatting (simply calling SetHintText() is fine!)
UGEditableTextBoxMultiLine = {}

function UGEditableTextBoxMultiLine:ClearFTextHint() end

function UGEditableTextBoxMultiLine:ApplyStyle() end

