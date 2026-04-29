---@class UTexture2D : UTexture
---@field public FirstResourceMemMip integer @keep track of first mip level used for ResourceMem creation
---@field private bTemporarilyDisableStreaming boolean @True if streaming is temporarily disabled so we can update subregions of this texture's resource       without streaming clobbering it. Automatically cleared before saving.
---@field public bHasBeenPaintedInEditor boolean @Whether the texture has been painted in the editor.
---@field public AddressX integer @The addressing mode to use for the X axis.
---@field public AddressY integer @The addressing mode to use for the Y axis.
---@field private ImportedSize FIntPoint @The imported size of the texture. Only valid on cooked builds when texture source is not available. Access ONLY via the GetImportedSize() accessor!
UTexture2D = {}

---Gets the X size of the texture, in pixels
---@return integer
function UTexture2D:Blueprint_GetSizeX() end

---Gets the Y size of the texture, in pixels
---@return integer
function UTexture2D:Blueprint_GetSizeY() end

