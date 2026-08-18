-- Area writes over cell buffers.

local This = {}

--- Reads the buffer size and reports a dead handle.
---@return number|nil, number|nil
local function GetValidatedSize(Buffer, CallerName)
    local BufferSizeX, BufferSizeY = UCellBufferLib.GetSize(Buffer)

    -- A released handle leaves both outputs untouched, so a zero size is how a dead buffer surfaces here.
    if BufferSizeX <= 0 or BufferSizeY <= 0 then
        LogError(CallerName .. ": the buffer is not alive")
        return nil, nil
    end

    return BufferSizeX, BufferSizeY
end

--- Rejects an area that does not fit the buffer.
--- Clamping was considered and rejected: silently shrinking the region would let a script with wrong
--- coordinates appear to work while writing somewhere else entirely.
---@return number|nil Buffer width, needed for index math, or nil when the area was rejected.
local function ValidateArea(Buffer, StartX, StartY, SizeX, SizeY, CallerName)
    local BufferSizeX, BufferSizeY = GetValidatedSize(Buffer, CallerName)
    if not BufferSizeX then
        return nil
    end

    if SizeX <= 0 or SizeY <= 0 then
        LogError(CallerName .. ": area size must be positive, got " .. SizeX .. "x" .. SizeY)
        return nil
    end

    if StartX < 0 or StartY < 0 then
        LogError(CallerName .. ": area start must not be negative, got (" .. StartX .. ", " .. StartY .. ")")
        return nil
    end

    if StartX + SizeX > BufferSizeX or StartY + SizeY > BufferSizeY then
        LogError(CallerName .. ": area (" .. StartX .. ", " .. StartY .. ") sized " .. SizeX .. "x" .. SizeY
            .. " does not fit a buffer of " .. BufferSizeX .. "x" .. BufferSizeY)
        return nil
    end

    return BufferSizeX
end

--- Walks the area and hands each flat cell index to Setter.
local function ForEachCellInArea(BufferSizeX, StartX, StartY, SizeX, SizeY, Setter)
    for Row = 0, SizeY - 1 do
        local RowOffset = (StartY + Row) * BufferSizeX
        for Column = 0, SizeX - 1 do
            Setter(StartX + Column + RowOffset)
        end
    end
end

--- Converts 2D cell coordinates into the flat index the buffer API expects.
---@param Buffer FCellBufferHandle
---@param X number Cell column
---@param Y number Cell row
---@return number|nil Nil when the buffer is dead or the coordinates fall outside it.
function This.GetCellIndex(Buffer, X, Y)
    local BufferSizeX, BufferSizeY = GetValidatedSize(Buffer, "GetCellIndex")
    if not BufferSizeX then
        return nil
    end

    if X < 0 or Y < 0 or X >= BufferSizeX or Y >= BufferSizeY then
        LogError("GetCellIndex: cell (" .. X .. ", " .. Y .. ") is outside a buffer of "
            .. BufferSizeX .. "x" .. BufferSizeY)
        return nil
    end

    return X + Y * BufferSizeX
end

--- Sets or clears one flag bit across a rectangular area of a byte buffer.
---@param Buffer FCellBufferHandle
---@param StartX number Left cell of the target area
---@param StartY number Top cell of the target area
---@param SizeX number Width of the target area, in cells
---@param SizeY number Height of the target area, in cells
---@param BitEnumValue number An enum value such as ECellFeatures.HasRoof, not a bit index. The
--- underlying C++ SetBitValue takes an index; the conversion happens here so that scripts can name the
--- flag they mean instead of restating its position.
---@param NewValue boolean
---@return boolean True when the whole area was written.
function This.SetBitValueInArea(Buffer, StartX, StartY, SizeX, SizeY, BitEnumValue, NewValue)
    local BufferSizeX = ValidateArea(Buffer, StartX, StartY, SizeX, SizeY, "SetBitValueInArea")
    if not BufferSizeX then
        return false
    end

    if not UCellBufferLib.IsBitBuffer(Buffer) then
        LogError("SetBitValueInArea: the buffer does not hold bit flags")
        return false
    end

    -- Checked once up front rather than per cell: the underlying SetBitValue refuses and logs an error
    -- on every single call while deferred writes are active, which on a full level means hundreds of
    -- thousands of log lines and no change at all.
    if UCellBufferLib.ShouldWriteChangesToDeferredBuffers(Buffer) then
        LogError("SetBitValueInArea: the buffer is mid-sync and cannot take bit writes right now")
        return false
    end

    local BitIndex, bResolved = UEnvisionBitLib.GetBitIndexFromEnumValue(BitEnumValue)
    if not bResolved then
        LogError("SetBitValueInArea: " .. BitEnumValue .. " is not a single flag bit")
        return false
    end

    UCellBufferLib.MarkAsHardUploadAwaiting(Buffer)

    ForEachCellInArea(BufferSizeX, StartX, StartY, SizeX, SizeY, function(CellIndex)
        UCellBufferLib.SetBitValue(Buffer, CellIndex, BitIndex, NewValue)
    end)

    return true
end

--- Shared body of the typed area writers.
local function SetValueInArea(Buffer, StartX, StartY, SizeX, SizeY, Setter, CallerName)
    local BufferSizeX = ValidateArea(Buffer, StartX, StartY, SizeX, SizeY, CallerName)
    if not BufferSizeX then
        return false
    end

    UCellBufferLib.MarkAsHardUploadAwaiting(Buffer)
    ForEachCellInArea(BufferSizeX, StartX, StartY, SizeX, SizeY, Setter)
    return true
end

--- Writes one byte value across a rectangular area.
---@return boolean True when the whole area was written.
function This.SetValueInArea_Byte(Buffer, StartX, StartY, SizeX, SizeY, NewValue)
    return SetValueInArea(Buffer, StartX, StartY, SizeX, SizeY, function(CellIndex)
        UCellBufferLib.SetValue_Byte(Buffer, CellIndex, NewValue)
    end, "SetValueInArea_Byte")
end

--- Writes one float value across a rectangular area.
---@return boolean True when the whole area was written.
function This.SetValueInArea_Float(Buffer, StartX, StartY, SizeX, SizeY, NewValue)
    return SetValueInArea(Buffer, StartX, StartY, SizeX, SizeY, function(CellIndex)
        UCellBufferLib.SetValue_Float(Buffer, CellIndex, NewValue)
    end, "SetValueInArea_Float")
end

--- Writes one color value across a rectangular area.
---@return boolean True when the whole area was written.
function This.SetValueInArea_Color(Buffer, StartX, StartY, SizeX, SizeY, NewValue)
    return SetValueInArea(Buffer, StartX, StartY, SizeX, SizeY, function(CellIndex)
        UCellBufferLib.SetValue_Color(Buffer, CellIndex, NewValue)
    end, "SetValueInArea_Color")
end

return This
