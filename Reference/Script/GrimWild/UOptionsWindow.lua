---@class UOptionsWindow : UUserWidget
---@field protected B_Close UGButton
---@field protected ETB_Search UGEditableTextBox
---@field protected B_Reimport UGButton @TODO: Just testing; Probably, it won't stay in production release. Do we even need this functionality?
---@field protected B_ResetToDefault UGButton
---@field protected SB_Categories UGScrollBox
---@field protected WS_Content UWidgetSwitcher
---@field protected ParentHUD UHUDBase @Since Options window exist in Menu and Game maps, there is no strict owner. It's either MenuPawn or PlayerPawn. So we cannot call GetOwningPlayer<???>() to get owning GameHUD. It's simpler to cache it here
---@field protected SelectedCategory string
---@field protected FallbackCategory FPrimaryAssetId
UOptionsWindow = {}

---@param SearchString string
function UOptionsWindow:FilterOptions(SearchString) end

function UOptionsWindow:OnClosePressed() end

function UOptionsWindow:OnReimportPressed() end

function UOptionsWindow:OnResetToDefaultPressed() end

---@param Text string
function UOptionsWindow:OnSearchTextChanged(Text) end

function UOptionsWindow:ResetToDefault_Confirmed() end

---@param InCategoryName string
function UOptionsWindow:SwitchCategory(InCategoryName) end

