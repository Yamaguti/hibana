
local Cell = relativeRequire("cell", ...)
local Game = {}



local function populateGrid(game, grid)
    for i = screenLeft, screenRight, (Cell.squareSize+5) do
        grid[i] = {}
        for j = screenTop, screenBottom, (Cell.squareSize+5) do
            local cell = Cell.new()
            cell.x = i
            cell.y = j
            grid[i][j] = cell

            game:insert(cell)
        end
    end
end


function Game.new()
    local game = display.newGroup()

    ----

    local grid = {}
    populateGrid(game, grid)
    game.grid = grid

    ----

    ----

    return game
end

return Game