---@meta
---Dialog for writing the current draft to a mod pack file in the player's own folder. Created on demand
---by its owner and destroyed on close.
---@class USaveModListAsPackWindow : UUserWidget
---@field protected ETB_Name UGEditableTextBox
---@field protected B_Save UGButton
---@field protected B_Cancel UGButton
---@field protected I_SaveBlocker UGImage @Visible when Save is blocked (invalid name or empty draft); eats the click and carries a UMG tooltip.
---@field public OnCloseRequested MulticastDelegate|fun()
USaveModListAsPackWindow = {}

---@return boolean
function USaveModListAsPackWindow:IsNameValid() end

function USaveModListAsPackWindow:OnCancelPressed() end

---@param NewText string
function USaveModListAsPackWindow:OnNameTextChanged(NewText) end

function USaveModListAsPackWindow:OnOverwriteConfirmed() end

function USaveModListAsPackWindow:OnSavePressed() end

---Fired on every validity re-evaluation so UMG can colour the name field.
function USaveModListAsPackWindow:OnValidityChanged() end

---An empty draft is refused: the window opens, but Save stays blocked.
---@param InDraft TArray<FModReference>
function USaveModListAsPackWindow:Open(InDraft) end

