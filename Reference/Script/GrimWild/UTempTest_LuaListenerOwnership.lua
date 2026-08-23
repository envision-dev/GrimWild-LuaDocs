---@meta
---Fixes which module a delegate listener belongs to when the callback and the Add() call come from
---different modules.
---The decision this suite encodes: the listener belongs to the module whose code called Add, not to
---the module the callback was written in. Every assertion below follows from that one sentence, so
---changing the decision means rewriting the expectations rather than tuning them.
---@class UTempTest_LuaListenerOwnership : UTestSuiteBase
---@field private Fixture UTempTest_LuaListenerOwnership_Fixture
---@field private ThrowawayEnv UTempTest_LuaListenerOwnership_Env
UTempTest_LuaListenerOwnership = {}

---@param WorldContext UObject
function UTempTest_LuaListenerOwnership:Start(WorldContext) end

