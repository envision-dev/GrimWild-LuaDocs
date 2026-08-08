---@class UEnvisionInput : UBlueprintFunctionLibrary
UEnvisionInput = {}

---@return string OutString
function UEnvisionInput.DebugInputActions() end

---@param Mapping FInputActionKeyMapping
---@param OutChord FInputChord @[out, modified in place]
function UEnvisionInput.InputActionKeyMappingToInputChord(Mapping, OutChord) end

---@param String string
---@param OutChord FInputChord @[out, modified in place]
function UEnvisionInput.InputChordFromString(String, OutChord) end

---NOTE: OutMapping's ActionName remain unchanged
---@param Chord FInputChord
---@param OutMapping FInputActionKeyMapping @[out, modified in place]
function UEnvisionInput.InputChordToInputActionKeyMapping(Chord, OutMapping) end

---@param Chord FInputChord
---@return string
function UEnvisionInput.InputChordToString(Chord) end

