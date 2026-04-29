---Used to hold all data needed to render static sprites in World.
---Manages runtime texture atlases and sprite pools.
---Note: the whole system is transient, and no visuals are saved to the disk.
---@class UStaticSpriteSubsystem : UWorldSubsystem
---@field protected RuntimeTextureAtlases TArray<URuntimeTextureAtlas> @Note: Do not shrink, since FSpriteCachedData refers to its atlas by the index inside this array.
---@field protected SpriteDataStrongRefs TMap<FPrimaryAssetId, UObject> @Strong references to parent USpriteData objects. Prevents GC of SpriteData assets while their FObjectSprites are registered in the subsystem. Key = SpriteData primary asset id. Value = ref count of registered sprites from that asset.
---@field protected SpriteComponents TMap<integer, UStaticSpriteComponent> @The map of all existing Sprite Component in the scene (including sprite pool)
---@field protected SpriteRenderer ASpriteRenderer @The Actor that is used as a parent for all Static Sprites in the game
---@field protected AtlasesWaitingForDeferredDraw TArray<URuntimeTextureAtlas>
UStaticSpriteSubsystem = {}

---@return UStaticSpriteSubsystem
function UStaticSpriteSubsystem.Get() end

---Gets the default material used for all sprites if it's not individually overridden
---@return UMaterialInterface
function UStaticSpriteSubsystem.GetDefaultMaterial() end

---Returns the given proxy's Root
---@param InProxyId integer
---@return integer
function UStaticSpriteSubsystem:GetProxyRootParent(InProxyId) end

---
---@param InIndex integer
---@return URuntimeTextureAtlas
function UStaticSpriteSubsystem:GetRuntimeTextureAtlas(InIndex) end

---/ BP
---@return TArray<URuntimeTextureAtlas>
function UStaticSpriteSubsystem:GetRuntimeTextureAtlases() end

---@param InComponentId integer
---@return UStaticSpriteComponent
function UStaticSpriteSubsystem:GetSpriteComponent(InComponentId) end

---@return TMap<integer, UStaticSpriteComponent>
function UStaticSpriteSubsystem:GetSpriteComponents() end

---@return TMap<integer, FSpriteProxy>
function UStaticSpriteSubsystem:GetSpriteProxies() end

---@param InProxyId integer
---@return FSpriteProxy
function UStaticSpriteSubsystem:GetSpriteProxyRef(InProxyId) end

---@return ASpriteRenderer
function UStaticSpriteSubsystem:GetSpriteRenderer() end

---@param InComponentId integer
---@return boolean
function UStaticSpriteSubsystem:IsSpriteComponentIdValid(InComponentId) end

---@param InProxyId integer
---@return boolean
function UStaticSpriteSubsystem:IsValidSpriteProxy(InProxyId) end

---@param NewValue number
function UStaticSpriteSubsystem:SetTargetAnimationFrameDeltaTime(NewValue) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UStaticSpriteSubsystem:GatherDebugData(DebugString) end

