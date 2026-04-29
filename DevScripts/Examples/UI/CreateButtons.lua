
local HUD = GetPlayerController():GetGameHUD()

---@type UHorizontalBox
local HBox = HUD.SwitchablePanel:GetChildAt(0)

-- CREATING BUTTONS WITH TEXT OR/AND ICON

--Text to be shown on the button (inline text = no translation)
---@type FEText
local Text = FEText()
Text.InlineText = "Hello World!"

--Color of the button 
---@type FWidgetColorStyle
local Style = FWidgetColorStyle()
Style.Emphasis = EWidgetEmphasis.Neutral
Style.Shade = EColorShade.Dark4

--Create a button with created Text and Style
local Widget = UWidgetLib.CreateButtonWithText(HUD, Text, Style)

--Add it to some parent widget on the player screen
HBox:AddChild(Widget)

--Bind an event on click
Widget.OnClicked:Add(function() LogWarn("Clicked the button!") end)

--MORE EXAMPLES

local Widget1 = UWidgetLib.CreateButtonWithIcon(HUD, "Icon_Analytics", Style)
HBox:AddChild(Widget1)

local Widget2 = UWidgetLib.CreateButtonWithTextAndIcon(HUD, Text, "Icon_Fire", Style)
HBox:AddChild(Widget2)

-- CREATING A GENERIC BUTTON

local GenericButton = UWidgetLib.CreateButton(HUD)
HBox:AddChild(GenericButton)

--Change the color style of a living button
GenericButton.WidgetColorStyle.Emphasis = EWidgetEmphasis.Maximum --Red
GenericButton:ApplyStyle()
