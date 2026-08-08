---Self-contained bridge between the game UI and ISteamUGC for publishing/updating a single Workshop item.
---Knows nothing about UModManager beyond what is passed in via its fields. Created by UMG (NewObject),
---configured via its UPROPERTY fields, then TryUpload() is called once.
---@class UModUploader_SteamWorkshop : UObject
---@field public TargetFileId string @Decimal PublishedFileId string. Empty or "0" means create a new item.
---@field public ContentFolder string @Required: absolute path of the mod folder to upload.
---@field public ModId string @Required: validated with UModManager::IsValidModId.
---@field public ModType EModType
---@field public Title string @Optional. Left unset (empty), the Workshop-side title survives the update untouched.
---@field public Description string
---@field public Visibility EWorkshopVisibility
---@field public Tags TArray<string> @Additional visible Workshop tags, beyond the type tag ("Mod"/"ModPack") which is always set.
---@field public ChangeNote string
---@field public PreviewImagePath string @Optional. Must be under 1 MB; checked locally before starting the update.
---@field public OnCompleted MulticastDelegate|fun(bSuccess: boolean, ResultCode: integer, FileId: string)
---@field public OnProgress MulticastDelegate|fun(Status: EWorkshopUploadStatus, BytesProcessed: integer, BytesTotal: integer)
---@field public OnLegalAgreementRequired MulticastDelegate|fun(Url: string) @Fired instead of OnCompleted when Steam reports the item needs the Workshop legal agreement accepted. Not a failure: the UI should open the Steam overlay to Url, then let the player retry the upload (with TargetFileId now set, if this happened during item creation).
UModUploader_SteamWorkshop = {}

---UI pre-selection hint only; never decides anything. Returns empty if no entry exists for ModId.
---@param InModId string
---@return string
function UModUploader_SteamWorkshop.GetLastUsedFileIdForMod(InModId) end

function UModUploader_SteamWorkshop:TryUpload() end

