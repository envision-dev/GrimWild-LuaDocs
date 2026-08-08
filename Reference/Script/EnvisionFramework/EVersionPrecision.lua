---@class EVersionPrecision
---@field public Major EVersionPrecision [0] How many components are actually defined. Comparisons only look at components up to the shallower of the two operands, so a target "0.15" matches any 0.15.x.
---@field public Minor EVersionPrecision [1]
---@field public Patch EVersionPrecision [2]
---@field public ReleaseState EVersionPrecision [3]
---@field public ReleaseNumber EVersionPrecision [4]
---@field public Build EVersionPrecision [5]
EVersionPrecision = {}
