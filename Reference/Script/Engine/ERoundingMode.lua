---Provides rounding modes for converting numbers into localized text
---@class ERoundingMode
---@field public HalfToEven ERoundingMode [0] Rounds to the nearest place, equidistant ties go to the value which is closest to an even value: 1.5 becomes 2, 0.5 becomes 0
---@field public HalfFromZero ERoundingMode [1] Rounds to nearest place, equidistant ties go to the value which is further from zero: -0.5 becomes -1.0, 0.5 becomes 1.0
---@field public HalfToZero ERoundingMode [2] Rounds to nearest place, equidistant ties go to the value which is closer to zero: -0.5 becomes 0, 0.5 becomes 0.
---@field public FromZero ERoundingMode [3] Rounds to the value which is further from zero, "larger" in absolute value: 0.1 becomes 1, -0.1 becomes -1
---@field public ToZero ERoundingMode [4] Rounds to the value which is closer to zero, "smaller" in absolute value: 0.1 becomes 0, -0.1 becomes 0
---@field public ToNegativeInfinity ERoundingMode [5] Rounds to the value which is more negative: 0.1 becomes 0, -0.1 becomes -1
---@field public ToPositiveInfinity ERoundingMode [6] Rounds to the value which is more positive: 0.1 becomes 1, -0.1 becomes 0
ERoundingMode = {}
