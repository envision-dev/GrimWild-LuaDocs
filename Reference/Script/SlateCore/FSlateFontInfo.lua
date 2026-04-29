---A representation of a font in Slate.
---@class FSlateFontInfo
---@field public FontObject UObject @The font object (valid when used from UMG or a Slate widget style asset)
---@field public FontMaterial UObject @The material to use when rendering this font
---@field public OutlineSettings FFontOutlineSettings @Settings for applying an outline to a font
---@field public TypefaceFontName string @The name of the font to use from the default typeface (None will use the first entry)
---@field public Size number @The font size is a measure in point values. The conversion of points to Slate Units is done at 96 DPI. So if you're using a tool like Photoshop to prototype layouts and UI mock ups, you can change the UMG Font settings to ensure that UMG font size is displayed in its 72 DPI equivalent, even if Slate will still use 96 DPI internally.
---@field public LetterSpacing integer @The uniform spacing (or tracking) between all characters in the text.
---@field public SkewAmount number @A skew amount to apply to the text.
FSlateFontInfo = {}
