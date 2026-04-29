---A StaticMesh is a piece of geometry that consists of a static set of polygons.
---Static Meshes can be translated, rotated, and scaled, but they cannot have their vertices animated in any way. As such, they are more efficient
---to render than other types of geometry such as USkeletalMesh, and they are often the basic building block of levels created in the engine.
---@class UStaticMesh : UStreamableRenderAsset
---@field private SourceModels TArray<FStaticMeshSourceModel>
---@field private HiResSourceModel FStaticMeshSourceModel
---@field private SectionInfoMap FMeshSectionInfoMap
---@field private OriginalSectionInfoMap FMeshSectionInfoMap
---@field public LODGroup string @The LOD group to which this mesh belongs.
---@field public NumStreamedLODs FPerPlatformInt @If non-negative, specify the maximum number of streamed LODs. Only has effect if mesh LOD streaming is enabled for the target platform.
---@field public ImportVersion integer @The last import version
---@field public MaterialRemapIndexPerImportVersion TArray<FMaterialRemapIndex>
---@field private LightmapUVVersion integer
---@field public bAutoComputeLODScreenSize boolean @If true, the screen sizes at which LODs swap are computed automatically.
---@field public NaniteSettings FMeshNaniteSettings @Settings related to building Nanite data.
---@field public MinQualityLevelLOD FPerQualityLevelInt @Allow more flexibility to set various values driven by the Scalability or Device Profile.
---@field public MinLOD FPerPlatformInt
---@field private StaticMaterials TArray<FStaticMaterial>
---@field private LightmapUVDensity number
---@field public LightMapResolution integer @The light map resolution
---@field public LightMapCoordinateIndex integer @The light map coordinate index
---@field public DistanceFieldSelfShadowBias number @Useful for reducing self shadowing from distance field methods when using world position offset to animate the mesh's vertices.
---@field private BodySetup UBodySetup
---@field public LODForCollision integer @Specifies which mesh LOD to use for complex (per-poly) collision. Sometimes it can be desirable to use a lower poly representation for collision to reduce memory usage, improve performance and behaviour. Collision representation does not change based on distance to camera.
---@field public bGenerateMeshDistanceField boolean @Whether to generate a distance field for this mesh, which can be used by DistanceField Indirect Shadows. This is ignored if the project's 'Generate Mesh Distance Fields' setting is enabled.
---@field public bHasNavigationData boolean @If true, mesh will have NavCollision property with additional data for navmesh generation and usage.           Set to false for distant meshes (always outside navigation bounds) to save memory on collision data.
---@field public bSupportUniformlyDistributedSampling boolean @Mesh supports uniformly distributed sampling in constant time. Memory cost is 8 bytes per triangle. Example usage is uniform spawning of particles.
---@field public bSupportPhysicalMaterialMasks boolean @If true, complex collision data will store UVs and face remap table for use when performing PhysicalMaterialMask lookups in cooked builds. Note the increased memory cost for this functionality.
---@field public bSupportRayTracing boolean @If true, a ray tracing acceleration structure will be built for this mesh and it may be used in ray tracing effects
---@field public bDoFastBuild boolean
---@field public bAllowCPUAccess boolean @If true, will keep geometry data CPU-accessible in cooked builds, rather than uploading to GPU memory and releasing it from CPU memory. This is required if you wish to access StaticMesh geometry data on the CPU at runtime in cooked builds (e.g. to convert StaticMesh to ProceduralMeshComponent)
---@field public bSupportGpuUniformlyDistributedSampling boolean @If true, a GPU buffer containing required data for uniform mesh surface sampling will be created at load time. It is created from the cpu data so bSupportUniformlyDistributedSampling is also required to be true.
---@field public AssetImportData UAssetImportData @Importing data and options used for this mesh
---@field public ThumbnailInfo UThumbnailInfo @Information for thumbnail rendering
---@field public EditorCameraPosition FAssetEditorOrbitCameraPosition @The stored camera position to use as a default for the static mesh editor
---@field public bCustomizedCollision boolean @If the user has modified collision in any way or has custom collision imported. Used for determining if to auto generate collision on import
---@field public Sockets TArray<UStaticMeshSocket> @Array of named socket locations, set up in editor and used as a shortcut instead of specifying everything explicitly to AttachComponent in the StaticMeshComponent.
---@field public PositiveBoundsExtension FVector
---@field public NegativeBoundsExtension FVector
---@field public ExtendedBounds FBoxSphereBounds
---@field protected ElementToIgnoreForTexFactor integer @Index of an element to ignore while gathering streaming texture factors. This is useful to disregard automatically generated vertex data which breaks texture factor heuristics.
---@field protected AssetUserData TArray<UAssetUserData> @Array of user data stored with the asset
---@field public ComplexCollisionMesh UStaticMesh
---@field private NavCollision UNavCollisionBase
UStaticMesh = {}

---Adds a new material and return its slot name
---@param Material UMaterialInterface
---@return string
function UStaticMesh:AddMaterial(Material) end

---Add a socket object in this StaticMesh.
---@param Socket UStaticMeshSocket
function UStaticMesh:AddSocket(Socket) end

---Builds static mesh LODs from the array of StaticMeshDescriptions passed in
---@param StaticMeshDescriptions TArray<UStaticMeshDescription>
---@param bBuildSimpleCollision? boolean @[default: false]
---@param bFastBuild? boolean @[default: true]
function UStaticMesh:BuildFromStaticMeshDescriptions(StaticMeshDescriptions, bBuildSimpleCollision, bFastBuild) end

---Create an empty StaticMeshDescription object, to describe a static mesh at runtime
---@param Outer? UObject @[default: None]
---@return UStaticMeshDescription
function UStaticMesh.CreateStaticMeshDescription(Outer) end

---Find a socket object in this StaticMesh by name.
---Entering NAME_None will return NULL. If there are multiple sockets with the same name, will return the first one.
---@param InSocketName string
---@return UStaticMeshSocket
function UStaticMesh:FindSocket(InSocketName) end

---Returns the bounding box, in local space including bounds extension(s), of the StaticMesh asset
---@return FBox
function UStaticMesh:GetBoundingBox() end

---Returns the number of bounds of the mesh.
---@return FBoxSphereBounds
function UStaticMesh:GetBounds() end

---Gets a Material given a Material Index and an LOD number
---@param MaterialIndex integer
---@return UMaterialInterface
function UStaticMesh:GetMaterial(MaterialIndex) end

---Gets a Material index given a slot name
---@param MaterialSlotName string
---@return integer
function UStaticMesh:GetMaterialIndex(MaterialSlotName) end

---@param PlatformName string
---@return integer
function UStaticMesh:GetMinimumLODForPlatform(PlatformName) end

---@param PlatformMinimumLODs TMap<string, integer> @[out]
function UStaticMesh:GetMinimumLODForPlatforms(PlatformMinimumLODs) end

---@param QualityLevel string
---@return integer
function UStaticMesh:GetMinimumLODForQualityLevel(QualityLevel) end

---@param QualityLevelMinimumLODs TMap<string, integer> @[out]
function UStaticMesh:GetMinimumLODForQualityLevels(QualityLevelMinimumLODs) end

---@param QualityLevelMinimumLODs TMap<EPerQualityLevels, integer> @[out]
---@param Default integer @[out]
function UStaticMesh:GetMinLODForQualityLevels(QualityLevelMinimumLODs, Default) end

---Returns the number of LODs used by the mesh.
---@return integer
function UStaticMesh:GetNumLODs() end

---Returns number of Sections that this StaticMesh has, in the supplied LOD (LOD 0 is the highest)
---@param InLOD integer
---@return integer
function UStaticMesh:GetNumSections(InLOD) end

---Returns the number of triangles in the render data for the specified LOD.
---@param LODIndex integer
---@return integer
function UStaticMesh:GetNumTriangles(LODIndex) end

---Returns a list of sockets with the provided tag.
---@param InSocketTag string
---@return TArray<UStaticMeshSocket>
function UStaticMesh:GetSocketsByTag(InSocketTag) end

---@return TArray<FStaticMaterial>
function UStaticMesh:GetStaticMaterials() end

---Return a new StaticMeshDescription referencing the MeshDescription of the given LOD
---@param LODIndex integer
---@return UStaticMeshDescription
function UStaticMesh:GetStaticMeshDescription(LODIndex) end

---@return boolean
function UStaticMesh:IsLODScreenSizeAutoComputed() end

---Remove a socket object in this StaticMesh by providing it's pointer. Use FindSocket() if needed.
---@param Socket UStaticMeshSocket
function UStaticMesh:RemoveSocket(Socket) end

---Sets a Material given a Material Index
---@param MaterialIndex integer
---@param NewMaterial UMaterialInterface
function UStaticMesh:SetMaterial(MaterialIndex, NewMaterial) end

---@param PlatformName string
---@param InMinLOD integer
function UStaticMesh:SetMinimumLODForPlatform(PlatformName, InMinLOD) end

---@param PlatformMinimumLODs TMap<string, integer>
function UStaticMesh:SetMinimumLODForPlatforms(PlatformMinimumLODs) end

---Allow to override min lod quality levels on a staticMesh and it Default value (-1 value for Default dont override its value).
---@param QualityLevelMinimumLODs TMap<EPerQualityLevels, integer>
---@param Default? integer @[default: -1]
function UStaticMesh:SetMinLODForQualityLevels(QualityLevelMinimumLODs, Default) end

---@param Num integer
function UStaticMesh:SetNumSourceModels(Num) end

---@param InStaticMaterials TArray<FStaticMaterial>
function UStaticMesh:SetStaticMaterials(InStaticMaterials) end

