---The Side to use when scaling the UI.
---@class EUIScalingRule
---@field public ShortestSide EUIScalingRule [0] Evaluates the scale curve based on the shortest side of the viewport.
---@field public LongestSide EUIScalingRule [1] Evaluates the scale curve based on the longest side of the viewport.
---@field public Horizontal EUIScalingRule [2] Evaluates the scale curve based on the X axis of the viewport.
---@field public Vertical EUIScalingRule [3] Evaluates the scale curve based on the Y axis of the viewport.
---@field public ScaleToFit EUIScalingRule [4] ScaleToFit - Does not use scale curve. Emulates behavior of scale box by using DesignScreenSize and scaling the content relatively to it.
---@field public Custom EUIScalingRule [5] Custom - Allows custom rule interpretation.
EUIScalingRule = {}
