---Static library to supply "for free" functionality to widgets that implement IUserListEntry
---@class UUserListEntryLibrary : UBlueprintFunctionLibrary
UUserListEntryLibrary = {}

---Returns the list view that contains this entry.
---@param UserListEntry TScriptInterface<UUserListEntry> @Note: Visually not transmitted, but this defaults to "self". No need to hook up if calling internally.
---@return UListViewBase
function UUserListEntryLibrary.GetOwningListView(UserListEntry) end

---Returns true if the item represented by this entry is currently expanded and showing its children. Tree view entries only.
---@param UserListEntry TScriptInterface<UUserListEntry> @Note: Visually not transmitted, but this defaults to "self". No need to hook up if calling internally.
---@return boolean
function UUserListEntryLibrary.IsListItemExpanded(UserListEntry) end

---Returns true if the item represented by this entry is currently selected in the owning list view.
---@param UserListEntry TScriptInterface<UUserListEntry> @Note: Visually not transmitted, but this defaults to "self". No need to hook up if calling internally.
---@return boolean
function UUserListEntryLibrary.IsListItemSelected(UserListEntry) end

