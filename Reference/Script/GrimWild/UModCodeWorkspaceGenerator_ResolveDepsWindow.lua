---@meta
---Fullscreen dialog shown by UModCodeWorkspaceGenerator when a dependency has more than one installed copy
---to point the mod author's IDE at. Only ambiguous dependencies are listed; a missing one is a log warning.
---The chosen paths are read back through GetResolvedChoices().
---@class UModCodeWorkspaceGenerator_ResolveDepsWindow : UUserWidget
---@field protected SB_Deps UGScrollBox
---@field protected TB_Title UGTextBlock
---@field protected B_Resolve UGButton
---@field protected B_Cancel UGButton
---@field protected DepSlotClass TSubclassOf<UModCodeWorkspaceGenerator_ResolveDepsWindow_DepSlot> @The row widget is meaningless outside this window, so it is set per-widget rather than in settings.
---@field protected DepSlots TArray<UModCodeWorkspaceGenerator_ResolveDepsWindow_DepSlot>
---@field public OnDepsResolved MulticastDelegate|fun()
---@field public OnDepsCancelled MulticastDelegate|fun()
UModCodeWorkspaceGenerator_ResolveDepsWindow = {}

---Mod id to the absolute path chosen for it.
---@return TMap<string, string>
function UModCodeWorkspaceGenerator_ResolveDepsWindow:GetResolvedChoices() end

function UModCodeWorkspaceGenerator_ResolveDepsWindow:OnCancelPressed() end

function UModCodeWorkspaceGenerator_ResolveDepsWindow:OnResolvePressed() end

