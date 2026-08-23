---@meta
---One position in the enabled mod list. Missing placeholders (ResolvedMod == nullptr) are first-class
---members: they occupy an order position, are shown by the UI, and survive apply/persist round trips.
---@class FEnabledModEntry : Struct
---@field public Reference FModReference
---@field public ResolvedMod UMod @Null when the referenced mod is not installed (missing placeholder).
FEnabledModEntry = {}
