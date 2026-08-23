---@meta
---Exists to answer one question by experiment: whether a struct userdata handed to Lua from a
---UPROPERTY still resolves to readable memory after its owner has been collected, and whether that
---memory can be re-occupied by a later object. Everything here is deliberately observable from Lua
---so the whole sequence can be driven from a script and reported on.
---@class UDanglingStructProbe : UObject
---@field public VectorValue FVector
UDanglingStructProbe = {}

function UDanglingStructProbe.Cleanup() end

---@return UDanglingStructProbe
function UDanglingStructProbe.Create() end

---Drops the only strong reference and runs a full blocking purge. Answers whether the object
---actually died, which is the precondition for anything else here meaning something.
---@return boolean
function UDanglingStructProbe.ReleaseAndPurge() end

---Allocates same-class objects until one lands on the exact address the dead object's struct
---occupied. Same class means same offset, so base equality is enough.
---@param MaxAttempts integer
---@return boolean
function UDanglingStructProbe.ReoccupyAddress(MaxAttempts) end

---@return string
function UDanglingStructProbe.Report() end

