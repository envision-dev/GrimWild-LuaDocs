---@class EModIssueType
---@field public MissingDependency EModIssueType [0]
---@field public CircularDependency EModIssueType [1] Error
---@field public DuplicateIdEnabled EModIssueType [2] Error
---@field public VersionUnsatisfied EModIssueType [3] Error
---@field public GameVersionUnsatisfied EModIssueType [4] Error: a dependency is enabled but outside the declared min/max range
---@field public DependencyOrderViolation EModIssueType [5] Error: mod's min/maxGameVersion excludes the current game version
---@field public MissingIncludedMod EModIssueType [6] Error: dependency is enabled but listed after its dependent
---@field public UnknownVersion EModIssueType [7] Warning: a modpack member is not installed or not enabled
EModIssueType = {}
