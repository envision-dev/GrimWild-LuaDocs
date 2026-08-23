---@meta
---Steam Workshop download dialog: searches the Workshop for the mod id a reference names and lets the
---player subscribe to one of the results. Created on demand by its owner and destroyed on close.
---@class UModDownloadWindow_SteamWorkshop : UUserWidget
---@field protected B_Close UGButton
---@field protected WS_Content UWidgetSwitcher @Child 0 is the results list, child 1 the in-progress page, child 2 the nothing-found page.
---@field protected SB_Results UScrollBox
---@field public OnCloseRequested MulticastDelegate|fun()
UModDownloadWindow_SteamWorkshop = {}

---@return FModReference
function UModDownloadWindow_SteamWorkshop:GetReference() end

function UModDownloadWindow_SteamWorkshop:OnClosePressed() end

---@param bSuccess boolean
---@param Candidates TArray<FWorkshopModCandidate>
function UModDownloadWindow_SteamWorkshop:OnSearchComplete(bSuccess, Candidates) end

---@param ItemSlot UWorkshopItemSlot
function UModDownloadWindow_SteamWorkshop:OnSlotSubscribeClicked(ItemSlot) end

---@param bSuccess boolean
---@param FileId string
function UModDownloadWindow_SteamWorkshop:OnSubscribeComplete(bSuccess, FileId) end

