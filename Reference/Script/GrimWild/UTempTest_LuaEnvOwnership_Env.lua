---A second script env whose whole reason to exist is that it can be unregistered mid-run while the
---dev env stays up. Its root is a scratch directory the suite writes into; nothing else in the
---project ever loads from it.
---@class UTempTest_LuaEnvOwnership_Env : UScriptEnv
UTempTest_LuaEnvOwnership_Env = {}

