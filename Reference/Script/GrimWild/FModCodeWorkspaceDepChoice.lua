---@meta
---One ambiguous dependency: several installed copies match the same id, so the player picks one.
---@class FModCodeWorkspaceDepChoice : Struct
---@field public ModId string
---@field public CandidatePaths TArray<string>
---@field public PreselectedIndex integer
FModCodeWorkspaceDepChoice = {}
