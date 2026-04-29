---Mod Editor window for editing a single asset.
---@class UAssetEditorWindow : UModEditorWindowBase
---@field public Asset UGAssetBase @Asset we're applying changes to and saving delta changes (from OriginalAsset) to disk
---@field public OriginalAsset UGAssetBase @Asset from which we're making changes. Nullptr = creating a standalone asset, not editing anything else
UAssetEditorWindow = {}

