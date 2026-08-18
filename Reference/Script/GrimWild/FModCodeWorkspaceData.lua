---The full content of a mod's .code-workspace file, split into the entries this system generates and
---whatever the mod author added by hand. Everything foreign is round-tripped verbatim.
---@class FModCodeWorkspaceData
---@field public Entries TArray<FModCodeWorkspaceEntry> @Generated entries, in write order. The mod's own Scripts folder is always the first one.
---@field public PreviousGeneratedPaths TArray<string> @Comparable paths of the generated "folders" entries of the file that was read, used both to tell our own library paths from foreign ones and to preselect an ambiguous dependency's old choice.
FModCodeWorkspaceData = {}
