---@meta
---Base class for all object components. Components are WorldObjects attached to a parent WorldObject.
---@class UObjectComponent : UWorldObject
UObjectComponent = {}

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function UObjectComponent:GatherDebugData() end

