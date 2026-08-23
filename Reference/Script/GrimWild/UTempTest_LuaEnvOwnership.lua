---@meta
---Fixes what unregistering a script env takes with it.
---The decision this suite encodes is the same one TempTest_LuaCallbackOwnership encodes at module
---level, applied to envs: a listener belongs to where its callback was written, so unregistering an
---env removes the listeners whose callbacks its own scripts define and nothing else. A callback with
---no module generation at all (a one-shot script, the console) belongs to the env it was written in
---and is removed with it.
---@class UTempTest_LuaEnvOwnership : UTestSuiteBase
---@field private Fixture UTempTest_LuaEnvOwnership_Fixture
---@field private ModEnv UTempTest_LuaEnvOwnership_Env
UTempTest_LuaEnvOwnership = {}

---@param WorldContext UObject
function UTempTest_LuaEnvOwnership:Start(WorldContext) end

