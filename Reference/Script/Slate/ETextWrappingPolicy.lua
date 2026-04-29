---The different methods that can be used if a word is too long to be broken by the default line-break iterator.
---@class ETextWrappingPolicy
---@field public DefaultWrapping ETextWrappingPolicy [0] No fallback, just use the given line-break iterator
---@field public AllowPerCharacterWrapping ETextWrappingPolicy [1] Fallback to per-character wrapping if a word is too long
ETextWrappingPolicy = {}
