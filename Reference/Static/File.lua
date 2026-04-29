---@class File
File = {}

---@param P0 string 
---@param P1 string 
---@return boolean
function File:Open(P0, P1) end

function File:Close() end

---@param P0 string 
---@param P1 integer 
function File:Seek(P0, P1) end

---@return integer
function File:TotalSize() end

function File:Flush() end

---@return boolean
function File:IsValid() end
