---Blueprint-facing helpers for building/resolving mod references and handles.
---@class UModUtilityLibrary : UBlueprintFunctionLibrary
UModUtilityLibrary = {}

---@param Mod UMod
---@return FModHandle
function UModUtilityLibrary.MakeModHandle(Mod) end

---@param Mod UMod
---@return FModReference
function UModUtilityLibrary.MakeModReference(Mod) end

---@param Handle FModHandle
---@return UMod
function UModUtilityLibrary.ResolveModHandle(Handle) end

---Resolves Reference against UModManager::Get() (no world context). A null manager is an ERROR
---(unlike FModHandle::Get, a direct Blueprint call site expects a live manager); not found is a
---silent nullptr (a normal missing state).
---@param Reference FModReference
---@return UMod
function UModUtilityLibrary.ResolveModReference(Reference) end

