---@class UWidgetLayoutLibrary : UBlueprintFunctionLibrary
UWidgetLayoutLibrary = {}

---Gets the platform's mouse cursor position.  This is the 'absolute' desktop location of the mouse.
---@return FVector2D
function UWidgetLayoutLibrary.GetMousePositionOnPlatform() end

---Gets the platform's mouse cursor position in the local space of the viewport widget.
---@param WorldContextObject UObject
---@return FVector2D
function UWidgetLayoutLibrary.GetMousePositionOnViewport(WorldContextObject) end

---Gets the mouse position of the player controller, scaled by the DPI.  If you're trying to go from raw mouse screenspace coordinates
---to fullscreen widget space, you'll need to transform the mouse into DPI Scaled space.  This function performs that scaling.
---MousePositionScaledByDPI = MousePosition * (1 / ViewportScale).
---        //UE_DEPRECATED(4.17, "Use GetMousePositionOnViewport() instead.  Optionally and for more options, you can use GetViewportWidgetGeometry and GetPlayerScreenWidgetGeometry are newly introduced to give you the geometry of the viewport and the player screen for widgets to help convert between spaces.")
---@param Player APlayerController
---@param LocationX number @[out]
---@param LocationY number @[out]
---@return boolean
function UWidgetLayoutLibrary.GetMousePositionScaledByDPI(Player, LocationX, LocationY) end

---Gets the geometry of the widget holding all widgets added to the "Player Screen". You
---can use this geometry to convert between absolute and local space of widgets held on this
---widget.
---@param PlayerController APlayerController
---@return FGeometry
function UWidgetLayoutLibrary.GetPlayerScreenWidgetGeometry(PlayerController) end

---Gets the current DPI Scale being applied to the viewport and all the Widgets.
---@param WorldContextObject UObject
---@return number
function UWidgetLayoutLibrary.GetViewportScale(WorldContextObject) end

---Gets the size of the game viewport.
---@param WorldContextObject UObject
---@return FVector2D
function UWidgetLayoutLibrary.GetViewportSize(WorldContextObject) end

---Gets the geometry of the widget holding all widgets added to the "Viewport".  You
---can use this geometry to convert between absolute and local space of widgets held on this
---widget.
---@param WorldContextObject UObject
---@return FGeometry
function UWidgetLayoutLibrary.GetViewportWidgetGeometry(WorldContextObject) end

---Gets the projected world to screen position for a player, then converts it into a widget
---position, which takes into account any quality scaling.
---@param PlayerController APlayerController @The player controller to project the position in the world to their screen.
---@param WorldLocation FVector @The world location to project from.
---@param ScreenPosition FVector2D @[out] The position in the viewport with quality scale removed and DPI scale remove.
---@param bPlayerViewportRelative boolean @Should this be relative to the player viewport subregion (useful when using player attached widgets in split screen or when aspect-ratio constrained)
---@return boolean
function UWidgetLayoutLibrary.ProjectWorldLocationToWidgetPosition(PlayerController, WorldLocation, ScreenPosition, bPlayerViewportRelative) end

---Removes all widgets from the viewport.
---@param WorldContextObject UObject
function UWidgetLayoutLibrary.RemoveAllWidgets(WorldContextObject) end

---Gets the slot object on the child widget as a Border Slot, allowing you to manipulate layout information.
---@param Widget UWidget @The child widget of a border panel.
---@return UBorderSlot
function UWidgetLayoutLibrary.SlotAsBorderSlot(Widget) end

---Gets the slot object on the child widget as a Canvas Slot, allowing you to manipulate layout information.
---@param Widget UWidget @The child widget of a canvas panel.
---@return UCanvasPanelSlot
function UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget) end

---Gets the slot object on the child widget as a Grid Slot, allowing you to manipulate layout information.
---@param Widget UWidget @The child widget of a grid panel.
---@return UGridSlot
function UWidgetLayoutLibrary.SlotAsGridSlot(Widget) end

---Gets the slot object on the child widget as a Horizontal Box Slot, allowing you to manipulate its information.
---@param Widget UWidget @The child widget of a Horizontal Box.
---@return UHorizontalBoxSlot
function UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(Widget) end

---Gets the slot object on the child widget as a Overlay Slot, allowing you to manipulate layout information.
---@param Widget UWidget @The child widget of a overlay panel.
---@return UOverlaySlot
function UWidgetLayoutLibrary.SlotAsOverlaySlot(Widget) end

---Gets the slot object on the child widget as a Safe Box Slot, allowing you to manipulate its information.
---@param Widget UWidget @The child widget of a Safe Box.
---@return USafeZoneSlot
function UWidgetLayoutLibrary.SlotAsSafeBoxSlot(Widget) end

---Gets the slot object on the child widget as a Scale Box Slot, allowing you to manipulate its information.
---@param Widget UWidget @The child widget of a Scale Box.
---@return UScaleBoxSlot
function UWidgetLayoutLibrary.SlotAsScaleBoxSlot(Widget) end

---Gets the slot object on the child widget as a Scroll Box Slot, allowing you to manipulate its information.
---@param Widget UWidget @The child widget of a Scroll Box.
---@return UScrollBoxSlot
function UWidgetLayoutLibrary.SlotAsScrollBoxSlot(Widget) end

---Gets the slot object on the child widget as a Size Box Slot, allowing you to manipulate its information.
---@param Widget UWidget @The child widget of a Size Box.
---@return USizeBoxSlot
function UWidgetLayoutLibrary.SlotAsSizeBoxSlot(Widget) end

---Gets the slot object on the child widget as a Uniform Grid Slot, allowing you to manipulate layout information.
---@param Widget UWidget @The child widget of a uniform grid panel.
---@return UUniformGridSlot
function UWidgetLayoutLibrary.SlotAsUniformGridSlot(Widget) end

---Gets the slot object on the child widget as a Vertical Box Slot, allowing you to manipulate its information.
---@param Widget UWidget @The child widget of a Vertical Box.
---@return UVerticalBoxSlot
function UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(Widget) end

---Gets the slot object on the child widget as a Widget Switcher Slot, allowing you to manipulate its information.
---@param Widget UWidget @The child widget of a Widget Switcher Slot.
---@return UWidgetSwitcherSlot
function UWidgetLayoutLibrary.SlotAsWidgetSwitcherSlot(Widget) end

---Gets the slot object on the child widget as a Wrap Box Slot, allowing you to manipulate its information.
---@param Widget UWidget @The child widget of a Wrap Box.
---@return UWrapBoxSlot
function UWidgetLayoutLibrary.SlotAsWrapBoxSlot(Widget) end

