---Player controller used in Game Map
---@class AGPlayerController : AGPlayerControllerBase
---@field protected GameHUDClass TSoftClassPtr<UGameHUD>
---@field protected GameHUD UGameHUD
---@field public LuaSingleCastDelegateTest Delegate|fun(bSuccess: boolean)
AGPlayerController = {}

function AGPlayerController:CustomFunction() end

---@return UGameHUD
function AGPlayerController:GetGameHUD() end

---TODO TEMP TESTS
---@param AssetId FPrimaryAssetId
---@param ModificationFilename string
---@return boolean
function AGPlayerController:Test_AddModification(AssetId, ModificationFilename) end

---@param Key string
---@param Value string
function AGPlayerController:Test_AddTranslation(Key, Value) end

---@param OnComplete Delegate|fun(bSuccess: boolean, PublishedFileId: integer)
function AGPlayerController.Test_CreateWorkshopItem(OnComplete) end

function AGPlayerController:Test_DestroyAllSprites() end

---@param InStyle FColorStyle
---@param Filename string
function AGPlayerController:Test_ExportColorPalette(InStyle, Filename) end

---@param Asset UGAssetBase
---@param Filename string
function AGPlayerController:Test_ExportVAsset(Asset, Filename) end

---@param AssetId FPrimaryAssetId
---@param MainFilePath string
---@return UWorldObject
function AGPlayerController:Test_GetTemplate(AssetId, MainFilePath) end

---@param Filename string
function AGPlayerController:Test_ImportColorPalette(Filename) end

---Uploads and submits a Workshop item update. Leave desired fields empty to skip updating them.
---        //TODO: used in Lua example
---@param PublishedFileId integer
---@param ContentFolderPath string
---@param PreviewImagePath string
---@param Title string
---@param ChangeNote string
---@param OnComplete Delegate|fun(bSuccess: boolean)
function AGPlayerController.Test_UploadWorkshopItem(PublishedFileId, ContentFolderPath, PreviewImagePath, Title, ChangeNote, OnComplete) end

