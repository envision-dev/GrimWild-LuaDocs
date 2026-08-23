---@meta
---Pins the behaviour of the script-facing timer surface: SetTimer, Routine and Wait, the handle they
---hand back, what they refuse, which frame they fire on, and who owns an entry once it exists.
---The decision the last group encodes is the counterintuitive one: an entry belongs to the module that
---defines the callback, never to the module that called SetTimer or Routine with it. A library function
---scheduled by a consumer therefore outlives the consumer and dies with the library.
---@class UTempTest_LuaTimers : UTestSuiteBase
---@field private Fixture UTempTest_LuaTimers_Fixture
UTempTest_LuaTimers = {}

---@param WorldContext UObject
function UTempTest_LuaTimers:Start(WorldContext) end

