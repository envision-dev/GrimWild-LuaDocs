---Static library to supply "for free" functionality to widgets that implement IUserListEntry
---@class UUserObjectListEntryLibrary : UBlueprintFunctionLibrary
UUserObjectListEntryLibrary = {}

---Returns the item in the owning list view that this entry is currently assigned to represent.
---@param UserObjectListEntry TScriptInterface<UUserObjectListEntry> @Note: Visually not transmitted, but this defaults to "self". No need to hook up if calling internally.
---@return UObject
function UUserObjectListEntryLibrary.GetListItemObject(UserObjectListEntry) end

