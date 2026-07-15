---Stylized multi-line editable text box with Envision color style and translation support.
---@class UGEditableTextBoxMultiLine : UMultiLineEditableTextBox
---@field public EHintText FEText @Priority: 1) HintText field 2) this field. It means that if HintText is not empty, this text won't be visible. Use EText for automatic translation and HintText for FText formatting (simply calling SetHintText() is fine!)
UGEditableTextBoxMultiLine = {}

function UGEditableTextBoxMultiLine:ClearFTextHint() end

---@param InText string
---@param CommitMethod integer
function UGEditableTextBoxMultiLine:HandleTextCommitted(InText, CommitMethod) end

---Data -> Widget sync. Does not trigger change/commit delegates. Defers while the user is typing.
---@param NewText string
function UGEditableTextBoxMultiLine:UpdateText(NewText) end

function UGEditableTextBoxMultiLine:ApplyStyle() end

