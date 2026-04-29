---Represents an isolated grid of cells.
---Usage: Levels and Planets
---@class UGameLevel : UWorldObject
---@field protected LightManager ULightManager
UGameLevel = {}

---@param Features integer
---@return string
function UGameLevel.CellFeaturesToString(Features) end

---@param Restrictions integer
---@return string
function UGameLevel.CellRestrictionsToString(Restrictions) end

---@return ULightManager
function UGameLevel:GetLightManager() end

---@param OutSizeX integer @[out]
---@param OutSizeY integer @[out]
function UGameLevel:GetSize(OutSizeX, OutSizeY) end

---@param SizeX integer
---@param SizeY integer
function UGameLevel:Init(SizeX, SizeY) end

---Used to get all neighbor states for tiles.
---@param BufferName string
---@param CellIndex integer
---@param BitIndex integer
---@param bDefaultState boolean
---@return integer
function UGameLevel:Test_GetTileNeighborMask(BufferName, CellIndex, BitIndex, bDefaultState) end

---@return TArray<string>
function UGameLevel:GetCellBufferList_Float() end

---@return TArray<string>
function UGameLevel:GetCellBufferList_Color() end

---@return TArray<string>
function UGameLevel:GetCellBufferList_Byte() end

---@param ValueType ECellBufferValueType
---@return TArray<string>
function UGameLevel:GetCellBufferList(ValueType) end

---@param BufferName string
---@return FCellBufferHandle
function UGameLevel:GetCellBuffer_Float(BufferName) end

---@param BufferName string
---@return FCellBufferHandle
function UGameLevel:GetCellBuffer_Color(BufferName) end

---May return an invalid handle. Always check Handle.IsAlive() before use.
---@param BufferName string
---@return FCellBufferHandle
function UGameLevel:GetCellBuffer_Byte(BufferName) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UGameLevel:GatherDebugData(DebugString) end

