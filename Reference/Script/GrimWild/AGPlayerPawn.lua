---Player pawn class used in Game Map
---@class AGPlayerPawn : AGPlayerPawnBase
---@field protected Camera UCameraComponent
---@field protected SpringArm UGSpringArmComponent
---@field protected CameraOrthoWidth_Min number @Minimum ortho width possible. We reach this value at max zoom value
---@field protected CameraOrthoWidth_Max number @Maximum ortho width possible. We reach this value at min zoom value
---@field protected CameraZoomStep number @The amount to zoom to add/subtract on mouse wheel input. Note: final zoom is affected by CameraZoomSensitivity option and Shift key
---@field protected CameraZoomSpeed number @The speed (per sec) of Ortho Width changing while zooming
---@field protected CurrentZoom number @Current zoom step, normalized. Affected by CameraZoomSensitivity option
---@field protected CameraBaseMovementSpeed number @Base camera keyboard movement speed (at the closest zoom)
---@field protected CameraMovementSpeedScaleRatio number @The multiplier applied to the speed that is being added to the Base value based on current zoom. The formula is (Base + CameraMovementSpeedScaleRatio * ZoomNormalized * Base). So 1.f = doubling the speed. 0 = removing the speed scaling
---@field protected StickMovementFullSpeed number @Camera movement speed at full stick length
---@field protected StickMovementFullLengthSquared number @Squared length (in uu) of a vector from initial stick world location considered as "full speed". Note: We can change this at runtime with no additional code updates.
---@field public CustomInputActions TMap<string, MulticastDelegate|fun(InputEvent: integer)> @Delegates to be bound from Lua for custom input actions (VAsset options)
---@field protected OnStickMovementAction MulticastDelegate|fun(Event: integer)
---@field protected OnDragMovementAction MulticastDelegate|fun(Event: integer)
AGPlayerPawn = {}

---@param LocationToAdd FVector2D
function AGPlayerPawn:AddCameraLocation(LocationToAdd) end

---Updates all necessary fields related to player controls from the user settings cfg file
function AGPlayerPawn:ApplyGameOptions() end

---Returns the cached mouse screen position value.
---NOTE: It may refer to the previous frame mouse position. For the real-time value, use PlayerController->GetMousePosition().
---@return FVector2D
function AGPlayerPawn:GetCachedMouseScreenPosition() end

---Returns the cached mouse trace location value.
---NOTE: It may refer to the previous frame mouse location. For the real-time value, use TraceMouseLocation().
---@return FVector2D
function AGPlayerPawn:GetCachedMouseWorldLocation() end

---@return number
function AGPlayerPawn:GetCurrentZoom() end

---@param ActionName string
---@param Event integer
function AGPlayerPawn:InputAction_Custom(ActionName, Event) end

---@param Event integer
function AGPlayerPawn:OnEscEvent(Event) end

---Tick function that executes in TG_PostUpdateWorld group.
---@param DeltaTime number
function AGPlayerPawn:PostTick(DeltaTime) end

---Does the deprojection of given screen-space coordinates into world-space location
---@param InScreenPosition FVector2D
---@return FVector2D
function AGPlayerPawn:ScreenPositionToWorldLocation(InScreenPosition) end

---
---@param NewLocation FVector2D
---@param bTeleport? boolean @[default: false]
function AGPlayerPawn:SetCameraLocation(NewLocation, bTeleport) end

---
---@param InCurrentZoom number
function AGPlayerPawn:SetCurrentZoom(InCurrentZoom) end

---@param ActionName string
function AGPlayerPawn:Test_BindAction(ActionName) end

---@param Event integer
function AGPlayerPawn:Test_ExecuteAction(Event) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function AGPlayerPawn:GatherDebugData(DebugString) end

