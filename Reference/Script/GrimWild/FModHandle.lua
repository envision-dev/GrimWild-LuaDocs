---The menu/discovery-zone way to point at a mod: rescans replace UMod instances, and the enabled list
---may reference mods that are not installed at all, so a raw UMod* is not safe to hold across a UI frame.
---Gameplay code running against the stable LoadedMods set should keep using raw UMod* instead; a handle
---costs a linear registry lookup on every re-resolve. Reference is the only part of this struct that is
---persistable.
---@class FModHandle
---@field public Reference FModReference
FModHandle = {}
