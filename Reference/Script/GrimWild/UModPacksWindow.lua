---@meta
---Standalone window listing every available mod pack, the player's own and the ones mods ship, in one
---alphabetical list. Reading a pack into the draft is the owner's job; this window only reports the choice.
---@class UModPacksWindow : UUserWidget
---@field protected SearchBox USearchBox
---@field protected ML_Packs UModList
---@field protected CB_OnlyMine UGCheckBox
---@field protected B_OpenLocation UGButton
---@field protected B_Close UGButton
---@field public OnPackChosen MulticastDelegate|fun(PackFile: FModPackFile)
---@field public OnCloseRequested MulticastDelegate|fun()
UModPacksWindow = {}

function UModPacksWindow:OnClosePressed() end

function UModPacksWindow:OnDeleteConfirmed() end

---@param bIsChecked boolean
function UModPacksWindow:OnOnlyMineStateChanged(bIsChecked) end

function UModPacksWindow:OnOpenLocationPressed() end

---@param PackSlot UModPackSlot
function UModPacksWindow:OnPackDeleteClicked(PackSlot) end

---@param PackSlot UModPackSlot
function UModPacksWindow:OnPackSetAsCurrentClicked(PackSlot) end

---@param PackSlot UModPackSlot
function UModPacksWindow:OnPackSlotCreated(PackSlot) end

---@param SearchText string
function UModPacksWindow:OnSearchTextChanged(SearchText) end

---Shows the window and re-enumerates the available packs.
function UModPacksWindow:Open() end

---Re-enumerates the available packs and rebuilds the list.
function UModPacksWindow:RefreshAll() end

