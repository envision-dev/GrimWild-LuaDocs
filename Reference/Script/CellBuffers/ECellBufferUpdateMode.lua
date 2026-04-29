---Defines rules for lifecycle updates.
---@class ECellBufferUpdateMode
---@field public Game ECellBufferUpdateMode [0] In-game data. Connected to game time and world objects. Updated in SyncTick
---@field public Visual ECellBufferUpdateMode [1] Visual data that has no connection to the game world. Cheaper than Game, but is generally unreliable to access from world objects (we can start buffer lifecycle update right inside a logical tick, making different objects rely on mixed data). Updated each UE frame.
ECellBufferUpdateMode = {}
