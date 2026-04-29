-- Written by Claude, approved by teedeezet.

-- Covers a rectangular area of cells with roof flags by setting or clearing
-- the roof bit inside the "Features" byte buffer.
-- The affected region starts at (StartX, StartY) and spans (AreaSizeX x AreaSizeY) cells.

-- ── Inputs ────────────────────────────────────────────────────────────────────
StartX = 0 -- Left cell of the target area (X, in cells)
StartY = 0 -- Top cell of the target area (Y, in cells)
AreaSizeX = 32 -- Width of the target area (in cells)
AreaSizeY = 32 -- Height of the target area (in cells)
RoofBitIndex = 5 -- Bit index of the roof flag inside the Features byte [0..7], corresponds to ECellFeatures.HasRoof
PlaceRoof = true -- true = set roof bit, false = clear roof bit
-- ─────────────────────────────────────────────────────────────────────────────

---@class APlaytestScene
local Playtest = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene.StaticClass())
local Buffer = Playtest:GetGameLevel():GetCellBuffer_Byte("CellFeatures")

-- Retrieve buffer width to convert 2D coordinates into flat cell indices
local BufferSizeX, BufferSizeY = UCellBufferLib.GetSize(Buffer)

-- Bulk bit writes: request a full buffer sync on the next upload
-- instead of building a dirty chunk per cell
UCellBufferLib.MarkAsHardUploadAwaiting(Buffer)
for row = 0, AreaSizeY - 1 do
    local absY = StartY + row
    for col = 0, AreaSizeX - 1 do
        local absX = StartX + col
        local cellIndex = absX + absY * BufferSizeX
        UCellBufferLib.SetBitValue(Buffer, cellIndex, RoofBitIndex, PlaceRoof)
    end
end