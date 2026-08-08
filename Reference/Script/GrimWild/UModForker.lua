---Forks a discovered mod (any source) into an editable project folder under ModProjects/ or ModPackProjects/.
---The id is not changed: a fork keeps the original id by design.
---Created via NewObject, configured via its UPROPERTY fields, then TryFork() is called once.
---@class UModForker : UObject
---@field public SourceMod UMod @Required: a discovered mod (any source) to fork from.
---@field public OverrideVisibleName string @Optional. When non-empty, used instead of SourceMod's visible name for both the fork's target folder name and its manifest 'name' field.
---@field public OwningHUD UHUDBase @Required: the HUD that owns confirmation windows shown by this operation.
---@field public OnCompleted MulticastDelegate|fun(bSuccess: boolean, ResultPath: string)
UModForker = {}

function UModForker:OnConfirmationCancelled() end

function UModForker:OnOverwriteConfirmed() end

function UModForker:TryFork() end

