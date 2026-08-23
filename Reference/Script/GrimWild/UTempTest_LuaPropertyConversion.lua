---@meta
---First execution of the unified value conversion in PropertyDesc.cpp: one predicate per property type,
---shared by the field assignment path through CheckWritable and by the argument path through
---CheckPropertyType, and one set of conversion helpers shared by every write that gets past it.
---The regression behind it: the two paths disagreed about which Lua values a property would accept, so
---a value refused as an argument could still be assigned to the same field, and the same value could
---land differently depending on which route it took. T06 is therefore the centre of the suite: every
---other test states what one path does, and T06 states that the two do the same thing.
---Needs a PIE or Standalone session with a GameInstance owning ULuaSubsystem.
---@class UTempTest_LuaPropertyConversion : UTestSuiteBase
---@field private Target UTempTest_LuaPropertyConversion_Target
UTempTest_LuaPropertyConversion = {}

---@param WorldContext UObject
function UTempTest_LuaPropertyConversion:Start(WorldContext) end

