---@meta
---Thread-safe random number generator that can be manually seeded.
---@class FRandomStream : Struct
---@field public InitialSeed integer @Holds the initial seed.
---@field public Seed integer @Holds the current seed.
FRandomStream = {}
