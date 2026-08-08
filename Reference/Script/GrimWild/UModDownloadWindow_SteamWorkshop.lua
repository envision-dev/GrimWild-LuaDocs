---Stub for the Steam Workshop download dialog. Future behavior: a Workshop search by the mod-id kv-tag,
---plus a direct fileId path when Reference.Source == EModSource::SteamWorkshop (SourceKey is the fileId).
---No logic yet; created on demand by its owner and destroyed on close.
---@class UModDownloadWindow_SteamWorkshop : UUserWidget
---@field protected B_Close UGButton
---@field public OnCloseRequested MulticastDelegate|fun()
UModDownloadWindow_SteamWorkshop = {}

---@return FModReference
function UModDownloadWindow_SteamWorkshop:GetReference() end

function UModDownloadWindow_SteamWorkshop:OnClosePressed() end

