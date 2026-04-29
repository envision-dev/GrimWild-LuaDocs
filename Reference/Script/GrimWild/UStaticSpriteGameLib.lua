---Game-side functions for Static Sprites module
---@class UStaticSpriteGameLib : UBlueprintFunctionLibrary
UStaticSpriteGameLib = {}

---Creates a new sprite instance from the given SpriteId (can be null to create empty scenes).
---Will synchronously load the corresponding SpriteData if it wasn't loaded before.
---@param __WorldContext UObject
---@param SpriteId FObjectSpriteId
---@param SpawnParameters FSpriteProxyParameters
---@param AttachParameters FObjectSpriteAttachmentParams
---@param IndividualMaterialOverride? UMaterialInterface @[default: None]
---@return integer
function UStaticSpriteGameLib.CreateSpriteInstance(__WorldContext, SpriteId, SpawnParameters, AttachParameters, IndividualMaterialOverride) end

---@param __WorldContext UObject
---@param ProxyId integer
---@param SpriteId FObjectSpriteId
---@return boolean
function UStaticSpriteGameLib.SetSpriteInstanceSourceSprite(__WorldContext, ProxyId, SpriteId) end

