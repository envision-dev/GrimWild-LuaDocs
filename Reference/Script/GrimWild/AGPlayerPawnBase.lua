---Lua side (bind custom lua code to it)
---@class AGPlayerPawnBase : APawn
---@field public OnLeftMouseAction MulticastDelegate|fun(Event: integer) @Note: handles Game input, not UI interaction (e.g. pressing a UI button won't fire it)
---@field public OnRightMouseAction MulticastDelegate|fun(Event: integer) @Note: handles Game input, not UI interaction (e.g. pressing a UI button won't fire it)
---@field public OnMiddleMouseAction MulticastDelegate|fun(Event: integer) @Note: handles Game input, not UI interaction (e.g. pressing a UI button won't fire it)
---@field public OnEscapeAction MulticastDelegate|fun(Event: integer)
---@field public OnShiftAction MulticastDelegate|fun(Event: integer)
---@field public OnCtrlAction MulticastDelegate|fun(Event: integer)
---@field public OnAltAction MulticastDelegate|fun(Event: integer)
AGPlayerPawnBase = {}

---@return boolean
function AGPlayerPawnBase:IsAltPressed() end

---@return boolean
function AGPlayerPawnBase:IsCtrlPressed() end

---Note: handles Game input, not UI interaction (e.g. pressing a UI button won't fire it)
---@return boolean
function AGPlayerPawnBase:IsLeftMousePressed() end

---@return boolean
function AGPlayerPawnBase:IsMiddleMousePressed() end

---Note: handles Game input, not UI interaction (e.g. pressing a UI button won't fire it)
---@return boolean
function AGPlayerPawnBase:IsRightMousePressed() end

---@return boolean
function AGPlayerPawnBase:IsShiftPressed() end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function AGPlayerPawnBase:GatherDebugData(DebugString) end

