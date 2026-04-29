---@class UWidgetBlueprintLibrary : UBlueprintFunctionLibrary
UWidgetBlueprintLibrary = {}

---Cancels any current drag drop operation.
function UWidgetBlueprintLibrary.CancelDragDrop() end

---@param Reply FEventReply @[out]
---@param CapturingWidget UWidget
---@param bInAllJoysticks? boolean @[default: false]
---@return FEventReply
function UWidgetBlueprintLibrary.CaptureJoystick(Reply, CapturingWidget, bInAllJoysticks) end

---@param Reply FEventReply @[out]
---@param CapturingWidget UWidget
---@return FEventReply
function UWidgetBlueprintLibrary.CaptureMouse(Reply, CapturingWidget) end

---@param Reply FEventReply @[out]
---@param bInAllUsers? boolean @[default: false]
---@return FEventReply
function UWidgetBlueprintLibrary.ClearUserFocus(Reply, bInAllUsers) end

---Creates a widget
---@param WorldContextObject UObject
---@param WidgetType TSubclassOf<UUserWidget>
---@param OwningPlayer APlayerController
---@return UUserWidget
function UWidgetBlueprintLibrary.Create(WorldContextObject, WidgetType, OwningPlayer) end

---Creates a new drag and drop operation that can be returned from a drag begin to inform the UI what i
---being dragged and dropped and what it looks like.
---@param OperationClass TSubclassOf<UDragDropOperation>
---@return UDragDropOperation
function UWidgetBlueprintLibrary.CreateDragDropOperation(OperationClass) end

---Ask Slate to detect if a user starts dragging in this widget later.  Slate internally tracks the movement
---and if it surpasses the drag threshold, Slate will send an OnDragDetected event to the widget.
---@param Reply FEventReply @[out]
---@param WidgetDetectingDrag UWidget @Detect dragging in this widget
---@param DragKey FKey
---@return FEventReply
function UWidgetBlueprintLibrary.DetectDrag(Reply, WidgetDetectingDrag, DragKey) end

---Given the pointer event, emit the DetectDrag reply if the provided key was pressed.
---If the DragKey is a touch key, that will also automatically work.
---@param PointerEvent FPointerEvent
---@param WidgetDetectingDrag UWidget @Detect dragging in this widget.
---@param DragKey FKey
---@return FEventReply
function UWidgetBlueprintLibrary.DetectDragIfPressed(PointerEvent, WidgetDetectingDrag, DragKey) end

---Closes any popup menu
function UWidgetBlueprintLibrary.DismissAllMenus() end

---Draws a box
---@param Context FPaintContext @[out]
---@param Position FVector2D
---@param Size FVector2D
---@param Brush USlateBrushAsset
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
function UWidgetBlueprintLibrary.DrawBox(Context, Position, Size, Brush, Tint) end

---Draws a line.
---@param Context FPaintContext @[out]
---@param PositionA FVector2D
---@param PositionB FVector2D
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param bAntiAlias? boolean @[default: true]
---@param Thickness? number @[default: 1.000000]
function UWidgetBlueprintLibrary.DrawLine(Context, PositionA, PositionB, Tint, bAntiAlias, Thickness) end

---Draws several line segments.
---@param Context FPaintContext @[out]
---@param Points TArray<FVector2D>
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param bAntiAlias? boolean @[default: true]
---@param Thickness? number @[default: 1.000000]
function UWidgetBlueprintLibrary.DrawLines(Context, Points, Tint, bAntiAlias, Thickness) end

---Draws a hermite spline.
---@param Context FPaintContext @[out]
---@param Start FVector2D
---@param StartDir FVector2D
---@param End FVector2D
---@param EndDir FVector2D
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Thickness? number @[default: 1.000000]
function UWidgetBlueprintLibrary.DrawSpline(Context, Start, StartDir, End, EndDir, Tint, Thickness) end

---Draws text.
---@param Context FPaintContext @[out]
---@param InString string
---@param Position FVector2D
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
function UWidgetBlueprintLibrary.DrawText(Context, InString, Position, Tint) end

---Draws text.
---@param Context FPaintContext @[out]
---@param Text string
---@param Position FVector2D
---@param Font UFont
---@param FontSize? number @[default: 16.000000]
---@param FontTypeFace? string @[default: Regular]
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
function UWidgetBlueprintLibrary.DrawTextFormatted(Context, Text, Position, Font, FontSize, FontTypeFace, Tint) end

---An event should return FReply::Handled().EndDragDrop() to request that the current drag/drop operation be terminated.
---@param Reply FEventReply @[out]
---@return FEventReply
function UWidgetBlueprintLibrary.EndDragDrop(Reply) end

---Find all widgets of a certain class.
---@param WorldContextObject UObject
---@param FoundWidgets TArray<UUserWidget> @[out] The widgets that were found matching the filter.
---@param WidgetClass TSubclassOf<UUserWidget> @The widget class to filter by.
---@param TopLevelOnly? boolean @[default: true] Only the widgets that are direct children of the viewport will be returned.
function UWidgetBlueprintLibrary.GetAllWidgetsOfClass(WorldContextObject, FoundWidgets, WidgetClass, TopLevelOnly) end

---Find all widgets in the world with the specified interface.
---This is a slow operation, use with caution e.g. do not use every frame.
---@param WorldContextObject UObject
---@param FoundWidgets TArray<UUserWidget> @[out] Output array of widgets that implement the specified interface.
---@param Interface TSubclassOf<UInterface> @The interface to find. Must be specified or result array will be empty.
---@param TopLevelOnly boolean @Only the widgets that are direct children of the viewport will be returned.
function UWidgetBlueprintLibrary.GetAllWidgetsWithInterface(WorldContextObject, FoundWidgets, Interface, TopLevelOnly) end

---Gets the resource object on a brush.  This could be a UTexture2D or a UMaterialInterface.
---@param Brush FSlateBrush
---@return UObject
function UWidgetBlueprintLibrary.GetBrushResource(Brush) end

---Gets the brush resource as a material.
---@param Brush FSlateBrush
---@return UMaterialInterface
function UWidgetBlueprintLibrary.GetBrushResourceAsMaterial(Brush) end

---Gets the brush resource as a texture 2D.
---@param Brush FSlateBrush
---@return UTexture2D
function UWidgetBlueprintLibrary.GetBrushResourceAsTexture2D(Brush) end

---Returns the drag and drop operation that is currently occurring if any, otherwise nothing.
---@return UDragDropOperation
function UWidgetBlueprintLibrary.GetDragDroppingContent() end

---Gets the material that allows changes to parameters at runtime.  The brush must already have a material assigned to it,
---if it does it will automatically be converted to a MID.
---@param Brush FSlateBrush @[out]
---@return UMaterialInstanceDynamic
function UWidgetBlueprintLibrary.GetDynamicMaterial(Brush) end

---@param Event FCharacterEvent
---@return FInputEvent
function UWidgetBlueprintLibrary.GetInputEventFromCharacterEvent(Event) end

---@param Event FKeyEvent
---@return FInputEvent
function UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(Event) end

---@param Event FNavigationEvent
---@return FInputEvent
function UWidgetBlueprintLibrary.GetInputEventFromNavigationEvent(Event) end

---@param Event FPointerEvent
---@return FInputEvent
function UWidgetBlueprintLibrary.GetInputEventFromPointerEvent(Event) end

---@param Event FAnalogInputEvent
---@return FKeyEvent
function UWidgetBlueprintLibrary.GetKeyEventFromAnalogInputEvent(Event) end

---Gets the amount of padding that needs to be added when accounting for the safe zone on TVs.
---@param WorldContextObject UObject
---@param SafePadding FVector4 @[out]
---@param SafePaddingScale FVector2D @[out]
---@param SpillOverPadding FVector4 @[out]
function UWidgetBlueprintLibrary.GetSafeZonePadding(WorldContextObject, SafePadding, SafePaddingScale, SpillOverPadding) end

---The event reply to use when you choose to handle an event.  This will prevent the event
---from continuing to bubble up / down the widget hierarchy.
---@return FEventReply
function UWidgetBlueprintLibrary.Handled() end

---Returns true if a drag/drop event is occurring that a widget can handle.
---@return boolean
function UWidgetBlueprintLibrary.IsDragDropping() end

---@param Reply FEventReply @[out]
---@param CapturingWidget UWidget
---@return FEventReply
function UWidgetBlueprintLibrary.LockMouse(Reply, CapturingWidget) end

---Creates a Slate Brush from a Slate Brush Asset
---@param BrushAsset USlateBrushAsset
---@return FSlateBrush
function UWidgetBlueprintLibrary.MakeBrushFromAsset(BrushAsset) end

---Creates a Slate Brush from a Material.  Materials don't have an implicit size, so providing a widget and height
---is required to hint slate with how large the image wants to be by default.
---@param Material UMaterialInterface
---@param Width? integer @[default: 32]
---@param Height? integer @[default: 32]
---@return FSlateBrush
function UWidgetBlueprintLibrary.MakeBrushFromMaterial(Material, Width, Height) end

---Creates a Slate Brush from a Texture2D
---@param Texture UTexture2D
---@param Width? integer @[default: 0] When less than or equal to zero, the Width of the brush will default to the Width of the Texture
---@param Height? integer @[default: 0] When less than or equal to zero, the Height of the brush will default to the Height of the Texture
---@return FSlateBrush
function UWidgetBlueprintLibrary.MakeBrushFromTexture(Texture, Width, Height) end

---Creates a Slate Brush that wont draw anything, the "Null Brush".
---@return FSlateBrush
function UWidgetBlueprintLibrary.NoResourceBrush() end

function UWidgetBlueprintLibrary:OnGameWindowCloseButtonClickedDelegate__DelegateSignature() end

---@param Reply FEventReply @[out]
---@param bInAllJoysticks? boolean @[default: false]
---@return FEventReply
function UWidgetBlueprintLibrary.ReleaseJoystickCapture(Reply, bInAllJoysticks) end

---@param Reply FEventReply @[out]
---@return FEventReply
function UWidgetBlueprintLibrary.ReleaseMouseCapture(Reply) end

function UWidgetBlueprintLibrary.RestorePreviousWindowTitleBarState() end

---Sets the resource on a brush to be a Material.
---@param Brush FSlateBrush @[out]
---@param Material UMaterialInterface
function UWidgetBlueprintLibrary.SetBrushResourceToMaterial(Brush, Material) end

---Sets the resource on a brush to be a UTexture2D.
---@param Brush FSlateBrush @[out]
---@param Texture UTexture2D
function UWidgetBlueprintLibrary.SetBrushResourceToTexture(Brush, Texture) end

---Apply color deficiency correction settings to the game window
---@param Type EColorVisionDeficiency @The type of color deficiency correction to apply.
---@param Severity number @Intensity of the color deficiency correction effect, from 0 to 1.
---@param CorrectDeficiency boolean @Shifts the color spectrum to the visible range based on the current deficiency type.
---@param ShowCorrectionWithDeficiency boolean @If you're correcting the color deficiency, you can use this to visualize what the correction looks like with the deficiency.
function UWidgetBlueprintLibrary.SetColorVisionDeficiencyType(Type, Severity, CorrectDeficiency, ShowCorrectionWithDeficiency) end

function UWidgetBlueprintLibrary.SetFocusToGameViewport() end

---Loads or sets a hardware cursor from the content directory in the game.
---@param WorldContextObject UObject
---@param CursorShape integer
---@param CursorName string
---@param HotSpot FVector2D
---@return boolean
function UWidgetBlueprintLibrary.SetHardwareCursor(WorldContextObject, CursorShape, CursorName, HotSpot) end

---Setup an input mode that allows only the UI to respond to user input, and if the UI doesn't handle it player input / player controller gets a chance.
---Note: This means that any bound Input events in the widget will be called.
---@param PlayerController APlayerController
---@param InWidgetToFocus? UWidget @[default: None]
---@param InMouseLockMode? EMouseLockMode @[default: DoNotLock]
---@param bHideCursorDuringCapture? boolean @[default: true]
---@param bFlushInput? boolean @[default: false]
function UWidgetBlueprintLibrary.SetInputMode_GameAndUIEx(PlayerController, InWidgetToFocus, InMouseLockMode, bHideCursorDuringCapture, bFlushInput) end

---Setup an input mode that allows only player input / player controller to respond to user input.
---Note: Any bound Input Events in this widget will be called.
---@param PlayerController APlayerController
---@param bFlushInput? boolean @[default: false]
function UWidgetBlueprintLibrary.SetInputMode_GameOnly(PlayerController, bFlushInput) end

---Setup an input mode that allows only the UI to respond to user input.
---Note: This means that any bound Input Events in the widget will not be called!
---@param PlayerController APlayerController
---@param InWidgetToFocus? UWidget @[default: None]
---@param InMouseLockMode? EMouseLockMode @[default: DoNotLock]
---@param bFlushInput? boolean @[default: false]
function UWidgetBlueprintLibrary.SetInputMode_UIOnlyEx(PlayerController, InWidgetToFocus, InMouseLockMode, bFlushInput) end

---@param Reply FEventReply @[out]
---@param NewMousePosition FVector2D
---@return FEventReply
function UWidgetBlueprintLibrary.SetMousePosition(Reply, NewMousePosition) end

---@param Reply FEventReply @[out]
---@param FocusWidget UWidget
---@param bInAllUsers? boolean @[default: false]
---@return FEventReply
function UWidgetBlueprintLibrary.SetUserFocus(Reply, FocusWidget, bInAllUsers) end

---@param bActive boolean
function UWidgetBlueprintLibrary.SetWindowTitleBarCloseButtonActive(bActive) end

---@param Delegate Delegate|fun()
function UWidgetBlueprintLibrary.SetWindowTitleBarOnCloseClickedDelegate(Delegate) end

---@param TitleBarContent UWidget
---@param Mode EWindowTitleBarMode
---@param bTitleBarDragEnabled boolean
---@param bWindowButtonsVisible boolean
---@param bTitleBarVisible boolean
function UWidgetBlueprintLibrary.SetWindowTitleBarState(TitleBarContent, Mode, bTitleBarDragEnabled, bWindowButtonsVisible, bTitleBarVisible) end

---The event reply to use when you choose not to handle an event.
---@return FEventReply
function UWidgetBlueprintLibrary.Unhandled() end

---@param Reply FEventReply @[out]
---@return FEventReply
function UWidgetBlueprintLibrary.UnlockMouse(Reply) end

