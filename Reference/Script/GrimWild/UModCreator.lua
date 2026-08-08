---Creates a new mod/modpack project on disk: mod.json, Scripts/main.lua and an empty Content/ folder.
---Created via NewObject, configured via its UPROPERTY fields, then TryCreate() is called once.
---@class UModCreator : UObject
---@field public Id string @Required: validated with UModManager::IsValidModId.
---@field public VisibleName string @Optional. Falls back to Id for both the folder name and the manifest 'name' field when empty.
---@field public Type EModType
---@field public OwningHUD UHUDBase @Required: the HUD that owns confirmation windows shown by this operation.
---@field public OnCompleted MulticastDelegate|fun(bSuccess: boolean, ResultPath: string)
UModCreator = {}

function UModCreator:OnConfirmationCancelled() end

function UModCreator:OnFolderCollisionConfirmed() end

function UModCreator:OnIdCollisionConfirmed() end

function UModCreator:TryCreate() end

