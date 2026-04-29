---Structured world time.
---Values must be set in acceptable ranges.
---@class FStructuredWorldTime
---@field public Year integer @(0..inf)
---@field public Season integer @(0..EWorldSeasons::NUM-1)
---@field public Day integer @(0..DAYS_IN_SEASON-1)
---@field public Hour integer @(0..HOURS_IN_DAY-1)
---@field public Minute integer @(0..MINUTES_IN_HOUR-1)
FStructuredWorldTime = {}
