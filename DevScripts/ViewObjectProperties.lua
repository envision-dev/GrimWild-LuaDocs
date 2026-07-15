
--- Defines

local Object = GetPlayerPawn() --Object which properties we want to view and edit

---


--Get player's UI
local GameHUD = GetPlayerController():GetGameHUD()

--Get the Widget Blueprint of target class
local WindowClass = UObjectUPropertyViewer.Load("/Game/UserInterface/Dev/WBP_UPropertyViewer.WBP_UPropertyViewer_C")

local WindowPosition = FVector2D(10, 56)

--Create the window itself
---@type UObjectUPropertyViewer
local Window = GameHUD:K2_CreateDraggableWindow(WindowClass, WindowPosition, 0)

--Helper struct used for property blacklists/whitelists
local Context = FPropertySlotBuildContext()

--Fill the window content with properties of the desired Object
Window:Init(Object, Context)