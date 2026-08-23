---@meta
---/Widget
---@class ULogEntryWidget : UUserWidget
---@field protected B_Background UButton
---@field protected TB_Message UTextBlock
---@field protected TB_Time UTextBlock
---@field protected TB_Id UTextBlock
ULogEntryWidget = {}

---@return boolean
function ULogEntryWidget:IsItemSelected() end

function ULogEntryWidget:OnBackgroundPressed() end

---@param bIsSelected boolean
function ULogEntryWidget:OnItemSelectionChanged(bIsSelected) end

---Called when this entry is assigned a new item object to represent by the owning list view
---@param ListItemObject UObject
function ULogEntryWidget:OnListItemObjectSet(ListItemObject) end

