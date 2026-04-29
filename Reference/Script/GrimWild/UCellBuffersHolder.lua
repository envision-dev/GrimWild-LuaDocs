---@class UCellBuffersHolder : UInterface
UCellBuffersHolder = {}

---May return an invalid handle. Always check Handle.IsAlive() before use.
---@param BufferName string
---@return FCellBufferHandle
function UCellBuffersHolder:GetCellBuffer_Byte(BufferName) end

---@param BufferName string
---@return FCellBufferHandle
function UCellBuffersHolder:GetCellBuffer_Color(BufferName) end

---@param BufferName string
---@return FCellBufferHandle
function UCellBuffersHolder:GetCellBuffer_Float(BufferName) end

---@param ValueType ECellBufferValueType
---@return TArray<string>
function UCellBuffersHolder:GetCellBufferList(ValueType) end

---@return TArray<string>
function UCellBuffersHolder:GetCellBufferList_Byte() end

---@return TArray<string>
function UCellBuffersHolder:GetCellBufferList_Color() end

---@return TArray<string>
function UCellBuffersHolder:GetCellBufferList_Float() end

