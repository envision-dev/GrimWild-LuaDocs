---Read-only manifest display for a single mod reference, embedded via BindWidget in UModsWindow and
---UModProjectsWindow. WS_State child 0 is the content page, child 1 is the empty ("select a mod") page.
---@class UModInfo : UUserWidget
---@field protected WS_State UWidgetSwitcher
---@field protected TB_Name UGTextBlock
---@field protected TB_Id UGTextBlock
---@field protected TB_Version UGTextBlock
---@field protected TB_Type UGTextBlock
---@field protected TB_Description UGTextBlock
---@field protected TB_Authors UGTextBlock
---@field protected TB_Dependencies UGTextBlock
---@field protected TB_Source UGTextBlock
---@field protected TB_Problems UGTextBlock
---@field protected I_Preview UGImage @TODO: route through the future project-wide transient texture registry once it exists.
---@field protected B_GetFromWorkshop UGButton
---@field public OnGetFromWorkshopClicked MulticastDelegate|fun(Reference: FModReference)
UModInfo = {}

function UModInfo:OnGetFromWorkshopReleased() end

---@param Text string
function UModInfo:SetProblemsText(Text) end

---Switches to the content page and writes every field. Resolved fills the full manifest and hides
---B_GetFromWorkshop; unresolvable shows only the id and last known source and reveals B_GetFromWorkshop.
---ShowNoMod deliberately clears nothing, so overwriting every field here is what keeps the content
---page from ever showing a previous selection's stale data.
---@param Reference FModReference
function UModInfo:ShowMod(Reference) end

function UModInfo:ShowNoMod() end

