---@class UMaterialInstance : UMaterialInterface
---@field public PhysMaterial UPhysicalMaterial @Physical material to use for this graphics material. Used for sounds, effects etc.
---@field public PhysicalMaterialMap UPhysicalMaterial @Physical material map used with physical material mask, when it exists.
---@field public Parent UMaterialInterface @Parent material.
---@field public NaniteOverrideMaterial FMaterialOverrideNanite @An override material which will be used instead of this one when rendering with Nanite.
---@field public bHasStaticPermutationResource boolean @Indicates whether the instance has static permutation resources (which are required when static parameters are present) Read directly from the rendering thread, can only be modified with the use of a FMaterialUpdateContext. When true, StaticPermutationMaterialResources will always be valid and non-null.
---@field public bOverrideSubsurfaceProfile boolean @Defines if SubsurfaceProfile from this instance is used or it uses the parent one.
---@field public ScalarParameterValues TArray<FScalarParameterValue> @Scalar parameters.
---@field public VectorParameterValues TArray<FVectorParameterValue> @Vector parameters.
---@field public DoubleVectorParameterValues TArray<FDoubleVectorParameterValue> @DoubleVector parameters.
---@field public TextureParameterValues TArray<FTextureParameterValue> @Texture parameters.
---@field public RuntimeVirtualTextureParameterValues TArray<FRuntimeVirtualTextureParameterValue> @RuntimeVirtualTexture parameters.
---@field public SparseVolumeTextureParameterValues TArray<FSparseVolumeTextureParameterValue> @Sparse Volume Texture parameters.
---@field public FontParameterValues TArray<FFontParameterValue> @Font parameters.
---@field public BasePropertyOverrides FMaterialInstanceBasePropertyOverrides
---@field private StaticParametersRuntime FStaticParameterSetRuntimeData @Static parameter values that are overridden in this instance.
---@field private ReferencedTextureGuids TArray<FGuid>
UMaterialInstance = {}

