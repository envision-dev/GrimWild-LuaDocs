---Channel between the generated Lua modules and the suite. One counter per subscribed callback,
---because "which listener survived" is the only question this suite asks and a shared counter could
---not answer it.
---@class UTempTest_LuaEnvOwnership_Fixture : UObject
---@field public OnEvent MulticastDelegate|fun(Value: integer)
---@field public OwnCallCount integer @A function the mod env's module defines and subscribes itself. The control case.
---@field public LibCallCount integer @A function the dev env's library defines, subscribed by the mod env's module.
---@field public CrossCallCount integer @A function the mod env's module defines, subscribed by the dev env's module.
---@field public ModOneShotCallCount integer @An inline closure a one-shot script in the mod env subscribed, so it belongs to no module generation and only env-scoped cleanup can reach it.
---@field public DevOneShotCallCount integer @The same shape in the dev env, so "the env teardown removed everything" cannot pass.
---@field public NativeCallCount integer
---@field public bLuaCallFailed boolean
---@field public LuaErrorMessage string
UTempTest_LuaEnvOwnership_Fixture = {}

---@return UTempTest_LuaEnvOwnership_Fixture
function UTempTest_LuaEnvOwnership_Fixture.GetCurrent() end

---Subscribed natively so every test has a listener no Lua-side cleanup may ever touch. A test
---that ends with this one missing has found cleanup reaching past the Lua layer.
---@param Value integer
function UTempTest_LuaEnvOwnership_Fixture:NativeHandler(Value) end

