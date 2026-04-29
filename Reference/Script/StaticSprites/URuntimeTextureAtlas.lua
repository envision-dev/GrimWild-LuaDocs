---Texture atlas we use for static sprites at runtime.
---There are two types of Runtime Texture Atlases.
---The first one is "classic" type that was initially the only way to handle sprites.
---It's called CRT type, and it uses Canvas Render Target as texture parameter.
---The second one is called Non-CRT or !CRT.
---It was created on top of the Runtime Texture Atlas structure to handle sprites that should not create runtime Render Targets.
---Instead, they use their own UTexture2D* SourceTexture and given UVs as shader parameters.
---We still benefit from creating Non-CRT sprites with Static Sprite Subsystem.
---The RTA structure allows us to use material overrides and Sprite Pools.
---Non-CRT type is used with TileSets, where SourceTexture already contains an atlas with many elements.
---@class URuntimeTextureAtlas : UObject
---@field protected AtlasTexture UTexture @Actual atlas texture we draw on and send to GPU as a shader parameter
---@field protected RenderProxies TMap<UMaterialInterface, FRenderProxyContainer>
---@field protected SpritesToDraw TArray<FSpriteToDraw> @The array of sprites that wait to be drawn to the atlas texture at the end of the frame. CRT-type only
URuntimeTextureAtlas = {}

---@return UTexture
function URuntimeTextureAtlas:GetAtlasTexture() end

---Returns the total amount of Released Components stored in this atlas (for every material)
---@return integer
function URuntimeTextureAtlas:GetNumReleasedComponents() end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function URuntimeTextureAtlas:GatherDebugData(DebugString) end

