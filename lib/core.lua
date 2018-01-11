
require("lib.utils")


--- Set global for easy access to screen dimensions. Refs from:
-- https://docs.coronalabs.com/api/library/display/contentCenterX.html
-- https://docs.coronalabs.com/api/library/display/contentWidth.html
local function setDimensionGlobals()
    centerX      = display.contentCenterX
    centerY      = display.contentCenterY

    screenWidth  = display.actualContentWidth
    screenHeight = display.actualContentHeight

    screenLeft   = centerX - screenWidth  * 0.5
    screenRight  = centerX + screenWidth  * 0.5
    screenTop    = centerY - screenHeight * 0.5
    screenBottom = centerY + screenHeight * 0.5
end

setDimensionGlobals()
