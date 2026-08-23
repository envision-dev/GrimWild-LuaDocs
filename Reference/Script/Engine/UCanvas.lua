---@meta
---A drawing canvas.
---@class UCanvas : UObject
---@field public OrgX number @Modifiable properties.
---@field public OrgY number @Origin for drawing in X.
---@field public ClipX number @Origin for drawing in Y.
---@field public ClipY number @Bottom right clipping region.
---@field public DrawColor FColor @Bottom right clipping region.
---@field public bCenterX boolean @Color for drawing.
---@field public bCenterY boolean @Whether to center the text horizontally (about CurX)
---@field public bNoSmooth boolean @Whether to center the text vertically (about CurY)
---@field public SizeX integer @Don't bilinear filter.
---@field public SizeY integer @Zero-based actual dimensions X.
---@field public ColorModulate FPlane @Internal.
---@field public DefaultTexture UTexture2D
---@field public GradientTexture0 UTexture2D @Default texture to use
---@field public ReporterGraph UReporterGraph @Helper class to render 2d graphs on canvas
UCanvas = {}

---Performs a deprojection of a screen space coordinate using the projection matrix set up for the Canvas.
---@param ScreenPosition FVector2D @Screen space position to deproject to the World.
---@param WorldOrigin FVector @[out, modified in place] Vector which is the world position of the screen space position.
---@param WorldDirection FVector @[out, modified in place] Vector which can be used in a trace to determine what is "behind" the screen space position. Useful for object picking.
function UCanvas:K2_Deproject(ScreenPosition, WorldOrigin, WorldDirection) end

---Draws a 3x3 grid border with tiled frame and tiled interior on the Canvas.
---@param BorderTexture UTexture @Texture to use for border.
---@param BackgroundTexture UTexture @Texture to use for border background.
---@param LeftBorderTexture UTexture @Texture to use for the tiling left border.
---@param RightBorderTexture UTexture @Texture to use for the tiling right border.
---@param TopBorderTexture UTexture @Texture to use for the tiling top border.
---@param BottomBorderTexture UTexture @Texture to use for the tiling bottom border.
---@param ScreenPosition FVector2D @Screen space position to render the texture.
---@param ScreenSize FVector2D @Screen space size to render the texture.
---@param CoordinatePosition FVector2D @Normalized UV starting coordinate to use when rendering the border texture.
---@param CoordinateSize? FVector2D @[default: (X=1.000,Y=1.000)] Normalized UV size coordinate to use when rendering the border texture.
---@param RenderColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)] Color to tint the border.
---@param BorderScale? FVector2D @[default: (X=0.100,Y=0.100)] Scale of the border.
---@param BackgroundScale? FVector2D @[default: (X=0.100,Y=0.100)] Scale of the background.
---@param Rotation? number @[default: 0.000000] Rotation, in degrees, to render the texture.
---@param PivotPoint? FVector2D @[default: (X=0.500,Y=0.500)] Normalized pivot point to use when rotating the texture.
---@param CornerSize? FVector2D @[default: ""] Frame corner size in percent of frame texture (should be < 0.5f).
function UCanvas:K2_DrawBorder(BorderTexture, BackgroundTexture, LeftBorderTexture, RightBorderTexture, TopBorderTexture, BottomBorderTexture, ScreenPosition, ScreenSize, CoordinatePosition, CoordinateSize, RenderColor, BorderScale, BackgroundScale, Rotation, PivotPoint, CornerSize) end

---Draws an unfilled box on the Canvas.
---@param ScreenPosition FVector2D @Screen space position to render the text.
---@param ScreenSize FVector2D @Screen space size to render the texture.
---@param Thickness? number @[default: 1.000000] How many pixels thick the box lines should be.
---@param RenderColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
function UCanvas:K2_DrawBox(ScreenPosition, ScreenSize, Thickness, RenderColor) end

---Draws a line on the Canvas.
---@param ScreenPositionA? FVector2D @[default: ""] Starting position of the line in screen space.
---@param ScreenPositionB? FVector2D @[default: ""] Ending position of the line in screen space.
---@param Thickness? number @[default: 1.000000] How many pixels thick this line should be.
---@param RenderColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)] Color to render the line.
function UCanvas:K2_DrawLine(ScreenPositionA, ScreenPositionB, Thickness, RenderColor) end

---Draws a material on the Canvas.
---@param RenderMaterial UMaterialInterface @Material to use when rendering. Remember that only the emissive channel is able to be rendered as no lighting is performed when rendering to the Canvas.
---@param ScreenPosition FVector2D @Screen space position to render the texture.
---@param ScreenSize FVector2D @Screen space size to render the texture.
---@param CoordinatePosition FVector2D @Normalized UV starting coordinate to use when rendering the texture.
---@param CoordinateSize? FVector2D @[default: (X=1.000,Y=1.000)] Normalized UV size coordinate to use when rendering the texture.
---@param Rotation? number @[default: 0.000000] Rotation, in degrees, to render the texture.
---@param PivotPoint? FVector2D @[default: (X=0.500,Y=0.500)] Normalized pivot point to use when rotating the texture.
function UCanvas:K2_DrawMaterial(RenderMaterial, ScreenPosition, ScreenSize, CoordinatePosition, CoordinateSize, Rotation, PivotPoint) end

---Draws a set of triangles on the Canvas.
---@param RenderMaterial UMaterialInterface @Material to use when rendering. Remember that only the emissive channel is able to be rendered as no lighting is performed when rendering to the Canvas.
---@param Triangles TArray<FCanvasUVTri> @Triangles to render.
function UCanvas:K2_DrawMaterialTriangle(RenderMaterial, Triangles) end

---Draws a polygon on the Canvas.
---@param RenderTexture UTexture @Texture to use when rendering the triangles. If no texture is set, then the default white texture is used.
---@param ScreenPosition FVector2D @Screen space position to render the text.
---@param Radius? FVector2D @[default: (X=1.000,Y=1.000)] How large in pixels this polygon should be.
---@param NumberOfSides? integer @[default: 3] How many sides this polygon should have. This should be above or equal to three.
---@param RenderColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)] Color to tint the polygon.
function UCanvas:K2_DrawPolygon(RenderTexture, ScreenPosition, Radius, NumberOfSides, RenderColor) end

---Draws text on the Canvas.
---@param RenderFont UFont @Font to use when rendering the text. If this is null, then a default engine font is used.
---@param RenderText string @Text to render on the Canvas.
---@param ScreenPosition FVector2D @Screen space position to render the text.
---@param Scale? FVector2D @[default: (X=1.000,Y=1.000)]
---@param RenderColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)] Color to render the text.
---@param Kerning? number @[default: 0.000000] Horizontal spacing adjustment to modify the spacing between each letter.
---@param ShadowColor? FLinearColor @[default: (R=0.000000,G=0.000000,B=0.000000,A=1.000000)] Color to render the shadow of the text.
---@param ShadowOffset? FVector2D @[default: (X=1.000,Y=1.000)] Pixel offset relative to the screen space position to render the shadow of the text.
---@param bCentreX? boolean @[default: false] If true, then interpret the screen space position X coordinate as the center of the rendered text.
---@param bCentreY? boolean @[default: false] If true, then interpret the screen space position Y coordinate as the center of the rendered text.
---@param bOutlined? boolean @[default: false] If true, then the text should be rendered with an outline.
---@param OutlineColor? FLinearColor @[default: (R=0.000000,G=0.000000,B=0.000000,A=1.000000)] Color to render the outline for the text.
function UCanvas:K2_DrawText(RenderFont, RenderText, ScreenPosition, Scale, RenderColor, Kerning, ShadowColor, ShadowOffset, bCentreX, bCentreY, bOutlined, OutlineColor) end

---Draws a texture on the Canvas.
---@param RenderTexture UTexture @Texture to use when rendering. If no texture is set then this will use the default white texture.
---@param ScreenPosition FVector2D @Screen space position to render the texture.
---@param ScreenSize FVector2D @Screen space size to render the texture.
---@param CoordinatePosition FVector2D @Normalized UV starting coordinate to use when rendering the texture.
---@param CoordinateSize? FVector2D @[default: (X=1.000,Y=1.000)] Normalized UV size coordinate to use when rendering the texture.
---@param RenderColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)] Color to use when rendering the texture.
---@param BlendMode? integer @[default: BLEND_Translucent] Blending mode to use when rendering the texture.
---@param Rotation? number @[default: 0.000000] Rotation, in degrees, to render the texture.
---@param PivotPoint? FVector2D @[default: (X=0.500,Y=0.500)] Normalized pivot point to use when rotating the texture.
function UCanvas:K2_DrawTexture(RenderTexture, ScreenPosition, ScreenSize, CoordinatePosition, CoordinateSize, RenderColor, BlendMode, Rotation, PivotPoint) end

---Draws a set of triangles on the Canvas.
---@param RenderTexture UTexture @Texture to use when rendering the triangles. If no texture is set, then the default white texture is used.
---@param Triangles TArray<FCanvasUVTri> @Triangles to render.
function UCanvas:K2_DrawTriangle(RenderTexture, Triangles) end

---Performs a projection of a world space coordinates using the projection matrix set up for the Canvas.
---@param WorldLocation FVector @World space location to project onto the Canvas rendering plane.
---@return FVector
function UCanvas:K2_Project(WorldLocation) end

---Returns the wrapped text size in screen space coordinates.
---@param RenderFont UFont @Font to use when determining the size of the text. If this is null, then a default engine font is used.
---@param RenderText string @Text to determine the size of.
---@return FVector2D
function UCanvas:K2_StrLen(RenderFont, RenderText) end

---Returns the clipped text size in screen space coordinates.
---@param RenderFont UFont @Font to use when determining the size of the text. If this is null, then a default engine font is used.
---@param RenderText string @Text to determine the size of.
---@param Scale? FVector2D @[default: (X=1.000,Y=1.000)] Scale of the font to use when determining the size of the text.
---@return FVector2D
function UCanvas:K2_TextSize(RenderFont, RenderText, Scale) end

