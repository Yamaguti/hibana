
local Grid = relativeRequire("grid", ...)
local Game = {}




function Game.new()
    local game = display.newGroup()

    ----

    local grid = Grid.new()
    game.grid = grid
    grid:insertChildrenIn(game)

    ----

    local Button = require("lib.button")
    local button = Button.new({
        build = function ()
            local rect = display.newRect(0, 0, 100, 100)
            rect:setFillColor(1, 0, 0, 0.5)
            return rect
        end,
        onRelease = function ()
            local amount = math.random(200)
            for _ = 1, amount do
                grid[math.random(1, #grid)][math.random(1, #grid[1])]:turnOn()
            end
        end
    })
    button.x = centerX
    button.y = centerY
    game:insert(button)

    ----

    timer.performWithDelay(500, function()
        grid:computeNextStep()
    end, 0)

    ----

    return game
end

return Game