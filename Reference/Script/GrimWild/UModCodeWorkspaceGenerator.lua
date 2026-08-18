---Writes a mod project's mod_<id>.code-workspace: the mod's own script folder, the base game's Lua folder
---and every dependency it can resolve, so require paths resolve in the mod author's IDE. Created via
---CreateAndInit, then TryGenerate() is called once.
---@class UModCodeWorkspaceGenerator : UObject
---@field public OnCompleted MulticastDelegate|fun(bSuccess: boolean, ResultPath: string)
---@field private TargetMod UMod @UModManager::Rescan() replaces every UMod, can fire from a Steam callback at any moment, and this operation can sit waiting on the player indefinitely, so the mod is never this object's owner.
---@field private OwningHUD UHUDBase
---@field private ResolveDepsWindow UModCodeWorkspaceGenerator_ResolveDepsWindow
UModCodeWorkspaceGenerator = {}

function UModCodeWorkspaceGenerator:OnDepsCancelled() end

function UModCodeWorkspaceGenerator:OnDepsResolved() end

function UModCodeWorkspaceGenerator:TryGenerate() end

