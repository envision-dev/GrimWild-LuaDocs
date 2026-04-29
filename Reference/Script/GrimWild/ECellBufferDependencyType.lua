---@class ECellBufferDependencyType
---@field public Soft ECellBufferDependencyType [0] Buffer is processed after its dependency if possible, but runs independently if the dependency is paused or skipped. Recommended for most gameplay cases.
---@field public Hard ECellBufferDependencyType [1] Buffer is skipped entirely this tick if its dependency is paused, skipped, or has SyncStatus != NotRunning. Used primarily for testing.
ECellBufferDependencyType = {}
