---Why we haven't exposed the loading screen to the standalone module, loading at early phase:
---TL;DR: It was just quick to develop and debug; Moving to another module now can break everything.
---Long story: in LS, we use UMG widget and DeveloperSettings to store its reference. This probably won't work at game init.
---The easiest solution (if you'll ever need an initial loading screen): make another implementation of "initial loading screen", from scratch.
---Use plain MoviePlayer + Slate, make no UObject and DeveloperSettings references.
---@class ULoadingScreenManager : UGameInstanceSubsystem
---@field protected CurrentLoadingScreen ULoadingScreen
---@field public OnLoadingScreenStarted MulticastDelegate|fun()
---@field public OnLoadingScreenDestroyed MulticastDelegate|fun()
ULoadingScreenManager = {}

---@param __WorldContext UObject
function ULoadingScreenManager.DestroyLoadingScreen(__WorldContext) end

---@return ULoadingScreenManager
function ULoadingScreenManager.Get() end

---@param __WorldContext UObject
---@return boolean
function ULoadingScreenManager.IsLoadingScreenRunning(__WorldContext) end

---@param __WorldContext UObject
---@param Type? ELoadingScreenType @[default: Fullscreen]
function ULoadingScreenManager.StartLoadingScreen(__WorldContext, Type) end

