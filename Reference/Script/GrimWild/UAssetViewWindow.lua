---Window that displays a filterable list of primary assets loaded in the game.
---@class UAssetViewWindow : UDraggableWindow
---@field protected AssetViewEntries TArray<UAssetViewEntryObject> @All entries created, unfiltered
---@field protected B_Refresh UButton
---@field protected LB_Content UGListView @List items: only includes filtered entries. To get all entries, use this->AssetViewEntries
---@field protected Properties FAssetViewProperties
UAssetViewWindow = {}

function UAssetViewWindow:FilterSlots() end

---@param InProperties FAssetViewProperties
function UAssetViewWindow:Init(InProperties) end

function UAssetViewWindow:Refresh() end

