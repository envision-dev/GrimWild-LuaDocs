---@meta
---Handles session and player data saving and loading.
---@class USaveGameSubsystem : UGameInstanceSubsystem
---@field protected PlayerData UPlayerData
USaveGameSubsystem = {}

---@return USaveGameSubsystem
function USaveGameSubsystem.Get() end

---@return UPlayerData
function USaveGameSubsystem:GetPlayerData() end

---Loads a previously saved game world into GameWorld.
---Runs the three-phase load sequence:
---Phase 0 — ScanSAssets: register save-session VAssets.
---Phase 1 — Object creation + Initialize from saved data.
---Phase 2 — BeginPlay on all created objects.
---@param GameWorld UGameWorld
---@param SaveName string
function USaveGameSubsystem:LoadGameWorld(GameWorld, SaveName) end

---Saves the current Game World session to disk under the given name.
---@param GameWorld UGameWorld
---@param SaveName string
function USaveGameSubsystem:SaveGameWorld(GameWorld, SaveName) end

function USaveGameSubsystem:SavePlayerData() end

