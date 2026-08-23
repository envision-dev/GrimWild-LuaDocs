---@meta
---Material Instances may be used to change the appearance of a material without incurring an expensive recompilation of the material.
---General modification of the material cannot be supported without recompilation, so the instances are limited to changing the values of
---predefined material parameters. The parameters are statically defined in the compiled material by a unique name, type and default value.
---@class UMaterialInstanceConstant : UMaterialInstance
---@field public PhysMaterialMask UPhysicalMaterialMask @Physical material mask to use for this graphics material. Used for sounds, effects etc.
UMaterialInstanceConstant = {}

---Get the scalar (float) parameter value from an MIC
---@param ParameterName string
---@return number
function UMaterialInstanceConstant:K2_GetScalarParameterValue(ParameterName) end

---Get the MIC texture parameter value
---@param ParameterName string
---@return UTexture
function UMaterialInstanceConstant:K2_GetTextureParameterValue(ParameterName) end

---Get the MIC vector parameter value
---@param ParameterName string
---@return FLinearColor
function UMaterialInstanceConstant:K2_GetVectorParameterValue(ParameterName) end

