---@meta
---Defines rules for lifecycle updates.
---@class ECellBufferUpdateMode
---@field public Game ECellBufferUpdateMode [0] Synchronizes CPU <-> GPU state changes Sync Tick by default. Can be forced into the next sync process using MarkGameBufferForEagerSync().
---@field public Visual ECellBufferUpdateMode [1] Synchronizes CPU <-> GPU state changes every UE frame by default.
ECellBufferUpdateMode = {}
