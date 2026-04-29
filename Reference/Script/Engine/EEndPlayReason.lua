---Specifies why an actor is being deleted/removed from a level
---@class EEndPlayReason
---@field public Destroyed EEndPlayReason [0] When the Actor or Component is explicitly destroyed.
---@field public LevelTransition EEndPlayReason [1] When the world is being unloaded for a level transition.
---@field public EndPlayInEditor EEndPlayReason [2] When the world is being unloaded because PIE is ending.
---@field public RemovedFromWorld EEndPlayReason [3] When the level it is a member of is streamed out.
---@field public Quit EEndPlayReason [4] When the application is being exited.
EEndPlayReason = {}
