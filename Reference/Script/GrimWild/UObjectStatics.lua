---@class UObjectStatics : UBlueprintFunctionLibrary
UObjectStatics = {}

---@param Attachment FObjectAttachment
---@return UWorldObject
function UObjectStatics.GetObject(Attachment) end

---@param Attachment FObjectAttachment @[out]
---@return UWorldObject
function UObjectStatics.GetObject_Mutable(Attachment) end

---@param Attachment FObjectAttachment
---@return boolean
function UObjectStatics.IsAttachmentIndividualStrong(Attachment) end

---@param Attachment FObjectAttachment
---@return boolean
function UObjectStatics.IsAttachmentStaticNow(Attachment) end

---@param Attachment FObjectAttachment
---@return boolean
function UObjectStatics.IsAttachmentWeak(Attachment) end

