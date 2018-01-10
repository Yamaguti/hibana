
require("lib.utils")


-- easy global screen dimensions
local function setDimensionGlobals()
    -- https://docs.coronalabs.com/api/library/display/contentCenterX.html
    -- https://docs.coronalabs.com/api/library/display/contentWidth.html

    screenWidth  = display.contentWidth
    screenHeight = display.contentHeight

    centerX      = display.contentCenterX
    centerY      = display.contentCenterY
end

setDimensionGlobals()
