------ Defines

local TargetCornerRadii = FVector4(10, 10, 10, 10)
local TargetOutlineWidth = 1

------

---@param Brush FSlateBrush
local function ChangeBrushStyle(Brush)
    Brush.OutlineSettings.CornerRadii = TargetCornerRadii
    Brush.OutlineSettings.Width = TargetOutlineWidth
end

local WidgetSettings = UWidgetSettings.Get()
ChangeBrushStyle(WidgetSettings.DefaultButtonStyle.Normal)
ChangeBrushStyle(WidgetSettings.DefaultButtonStyle.Hovered)
ChangeBrushStyle(WidgetSettings.DefaultButtonStyle.Pressed)
ChangeBrushStyle(WidgetSettings.DefaultButtonStyle.Disabled)

WidgetSettings.ApplyStyleToAllWidgets(GetWorld())