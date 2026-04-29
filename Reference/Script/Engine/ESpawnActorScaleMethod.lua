---Determines how the transform being passed into actor spawning methods interact with the actor's default root component
---@class ESpawnActorScaleMethod
---@field public OverrideRootScale ESpawnActorScaleMethod [0] Ignore the default scale in the actor's root component and hard-set it to the value of SpawnTransform Parameter
---@field public MultiplyWithRoot ESpawnActorScaleMethod [1] Multiply value of the SpawnTransform Parameter with the default scale in the actor's root component
---@field public SelectDefaultAtRuntime ESpawnActorScaleMethod [2]
ESpawnActorScaleMethod = {}
