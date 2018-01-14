
local Private = {}
local Button = {}

function Private.touchIsInBounds(button, touchEvent)
    local touchArea = button._touchArea

    local localX, localY = touchArea.parent:contentToLocal(touchEvent.x, touchEvent.y)
    localX, localY = localX - touchArea.x, localY - touchArea.y

    local halfWidth, halfHeight =
        button.config.width*0.5, button.config.height*0.5

    return -halfHeight <= localY and localY <= halfHeight
       and  -halfWidth <= localX and localX <= halfWidth
end


function Private.touch(button, event)
    local phase = event.phase

    if phase == "began" then
        display.getCurrentStage():setFocus(touchArea)
        Private.scaleContentsDown(button)

    elseif phase == "moved" then

    elseif phase == "ended" then
        display.getCurrentStage():setFocus(nil)
        Private.scaleContentsUp(button)
        event.target:onRelease()
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

    local touchArea = display.newRect(0,
                                      0,
                                      config.width or contents.width,
                                      config.height or contents.height
                                     )
    touchArea:setFillColor(0, 0, 0.5, 0.5)
    touchArea.isVisible = false
    button:insert(touchArea)
    button._touchArea = touchArea

    config.width  = touchArea.width
    config.height = touchArea.height

    ----

    button.touch = Private.touch
    button.onRelease = config.onRelease

    ----

    button:addEventListener("touch")

    return button
end

return Button