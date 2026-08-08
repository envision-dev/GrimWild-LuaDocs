-- Copies the border mask texture from the Grass surface material onto the Soil.

local Common = require("dev.lib.common")

-- PARAMETERS (edit before running)
local GrassId = "Grass"
local SoilId = "Soil"

local SurfaceMaskParam = "SurfaceMask"

local Playtest = Common.GetPlaytestScene()

-- Surfaces don't store their MID; it lives on the plane's material slot 0.
local GrassMID = Playtest.Surfaces:Find(GrassId).PlaneComponent:GetMaterial(0)
local SoilMID = Playtest.Surfaces:Find(SoilId).PlaneComponent:GetMaterial(0)

local SurfaceMask = GrassMID:K2_GetTextureParameterValue(SurfaceMaskParam)
SoilMID:SetTextureParameterValue(SurfaceMaskParam, SurfaceMask)
