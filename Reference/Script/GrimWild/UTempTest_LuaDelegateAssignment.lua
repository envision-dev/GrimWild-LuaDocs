---@meta
---Covers the refusal of delegate assignment from Lua added to FDelegatePropertyDesc::CheckWritable and
---TMulticastDelegatePropertyDesc::CheckWritable, and - the part that matters more - the two paths that
---refusal was not allowed to touch: subscribing through :Bind/:Unbind/:Add/:Remove/:RemoveAll, and
---passing a Lua function into a single-cast delegate UFUNCTION parameter.
---Assertions on the refusal text are made on substrings only ("delegates are not assignable",
---"use :Bind(fn)", "use :Add(fn)"), never on the whole sentence, because the wrapper around it is
---assembled by CheckLuaWriteAllowed and is free to change without this suite being wrong.
---@class UTempTest_LuaDelegateAssignment : UTestSuiteBase
---@field private Fixture UTempTest_LuaDelegateAssignment_Fixture
UTempTest_LuaDelegateAssignment = {}

---@param WorldContext UObject
function UTempTest_LuaDelegateAssignment:Start(WorldContext) end

