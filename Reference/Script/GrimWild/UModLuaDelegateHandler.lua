---@meta
---Delegate handler created by mod/dev scripts. Inherits ULuaDelegateHandler so UE routes
---ProcessEvent to us when the delegate fires. Implements ILuaOwnedHandle so the owning module's
---teardown can clean it up.
---Note: We bind and unbind through FScriptDelegate::BindUFunction and
---FMulticastDelegateProperty::AddDelegate/RemoveDelegate instead of going through FDelegateRegistry,
---since its own handler creation (CreateHandler) is private and would duplicate the bookkeeping we
---already do here.
---Note: we use UModLuaDelegateHandler for passing lua functions to CPP.
---But we use UnLua's modified ULuaDelegateHandler for "Single-cast Delegates passed as UFUNCTION parameters".
---@class UModLuaDelegateHandler : ULuaDelegateHandler
UModLuaDelegateHandler = {}

