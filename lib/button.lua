
local Private = {}
local Button = {}

function Private.touch(button, event)
    local phase = event.phase

    if phase == "ended" then
        event.target:onRelease()
    end

    return true
end


function Button.new(config)
    local button = display.newGroup()

    ----

    local contents = config.build()
    button:insert(contents)

    ----

    local touchArea = display.newRect(0,
                                      0,
                                      config.width or contents.width,
                                      config.height or contents.height
                                     )
    touchArea:setFillColor(0, 0, 0.5, 0.5)
    button:insert(touchArea)

    ----

    button.touch = Private.touch
    button.onRelease = config.onRelease

    ----

    button:addEventListener("touch")

    return button
end

return Button