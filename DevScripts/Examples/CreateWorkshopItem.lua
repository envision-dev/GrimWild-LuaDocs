--Workshop item ID. Leave 0 to create a new item, use existing one to update. Find it here:
--https://steamcommunity.com/sharedfiles/filedetails/?id=ID_GOES_HERE
--Note: your steam account must own the item you want to edit.
local ItemId = 0

--Leave desired fields empty to skip their updating
local ItemName = "12"
local ItemPreviewFile = "" -- Absolute path on disk, e.g. "D:/MyWorkshopItem/Preview.png". PNG or JPEG, ideally 512×512 or larger
local ItemContentFolder = "C:/Users/PC/Downloads/111" -- Absolute folder path on disk, e.g. "D:/MyWorkshopItem/Content".
local ChangeNote = "" -- Change note, will be visible in item update history 

--EResult error codes description:
--https://partner.steamgames.com/doc/api/steam_api#EResult

local This = {}

-- Executes automatically after the script load
function This:OnConstruct()
    if (ItemId == 0) then
        LogInfo("Creating a workshop item. Please, wait...")
        AGPlayerController.Test_CreateWorkshopItem(This.OnItemCreated)
    else
        This:UpdateWorkshopItem(ItemId)
    end
end

--- Callback from workshop item creation.
---@param bSuccess boolean 
---@param CreatedItemId number Workshop item Id that was just created
function This:OnItemCreated(bSuccess, CreatedItemId)
    print(bSuccess)
    if (bSuccess) then
        LogInfo("Successfully created a workshop item. Published item Id:" .. CreatedItemId)
        This:UpdateWorkshopItem(CreatedItemId)
    else
        LogError("Failed to create a workshop item")
    end
end

--- Updates the given workshop item with the non-empty fields defined at the top of the file.
---@param ItemIdToUpdate number
function This:UpdateWorkshopItem(ItemIdToUpdate)
    LogInfo("Updating the workshop item. Please, wait...")
    AGPlayerController.Test_UploadWorkshopItem(ItemIdToUpdate, ItemContentFolder, ItemPreviewFile, ItemName, ChangeNote, This.UpdateWorkshopItemComplete)
end

--- Callback from workshop item update.
---@param bSuccess boolean 
function This:UpdateWorkshopItemComplete(bSuccess)
    if (bSuccess) then
        LogInfo("Successfully updated the workshop item")
    else
        LogError("Failed to update the workshop item")
    end
    LogInfo("The script has complete its work")
end

return This
