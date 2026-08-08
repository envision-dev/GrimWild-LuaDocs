-- Adds heat to a single cell of the "Heat" float buffer.

local Common = require("dev.lib.common")
local CellBuffers = require("dev.lib.cellbuffers")

-- PARAMETERS (edit before running)
local HeatAmount = 4000.0
local CellX = 256
local CellY = 256

local Playtest = Common.GetPlaytestScene()
local Buffer = Playtest:GetGameLevel():GetCellBuffer_Float("Heat")

local CellIndex = CellBuffers.GetCellIndex(Buffer, CellX, CellY)

UCellBufferLib.AddValue_Float(Buffer, CellIndex, HeatAmount)
