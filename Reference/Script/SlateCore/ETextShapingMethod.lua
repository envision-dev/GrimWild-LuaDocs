---Methods that can be used to shape text.
---@class ETextShapingMethod
---@field public Auto ETextShapingMethod [0] Automatically picks the fastest possible shaping method (either KerningOnly or FullShaping) based on the reading direction of the text. Left-to-right text uses the KerningOnly method, and right-to-left text uses the FullShaping method.
---@field public KerningOnly ETextShapingMethod [1] Provides fake shaping using only kerning data. This can be faster than full shaping, but won't render complex right-to-left or bi-directional glyphs (such as Arabic) correctly. This can be useful as an optimization when you know your text block will only show simple glyphs (such as numbers).
---@field public FullShaping ETextShapingMethod [2] Provides full text shaping, allowing accurate rendering of complex right-to-left or bi-directional glyphs (such as Arabic). This mode will perform ligature replacement for all languages (such as the combined "fi" glyph in English).
ETextShapingMethod = {}
