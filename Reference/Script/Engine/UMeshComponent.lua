---MeshComponent is an abstract base for any component that is an instance of a renderable collection of triangles.
---@class UMeshComponent : UPrimitiveComponent
---@field public OverrideMaterials TArray<UMaterialInterface> @Material overrides.
---@field public OverlayMaterial UMaterialInterface @Translucent material to blend on top of this mesh. Mesh will be rendered twice - once with a base material and once with overlay material
---@field public OverlayMaterialMaxDrawDistance number @The max draw distance for overlay material. A distance of 0 indicates that overlay will be culled using primitive max distance.
---@field protected bEnableMaterialParameterCaching boolean
UMeshComponent = {}

---@param MaterialSlotName string
---@return integer
function UMeshComponent:GetMaterialIndex(MaterialSlotName) end

---@return TArray<UMaterialInterface>
function UMeshComponent:GetMaterials() end

---@return TArray<string>
function UMeshComponent:GetMaterialSlotNames() end

---Get the overlay material used by this instance
---@return UMaterialInterface
function UMeshComponent:GetOverlayMaterial() end

---Get the overlay material used by this instance
---@return number
function UMeshComponent:GetOverlayMaterialMaxDrawDistance() end

---@param MaterialSlotName string
---@return boolean
function UMeshComponent:IsMaterialSlotNameValid(MaterialSlotName) end

---Tell the streaming system to start loading all textures with all mip-levels.
---@param Seconds number
---@param bPrioritizeCharacterTextures boolean
---@param CinematicTextureGroups? integer @[default: 0]
function UMeshComponent:PrestreamTextures(Seconds, bPrioritizeCharacterTextures, CinematicTextureGroups) end

---Change the overlay material used by this instance
---@param NewOverlayMaterial UMaterialInterface
function UMeshComponent:SetOverlayMaterial(NewOverlayMaterial) end

---Change the overlay material max draw distance used by this instance
---@param InMaxDrawDistance number
function UMeshComponent:SetOverlayMaterialMaxDrawDistance(InMaxDrawDistance) end

---Set all occurrences of Scalar Material Parameters with ParameterName in the set of materials of the SkeletalMesh to ParameterValue
---@param ParameterName string
---@param ParameterValue number
function UMeshComponent:SetScalarParameterValueOnMaterials(ParameterName, ParameterValue) end

---Set all occurrences of Vector Material Parameters with ParameterName in the set of materials of the SkeletalMesh to ParameterValue
---@param ParameterName string
---@param ParameterValue FVector
function UMeshComponent:SetVectorParameterValueOnMaterials(ParameterName, ParameterValue) end

