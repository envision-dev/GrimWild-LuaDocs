---@meta
---Implement an Actor component for input bindings.
---An Input Component is a transient component that enables an Actor to bind various forms of input events to delegate functions.
---Input components are processed from a stack managed by the PlayerController and processed by the PlayerInput.
---Each binding can consume the input event preventing other components on the input stack from processing the input.
---@class UInputComponent : UActorComponent
---@field private CachedKeyToActionInfo TArray<FCachedKeyToActionInfo>
UInputComponent = {}

---Returns the analog value for the given key/button.  If analog isn't supported, returns 1 for down and 0 for up.
---@param Key FKey
---@return number
function UInputComponent:GetControllerAnalogKeyState(Key) end

---Retrieves the X and Y displacement of the given analog stick.  For WhickStick, 0 = left, 1 = right.
---@param WhichStick integer
---@return number StickX
---@return number StickY
function UInputComponent:GetControllerAnalogStickState(WhichStick) end

---Returns how long the given key/button has been down.  Returns 0 if it's up or it just went down this frame.
---@param Key FKey
---@return number
function UInputComponent:GetControllerKeyTimeDown(Key) end

---Retrieves how far the mouse moved this frame.
---@return number DeltaX
---@return number DeltaY
function UInputComponent:GetControllerMouseDelta() end

---Returns the vector value for the given key/button.
---@param Key FKey
---@return FVector
function UInputComponent:GetControllerVectorKeyState(Key) end

---Returns the location of a touch, and if it's held down
---@param FingerIndex integer
---@return number LocationX
---@return number LocationY
---@return boolean bIsCurrentlyPressed
function UInputComponent:GetTouchState(FingerIndex) end

---Returns true if the given key/button is pressed on the input of the controller (if present)
---@param Key FKey
---@return boolean
function UInputComponent:IsControllerKeyDown(Key) end

---@param InOwner AActor
---@param EndPlayReason integer
function UInputComponent:OnInputOwnerEndPlayed(InOwner, EndPlayReason) end

---Returns true if the given key/button was up last frame and down this frame.
---@param Key FKey
---@return boolean
function UInputComponent:WasControllerKeyJustPressed(Key) end

---Returns true if the given key/button was down last frame and up this frame.
---@param Key FKey
---@return boolean
function UInputComponent:WasControllerKeyJustReleased(Key) end

