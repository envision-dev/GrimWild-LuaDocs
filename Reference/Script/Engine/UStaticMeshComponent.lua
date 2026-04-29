---StaticMeshComponent is used to create an instance of a UStaticMesh.
---A static mesh is a piece of geometry that consists of a static set of polygons.
---@class UStaticMeshComponent : UMeshComponent
---@field public ForcedLodModel integer @If 0, auto-select LOD level. if >0, force to (ForcedLodModel-1).
---@field public MinLOD integer @Specifies the smallest LOD that will be used for this component. This is ignored if ForcedLodModel is enabled.
---@field public SubDivisionStepSize integer @Subdivision step size for static vertex lighting.
---@field private StaticMesh UStaticMesh
---@field public WireframeColorOverride FColor @Wireframe color to use if bOverrideWireframeColor is true
---@field public bForceNaniteForMasked boolean @Forces this component to always use Nanite for masked materials, even if FNaniteSettings::bAllowMaskedMaterials=false
---@field public bDisallowNanite boolean @Forces this component to use fallback mesh for rendering if Nanite is enabled on the mesh.
---@field public bForceDisableNanite boolean @Forces this component to use fallback mesh for rendering if Nanite is enabled on the mesh (run-time override)
---@field public bEvaluateWorldPositionOffset boolean @Whether to evaluate World Position Offset. This is only used when running with r.OptimizedWPO=1
---@field public bWorldPositionOffsetWritesVelocity boolean @Whether world position offset turns on velocity writes. If the WPO isn't static then setting false may give incorrect motion vectors. But if we know that the WPO is static then setting false may save performance.
---@field public bEvaluateWorldPositionOffsetInRayTracing boolean @Whether to evaluate World Position Offset for ray tracing. This is only used when running with r.RayTracing.Geometry.StaticMeshes.WPO=1
---@field public WorldPositionOffsetDisableDistance integer @Distance at which to disable World Position Offset for an entire instance (0 = Never disable WPO).
---@field public SelectedEditorSection integer @The section currently selected in the Editor. Used for highlighting
---@field public SelectedEditorMaterial integer @The material currently selected in the Editor. Used for highlighting
---@field public SectionIndexPreview integer @Index of the section to preview. If set to INDEX_NONE, all section will be rendered. Used for isolating in Static Mesh Tool *
---@field public MaterialIndexPreview integer @Index of the material to preview. If set to INDEX_NONE, all section will be rendered. Used for isolating in Static Mesh Tool *
---@field public StaticMeshImportVersion integer @* The import version of the static mesh when it was assign this is update when: * - The user assign a new staticmesh to the component * - The component is serialize (IsSaving) * - Default value is BeforeImportStaticMeshVersionWasAdded * * If when the component get load (PostLoad) the version of the attach staticmesh is newer * then this value, we will remap the material override because the order of the materials list * in the staticmesh can be changed. Hopefully there is a remap table save in the staticmesh.
---@field public bOverrideWireframeColor boolean @If true, WireframeColorOverride will be used. If false, color is determined based on mobility and physics simulation settings
---@field public bOverrideMinLOD boolean @Whether to override the MinLOD setting of the static mesh asset with the MinLOD of this component.
---@field public bOverrideNavigationExport boolean @If true, bForceNavigationObstacle flag will take priority over navigation data stored in StaticMesh
---@field public bForceNavigationObstacle boolean @Allows overriding navigation export behavior per component: full collisions or dynamic obstacle
---@field public bDisallowMeshPaintPerInstance boolean @If true, mesh painting is disallowed on this instance. Set if vertex colors are overridden in a construction script.
---@field public bIgnoreInstanceForTextureStreaming boolean @Ignore this instance of this static mesh when calculating streaming information. This can be useful when doing things like applying character textures to static geometry, to avoid them using distance-based streaming.
---@field public bOverrideLightMapRes boolean @Whether to override the lightmap resolution defined in the static mesh.
---@field public bCastDistanceFieldIndirectShadow boolean @Whether to use the mesh distance field representation (when present) for shadowing indirect lighting (from lightmaps or skylight) on Movable components. This works like capsule shadows on skeletal meshes, except using the mesh distance field so no physics asset is required. The StaticMesh must have 'Generate Mesh Distance Field' enabled, or the project must have 'Generate Mesh Distance Fields' enabled for this feature to work.
---@field public bOverrideDistanceFieldSelfShadowBias boolean @Whether to override the DistanceFieldSelfShadowBias setting of the static mesh asset with the DistanceFieldSelfShadowBias of this component.
---@field public bUseSubDivisions boolean @Whether to use subdivisions or just the triangle's vertices.
---@field public bUseDefaultCollision boolean @Use the collision profile specified in the StaticMesh asset.
---@field public bCustomOverrideVertexColorPerLOD boolean @The component has some custom painting on LODs or not.
---@field public bDisplayVertexColors boolean
---@field public bDisplayPhysicalMaterialMasks boolean
---@field public bDisplayNaniteFallbackMesh boolean @For Nanite enabled meshes, we'll only show the proxy mesh if this is true
---@field public bSortTriangles boolean @Enable dynamic sort mesh's triangles to remove ordering issue when rendered with a translucent material
---@field public bReverseCulling boolean @Controls whether the static mesh component's backface culling should be reversed
---@field public OverriddenLightMapRes integer @Light map resolution to use on this component, used if bOverrideLightMapRes is true and there is a valid StaticMesh.
---@field public DistanceFieldIndirectShadowMinVisibility number @Controls how dark the dynamic indirect shadow can be.
---@field public DistanceFieldSelfShadowBias number @Useful for reducing self shadowing from distance field methods when using world position offset to animate the mesh's vertices.
---@field public StreamingDistanceMultiplier number @Allows adjusting the desired resolution of streaming textures that uses UV 0.  1.0 is the default, whereas a higher value increases the streamed-in resolution.
---@field public LODData TArray<FStaticMeshComponentLODInfo> @Static mesh LOD data.  Contains static lighting data along with instanced mesh vertex colors.
---@field public StreamingTextureData TArray<FStreamingTextureBuildInfo> @The list of texture, bounds and scales. As computed in the texture streaming build process.
---@field public StaticMeshDerivedDataKey string @Derived data key of the static mesh, used to determine if an update from the source static mesh is required.
---@field public MaterialStreamingRelativeBoxes TArray<integer> @Material Bounds used for texture streaming.
---@field public LightmassSettings FLightmassPrimitiveSettings @The Lightmass settings for this object.
UStaticMeshComponent = {}

---Get the initial value of bEvaluateWorldPositionOffset. This is the value when BeginPlay() was last called.
---@return boolean
function UStaticMeshComponent:GetInitialEvaluateWorldPositionOffset() end

---Get Local bounds
---@param Min FVector @[out]
---@param Max FVector @[out]
function UStaticMeshComponent:GetLocalBounds(Min, Max) end

---@param OldStaticMesh UStaticMesh
function UStaticMeshComponent:OnRep_StaticMesh(OldStaticMesh) end

---Sets the component's DistanceFieldSelfShadowBias.  bOverrideDistanceFieldSelfShadowBias must be enabled for this to have an effect.
---@param NewValue number
function UStaticMeshComponent:SetDistanceFieldSelfShadowBias(NewValue) end

---@param NewValue boolean
function UStaticMeshComponent:SetEvaluateWorldPositionOffset(NewValue) end

---@param NewValue boolean
function UStaticMeshComponent:SetEvaluateWorldPositionOffsetInRayTracing(NewValue) end

---Force disabling of Nanite rendering. When true, Will swap to the the fallback mesh instead.
---@param bInForceDisableNanite boolean
function UStaticMeshComponent:SetForceDisableNanite(bInForceDisableNanite) end

---@param NewForcedLodModel integer
function UStaticMeshComponent:SetForcedLodModel(NewForcedLodModel) end

---Set forced reverse culling
---@param ReverseCulling boolean
function UStaticMeshComponent:SetReverseCulling(ReverseCulling) end

---Change the StaticMesh used by this instance.
---@param NewMesh UStaticMesh
---@return boolean
function UStaticMeshComponent:SetStaticMesh(NewMesh) end

---@param NewValue integer
function UStaticMeshComponent:SetWorldPositionOffsetDisableDistance(NewValue) end

