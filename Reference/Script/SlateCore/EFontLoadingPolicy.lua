---@class EFontLoadingPolicy
---@field public LazyLoad EFontLoadingPolicy [0] Lazy load the entire font into memory. This will consume more memory than Streaming, however there will be zero file-IO when rendering glyphs within the font, although the initial load may cause a hitch.
---@field public Stream EFontLoadingPolicy [1] Stream the font from disk. This will consume less memory than LazyLoad or Inline, however there will be file-IO when rendering glyphs, which may cause hitches under certain circumstances or on certain platforms.
---@field public Inline EFontLoadingPolicy [2] Embed the font data within the asset. This will consume more memory than Streaming, however it is guaranteed to be hitch free (only valid for font data within a Font Face asset).
EFontLoadingPolicy = {}
