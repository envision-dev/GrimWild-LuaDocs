-- Copies the border mask texture from the Grass surface material onto the Soil

local GrassId = "Grass"
local SoilId = "Soil"

--Hardcoded
local SurfaceMaskParam = "SurfaceMask"

---@class APlaytestScene
local Playtest = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene.StaticClass())

-- Surfaces don't store their MID; it lives on the plane's material slot 0.
local GrassMID = Playtest.Surfaces:Find(GrassId).PlaneComponent:GetMaterial(0)
local SoilMID = Playtest.Surfaces:Find(SoilId).PlaneComponent:GetMaterial(0)

local SurfaceMask = GrassMID:K2_GetTextureParameterValue(SurfaceMaskParam)
SoilMID:SetTextureParameterValue(SurfaceMaskParam, SurfaceMask)