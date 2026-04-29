---PlayerData is a container for all player-specific information that needs to be loaded during game initialization
---and saved to disk (and possibly Cloud) on any change.
---@class UPlayerData : UObject
UPlayerData = {}

---Equivalent to USaveGameSubsystem::SavePlayerData()
---@param WorldContext UObject
function UPlayerData:Save(WorldContext) end

