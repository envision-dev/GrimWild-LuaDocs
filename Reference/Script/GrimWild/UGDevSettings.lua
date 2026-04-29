---Settings for Grim Wild game module
---@class UGDevSettings : UDeveloperSettings
---@field public MainMenuMap TSoftObjectPtr<UWorld>
---@field public GameMap TSoftObjectPtr<UWorld>
---@field public LoadingScreenClass TSoftClassPtr<ULoadingScreen>
---@field public ColorPickerClass TSoftClassPtr<UColorPicker>
---@field public AssetTypeTraits TMap<FPrimaryAssetType, FAssetTypeTraits>
---@field public ModEditorWindows TMap<EModEditorWindowType, TSoftClassPtr<UModEditorWindowBase>>
---@field public PropertySlotWidgetClass TSoftClassPtr<UPropertySlotWidget>
---@field public PropertySlotWidget_OptionLockedInGameMapClass TSoftClassPtr<UUserWidget>
---@field public PropertySlotWidget_Color TSoftClassPtr<UPropertySlotWidget_Color>
---@field public CategoryButtonClass TSoftClassPtr<UCategoryButton>
---@field public GlobalMatParamCollection TSoftObjectPtr<UMaterialParameterCollection>
---@field public LevelLightOverlay TSoftObjectPtr<UMaterialInterface> @Material used for visual light overlay on levels
---@field public Noise_LF TSoftObjectPtr<UTexture> @Low-frequency Perlin, RGB channels with different seeds
---@field public Noise_MF TSoftObjectPtr<UTexture> @Mid-frequency Perlin, RGB channels with different seeds
---@field public Noise_HF TSoftObjectPtr<UTexture> @High-frequency Perlin, RGB channels with different seeds
---@field public Test_VAssetsToAdd TArray<FTest_VAssetToAdd> @Key = VAsset Id; Value = absolute path to the raw data file (including extension)
UGDevSettings = {}

---Get Settings object
---@return UGDevSettings
function UGDevSettings.Get() end

