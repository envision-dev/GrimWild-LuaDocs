---@class UVAssetTestManager : UObject
UVAssetTestManager = {}

---@param Asset UGAssetBase
---@param InDefaultAsset UGAssetBase
---@param Path string
---@param FileName string
---@return boolean
function UVAssetTestManager.Export(Asset, InDefaultAsset, Path, FileName) end

---EDITOR-ONLY!
---@param OutTextures TArray<TSoftObjectPtr<UTexture2D>> @[out]
function UVAssetTestManager.GetAllTexturesInTheGame(OutTextures) end

---@param Filename string
---@param Outer UObject
---@return UGAssetBase
function UVAssetTestManager.ImportMainPackage(Filename, Outer) end

---@param Filename string
---@param AssetToModify UGAssetBase
---@return UGAssetBase
function UVAssetTestManager.ImportModification(Filename, AssetToModify) end

