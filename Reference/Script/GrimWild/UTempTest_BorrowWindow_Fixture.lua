---@meta
---@class UTempTest_BorrowWindow_Fixture : UObject
---@field public OnPayload MulticastDelegate|fun(Payload: TArray<integer>)
---@field public OwnedArray TArray<integer>
UTempTest_BorrowWindow_Fixture = {}

---Rooted on creation. The fixture is reachable only from a Lua local, and a collection in the
---middle of a probe would produce symptoms indistinguishable from the bug under investigation.
---@return UTempTest_BorrowWindow_Fixture
function UTempTest_BorrowWindow_Fixture.Create() end

---Returned as a string so Lua never has to format a pointer, and so the value is stable across
---integer-width differences between the two sides.
---@param Arr TArray<integer>
---@return string
function UTempTest_BorrowWindow_Fixture.DataAddressString(Arr) end

---Reserves exactly Count so that the first Add from Lua is guaranteed to reallocate.
---@param Count integer
function UTempTest_BorrowWindow_Fixture:FillOwned(Count) end

---@param InArr TArray<integer>
function UTempTest_BorrowWindow_Fixture:ProbeConstRef(InArr) end

---@param InOut TArray<integer> @[out, modified in place]
function UTempTest_BorrowWindow_Fixture:ProbeMutableRef(InOut) end

---Lua takes no part in this one: the callee grows the container through B while A refers to the
---same block, which is the failure mode no Lua-side mark can ever observe.
---@param A TArray<integer>
---@param B TArray<integer> @[out, modified in place]
function UTempTest_BorrowWindow_Fixture:ProbeTwoParams(A, B) end

function UTempTest_BorrowWindow_Fixture:Release() end

