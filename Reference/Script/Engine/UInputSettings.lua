---Project wide settings for input handling
---@class UInputSettings : UObject
---@field public AxisConfig TArray<FInputAxisConfigEntry> @List of Axis Properties
---@field public PlatformSettings FPerPlatformSettings @Platform specific settings for Input.
---@field public bAltEnterTogglesFullscreen boolean
---@field public bF11TogglesFullscreen boolean
---@field public bUseMouseForTouch boolean @Allow mouse to be used for touch
---@field public bEnableMouseSmoothing boolean @Mouse smoothing control
---@field public bEnableFOVScaling boolean @Scale the mouse based on the player camera manager's field of view
---@field public bCaptureMouseOnLaunch boolean @Controls if the viewport will capture the mouse on Launch of the application
---@field public bEnableLegacyInputScales boolean @Enable the use of legacy input scales on the player controller (InputYawScale, InputPitchScale, and InputRollScale)
---@field public bEnableMotionControls boolean @If set to false, then the player controller's InputMotion function will never be called. This will effectively disable any motion input (tilt, rotation, acceleration, etc) on the GameViewportClient.
---@field public bFilterInputByPlatformUser boolean @If true, then the PlayerController::InputKey function will only process an input event if it came from an input device that is owned by the PlayerController's Platform User.
---@field public bEnableInputDeviceSubsystem boolean @If true, then the input device subsystem will be allowed to Initalize when the engine boots. NOTE: For this setting to take effect, and editor restart is required.
---@field public bShouldFlushPressedKeysOnViewportFocusLost boolean @If true, then the Player Controller will have it's Pressed Keys flushed when the input mode is changed to Game and UI mode or the game viewport loses focus. The default behavior is true.
---@field public bEnableDynamicComponentInputBinding boolean @Should components that are dynamically added via the 'AddComponent' function at runtime have input delegates bound to them?
---@field public bAlwaysShowTouchInterface boolean @Should the touch input interface be shown always, or only when the platform has a touch screen?
---@field public bShowConsoleOnFourFingerTap boolean @Whether or not to show the console on 4 finger tap, on mobile platforms
---@field public bEnableGestureRecognizer boolean @Whether or not to use the gesture recognition system to convert touches in to gestures that can be bound and queried
---@field public bUseAutocorrect boolean @If enabled, virtual keyboards will have autocorrect enabled. Currently only supported on mobile devices.
---@field public ExcludedAutocorrectOS TArray<string> @Disables autocorrect for these operating systems, even if autocorrect is enabled. Use the format "[platform] [osversion]" (e.g., "iOS 11.2" or "Android 6"). More specific versions will disable autocorrect for fewer devices ("iOS 11" will disable autocorrect for all devices running iOS 11, but "iOS 11.2.2" will not disable autocorrect for devices running 11.2.1).
---@field public ExcludedAutocorrectCultures TArray<string> @Disables autocorrect for these cultures, even if autocorrect is turned on. These should be ISO-compliant language and country codes, such as "en" or "en-US".
---@field public ExcludedAutocorrectDeviceModels TArray<string> @Disables autocorrect for these device models, even if autocorrect is turned in. Model IDs listed here will match against the start of the device's model (e.g., "SM-" will match all device model IDs that start with "SM-"). This is currently only supported on Android devices.
---@field public DefaultViewportMouseCaptureMode EMouseCaptureMode @The default mouse capture mode for the game viewport
---@field public DefaultViewportMouseLockMode EMouseLockMode @The default mouse lock state behavior when the viewport acquires capture
---@field public FOVScale number @The scaling value to multiply the field of view by
---@field public DoubleClickTime number @If a key is pressed twice in this amount of time it is considered a "double click"
---@field private ActionMappings TArray<FInputActionKeyMapping> @List of Action Mappings
---@field private AxisMappings TArray<FInputAxisKeyMapping> @List of Axis Mappings
---@field private SpeechMappings TArray<FInputActionSpeechMapping> @List of Speech Mappings
---@field private DefaultPlayerInputClass TSoftClassPtr<UPlayerInput> @Default class type for player input object. May be overridden by player controller.
---@field private DefaultInputComponentClass TSoftClassPtr<UInputComponent> @Default class type for pawn input components.
---@field public DefaultTouchInterface FSoftObjectPath @The default on-screen touch input interface for the game (can be null to disable the onscreen interface)
---@field public ConsoleKeys TArray<FKey> @The keys which open the console.
UInputSettings = {}

---Programmatically add an action mapping to the project defaults
---@param KeyMapping FInputActionKeyMapping
---@param bForceRebuildKeymaps? boolean @[default: true]
function UInputSettings:AddActionMapping(KeyMapping, bForceRebuildKeymaps) end

---Programmatically add an axis mapping to the project defaults
---@param KeyMapping FInputAxisKeyMapping
---@param bForceRebuildKeymaps? boolean @[default: true]
function UInputSettings:AddAxisMapping(KeyMapping, bForceRebuildKeymaps) end

---When changes are made to the default mappings, push those changes out to PlayerInput key maps
function UInputSettings:ForceRebuildKeymaps() end

---@param InActionName string
---@param OutMappings TArray<FInputActionKeyMapping> @[out]
function UInputSettings:GetActionMappingByName(InActionName, OutMappings) end

---Populate a list of all defined action names
---@param ActionNames TArray<string> @[out]
function UInputSettings:GetActionNames(ActionNames) end

---Returns all known legacy action and axis names that is useful for
---properties that you want a drop down selection of the available names
---on a UPROPERTY
---i.e.
---meta=(GetOptions="Engine.InputSettings.GetAllActionAndAxisNames")
---@return TArray<string>
function UInputSettings.GetAllActionAndAxisNames() end

---Retrieve all axis mappings by a certain name.
---@param InAxisName string
---@param OutMappings TArray<FInputAxisKeyMapping> @[out]
function UInputSettings:GetAxisMappingByName(InAxisName, OutMappings) end

---Populate a list of all defined axis names
---@param AxisNames TArray<string> @[out]
function UInputSettings:GetAxisNames(AxisNames) end

---Returns the game local input settings (action mappings, axis mappings, etc...)
---@return UInputSettings
function UInputSettings.GetInputSettings() end

---Programmatically remove an action mapping to the project defaults
---@param KeyMapping FInputActionKeyMapping
---@param bForceRebuildKeymaps? boolean @[default: true]
function UInputSettings:RemoveActionMapping(KeyMapping, bForceRebuildKeymaps) end

---Programmatically remove an axis mapping to the project defaults
---@param KeyMapping FInputAxisKeyMapping
---@param bForceRebuildKeymaps? boolean @[default: true]
function UInputSettings:RemoveAxisMapping(KeyMapping, bForceRebuildKeymaps) end

---Flush the current mapping values to the config file
function UInputSettings:SaveKeyMappings() end

