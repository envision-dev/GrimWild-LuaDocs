---@meta
---CanvasRenderTarget2D is 2D render target which exposes a Canvas interface to allow you to draw elements onto
---it directly.  Use CreateCanvasRenderTarget2D() to create a render target texture by unique name, then
---bind a function to the OnCanvasRenderTargetUpdate delegate which will be called when the render target is
---updated.  If you need to repaint your canvas every single frame, simply call UpdateResource() on it from a Tick
---function.  Also, remember to hold onto your new canvas render target with a reference so that it doesn't get
---garbage collected.
---@class UCanvasRenderTarget2D : UTextureRenderTarget2D
---@field public OnCanvasRenderTargetUpdate MulticastDelegate|fun(Canvas: UCanvas, Width: integer, Height: integer) @Called when this Canvas Render Target is asked to update its texture resource.
---@field protected World TWeakObjectPtr<UWorld> @The world this render target will be used with
---@field protected bShouldClearRenderTargetOnReceiveUpdate boolean @If true, clear the render target to green whenever OnReceiveUpdate() is called.  (Defaults to true.) If false, the render target will retain whatever values it had, allowing the user to update only areas that have changed.
UCanvasRenderTarget2D = {}

---Creates a new canvas render target and initializes it to the specified dimensions
---@param WorldContextObject UObject @The world where this render target will be rendered for
---@param CanvasRenderTarget2DClass TSubclassOf<UCanvasRenderTarget2D> @Class of the render target.  Unless you want to use a special sub-class, you can simply pass UCanvasRenderTarget2D::StaticClass() here.
---@param Width? integer @[default: 1024] Width of the render target.
---@param Height? integer @[default: 1024] Height of the render target.
---@return UCanvasRenderTarget2D
function UCanvasRenderTarget2D.CreateCanvasRenderTarget2D(WorldContextObject, CanvasRenderTarget2DClass, Width, Height) end

---Gets a specific render target's size from the global map of canvas render targets.
---@return integer Width @Output variable for the render target's width
---@return integer Height @Output variable for the render target's height
function UCanvasRenderTarget2D:GetSize() end

---Allows a Blueprint to implement how this Canvas Render Target 2D should be updated.
---@param Canvas UCanvas @Canvas object that can be used to paint to the render target
---@param Width integer @Width of the render target.
---@param Height integer @Height of the render target.
function UCanvasRenderTarget2D:ReceiveUpdate(Canvas, Width, Height) end

---Updates the the canvas render target texture's resource. This is where the render target will create or
---find a canvas object to use.  It also calls UpdateResourceImmediate() to clear the render target texture
---from the deferred rendering list, to stop the texture from being cleared the next frame. From there it
---will ask the rendering thread to set up the RHI viewport. The canvas is then set up for rendering and
---then the user's update delegate is called.  The canvas is then flushed and the RHI resolves the
---texture to make it available for rendering.
function UCanvasRenderTarget2D:UpdateResource() end

