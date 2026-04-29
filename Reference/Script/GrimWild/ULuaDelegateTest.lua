---Automated test class for the Lua delegate API (multicast and single-cast).
---Usage: create an instance and call Start(). Tests run sequentially via a timer-chained
---delegate. Generated Lua scripts live in Content/Lua/DevScripts/AutoTests_Delegates/
---and are deleted by Cleanup() after all tests finish.
---Test-only UGameWorld delegates added for this suite:
---  UGameWorld::OnTestIntEvent  (FOnTestIntEvent, int32 Value)
---These are marked TEST-ONLY in GameWorld.h and must be removed when this test class is removed.
---@class ULuaDelegateTest : UObject
---@field private LuaSubsystem ULuaSubsystem @--------------- resolved references ---------------
---@field private DevOwner UDevScriptOwner
---@field private GameWorld UGameWorld
---@field private PlayerController ALIVECODING_GPlayerController_0
ULuaDelegateTest = {}

---@return ULuaDelegateTest
function ULuaDelegateTest.GetActiveTest() end

function ULuaDelegateTest:IncrementCounter() end

---@param Stringified string
function ULuaDelegateTest:RecordArg(Stringified) end

---Called from Lua test scripts via the __LuaDelegateTest global.
---@param Tag string
function ULuaDelegateTest:RecordMarker(Tag) end

function ULuaDelegateTest:Start() end

