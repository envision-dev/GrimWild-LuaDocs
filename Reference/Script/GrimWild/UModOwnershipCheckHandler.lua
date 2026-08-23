---@meta
---One-shot target for QueryOwnPublishedItems, so a concurrent CheckWorkshopItemOwnership call keeps its own
---FileId/Callback closure instead of racing another call's response through a shared member on UModManager.
---@class UModOwnershipCheckHandler : UObject
UModOwnershipCheckHandler = {}

---@param bSuccess boolean
---@param Items TArray<FOwnedWorkshopItem>
function UModOwnershipCheckHandler:HandleQueryComplete(bSuccess, Items) end

