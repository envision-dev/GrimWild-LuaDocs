---@meta
---One row of UModCodeWorkspaceGenerator_ResolveDepsWindow: a dependency id and the installed copies that
---satisfy it. The absolute path alone identifies a copy.
---@class UModCodeWorkspaceGenerator_ResolveDepsWindow_DepSlot : UUserWidget
---@field protected TB_ModId UGTextBlock
---@field protected CB_Paths UGComboBoxString
UModCodeWorkspaceGenerator_ResolveDepsWindow_DepSlot = {}

---@return string
function UModCodeWorkspaceGenerator_ResolveDepsWindow_DepSlot:GetModId() end

---@return string
function UModCodeWorkspaceGenerator_ResolveDepsWindow_DepSlot:GetSelectedPath() end

