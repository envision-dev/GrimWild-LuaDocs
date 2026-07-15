---We need that to be USTRUCT, so we can use it as UPROPERTY map key
---@class FRenderProxyContainer
---@field public ReleasedComponents_Stationary TArray<integer> @Sprite Pool split by mobility. Stationary and Movable components are pooled separately so same-mode reuse avoids a render-proxy recreate. A cross-bucket borrow is still possible (see ClaimSpriteComponent) but triggers one recreate. Both arrays are stacks: newest elements are reused first; oldest expire via the cycle GC.
---@field public ReleasedComponents_Movable TArray<integer>
FRenderProxyContainer = {}
