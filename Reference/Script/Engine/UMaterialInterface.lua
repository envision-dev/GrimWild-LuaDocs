---@meta
---@class UMaterialInterface : UObject
---@field public SubsurfaceProfile USubsurfaceProfile @SubsurfaceProfile, for Screen Space Subsurface Scattering..
---@field public SpecularProfiles TArray<USpecularProfile> @Specular Profile. For internal usage, not editable/visible
---@field public bIncludedInBaseGame boolean @Whether this material interface is included in the base game (and not in a DLC)
---@field protected LightmassSettings FLightmassMaterialInterfaceSettings @The Lightmass settings for this object.
---@field protected TextureStreamingData TArray<FMaterialTextureInfo> @Data used by the texture streaming to know how each texture is sampled by the material. Sorted by names for quick access.
---@field protected AssetUserData TArray<UAssetUserData> @Array of user data stored with the asset
UMaterialInterface = {}

---Walks up parent chain and finds the base Material that this is an instance of. Just calls the virtual GetMaterial()
---@return UMaterial
function UMaterialInterface:GetBaseMaterial() end

---@return integer
function UMaterialInterface:GetBlendMode() end

---Get the associated nanite override material.
---@return UMaterialInterface
function UMaterialInterface:GetNaniteOverideMaterial() end

---@param Association integer
---@param ParameterName string
---@param LayerFunction UMaterialFunctionInterface
---@return FMaterialParameterInfo
function UMaterialInterface:GetParameterInfo(Association, ParameterName, LayerFunction) end

---Return a pointer to the physical material used by this material instance.
---@return UPhysicalMaterial
function UMaterialInterface:GetPhysicalMaterial() end

---Return a pointer to the physical material from mask map at given index.
---@param Index integer
---@return UPhysicalMaterial
function UMaterialInterface:GetPhysicalMaterialFromMap(Index) end

---Return a pointer to the physical material mask used by this material instance.
---@return UPhysicalMaterialMask
function UMaterialInterface:GetPhysicalMaterialMask() end

---Force the streaming system to disregard the normal logic for the specified duration and
---instead always load all mip-levels for all textures used by this material.
---@param OverrideForceMiplevelsToBeResident boolean @- Whether to use (true) or ignore (false) the bForceMiplevelsToBeResidentValue parameter.
---@param bForceMiplevelsToBeResidentValue boolean @- true forces all mips to stream in. false lets other factors decide what to do with the mips.
---@param ForceDuration number @- Number of seconds to keep all mip-levels in memory, disregarding the normal priority logic. Negative value turns it off.
---@param CinematicTextureGroups? integer @[default: 0] - Bitfield indicating texture groups that should use extra high-resolution mips
---@param bFastResponse? boolean @[default: false] - USE WITH EXTREME CAUTION! Fast response textures incur sizable GT overhead and disturb streaming metric calculation. Avoid whenever possible.
function UMaterialInterface:SetForceMipLevelsToBeResident(OverrideForceMiplevelsToBeResident, bForceMiplevelsToBeResidentValue, ForceDuration, CinematicTextureGroups, bFastResponse) end

