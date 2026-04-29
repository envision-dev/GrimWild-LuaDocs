---Notes:
---Works on every UGAssetBase subclass
---VAssets cannot add new Asset Types. So in order for VAssets to work properly, we should have at least one UAsset of the same type
---@class UGAssetManager : UAssetManager
UGAssetManager = {}

---@param InId FPrimaryAssetId
---@param InFilename string
---@param InParentId FPrimaryAssetId
function UGAssetManager.Test_AddVAsset(InId, InFilename, InParentId) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UGAssetManager:GatherDebugData(DebugString) end

