---Text transformation policy that can be applied to the text before displaying it.
---@class ETextTransformPolicy
---@field public None ETextTransformPolicy [0] No transform, just use the given text as-is
---@field public ToLower ETextTransformPolicy [1] Convert the text to lowercase for display
---@field public ToUpper ETextTransformPolicy [2] Convert the text to uppercase for display
ETextTransformPolicy = {}
