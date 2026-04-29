---A virtualized list that allows up to thousands of items to be displayed.
---An important distinction to keep in mind here is "Item" vs. "Entry"
---The list itself is based on a list of n items, but only creates as many entry widgets as can fit on screen.
---For example, a scrolling ListView of 200 items with 5 currently visible will only have created 5 entry widgets.
---To make a widget usable as an entry in a ListView, it must inherit from the IUserObjectListEntry interface.
---@class UListView : UListViewBase
---@field protected WidgetStyle FTableViewStyle
---@field protected ScrollBarStyle FScrollBarStyle
---@field protected Orientation integer @The scroll & layout orientation of the list. ListView and TileView only. Vertical will scroll vertically and arrange tiles into rows. Horizontal will scroll horizontally and arrange tiles into columns.
---@field protected SelectionMode integer
---@field protected ConsumeMouseWheel EConsumeMouseWheel
---@field protected bClearSelectionOnClick boolean
---@field protected bIsFocusable boolean
---@field protected bReturnFocusToSelection boolean
---@field protected ListItems TArray<UObject>
---@field protected EntrySpacing number @This deprecated property was originally BlueprintReadOnly. To satisfy the compiler requirment to have a BlueprintGetter for this property, it relies on the newly added UFunction GetHorizontalEntrySpacing() to act as its BlueprintGetter.
---@field private HorizontalEntrySpacing number
---@field private VerticalEntrySpacing number
---@field private BP_OnEntryInitialized MulticastDelegate @Called when a row widget is generated for a list item
---@field private BP_OnItemClicked MulticastDelegate
---@field private BP_OnItemDoubleClicked MulticastDelegate
---@field private BP_OnItemIsHoveredChanged MulticastDelegate
---@field private BP_OnItemSelectionChanged MulticastDelegate
---@field private BP_OnItemScrolledIntoView MulticastDelegate
---@field private BP_OnListViewScrolled MulticastDelegate
UListView = {}

---Adds an the item to the list
---@param Item UObject
function UListView:AddItem(Item) end

---Cancels a previous request to scroll and item into view.
function UListView:BP_CancelScrollIntoView() end

---Clear selection
function UListView:BP_ClearSelection() end

---Gets the number of items currently selected in the list
---@return integer
function UListView:BP_GetNumItemsSelected() end

---Gets the first selected item, if any; recommended that you only use this for single selection lists.
---@return UObject
function UListView:BP_GetSelectedItem() end

---Gets a list of all the currently selected items
---@param Items TArray<UObject> @[out]
---@return boolean
function UListView:BP_GetSelectedItems(Items) end

---Gets whether the entry for the given object is currently visible in the list
---@param Item UObject
---@return boolean
function UListView:BP_IsItemVisible(Item) end

---Requests that the given item is navigated to, scrolling it into view if needed.
---@param Item UObject
function UListView:BP_NavigateToItem(Item) end

---Requests that the given item is scrolled into view
---@param Item UObject
function UListView:BP_ScrollItemIntoView(Item) end

---Sets whether the given item is selected.
---@param Item UObject
---@param bSelected boolean
function UListView:BP_SetItemSelection(Item, bSelected) end

---Sets the array of objects to display rows for in the list
---@param InListItems TArray<UObject>
function UListView:BP_SetListItems(InListItems) end

---Sets the given item as the sole selected item.
---@param Item UObject
function UListView:BP_SetSelectedItem(Item) end

---Removes all items from the list
function UListView:ClearListItems() end

---Get the horizontal spacing between entries.
---@return number
function UListView:GetHorizontalEntrySpacing() end

---Returns the index that the specified item is at. Will return the first found, or -1 for not found
---@param Item UObject
---@return integer
function UListView:GetIndexForItem(Item) end

---Returns the item at the given index
---@param Index integer
---@return UObject
function UListView:GetItemAt(Index) end

---Gets the list of all items in the list.
---Note that each of these items only has a corresponding entry widget when visible. Use GetDisplayedEntryWidgets to get the currently displayed widgets.
---@return TArray<UObject>
function UListView:GetListItems() end

---Returns the total number of items
---@return integer
function UListView:GetNumItems() end

---Get the vertical spacing between entries.
---@return number
function UListView:GetVerticalEntrySpacing() end

---Returns true if a refresh is pending and the list will be rebuilt on the next tick
---@return boolean
function UListView:IsRefreshPending() end

---Requests that the item at the given index navigated to, scrolling it into view if needed.
---@param Index integer
function UListView:NavigateToIndex(Index) end

---@param Item AActor
---@param EndPlayReason integer
function UListView:OnListItemEndPlayed(Item, EndPlayReason) end

---@param ItemOuter AActor
---@param EndPlayReason integer
function UListView:OnListItemOuterEndPlayed(ItemOuter, EndPlayReason) end

---Removes an the item from the list
---@param Item UObject
function UListView:RemoveItem(Item) end

---Requests that the item at the given index is scrolled into view
---@param Index integer
function UListView:ScrollIndexIntoView(Index) end

---Sets the item at the given index as the sole selected item.
---@param Index integer
function UListView:SetSelectedIndex(Index) end

---Sets the new selection mode, preserving the current selection where possible.
---@param SelectionMode integer
function UListView:SetSelectionMode(SelectionMode) end

