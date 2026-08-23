---@meta
---Establishes what a Lua subscription to a sparse multicast delegate does, both on a delegate this
---suite declares and on AActor::OnDestroyed, which the engine declares. Reports rather than presumes
---- which metatable the userdata carries, which Add call shape is accepted, which handler class ends
---up in the invocation list, whether dispatch reaches Lua, whether a subscription on one actor
---touches another of the same class, and whether a binding outlives the module that made it. An
---inline delegate with an identical signature runs alongside as a control, so a failure on the
---sparse side cannot be blamed on the harness. Closes with the three script-driven listener removals,
---which share their code path with the inline case and are checked here only for parity.
---@class UTempTest_LuaSparseDelegate : UTestSuiteBase
---@field private Fixture UTempTest_LuaSparseDelegate_Fixture
UTempTest_LuaSparseDelegate = {}

---@param WorldContext UObject
function UTempTest_LuaSparseDelegate:Start(WorldContext) end

