---@meta
---@class UFAQWindow : UUserWidget
---@field protected B_Close UGButton
---@field protected SearchBox USearchBox
---@field protected SB_Categories UGScrollBox
---@field protected WS_Content UWidgetSwitcher
---@field protected SelectedCategory string
UFAQWindow = {}

---@param SearchString string
function UFAQWindow:FilterOptions(SearchString) end

function UFAQWindow:OnClosePressed() end

---@param InCategoryName string
function UFAQWindow:SwitchCategory(InCategoryName) end

