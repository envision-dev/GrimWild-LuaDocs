---Properties, native entry points and the Lua-to-C++ result channel used by UTempTest_LuaPropertyConversion.
---Deliberately a plain UObject: the suite must create no actors, components or tick sources.
---Every case is offered twice, once as a field and once as a UFUNCTION parameter of the same type, so
---the assignment path and the parameter path can be driven with identical values.
---@class UTempTest_LuaPropertyConversion_Target : UObject
---@field public IntValue integer @---- properties under test ----
---@field public BigIntValue integer
---@field public ByteValue integer
---@field public FloatValue number
---@field public DoubleValue number
---@field public ModernEnumValue ETempTest_LuaPropertyConversion_Modern
---@field public LegacyEnumValue integer
---@field public StringValue string
---@field public NameValue string
---@field public TextValue string
---@field public bBoolValue boolean
---@field public IntArray TArray<integer>
---@field public StringArray TArray<string>
---@field public PendingErrorMessage string @Written by the Lua side just before RecordOutcome, so a refusal carries its message into the record without the record itself having to reach back into Lua.
---@field public CallCount integer @---- proof that a native entry point was reached ----
---@field public LastDefaultedExtra integer @What the defaulted trailing parameter carried into the body. Reported rather than asserted: the value UnLua puts there is its business, not this suite's.
---@field public bLuaCallFailed boolean @---- result channel ----
---@field public LuaErrorMessage string
UTempTest_LuaPropertyConversion_Target = {}

---Resolution channel for the generated Lua module, which has no other way to reach this instance.
---@return UTempTest_LuaPropertyConversion_Target
function UTempTest_LuaPropertyConversion_Target.GetCurrent() end

---Snapshots every property under test into Records, alongside whether the write that preceded it
---raised. Called from Lua, but every value in the snapshot is read in C++ from the C++ field.
---@param bRaised boolean
function UTempTest_LuaPropertyConversion_Target:RecordOutcome(bRaised) end

---Restores every property under test to its baseline, so "unchanged after a refusal" is a statement
---about a real value surviving rather than about an empty field staying empty.
function UTempTest_LuaPropertyConversion_Target:ResetValuesUnderTest() end

---@param InValue integer
function UTempTest_LuaPropertyConversion_Target:SetBigIntValue(InValue) end

---@param bInValue boolean
function UTempTest_LuaPropertyConversion_Target:SetBoolValue(bInValue) end

---@param InValue integer
function UTempTest_LuaPropertyConversion_Target:SetByteValue(InValue) end

---@param InValue number
function UTempTest_LuaPropertyConversion_Target:SetDoubleValue(InValue) end

---@param InValue number
function UTempTest_LuaPropertyConversion_Target:SetFloatValue(InValue) end

---@param InValue TArray<integer>
function UTempTest_LuaPropertyConversion_Target:SetIntArray(InValue) end

------- native entry points, one per property under test ----
---@param InValue integer
function UTempTest_LuaPropertyConversion_Target:SetIntValue(InValue) end

---Trailing parameter carries a default, so a call may legitimately omit it.
---@param InValue integer
---@param InExtra? integer @[default: 5]
function UTempTest_LuaPropertyConversion_Target:SetIntWithDefault(InValue, InExtra) end

---@param InValue integer
function UTempTest_LuaPropertyConversion_Target:SetLegacyEnumValue(InValue) end

---@param InValue ETempTest_LuaPropertyConversion_Modern
function UTempTest_LuaPropertyConversion_Target:SetModernEnumValue(InValue) end

---@param InValue string
function UTempTest_LuaPropertyConversion_Target:SetNameValue(InValue) end

---@param InValue TArray<string>
function UTempTest_LuaPropertyConversion_Target:SetStringArray(InValue) end

---@param InValue string
function UTempTest_LuaPropertyConversion_Target:SetStringValue(InValue) end

---@param InValue string
function UTempTest_LuaPropertyConversion_Target:SetTextValue(InValue) end

