---@class EMouseCaptureMode
---@field public NoCapture EMouseCaptureMode [0] Do not capture the mouse at all
---@field public CapturePermanently EMouseCaptureMode [1] Capture the mouse permanently when the viewport is clicked, and consume the initial mouse down that caused the capture so it isn't processed by player input
---@field public CapturePermanently_IncludingInitialMouseDown EMouseCaptureMode [2] Capture the mouse permanently when the viewport is clicked, and allow player input to process the mouse down that caused the capture
---@field public CaptureDuringMouseDown EMouseCaptureMode [3] Capture the mouse during a mouse down, releases on mouse up
---@field public CaptureDuringRightMouseDown EMouseCaptureMode [4] Capture only when the right mouse button is down, not any of the other mouse buttons
EMouseCaptureMode = {}
