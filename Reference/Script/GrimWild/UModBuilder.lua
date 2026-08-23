---@meta
---Builds a mod project (editable source folder) into an installed copy under Mods/.
---Created via NewObject, configured via its UPROPERTY fields, then TryBuild() is called once.
---@class UModBuilder : UObject
---@field public ProjectDiskPath string @Required: absolute path to a project folder (under ModProjects/).
---@field public OwningHUD UHUDBase @Required: the HUD that owns confirmation windows shown by this operation.
---@field public OnCompleted MulticastDelegate|fun(bSuccess: boolean, ResultPath: string)
UModBuilder = {}

function UModBuilder:OnConfirmationCancelled() end

function UModBuilder:OnOverwriteConfirmed() end

function UModBuilder:TryBuild() end

