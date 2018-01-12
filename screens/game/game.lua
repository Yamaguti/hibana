
local Grid = relativeRequire("grid", ...)
local Game = {}




function Game.new()
    local game = display.newGroup()

    ----

    local grid = Grid.new()
    game.grid = grid
    grid:insertChildrenIn(game)

    ----

    timer.performWithDelay(500, function()
        grid:computeNextStep()
    end, 0)

    ----

    return game
end

return Game