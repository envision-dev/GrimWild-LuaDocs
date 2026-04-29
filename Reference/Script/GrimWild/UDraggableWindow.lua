---@class UDraggableWindow : UGWindow
---@field protected RootSizeBox USizeBox @Set Min/Max desired width/height. These fields are used to define min/max size of the window with the size drag. You may leave Max Desired W/H as 0. In this case, there's no size limit. For best results, the window must have Alignment set to 0,0 (from parent Canvas Panel)
---@field protected ResizeHandle UImage @If bound to a valid widget, allows the window to be resized. Define min/max size in RootSizeBox member.
UDraggableWindow = {}

