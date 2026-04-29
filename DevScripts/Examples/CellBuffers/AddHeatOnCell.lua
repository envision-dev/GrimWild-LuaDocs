local HeatAmount = 4000.0
local CellIndex = 25908

---@class APlaytestScene
local Playtest = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene.StaticClass())
local Buffer = Playtest:GetGameLevel():GetCellBuffer_Float("Heat")

UCellBufferLib.AddValue_Float(Buffer, CellIndex, HeatAmount)