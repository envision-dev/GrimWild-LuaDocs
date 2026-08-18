-- Sets or clears the roof flag over a rectangular area of the "CellFeatures" byte buffer.

local Common = require("dev.lib.common")
local CellBuffers = require("dev.lib.cellbuffers")

-- PARAMETERS (edit before running)
local StartX = 0 -- Left cell of the target area (X, in cells)
local StartY = 0 -- Top cell of the target area (Y, in cells)
local AreaSizeX = 32 -- Width of the target area (in cells)
local AreaSizeY = 32 -- Height of the target area (in cells)
local PlaceRoof = true -- true = set the roof flag, false = clear it

local Playtest = Common.GetPlaytestScene()
local Buffer = Playtest:GetGameLevel():GetCellBuffer_Byte("CellFeatures")

CellBuffers.SetBitValueInArea(Buffer, StartX, StartY, AreaSizeX, AreaSizeY, ECellFeatures.HasRoof, PlaceRoof)
