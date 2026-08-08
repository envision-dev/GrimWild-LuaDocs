---A scrollable list of UModSlot widgets. Owns no mutation logic: SetMods does a full rebuild every call
---(no diffing, no slot reuse), and OnSlotCreated is the only way owners learn about the slots it makes,
---so they can bind directly to each slot's own delegates.
---@class UModList : UUserWidget
---@field protected SB_Mods UScrollBox
---@field protected SearchBox USearchBox
---@field public OnSlotCreated MulticastDelegate|fun(Slot: UModSlot)
UModList = {}

---@return integer
function UModList:GetModCount() end

function UModList:OnRefreshed() end

---@param SearchText string
function UModList:OnSearchTextChanged(SearchText) end

---Clears SB_Mods and creates one UModSlot per reference, in order.
---@param InReferences TArray<FModReference>
function UModList:SetMods(InReferences) end

