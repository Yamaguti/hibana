
local Table   = require("lib.lua.table")
local Private = {}
local Button  = {}



function Private.touchIsInBounds(button, touchEvent)
    local touchArea = button._touchArea

    local localX, localY = touchArea.parent:contentToLocal(touchEvent.x, touchEvent.y)
    localX, localY = localX - touchArea.x, localY - touchArea.y

    local halfWidth, halfHeight =
        button.config.width*0.5, button.config.height*0.5

    return -halfHeight <= localY and localY <= halfHeight
       and -halfWidth  <= localX and localX <= halfWidth
end

function Private.touch(touchArea, event)
    local phase  = event.phase
    local button = touchArea._button

    if phase == "began" then
        display.getCurrentStage():setFocus(touchArea)
        button.isTouchInBounds = true
        button.touchStarted    = true

        Private.scaleContentsDown(button)

    elseif phase == "moved" then
        if not button.touchStarted then
            local newEvent = Table.shallowCopy(event)
            newEvent.phase = "began"
            touchArea:dispatchEvent(newEvent)
        end

        local isTouchCurrenlyInBounds   = Private.touchIsInBounds(button, event)
        local isTouchPreviouslyInBounds = button.isTouchInBounds

        if isTouchCurrenlyInBounds then
            if not isTouchPreviouslyInBounds then
                Private.scaleContentsDown(button)
            end
            button.isTouchInBounds = true
        else
            if isTouchPreviouslyInBounds then
                Private.scaleContentsUp(button)
            end
            button.isTouchInBounds = false
        end

    elseif phase == "ended"
        or phase == "cancelled"
    then
        display.getCurrentStage():setFocus(nil)
        Private.scaleContentsUp(button)
        button.isTouchInBounds = nil
        button.touchStarted    = nil

        if Private.touchIsInBounds(button, event) then
            button:onRelease()
        end
    end

    return true
end

function Private.scaleContentsUp(button)
    button._contents.xScale = 1
    button._contents.yScale = 1
end

function Private.scaleContentsDown(button)
    button._contents.xScale = 0.9
    button._contents.yScale = 0.9
end



function Button.new(config)
    local button  = display.newGroup()
    button.config = config

    ----

    local contents = config.build()
    button:insert(contents)
    button._contents = contents

    ----

    local touchArea =
        display.newRect(0,
         0,
         config.width or contents.width,
         config.height or contents.height
        )
    touchArea:setFillColor(0, 0, 0.5, 0.5)
    touchArea.isVisible = false
    touchArea.isHitTestable = true
    button:insert(touchArea)
    button._touchArea = touchArea
    touchArea._button = button

    config.width  = touchArea.width
    config.height = touchArea.height

    ----

    touchArea.touch  = Private.touch
    button.onRelease = config.onRelease

    ----

    touchArea:addEventListener("touch")

    return button
end

return Button