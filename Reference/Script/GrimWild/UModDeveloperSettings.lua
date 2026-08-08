---Developer-facing settings for mod project creation.
---@class UModDeveloperSettings : UDeveloperSettings
---@field public MainLuaTemplate string @Written into a new project's Scripts/main.lua by UModCreator.
---@field public ModsWindowClass TSoftClassPtr<UModsWindow>
---@field public ModSlotClass TSoftClassPtr<UModSlot>
---@field public ModProjectsWindowClass TSoftClassPtr<UModProjectsWindow>
---@field public CreateNewModWindowClass TSoftClassPtr<UCreateNewModWindow>
---@field public ForkModOptionsWindowClass TSoftClassPtr<UForkModOptionsWindow>
---@field public ModEditorClass TSoftClassPtr<UModEditor>
---@field public ModDownloadWindowClass TSoftClassPtr<UModDownloadWindow_SteamWorkshop>
---@field public MissingModPreview TSoftObjectPtr<UTexture2D> @The "?" texture shown by a missing UModSlot in place of the mod's preview.
---@field public ForkedNameSuffix FEText @Appended VERBATIM (no separator) to a fork's default visible name.
---@field public CreatorIdCollisionConfirmText FEText @{0} = mod id
---@field public CreatorFolderCollisionConfirmText FEText @{0} = folder path
---@field public ForkerOverwriteSameIdConfirmText FEText @{0} = target dir
---@field public ForkerOverwriteForeignConfirmText FEText @{0} = target dir, {1} = occupant mod id or <unreadable>
---@field public ForceApplyConfirmText FEText @{0} = issue count
---@field public ResetDraftConfirmText FEText @No arguments.
UModDeveloperSettings = {}

