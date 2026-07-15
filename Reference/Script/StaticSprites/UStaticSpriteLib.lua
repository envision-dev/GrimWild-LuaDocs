---Blueprint function library for Static Sprite Subsystem operations: sprite instance management, transform and tint control.
---=== Coordinate Unit Systems ===
---_TPX (Original Texture Pixels)
--- – Pixel dimensions of imported source textures. Stored in assets (UPROPERTY fields). TQ-agnostic: never changes.
--- – Convert to _UU: value * FStaticSpriteSettings::OriginalTextureSizeToUuRatio (= 100/256 ≈ 0.390625).
---_SPX (Scaled Pixels = TPX * TextureQuality)
--- – Runtime pixel size after the player's Texture Quality setting. Used for atlas allocation and GPU textures.
--- – Convert from _TPX: SPX = TPX * FStaticSpriteSettings::CurrentToOriginalTextureSizeRatio.
---_UU  (Unreal Units, world space)
--- – Standard UE world space. 1 game cell = 100 UU. Sprite visual size does NOT change with TextureQuality.
--- – Convert from _TPX: value * FStaticSpriteSettings::OriginalTextureSizeToUuRatio.
---UV  (no suffix, normalized 0..1)
--- – "UV" in a name always denotes source texture space (e.g. FObjectSprite::StartUV).
---AtlasUV (normalized 0..1, runtime atlas texture space)
--- – "Atlas" prefix signals runtime texture atlas space. AtlasUV ≠ source UV:
---  atlas placement depends on runtime slot allocation, not on the source texture.
---FSpriteTransform suffix note:
--- When a method name carries a unit suffix (_TPX, _UU, etc.), the suffix describes
--- the coordinate space of FSpriteTransform::Location only.
--- Rotation is always in degrees; Scale is always a dimensionless multiplier.
---@class UStaticSpriteLib : UBlueprintFunctionLibrary
UStaticSpriteLib = {}

---@param ProxyId integer
---@return boolean
function UStaticSpriteLib.ActivateSpriteInstance(ProxyId) end

---Reminder: CreateSpriteInstance() exists in Game Module only
---@param ProxyId integer
---@param Parameters FObjectSpriteAttachmentParams
---@return boolean
function UStaticSpriteLib.AttachSpriteInstance(ProxyId, Parameters) end

---/ Debug
---@param ProxyId integer
---@param OutString string @[out]
---@return boolean
function UStaticSpriteLib.DebugSpriteInstance(ProxyId, OutString) end

---@param ProxyId integer
---@param ChildrenAction ESpriteDestroyChildrenAction
---@return boolean
function UStaticSpriteLib.DestroySpriteInstance(ProxyId, ChildrenAction) end

---Not scaled by Texture Quality
---@return integer
function UStaticSpriteLib.GetOriginalTextureAtlasSlotSize() end

---@param InSprite FObjectSprite
---@return FObjectSpriteId
function UStaticSpriteLib.GetSpriteId(InSprite) end

---@param ProxyId integer
---@return UStaticSpriteComponent
function UStaticSpriteLib.GetSpriteInstanceActiveComponent(ProxyId) end

---@param ProxyId integer
---@param OutMap TMap<integer, number> @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceAllArbitraryCPD(ProxyId, OutMap) end

---@param ProxyId integer
---@param Index integer
---@param OutValue number @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceArbitraryCPD(ProxyId, Index, OutValue) end

---@param ProxyId integer
---@param OutAttachChildren TArray<integer> @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceAttachChildren(ProxyId, OutAttachChildren) end

---@param ProxyId integer
---@param OutAttachParent integer @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceAttachParent(ProxyId, OutAttachParent) end

---@param ProxyId integer
---@param OutAttachRootParent integer @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceAttachRootParent(ProxyId, OutAttachRootParent) end

---@param ProxyId integer
---@return ESpriteMobility
function UStaticSpriteLib.GetSpriteInstanceEffectiveMobility(ProxyId) end

---@param ProxyId integer
---@return UMaterialInterface
function UStaticSpriteLib.GetSpriteInstanceMaterial(ProxyId) end

---Returns a copy
---@param ProxyId integer
---@param OutParameters FSpriteProxyParameters @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceParameters(ProxyId, OutParameters) end

---@param ProxyId integer
---@param OutRelRP integer @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceRelativeRenderPriority(ProxyId, OutRelRP) end

---@param ProxyId integer
---@param OutTransform FSpriteTransform @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceRelativeTransform(ProxyId, OutTransform) end

---/ Mobility
---@param ProxyId integer
---@return ESpriteMobility
function UStaticSpriteLib.GetSpriteInstanceSelfMobility(ProxyId) end

---Returns false for empty scenes
---@param ProxyId integer
---@param OutId FObjectSpriteId @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceSourceSprite(ProxyId, OutId) end

---Calculated at the end of the frame
---@param ProxyId integer
---@param OutTransform FTransform @[out]
---@return boolean
function UStaticSpriteLib.GetSpriteInstanceWorldTransform(ProxyId, OutTransform) end

---Gets the sprite's source texture region size in _SPX (scaled pixels = TPX * TextureQuality).
---@param InSprite FObjectSprite
---@param OutX integer @[out]
---@param OutY integer @[out]
function UStaticSpriteLib.GetSpriteSize_SPX(InSprite, OutX, OutY) end

---Gets the sprite's source texture region in Runtime Texture Atlas slots
---@param InSprite FObjectSprite
---@param OutX integer @[out]
---@param OutY integer @[out]
function UStaticSpriteLib.GetSpriteSize_TextureAtlasSlots(InSprite, OutX, OutY) end

---Gets the sprite's source texture region size in _TPX (original texture pixels, TQ-agnostic).
---@param InSprite FObjectSprite
---@param OutX integer @[out]
---@param OutY integer @[out]
function UStaticSpriteLib.GetSpriteSize_TPX(InSprite, OutX, OutY) end

---@param InSprite FObjectSprite
---@return TMap<string, FSpriteSocket>
function UStaticSpriteLib.GetSpriteSockets(InSprite) end

---@param InSprite FObjectSprite @[out]
---@return TMap<string, FSpriteSocket>
function UStaticSpriteLib.GetSpriteSocketsRef(InSprite) end

---Scaled by Texture Quality
---@return integer
function UStaticSpriteLib.GetTextureAtlasSlotSize() end

---@param InTransformToInit FSpriteTransform @[out]
---@param InSourceString string
function UStaticSpriteLib.InitSpriteTransformFromString(InTransformToInit, InSourceString) end

---/ Check
---@param ProxyId integer
---@return boolean
function UStaticSpriteLib.IsSpriteInstanceActive(ProxyId) end

---@param ProxyId integer
---@return boolean
function UStaticSpriteLib.IsSpriteInstanceVisible(ProxyId) end

---@param ProxyId integer
---@return boolean
function UStaticSpriteLib.ReleaseSpriteInstance(ProxyId) end

---@param ProxyId integer
---@param Index integer
---@param bResetValueOnActiveComponent boolean
---@return boolean
function UStaticSpriteLib.RemoveSpriteInstanceArbitraryCPD(ProxyId, Index, bResetValueOnActiveComponent) end

---/ ArbitraryCPD
---@param ProxyId integer
---@param Index integer
---@param Value number
---@return boolean
function UStaticSpriteLib.SetSpriteInstanceArbitraryCPD(ProxyId, Index, Value) end

---Null material will resolve to the Per-Sprite material or the Default one.
---To skip Per-Sprite material, set NewMaterial to Subsystem->GetDefaultMaterial() explicitly.
---@param ProxyId integer
---@param NewMaterial UMaterialInterface
---@return boolean
function UStaticSpriteLib.SetSpriteInstanceMaterialOverride(ProxyId, NewMaterial) end

---@param ProxyId integer
---@param NewRenderPriority integer
---@return boolean
function UStaticSpriteLib.SetSpriteInstanceRelativeRenderPriority(ProxyId, NewRenderPriority) end

---@param ProxyId integer
---@param InTransform FSpriteTransform
---@return boolean
function UStaticSpriteLib.SetSpriteInstanceRelativeTransform(ProxyId, InTransform) end

---@param ProxyId integer
---@param NewMobility ESpriteMobility
---@return boolean
function UStaticSpriteLib.SetSpriteInstanceSelfMobility(ProxyId, NewMobility) end

---@param ProxyId integer
---@param NewTint FColor
---@return boolean
function UStaticSpriteLib.SetSpriteInstanceTint(ProxyId, NewTint) end

---@param ProxyId integer
---@param bNewVisibility boolean
---@return boolean
function UStaticSpriteLib.SetSpriteInstanceVisibility(ProxyId, bNewVisibility) end

---@param ProxyId integer
---@param Index integer
---@return boolean
function UStaticSpriteLib.SpriteInstanceContainsArbitraryCPD(ProxyId, Index) end

---@param InTransform FSpriteTransform
---@return string
function UStaticSpriteLib.SpriteTransformToString(InTransform) end

---FTransform: location/scale: XY, rotation: Yaw
---@param InST FSpriteTransform
---@return FTransform
function UStaticSpriteLib.SpriteTransformToTransform(InST) end

---TEST ONLY. Validates the §2 premise: that per-frame Movable CPD upload for N sprites is cheap.
---Call once per frame on a scene of N active sprites, then read cost via Unreal Insights /
---'stat unit' (Game/Render/GPU) / 'stat gpu'. @@param MaxCount 0 = all active proxies.
---@param MaxCount? integer @[default: 0]
function UStaticSpriteLib.TEST_StressMovableCPDUpload(MaxCount) end

---FTransform: location/scale: XY, rotation: Yaw
---@param InTransform FTransform
---@return FSpriteTransform
function UStaticSpriteLib.TransformToSpriteTransform(InTransform) end

