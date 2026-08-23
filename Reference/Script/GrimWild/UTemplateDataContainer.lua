---@meta
---Stores the serialized template bytes for a UAsset's native template.
---Populated by editor tooling during the save process.
---At runtime, FTemplateInfo loads these bytes via FPackagedTemplateData.
---@class UTemplateDataContainer : UDataAsset
---@field public Bytes TArray<integer>
UTemplateDataContainer = {}

