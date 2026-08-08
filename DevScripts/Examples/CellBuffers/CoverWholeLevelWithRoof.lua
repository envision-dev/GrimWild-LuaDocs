-- Sets or clears the roof flag on every cell of the "CellFeatures" byte buffer.

local Common = require("dev.lib.common")
local CellBuffers = require("dev.lib.cellbuffers")

-- PARAMETERS (edit before running)
local PlaceRoof = true -- true = roof the whole level, false = uncover it

local Playtest = Common.GetPlaytestScene()
local Buffer = Playtest:GetGameLevel():GetCellBuffer_Byte("CellFeatures")

local BufferSizeX, BufferSizeY = UCellBufferLib.GetSize(Buffer)

CellBuffers.SetBitValueInArea(Buffer, 0, 0, BufferSizeX, BufferSizeY, ECellFeatures.HasRoof, PlaceRoof)
