---Some helpful UI-related blueprint-exposed methods for debugging and drawing shapes
---@class UUserInterfaceStatics : UBlueprintFunctionLibrary
UUserInterfaceStatics = {}

---Draws an absolute (viewport-scale) spline
---@param Context FPaintContext @[out]
---@param Start FVector2D
---@param StartDirection FVector2D
---@param End FVector2D
---@param EndDirection FVector2D
---@param Tint FLinearColor
---@param Thickness? number @[default: 1.000000]
---@param bPixelSnapping? boolean @[default: true]
function UUserInterfaceStatics.DrawAbsoluteSpline(Context, Start, StartDirection, End, EndDirection, Tint, Thickness, bPixelSnapping) end

---Draws a gradient
---@param Context FPaintContext @[out]
---@param Position FVector2D
---@param Size FVector2D
---@param GradientStops TArray<FSlateGradientStopBlueprint>
---@param GradientType integer
---@param CornerRadius FVector4
---@param bPixelSnapping? boolean @[default: true]
function UUserInterfaceStatics.DrawGradient(Context, Position, Size, GradientStops, GradientType, CornerRadius, bPixelSnapping) end

---Draws a rotated box
---@param Context FPaintContext @[out]
---@param Brush FSlateBrush
---@param Position FVector2f
---@param Size FVector2f
---@param Angle? number @[default: 0.000000]
---@param RotationPoint? FVector2D @[default: (X=0.000,Y=0.000)]
---@param bUseWorldRotationSpace? boolean @[default: false]
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param bPixelSnapping? boolean @[default: true]
function UUserInterfaceStatics.DrawRotatedBox(Context, Brush, Position, Size, Angle, RotationPoint, bUseWorldRotationSpace, Tint, bPixelSnapping) end

---Draws a spline
---@param Context FPaintContext @[out]
---@param Start FVector2D
---@param StartDirection FVector2D
---@param End FVector2D
---@param EndDirection FVector2D
---@param Thickness? number @[default: 1.000000]
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param bPixelSnapping? boolean @[default: true]
function UUserInterfaceStatics.DrawSpline(Context, Start, StartDirection, End, EndDirection, Thickness, Tint, bPixelSnapping) end

---Draws a Cubic Bezier Spline
---@param Context FPaintContext @[out]
---@param Start FVector2D
---@param StartDirection FVector2D
---@param End FVector2D
---@param EndDirection FVector2D
---@param Thickness? number @[default: 1.000000]
---@param Tint? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param bPixelSnapping? boolean @[default: true]
function UUserInterfaceStatics.MakeCubicBezierSpline(Context, Start, StartDirection, End, EndDirection, Thickness, Tint, bPixelSnapping) end

