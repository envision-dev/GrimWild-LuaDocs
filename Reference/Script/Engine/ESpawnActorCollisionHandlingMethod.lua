---Defines available strategies for handling the case where an actor is spawned in such a way that it penetrates blocking collision.
---@class ESpawnActorCollisionHandlingMethod
---@field public Undefined ESpawnActorCollisionHandlingMethod [0] Fall back to default settings.
---@field public AlwaysSpawn ESpawnActorCollisionHandlingMethod [1] Actor will spawn in desired location, regardless of collisions.
---@field public AdjustIfPossibleButAlwaysSpawn ESpawnActorCollisionHandlingMethod [2] Actor will try to find a nearby non-colliding location (based on shape components), but will always spawn even if one cannot be found.
---@field public AdjustIfPossibleButDontSpawnIfColliding ESpawnActorCollisionHandlingMethod [3] Actor will try to find a nearby non-colliding location (based on shape components), but will NOT spawn unless one is found.
---@field public DontSpawnIfColliding ESpawnActorCollisionHandlingMethod [4] Actor will fail to spawn.
ESpawnActorCollisionHandlingMethod = {}
