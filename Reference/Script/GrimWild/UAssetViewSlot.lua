---Widget that displays a single asset entry in the Asset View window.
---@class UAssetViewSlot : UUserWidget
---@field protected AssetId FPrimaryAssetId
---@field protected Format EGAssetFormat
---@field protected LoadStatus EGLoadStatus
---@field protected VAssetMainFilePath string
UAssetViewSlot = {}

---@param InAssetId FPrimaryAssetId
---@param InFormat EGAssetFormat
---@param InLoadStatus EGLoadStatus
---@param InVAssetMainFilePath string
function UAssetViewSlot:Init(InAssetId, InFormat, InLoadStatus, InVAssetMainFilePath) end

function UAssetViewSlot:PostInit() end

