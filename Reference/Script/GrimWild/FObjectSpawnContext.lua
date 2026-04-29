---TODO: Potentially unused 2025
---@class FObjectSpawnContext
---@field public bLoadingFromDisk boolean @Set to true on loading the object from disk
---@field public AssetId FPrimaryAssetId @ObjectData asset Id
---@field public InstanceId integer @Object instance unique Id. Can be null for new objects, so their Id is generated on spawning
FObjectSpawnContext = {}
