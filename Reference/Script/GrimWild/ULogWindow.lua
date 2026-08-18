---@class ULogWindow : UDraggableWindow
---@field protected LV_Messages UGListView @Widgets
---@field protected B_Close UGButton
---@field protected B_Clear UGButton
---@field protected B_OpenLocation UGButton
---@field protected CB_AutoOpen UGCheckBox
---@field protected CB_ShowNotes UGCheckBox
---@field protected CB_ShowWarnings UGCheckBox
---@field protected CB_ShowErrors UGCheckBox
---@field protected SearchBox USearchBox
---@field protected SelectedPanel UPanelWidget
---@field protected MLTB_SelectedMessage UMultiLineEditableTextBox
---@field protected B_CloseSelected UGButton
---@field protected B_CopySelected UGButton
---@field protected EntryClass TSubclassOf<ULogEntryWidget> @Data
---@field protected SelectedEntries TSet<TWeakObjectPtr<ULogEntry>> @Our own selection system, independent from UListView's built-in one (LV_Messages' SelectionMode should be set to None in the widget blueprint). Holds the backend UObjects behind the slots rather than the recycled slot widgets themselves, since those get destroyed/reused on scroll.
---@field protected AnchorEntry TWeakObjectPtr<ULogEntry> @Anchor for Shift+Click range selection. Reset explicitly on delete/clear rather than relying on TWeakObjectPtr invalidation, since the pointer can stay valid (pending GC) after its entry is removed.
---@field protected UnfilteredEntries TArray<ULogEntry> @Original message list, unaffected by filtering.
ULogWindow = {}

function ULogWindow:ClearAll() end

function ULogWindow:DeleteSelectedEntries() end

---@param InEntry ULogEntry
---@return boolean
function ULogWindow:IsEntrySelected(InEntry) end

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

