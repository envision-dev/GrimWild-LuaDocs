-- Written by Claude, approved by teedeezet.

-- Writes a horizontal heat conductivity gradient into the "HeatConductivity" byte cell buffer.
-- The gradient spans GradientSize cells starting at StartPoint.
-- Values interpolate linearly from GradientStartValue (left column) to GradientEndValue (right column).
-- Every row in the gradient region receives the same column value (purely horizontal gradient).
-- After writing, the buffer is marked dirty and an upload to GPU is requested.

-- ── Inputs ────────────────────────────────────────────────────────────────────
StartPointX = 0 -- Left cell of the gradient region (X, in cells)
StartPointY = 0 -- Top cell of the gradient region (Y, in cells)
GradientSizeX = 64 -- Width of the gradient region (in cells)
GradientSizeY = 64 -- Height of the gradient region (in cells)
GradientStartValue = 0 -- Byte value at the leftmost column  [0..255]
GradientEndValue = 255 -- Byte value at the rightmost column [0..255]
-- ─────────────────────────────────────────────────────────────────────────────

---@class APlaytestScene
local Playtest = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene.StaticClass())

local Buffer = Playtest:GetGameLevel():GetCellBuffer_Byte("HeatConductivity")

-- Retrieve the buffer size so we can compute flat cell indices
local BufferSizeX, BufferSizeY = UCellBufferLib.GetSize(Buffer)

-- Bulk writes benefit from a hard upload: the whole buffer is synced at once
-- instead of building individual dirty chunks for every SetValue call
UCellBufferLib.MarkAsHardUploadAwaiting(Buffer)

for col = 0, GradientSizeX - 1 do

    -- Normalized position along the horizontal axis [0 .. 1]
    local t = 0.0

    if GradientSizeX > 1 then
        t = col / (GradientSizeX - 1)
    end

    -- Linear interpolation between start and end byte values
    local cellValue = math.floor(GradientStartValue + t * (GradientEndValue - GradientStartValue) + 0.5)

    -- Clamp to valid byte range just in case the caller supplied out-of-range inputs
    if cellValue < 0   then cellValue = 0   end
    if cellValue > 255 then cellValue = 255 end
    
    local absX = StartPointX + col

    for row = 0, GradientSizeY - 1 do
        local absY = StartPointY + row
        -- Convert 2D cell coordinates to the flat 1D index the buffer API expects
        local cellIndex = absX + absY * BufferSizeX
        UCellBufferLib.SetValue_Byte(Buffer, cellIndex, cellValue)
    end
end