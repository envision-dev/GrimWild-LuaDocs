---@class ULogWindow : UDraggableWindow
---@field protected LV_Messages UGListView @Widgets
---@field protected B_Close UGButton
---@field protected B_Clear UGButton
---@field protected B_OpenLocation UGButton
---@field protected CB_AutoOpen UGCheckBox
---@field protected CB_ShowNotes UGCheckBox
---@field protected CB_ShowWarnings UGCheckBox
---@field protected CB_ShowErrors UGCheckBox
---@field protected ETB_Search UGEditableTextBox
---@field protected SelectedPanel UPanelWidget
---@field protected MLTB_SelectedMessage UMultiLineEditableTextBox
---@field protected B_CloseSelected UGButton
---@field protected B_CopySelected UGButton
---@field protected EntryClass TSubclassOf<ULogEntryWidget> @Data
---@field protected SelectedEntry ULogEntry @Selected slot
---@field protected UnfilteredEntries TArray<ULogEntry> @Original message list, unaffected by filtering.
ULogWindow = {}

function ULogWindow:ClearAll() end

---@param bIsChecked boolean
function ULogWindow:OnAutoOpenStateChanged(bIsChecked) end

function ULogWindow:OnClosePressed() end

function ULogWindow:OnCloseSelectedPressed() end

function ULogWindow:OnCopySelectedPressed() end

function ULogWindow:OnOpenLocationPressed() end

---@param NewText string
function ULogWindow:OnSearchTextChanged(NewText) end

---@param bIsChecked boolean
function ULogWindow:OnShowErrorsChanged(bIsChecked) end

---@param bIsChecked boolean
function ULogWindow:OnShowNotesChanged(bIsChecked) end

---@param bIsChecked boolean
function ULogWindow:OnShowWarningsChanged(bIsChecked) end

