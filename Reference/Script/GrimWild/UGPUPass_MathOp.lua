---@class UGPUPass_MathOp : UGPUPass
---@field public Operation EGPUMathOp
---@field public InputA FBPMathInput
---@field public InputB FBPMathInput
---@field public InputC FBPMathInput
---@field public ModeParams FLinearColor @Op-specific extra parameters. If:            R = mode (0:A>B, 1:A<B, 2:equals), G = threshold ComponentMask: R = bitmask (bit0=R, bit1=G, bit2=B, bit3=A) MakeFloat4:    R = W channel value
---@field public IfFalseResult FLinearColor @For If operation only: the result when the condition is false.
UGPUPass_MathOp = {}

