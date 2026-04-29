---@class UCanvasPanelSlot : UPanelSlot
---@field public LayoutData FAnchorData @The anchoring information for the slot
---@field public bAutoSize boolean @When AutoSize is true we use the widget's desired size
---@field public ZOrder integer @The order priority this widget is rendered in.  Higher values are rendered last (and so they will appear to be on top).
UCanvasPanelSlot = {}

---Gets the alignment on the slot
---@return FVector2D
function UCanvasPanelSlot:GetAlignment() end

---Gets the anchors on the slot
---@return FAnchors
function UCanvasPanelSlot:GetAnchors() end

---Gets if the slot to be auto-sized
---@return boolean
function UCanvasPanelSlot:GetAutoSize() end

---Gets the layout data of the slot
---@return FAnchorData
function UCanvasPanelSlot:GetLayout() end

---Gets the offset data of the slot, which could be position and size, or margins depending on the anchor points
---@return FMargin
function UCanvasPanelSlot:GetOffsets() end

---Gets the position of the slot
---@return FVector2D
function UCanvasPanelSlot:GetPosition() end

---Gets the size of the slot
---@return FVector2D
function UCanvasPanelSlot:GetSize() end

---Gets the z-order on the slot
---@return integer
function UCanvasPanelSlot:GetZOrder() end

---Sets the alignment on the slot
---@param InAlignment FVector2D
function UCanvasPanelSlot:SetAlignment(InAlignment) end

---Sets the anchors on the slot
---@param InAnchors FAnchors
function UCanvasPanelSlot:SetAnchors(InAnchors) end

---Sets if the slot to be auto-sized
---@param InbAutoSize boolean
function UCanvasPanelSlot:SetAutoSize(InbAutoSize) end

---Sets the layout data of the slot
---@param InLayoutData FAnchorData
function UCanvasPanelSlot:SetLayout(InLayoutData) end

---Sets the anchors on the slot
---@param InMaximumAnchors FVector2D
function UCanvasPanelSlot:SetMaximum(InMaximumAnchors) end

---Sets the anchors on the slot
---@param InMinimumAnchors FVector2D
function UCanvasPanelSlot:SetMinimum(InMinimumAnchors) end

---Sets the offset data of the slot, which could be position and size, or margins depending on the anchor points
---@param InOffset FMargin
function UCanvasPanelSlot:SetOffsets(InOffset) end

---Sets the position of the slot
---@param InPosition FVector2D
function UCanvasPanelSlot:SetPosition(InPosition) end

---Sets the size of the slot
---@param InSize FVector2D
function UCanvasPanelSlot:SetSize(InSize) end

---Sets the z-order on the slot
---@param InZOrder integer
function UCanvasPanelSlot:SetZOrder(InZOrder) end

