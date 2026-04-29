---Owns and drives the cell buffer sync pipeline for a single UGameWorld.
---Separated from UGameWorld to isolate buffer-specific logic.
---@class UCellBufferSyncManager : UObject
---@field public OnPreSyncProcess_Visual MulticastDelegate @todo; Runs before submitting a new sync process cycle; Last call point to add work for this frame.
---@field public OnPostSyncProcess_Visual MulticastDelegate @todo; Runs after submitting a new sync process cycle
---@field public OnPreSyncProcess_Game MulticastDelegate @todo; Runs before submitting a new sync process cycle; Last call point to add work for this frame.
---@field public OnPostSyncProcess_Game MulticastDelegate @todo; Runs after submitting a new sync process cycle
UCellBufferSyncManager = {}

---@param DebugString string @[out]
function UCellBufferSyncManager:GatherDebugData(DebugString) end

