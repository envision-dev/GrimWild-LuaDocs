---Defines a curve of interpolated points to evaluate over a given range
---@class UCurveBase : UObject
---@field public AssetImportData UAssetImportData
UCurveBase = {}

---Get the time range across all curves
---@return number MinTime
---@return number MaxTime
function UCurveBase:GetTimeRange() end

---Get the value range across all curves
---@return number MinValue
---@return number MaxValue
function UCurveBase:GetValueRange() end

