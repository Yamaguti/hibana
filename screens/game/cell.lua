
local Cell = {}
Cell.squareSize = 12

local function turnOn(rect)
    rect.on = true
    rect:setFillColor(math.random(), 0, math.random(), 1)
end

local function turnOff(rect)
    rect.on = false
    rect:setFillColor(0.2, 0.2, 0.2, 1)
end

local function touch(rect, event)
    local phase = event.phase
    if phase == "began"
    or phase == "moved"
    then
        if rect.on then
            rect:turnOff()
        else
            rect:turnOn()
        end
    end
end

function Cell.new()
    local rect = display.newRect(0, 0, Cell.squareSize, Cell.squareSize)

    ----

    rect.turnOn  = turnOn
    rect.turnOff = turnOff

    ----

    turnOff(rect)

    rect.touch = touch
    rect:addEventListener("touch")

    ----

    return rect
end

return Cell