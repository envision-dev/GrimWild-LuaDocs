---Developer settings for the Static Sprites system.
---@class USpriteDevSettings : UDeveloperSettings
---@field public DefaultMaterial TSoftObjectPtr<UMaterialInterface> @Default material used for all sprites if the sprite instance does not override it.
---@field public TextureAtlasClass TSoftClassPtr<UCanvasRenderTarget2D> @See UStaticSpriteSubsystem and URuntimeTextureAtlas for more information
---@field public ClearSlotBrush UTexture2D @TODO REMOVE
USpriteDevSettings = {}

---Get Settings object
---@return USpriteDevSettings
function USpriteDevSettings.Get() end

