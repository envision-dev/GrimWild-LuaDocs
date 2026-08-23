---@meta
---A scrollable list of mod or mod pack slot widgets. Owns no mutation logic: SetMods/SetModPacks do a
---full rebuild every call (no diffing, no slot reuse), and the OnSlotCreated delegates are the only way
---owners learn about the slots it makes, so they can bind directly to each slot's own delegates.
---@class UModList : UUserWidget
---@field protected SB_Mods UScrollBox
---@field public OnSlotCreated MulticastDelegate|fun(Slot: UModSlot)
---@field public OnPackSlotCreated MulticastDelegate|fun(PackSlot: UModPackSlot)
UModList = {}

---@return integer
function UModList:GetModCount() end

function UModList:OnRefreshed() end

---Clears SB_Mods and creates one UModPackSlot per pack file, in order.
---@param InPackFiles TArray<FModPackFile>
function UModList:SetModPacks(InPackFiles) end

---Clears SB_Mods and creates one UModSlot per reference, in order.
---@param InReferences TArray<FModReference>
function UModList:SetMods(InReferences) end

---@param SearchString string
---@return boolean
function UModList:MatchesTextFilter(SearchString) end

