---Animations for Static Sprites.
---Note for Curves: they all should start from 0.0 time. Negative time values are not supported.
---@class UAnimationData : UGAssetBase
---@field protected TotalTime number @Time of one animation cycle. If this value is greater than Elements' curve Time, it's okay. Curves just start to wrap/clamp it
---@field protected Elements TMap<string, FAnimationElement> @All the components to animate. Grim Wild: IDs here should be mapped with the IDs of the object components from the Game module.
UAnimationData = {}

---Evaluates the Sprite Transform for the given Element in the given time.
---Note: we only replace those OutTransform's members that exist in the Animation.
---Others remain untouched, so to prevent mixing the old and new data, pass an empty OutTransform value.
---@param InTime number
---@param InElementName string
---@param OutTransform FSpriteTransform @[out]
function UAnimationData:EvaluateElement(InTime, InElementName, OutTransform) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UAnimationData:GatherDebugData(DebugString) end

