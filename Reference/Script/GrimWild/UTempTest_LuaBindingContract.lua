---@meta
---The contract the Lua binding layer is expected to honour, written before three of its defects are
---fixed so that the same suite describes the before and the after.
---R01 to R33 cover behaviour that already works and must stay working. D01 to D13 describe the intended
---behaviour of the three defects and are expected to fail until those are fixed:
---- a write of a non-object into an object property validates one value and stores another, so any
---full userdata lands in the field as a raw pointer and numbers and strings clear it silently;
---- a failed read of a property through a type name leaves the resolved field cached on the class
---table, so every later read is answered from the cache and hands script an internal descriptor;
---- once that cache entry exists, a write through the type name never reaches __newindex and replaces
---the property for every instance of the class.
---Five of the D tests write an address that is not a UObject into an object property. They run by
---default because that write is refused before anything is stored, and stay behind a Start parameter so
---that a change which reintroduces the stored address can be shut out without deleting them. Disabled
---means SKIPPED with a reason, never absent: a test nobody can see is a test nobody remembers to enable.
---Needs a PIE or Standalone session whose GameInstance owns a ULuaSubsystem with a live environment.
---@class UTempTest_LuaBindingContract : UTestSuiteBase
---@field private Fixture UTempTest_LuaBindingContract_Fixture
---@field private Companion UTempTest_LuaBindingContract_Other @Held by the suite rather than only by the fixture, so the object every acceptable-write test assigns from survives the fixture's own object properties being emptied between tests.
UTempTest_LuaBindingContract = {}

---@param WorldContext UObject
---@param bInIncludePointerWritingTests? boolean @[default: true]
function UTempTest_LuaBindingContract:Start(WorldContext, bInIncludePointerWritingTests) end

