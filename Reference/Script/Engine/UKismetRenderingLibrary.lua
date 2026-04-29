---@class UKismetRenderingLibrary : UBlueprintFunctionLibrary
UKismetRenderingLibrary = {}

---Returns a Canvas object that can be used to draw to the specified render target.
---Canvas has functions like DrawMaterial with size parameters that can be used to draw to a specific area of a render target.
---Be sure to call EndDrawCanvasToRenderTarget to complete the rendering!
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param Canvas UCanvas @[out]
---@param Size FVector2D @[out]
---@param Context FDrawToRenderTargetContext @[out]
function UKismetRenderingLibrary.BeginDrawCanvasToRenderTarget(WorldContextObject, TextureRenderTarget, Canvas, Size, Context) end

---Break FSkelMeshSkinWeightInfo
---@param InWeight FSkelMeshSkinWeightInfo
---@param Bone0 integer @[out]
---@param Weight0 integer @[out]
---@param Bone1 integer @[out]
---@param Weight1 integer @[out]
---@param Bone2 integer @[out]
---@param Weight2 integer @[out]
---@param Bone3 integer @[out]
---@param Weight3 integer @[out]
function UKismetRenderingLibrary.BreakSkinWeightInfo(InWeight, Bone0, Weight0, Bone1, Weight1, Bone2, Weight2, Bone3, Weight3) end

---Calculates the projection matrix using this view info's aspect ratio (regardless of bConstrainAspectRatio)
---@param MinimalViewInfo FMinimalViewInfo
---@return FMatrix
function UKismetRenderingLibrary.CalculateProjectionMatrix(MinimalViewInfo) end

---Clears the specified render target with the given ClearColor.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param ClearColor? FLinearColor @[default: (R=0.000000,G=0.000000,B=0.000000,A=1.000000)]
function UKismetRenderingLibrary.ClearRenderTarget2D(WorldContextObject, TextureRenderTarget, ClearColor) end

---Copies the contents of a render target to a UTexture2D
---Only works in the editor
---@param WorldContextObject UObject
---@param RenderTarget UTextureRenderTarget2D
---@param Texture UTexture2D
function UKismetRenderingLibrary.ConvertRenderTargetToTexture2DEditorOnly(WorldContextObject, RenderTarget, Texture) end

---Creates a new render target and initializes it to the specified dimensions
---@param WorldContextObject UObject
---@param Width? integer @[default: 256]
---@param Height? integer @[default: 256]
---@param Format? integer @[default: RTF_RGBA16f]
---@param ClearColor? FLinearColor @[default: (R=0.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param bAutoGenerateMipMaps? boolean @[default: false]
---@param bSupportUAVs? boolean @[default: false]
---@return UTextureRenderTarget2D
function UKismetRenderingLibrary.CreateRenderTarget2D(WorldContextObject, Width, Height, Format, ClearColor, bAutoGenerateMipMaps, bSupportUAVs) end

---Creates a new render target array and initializes it to the specified dimensions
---@param WorldContextObject UObject
---@param Width? integer @[default: 256]
---@param Height? integer @[default: 256]
---@param Slices? integer @[default: 1]
---@param Format? integer @[default: RTF_RGBA16f]
---@param ClearColor? FLinearColor @[default: (R=0.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param bAutoGenerateMipMaps? boolean @[default: false]
---@param bSupportUAVs? boolean @[default: false]
---@return UTextureRenderTarget2DArray
function UKismetRenderingLibrary.CreateRenderTarget2DArray(WorldContextObject, Width, Height, Slices, Format, ClearColor, bAutoGenerateMipMaps, bSupportUAVs) end

---Creates a new volume render target and initializes it to the specified dimensions
---@param WorldContextObject UObject
---@param Width? integer @[default: 16]
---@param Height? integer @[default: 16]
---@param Depth? integer @[default: 16]
---@param Format? integer @[default: RTF_RGBA16f]
---@param ClearColor? FLinearColor @[default: (R=0.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param bAutoGenerateMipMaps? boolean @[default: false]
---@param bSupportUAVs? boolean @[default: false]
---@return UTextureRenderTargetVolume
function UKismetRenderingLibrary.CreateRenderTargetVolume(WorldContextObject, Width, Height, Depth, Format, ClearColor, bAutoGenerateMipMaps, bSupportUAVs) end

---Renders a quad with the material applied to the specified render target.
---This sets the render target even if it is already set, which is an expensive operation.
---Use BeginDrawCanvasToRenderTarget / EndDrawCanvasToRenderTarget instead if rendering multiple primitives to the same render target.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param Material UMaterialInterface
function UKismetRenderingLibrary.DrawMaterialToRenderTarget(WorldContextObject, TextureRenderTarget, Material) end

---Enables or disables the path tracer for the current Game Viewport.
---This command is equivalent to setting ShowFlag.PathTracing, but is accessible even from shipping builds.
---@param bEnablePathTracer boolean
function UKismetRenderingLibrary.EnablePathTracing(bEnablePathTracer) end

---Must be paired with a BeginDrawCanvasToRenderTarget to complete rendering to a render target.
---@param WorldContextObject UObject
---@param Context FDrawToRenderTargetContext
function UKismetRenderingLibrary.EndDrawCanvasToRenderTarget(WorldContextObject, Context) end

---Exports a render target as a HDR or PNG image onto the disk (depending on the format of the render target)
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param FilePath string
---@param FileName string
function UKismetRenderingLibrary.ExportRenderTarget(WorldContextObject, TextureRenderTarget, FilePath, FileName) end

---Exports a Texture2D as a HDR image onto the disk.
---@param WorldContextObject UObject
---@param Texture UTexture2D
---@param FilePath string
---@param FileName string
function UKismetRenderingLibrary.ExportTexture2D(WorldContextObject, Texture, FilePath, FileName) end

---Imports a texture from a buffer and creates Texture2D from it.
---@param WorldContextObject UObject
---@param Buffer TArray<integer>
---@return UTexture2D
function UKismetRenderingLibrary.ImportBufferAsTexture2D(WorldContextObject, Buffer) end

---Imports a texture file from disk and creates Texture2D from it.
---@param WorldContextObject UObject
---@param Filename string
---@return UTexture2D
function UKismetRenderingLibrary.ImportFileAsTexture2D(WorldContextObject, Filename) end

---Create FSkelMeshSkinWeightInfo
---@param Bone0 integer
---@param Weight0 integer
---@param Bone1 integer
---@param Weight1 integer
---@param Bone2 integer
---@param Weight2 integer
---@param Bone3 integer
---@param Weight3 integer
---@return FSkelMeshSkinWeightInfo
function UKismetRenderingLibrary.MakeSkinWeightInfo(Bone0, Weight0, Bone1, Weight1, Bone2, Weight2, Bone3, Weight3) end

---Incredibly inefficient and slow operation! Reads entire render target as sRGB color and returns a linear array of sRGB colors.
---LDR render targets are assumed to be in sRGB space. HDR ones are assumed to be in linear space.
---Result whether the operation succeeded.  If successful, OutSamples will an entry per pixel, where each is 8-bit per channel [0,255] BGRA in sRGB space.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param OutSamples TArray<FColor> @[out]
---@param bNormalize? boolean @[default: true]
---@return boolean
function UKismetRenderingLibrary.ReadRenderTarget(WorldContextObject, TextureRenderTarget, OutSamples, bNormalize) end

---Incredibly inefficient and slow operation! Read a value as sRGB color from a render target using integer pixel coordinates.
---LDR render targets are assumed to be in sRGB space. HDR ones are assumed to be in linear space.
---Result is 8-bit per channel [0,255] BGRA in sRGB space.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param X integer
---@param Y integer
---@return FColor
function UKismetRenderingLibrary.ReadRenderTargetPixel(WorldContextObject, TextureRenderTarget, X, Y) end

---Incredibly inefficient and slow operation! Read entire texture as-is from a render target.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param OutLinearSamples TArray<FLinearColor> @[out]
---@param bNormalize? boolean @[default: true]
---@return boolean
function UKismetRenderingLibrary.ReadRenderTargetRaw(WorldContextObject, TextureRenderTarget, OutLinearSamples, bNormalize) end

---Incredibly inefficient and slow operation! Read a value as-is from a render target using integer pixel coordinates.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param X integer
---@param Y integer
---@param bNormalize? boolean @[default: true]
---@return FLinearColor
function UKismetRenderingLibrary.ReadRenderTargetRawPixel(WorldContextObject, TextureRenderTarget, X, Y, bNormalize) end

---Incredibly inefficient and slow operation! Read an area of values as-is from a render target using a rectangle defined by integer pixel coordinates.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param MinX integer
---@param MinY integer
---@param MaxX integer
---@param MaxY integer
---@param bNormalize? boolean @[default: true]
---@return TArray<FLinearColor>
function UKismetRenderingLibrary.ReadRenderTargetRawPixelArea(WorldContextObject, TextureRenderTarget, MinX, MinY, MaxX, MaxY, bNormalize) end

---Incredibly inefficient and slow operation! Read a value as-is from a render target using UV [0,1]x[0,1] coordinates.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param U number
---@param V number
---@param bNormalize? boolean @[default: true]
---@return FLinearColor
function UKismetRenderingLibrary.ReadRenderTargetRawUV(WorldContextObject, TextureRenderTarget, U, V, bNormalize) end

---Incredibly inefficient and slow operation! Read an area of values as-is from a render target using a rectangle defined by UV [0,1]x[0,1] coordinates.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param Area FBox2D
---@param bNormalize? boolean @[default: true]
---@return TArray<FLinearColor>
function UKismetRenderingLibrary.ReadRenderTargetRawUVArea(WorldContextObject, TextureRenderTarget, Area, bNormalize) end

---Incredibly inefficient and slow operation! Read a value as sRGB color from a render target using UV [0,1]x[0,1] coordinates.
---LDR render targets are assumed to be in sRGB space. HDR ones are assumed to be in linear space.
---Result is 8-bit per channel [0,255] BGRA in sRGB space.
---@param WorldContextObject UObject
---@param TextureRenderTarget UTextureRenderTarget2D
---@param U number
---@param V number
---@return FColor
function UKismetRenderingLibrary.ReadRenderTargetUV(WorldContextObject, TextureRenderTarget, U, V) end

---Forces the path tracer to restart sample accumulation.
---This can be used to force the path tracer to compute a new frame in situations where it can not detect a change in the scene automatically.
function UKismetRenderingLibrary.RefreshPathTracingOutput() end

---Manually releases GPU resources of a render target. This is useful for blueprint creating a lot of render target that would
---normally be released too late by the garbage collector that can be problematic on platforms that have tight GPU memory constrains.
---@param TextureRenderTarget UTextureRenderTarget2D
function UKismetRenderingLibrary.ReleaseRenderTarget2D(TextureRenderTarget) end

---Creates a new Static Texture from a Render Target 2D.
---Only works in the editor
---@param RenderTarget UTextureRenderTarget2D
---@param Name? string @[default: Texture]
---@param CompressionSettings? integer @[default: TC_Default]
---@param MipSettings? integer @[default: TMGS_FromTextureGroup]
---@return UTexture2D
function UKismetRenderingLibrary.RenderTargetCreateStaticTexture2DEditorOnly(RenderTarget, Name, CompressionSettings, MipSettings) end

---Changes the resolution of a render target. This is useful for when you need to resize the game viewport or change the in-game resolution during runtime
---and thus need to update the sizes of all the render targets in the game accordingly.
---@param TextureRenderTarget UTextureRenderTarget2D
---@param Width? integer @[default: 256]
---@param Height? integer @[default: 256]
function UKismetRenderingLibrary.ResizeRenderTarget2D(TextureRenderTarget, Width, Height) end

---Set the inset shadow casting state of the given component and all its child attachments.
---    Also choose if all attachments should be grouped for the inset shadow rendering. If enabled, one depth target will be shared for all attachments.
---@param PrimitiveComponent UPrimitiveComponent
---@param bCastInsetShadow boolean
---@param bLightAttachmentsAsGroup boolean
function UKismetRenderingLibrary.SetCastInsetShadowForAllAttachments(PrimitiveComponent, bCastInsetShadow, bLightAttachmentsAsGroup) end

