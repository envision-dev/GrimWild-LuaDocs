-- Written by Claude, approved by teedeezet.

-- Sets or clears the roof bit on every cell in the "Features" buffer,
-- effectively covering or uncovering the entire level with roofs.

-- ── Inputs ────────────────────────────────────────────────────────────────────
RoofBitIndex = 5     -- Bit index of the roof flag inside the Features byte [0..7], corresponds to ECellFeatures.HasRoof
PlaceRoof    = true  -- true = set roof on all cells, false = clear roof on all cells
-- ─────────────────────────────────────────────────────────────────────────────

---@class APlaytestScene
local Playtest = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene.StaticClass())

local Buffer = Playtest:GetGameLevel():GetCellBuffer_Byte("CellFeatures")
local SizeX, SizeY = UCellBufferLib.GetSize(Buffer)
local totalCells = SizeX * SizeY

UCellBufferLib.MarkAsHardUploadAwaiting(Buffer)

for cellIndex = 0, totalCells - 1 do
    UCellBufferLib.SetBitValue(Buffer, cellIndex, RoofBitIndex, PlaceRoof)
end