-- Writes a horizontal gradient into the "HeatConductivity" byte buffer.
-- Values interpolate linearly from GradientStartValue at the leftmost column to GradientEndValue at the
-- rightmost one. Every row of a column receives the same value.

local Common = require("dev.lib.common")
local CellBuffers = require("dev.lib.cellbuffers")

-- PARAMETERS (edit before running)
local StartPointX = 0 -- Left cell of the gradient region (X, in cells)
local StartPointY = 0 -- Top cell of the gradient region (Y, in cells)
local GradientSizeX = 64 -- Width of the gradient region (in cells)
local GradientSizeY = 64 -- Height of the gradient region (in cells)
local GradientStartValue = 0 -- Byte value at the leftmost column [0..255]
local GradientEndValue = 255 -- Byte value at the rightmost column [0..255]

local Playtest = Common.GetPlaytestScene()
local Buffer = Playtest:GetGameLevel():GetCellBuffer_Byte("HeatConductivity")

for Column = 0, GradientSizeX - 1 do
    local Alpha = 0.0
    if GradientSizeX > 1 then
        Alpha = Column / (GradientSizeX - 1)
    end

    local CellValue = math.floor(GradientStartValue + Alpha * (GradientEndValue - GradientStartValue) + 0.5)
    CellValue = math.max(0, math.min(255, CellValue))

    -- One call per column, each covering a single column of the region, because the value changes along
    -- the horizontal axis while staying constant down each column.
    CellBuffers.SetValueInArea_Byte(Buffer, StartPointX + Column, StartPointY, 1, GradientSizeY, CellValue)
end
