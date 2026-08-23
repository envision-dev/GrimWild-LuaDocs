---@meta
---Creates a new mod project on disk: mod.json, the mod's Lua script root with main.lua, an empty
---Content/ folder, a .gitignore and an IDE code workspace file.
---Created via NewObject, configured via its UPROPERTY fields, then TryCreate() is called once.
---@class UModCreator : UObject
---@field public Id string @Required: validated with UModManager::IsValidModId.
---@field public VisibleName string @Optional. Falls back to Id for both the folder name and the manifest 'name' field when empty.
---@field public OwningHUD UHUDBase @Required: the HUD that owns confirmation windows shown by this operation.
---@field public OnCompleted MulticastDelegate|fun(bSuccess: boolean, ResultPath: string)
---@field private CodeWorkspaceGenerator UModCodeWorkspaceGenerator @Held only for the duration of the generation kicked off at the end of CreateProjectFiles.
UModCreator = {}

function UModCreator:OnConfirmationCancelled() end

function UModCreator:OnFolderCollisionConfirmed() end

function UModCreator:OnIdCollisionConfirmed() end

function UModCreator:TryCreate() end

