---@meta
---Render Component is used to draw one sprite on the scene.
---@class URenderComponent : UObjectComponent
URenderComponent = {}

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function URenderComponent:GatherDebugData() end

