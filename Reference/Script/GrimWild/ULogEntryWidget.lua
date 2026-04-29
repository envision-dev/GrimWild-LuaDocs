---/Widget
---@class ULogEntryWidget : UUserWidget
---@field protected B_Background UButton
---@field protected TB_Message UTextBlock
---@field protected TB_Time UTextBlock
---@field protected TB_Id UTextBlock
ULogEntryWidget = {}

function ULogEntryWidget:OnBackgroundPressed() end

---Called when this entry is assigned a new item object to represent by the owning list view
---@param ListItemObject UObject
function ULogEntryWidget:OnListItemObjectSet(ListItemObject) end

