---@meta
---Pins who owns a delegate listener and what the upvalue sweep at module teardown reaches.
---The decision this suite encodes: a listener belongs to the module that defines the callback
---function, and nothing about the call site changes that. On top of that, a module's teardown also
---removes any listener whose callback holds that module's table as a direct upvalue, so a closure
---built for a module cannot go on firing against state that is gone. Changing either decision means
---rewriting the expectations rather than tuning them.
---The accumulation E08 pins is a known and accepted consequence, not a defect the suite forgot about.
---@class UTempTest_LuaCallbackOwnership : UTestSuiteBase
---@field private Fixture UTempTest_LuaCallbackOwnership_Fixture
UTempTest_LuaCallbackOwnership = {}

---@param WorldContext UObject
function UTempTest_LuaCallbackOwnership:Start(WorldContext) end

