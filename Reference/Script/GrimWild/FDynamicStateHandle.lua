---@meta
---A reference to a FDynamicState for Blueprint and Lua.
---A handle does not keep the state alive. A stored handle
---can outlive the state it points at, and reports itself dead once that happens. Check using UDynamicStateLib.IsHandleAlive(Handle)
---@class FDynamicStateHandle : Struct
FDynamicStateHandle = {}
