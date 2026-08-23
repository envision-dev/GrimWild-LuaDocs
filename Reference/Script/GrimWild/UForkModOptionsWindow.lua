---@meta
---Single fullscreen fork dialog serving every fork entry point: the standalone fork button in
---UModProjectsWindow (no preselection) and the per-slot Fork action in UModsWindow and
---UModProjectsWindow (preselected source).
---@class UForkModOptionsWindow : UUserWidget
---@field protected SearchBox USearchBox
---@field protected ML_Candidates UModList
---@field protected ETB_NewName UGEditableTextBox
---@field protected B_Fork UGButton
---@field protected B_Cancel UGButton
---@field protected I_ForkBlocker UGImage @Visible when Fork is blocked (no valid selection or unsafe name); eats the click and carries a UMG tooltip.
---@field protected Forker UModForker @Held while a fork operation is in progress; non-null doubles as the busy guard on B_Fork.
---@field public OnCloseRequested MulticastDelegate|fun()
UForkModOptionsWindow = {}

function UForkModOptionsWindow:OnCancelPressed() end

---@param bSuccess boolean
---@param ResultPath string
function UForkModOptionsWindow:OnForkerCompleted(bSuccess, ResultPath) end

function UForkModOptionsWindow:OnForkPressed() end

---@param NewText string
function UForkModOptionsWindow:OnNewNameTextChanged(NewText) end

---@param SearchText string
function UForkModOptionsWindow:OnSearchTextChanged(SearchText) end

---@param InSlot UModSlot
function UForkModOptionsWindow:OnSlotCreated(InSlot) end

---@param InSlot UModSlot
function UForkModOptionsWindow:OnSlotSelected(InSlot) end

---Clears the name field, the selection, and fills ML_Candidates with every discovered mod from every
---source (including LocalProject: forking a fork is legal by design).
function UForkModOptionsWindow:Open() end

---Opens, then preselects the candidate slot matching Source. An unresolvable Source is an ERROR:
---the caller just produced it from a live slot.
---@param Source FModReference
function UForkModOptionsWindow:OpenForSource(Source) end

