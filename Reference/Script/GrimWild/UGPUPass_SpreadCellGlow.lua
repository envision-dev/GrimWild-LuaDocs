---Game-thread wrapper for FSpreadCellGlowCS.
---Standalone pass — clears and writes RT_SpreadCellGlow (rgb = color, a = intensity).
---Created and destroyed by ULightManager::CreateCellGlowSupport() /
---RemoveCellGlowSupport().
---RenderTarget (base) = RT_SpreadCellGlow (single output).
---@class UGPUPass_SpreadCellGlow : UGPUPass
---@field public CellGlowRT UTexture @CellGlow buffer data render target.
---@field public CellRestrictionsRT UTexture @CellRestrictions buffer data render target.
UGPUPass_SpreadCellGlow = {}

