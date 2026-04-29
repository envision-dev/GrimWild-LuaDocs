---@class EFontLayoutMethod
---@field public Metrics EFontLayoutMethod [0] Layout the font using the metrics data available in the font. This is typically the desired option, however some fonts have broken or incorrect metrics so may yield better results when using the bounding box values to layout the font.
---@field public BoundingBox EFontLayoutMethod [1] Layout the font using the values from its bounding box. This typically yields a larger line height for fonts that have valid metrics, however it can also produce much better results for fonts that have broken or incorrect metrics.
EFontLayoutMethod = {}
