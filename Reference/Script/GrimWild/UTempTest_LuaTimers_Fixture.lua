---Channel between the Lua under test and the suite.
---One ordered list of tags rather than a counter per case: half of what this suite asserts is the order
---two things happened in, and a set of counters could not answer that. Reporting through a call rather
---than through a table read back out of the Lua state keeps the frame and the timestamp of every entry
---on the C++ side, where the assertions are.
---@class UTempTest_LuaTimers_Fixture : UObject
UTempTest_LuaTimers_Fixture = {}

---@return UTempTest_LuaTimers_Fixture
function UTempTest_LuaTimers_Fixture.GetCurrent() end

---Hands out a tag unique to one load of a module and remembers it in LastInstanceTag, so the suite
---knows which id the generation it has just loaded records under. Built here rather than in script
---so no number-to-string formatting sits between what Lua writes and what C++ compares.
---@return string
function UTempTest_LuaTimers_Fixture:NextInstanceTag() end

---Appends Tag, stamped with the current frame and the current script clock reading.
---@param Tag string
function UTempTest_LuaTimers_Fixture:Record(Tag) end

