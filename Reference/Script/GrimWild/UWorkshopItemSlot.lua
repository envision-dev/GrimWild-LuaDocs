---@meta
---One Workshop search result. The owner's steam id is deliberately not shown: it is a raw number that
---means nothing to a player.
---@class UWorkshopItemSlot : UUserWidget
---@field protected TB_Title UGTextBlock
---@field protected TB_SubscriberCount UGTextBlock
---@field protected B_Subscribe UGButton
---@field public OnSubscribeClicked MulticastDelegate|fun(ItemSlot: UWorkshopItemSlot)
UWorkshopItemSlot = {}

---@return FWorkshopModCandidate
function UWorkshopItemSlot:GetCandidate() end

function UWorkshopItemSlot:OnSubscribeReleased() end

