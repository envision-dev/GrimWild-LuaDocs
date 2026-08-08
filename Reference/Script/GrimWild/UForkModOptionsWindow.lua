---Single fullscreen fork dialog serving every fork entry point: the standalone fork buttons in
---UModProjectsWindow (type-filtered, no preselection) and the per-slot Fork action in UModsWindow and
---UModProjectsWindow (preselected source). The "Mod Name" vs "Mod Pack Name" label is UMG-only, driven
---off GetTypeFilter().
---@class UForkModOptionsWindow : UUserWidget
---@field protected ML_Candidates UModList
---@field protected ETB_NewName UGEditableTextBox
---@field protected B_Fork UGButton
---@field protected B_Cancel UGButton
---@field protected I_ForkBlocker UGImage @Visible when Fork is blocked (no valid selection or unsafe name); eats the click and carries a UMG tooltip.
---@field protected TypeFilter EModType
---@field protected Forker UModForker @Held while a fork operation is in progress; non-null doubles as the busy guard on B_Fork.
---@field public OnCloseRequested MulticastDelegate|fun()
UForkModOptionsWindow = {}

---@return EModType
function UForkModOptionsWindow:GetTypeFilter() end

function UForkModOptionsWindow:OnCancelPressed() end

---@param bSuccess boolean
---@param ResultPath string
function UForkModOptionsWindow:OnForkerCompleted(bSuccess, ResultPath) end

function UForkModOptionsWindow:OnForkPressed() end

---@param NewText string
function UForkModOptionsWindow:OnNewNameTextChanged(NewText) end

---@param InSlot UModSlot
function UForkModOptionsWindow:OnSlotCreated(InSlot) end

---@param InSlot UModSlot
function UForkModOptionsWindow:OnSlotSelected(InSlot) end

---Clears the name field, the selection, and fills ML_Candidates with every discovered mod of
---InTypeFilter from every source (including LocalProject: forking a fork is legal by design).
---@param InTypeFilter EModType
function UForkModOptionsWindow:Open(InTypeFilter) end

---Resolves Source, opens filtered by its type, then preselects the matching candidate slot. An
---unresolvable Source is an ERROR: the caller just produced it from a live slot.
---@param Source FModReference
function UForkModOptionsWindow:OpenForSource(Source) end

