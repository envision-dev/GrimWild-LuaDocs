---Handles session and player data saving and loading.
---@class USaveGameSubsystem : UGameInstanceSubsystem
---@field protected PlayerData UPlayerData
USaveGameSubsystem = {}

---@return USaveGameSubsystem
function USaveGameSubsystem.Get() end

---@return UPlayerData
function USaveGameSubsystem:GetPlayerData() end

---Saves the current Game World session to disk under the given name.
---@param GameWorld UGameWorld
---@param SaveName string
function USaveGameSubsystem:SaveGameWorld(GameWorld, SaveName) end

function USaveGameSubsystem:SavePlayerData() end

