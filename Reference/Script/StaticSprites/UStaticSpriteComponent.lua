---Mesh Component, represented by runtime Sprite Render Data.
---We use Static Relevance here. It means that all Mesh Draw Commands are created and cached when we add this component to the scene.
---We also support Dynamic Instancing for Draw Call merging. This is done by creating or referencing an element in runtime Sprite Render Data.
---Given SourceSprite and Material, we create "constant" vertex factories (-> uniform buffers, vertex buffers, index buffers) and Material Render Proxies.
---They are "constant" since we collect and cache data from them when we add the component to the scene.
---The Static Sprite is merged with another one if their BaseTexture and Material (with Shader Bindings) match.
---CustomPrimitiveData can vary.
---Vertex Colors are not supported, use Custom Primitive Data instead.
---Stencil prevents sprite from draw command merging (it can merge with another exact same sprite wth the same Stencil value)
---@class UStaticSpriteComponent : UMeshComponent
UStaticSpriteComponent = {}

---@return integer
function UStaticSpriteComponent:GetComponentId() end

---@return integer
function UStaticSpriteComponent:GetCurrentProxyId() end

---Returns the raw socket transform stored inside FObjectSprite.
---Location is in _TPX (original texture pixels, TQ-agnostic). Does NOT apply TextureQuality.
---To get the socket position in world/relative _UU space, use GetSpriteSocketTransform_UU() instead.
---@param InSocketName string
---@return FSpriteTransform
function UStaticSpriteComponent:GetSpriteSocketTransform_TPX(InSocketName) end

---Returns the socket transform in _UU (Unreal Units).
---(Location in returned FSpriteTransform is _UU; Rotation is degrees; Scale is dimensionless.)
---@param InSocketName string
---@param Space? ESpriteSocketSpace @[default: World] - Relative: transform relative to the sprite pivot; World: transform in world space.
---@return FSpriteTransform
function UStaticSpriteComponent:GetSpriteSocketTransform_UU(InSocketName, Space) end

---Gets the texture used by this instance. This probably will load the texture from disk, since we unload it after adding to RTA (for CRT)
---@return UTexture2D
function UStaticSpriteComponent:GetSpriteTexture() end

---@return boolean
function UStaticSpriteComponent:IsComponentActive() end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UStaticSpriteComponent:GatherDebugData(DebugString) end

