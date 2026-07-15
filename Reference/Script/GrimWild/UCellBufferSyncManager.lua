---Owns and drives the cell buffer sync pipeline for a single UGameWorld.
---Separated from UGameWorld to isolate buffer-specific logic.
---@class UCellBufferSyncManager : UObject
---@field public OnPreSyncProcess MulticastDelegate|fun() @Fires on every RunBuildAndSubmit call, before any early-out on empty eligible set.
---@field public OnPostSyncProcess MulticastDelegate|fun() @Fires on every RunBuildAndSubmit call, after Phase C is enqueued and eager cleanup runs.
UCellBufferSyncManager = {}

---@param DebugString string @[out]
function UCellBufferSyncManager:GatherDebugData(DebugString) end

