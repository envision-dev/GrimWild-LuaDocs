---Dialog for creating a new mod/modpack project. Created on demand by its owner and destroyed on close.
---@class UCreateNewModWindow : UUserWidget
---@field protected ETB_Id UGEditableTextBox
---@field protected ETB_Name UGEditableTextBox
---@field protected B_Create UGButton
---@field protected B_Cancel UGButton
---@field protected I_CreateBlocker UGImage @Visible when Create is blocked (invalid id and/or name); eats the click and carries a UMG tooltip.
---@field protected Type EModType
---@field protected Creator UModCreator @Held while a create operation is in progress; non-null doubles as the busy guard on B_Create.
---@field public OnCloseRequested MulticastDelegate|fun()
UCreateNewModWindow = {}

---@return boolean
function UCreateNewModWindow:IsIdValid() end

---@return boolean
function UCreateNewModWindow:IsNameValid() end

function UCreateNewModWindow:OnCancelPressed() end

function UCreateNewModWindow:OnCreatePressed() end

---@param bSuccess boolean
---@param ResultPath string
function UCreateNewModWindow:OnCreatorCompleted(bSuccess, ResultPath) end

---@param NewText string
function UCreateNewModWindow:OnIdTextChanged(NewText) end

---@param NewText string
function UCreateNewModWindow:OnNameTextChanged(NewText) end

---Fired on every validity re-evaluation so UMG can color the id/name fields.
function UCreateNewModWindow:OnValidityChanged() end

---@param InType EModType
function UCreateNewModWindow:Open(InType) end

