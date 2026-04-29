---Enumerates types of color values that can be held by Slate color.
---Should we use the specified color? If not, then which color from the style should we use.
---@class ESlateColorStylingMode
---@field public UseColor_Specified ESlateColorStylingMode [0] Color value is stored in this Slate color.
---@field public UseColor_ColorTable ESlateColorStylingMode [1] Color value is stored in the linked color table.
---@field public UseColor_Foreground ESlateColorStylingMode [2] Use the widget's foreground color.
---@field public UseColor_Foreground_Subdued ESlateColorStylingMode [3] Use the widget's subdued color.
---@field public UseColor_UseStyle ESlateColorStylingMode [4] Use the foreground color defined in a widget specific style.
ESlateColorStylingMode = {}
