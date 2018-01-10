
local Cell = {}
Cell.squareSize = 12

function Cell.new()
    local rect = display.newRect(0, 0, Cell.squareSize, Cell.squareSize)

    -- rect:setFillColor(math.random(), 0, math.random(), 1)
    rect:setFillColor(0.2, 0.2, 0.2, 1)

    return rect
end

return Cell