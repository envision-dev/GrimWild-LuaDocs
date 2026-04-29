---@class UEnvisionInput : UBlueprintFunctionLibrary
UEnvisionInput = {}

---@param OutString string @[out]
function UEnvisionInput.DebugInputActions(OutString) end

---@param Mapping FInputActionKeyMapping
---@param OutChord FInputChord @[out]
function UEnvisionInput.InputActionKeyMappingToInputChord(Mapping, OutChord) end

---@param String string
---@param OutChord FInputChord @[out]
function UEnvisionInput.InputChordFromString(String, OutChord) end

---NOTE: OutMapping's ActionName remain unchanged
---@param Chord FInputChord
---@param OutMapping FInputActionKeyMapping @[out]
function UEnvisionInput.InputChordToInputActionKeyMapping(Chord, OutMapping) end

---@param Chord FInputChord
---@return string
function UEnvisionInput.InputChordToString(Chord) end

