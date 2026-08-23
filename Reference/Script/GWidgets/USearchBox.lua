---@meta
---Stylized search box.
---Composition of UGEditableTextBox + UGBorder/UGImage.
---@class USearchBox : UWidget
---@field public OnSearchTextChanged MulticastDelegate|fun(SearchText: string)
---@field public OnSearchTextCommitted MulticastDelegate|fun(SearchText: string, CommitMethod: integer)
---@field protected ETB_Text UGEditableTextBox
---@field protected IconBorder UGBorder
---@field protected Icon UGImage
USearchBox = {}

function USearchBox:FocusSearchField() end

---@return string
function USearchBox:GetSearchText() end

---@param InText string
function USearchBox:HandleETBTextChanged(InText) end

---@param InText string
---@param CommitMethod integer
function USearchBox:HandleETBTextCommitted(InText, CommitMethod) end

---Data -> Widget sync. Does not trigger OnSearchTextChanged or OnSearchTextCommitted.
---@param NewText string
function USearchBox:UpdateSearchText(NewText) end

function USearchBox:ApplyStyle() end

