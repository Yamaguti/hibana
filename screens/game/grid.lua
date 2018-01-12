
local Cell    = relativeRequire("cell", ...)
local Private = {}


-- Helpers

local function inBounds(i, max)
    return i < max and i >   1
end

local function countAliveNeighbors(auxGrid, i, j)
    local count = 0

    for k = -1, 1 do
        for l = -1, 1 do
            if  inBounds(i + k, #auxGrid)
            and inBounds(j + k, #auxGrid[1])
            then
                count = count + (auxGrid[i+k][j+l] == true and 1 or 0)
            end
        end
    end

    return count - (auxGrid[i][j] == true and 1 or 0)
end


-- Private

function Private.populateGrid(grid)
    local lin = 0
    for i = screenLeft, screenRight, (Cell.squareSize+5) do
        lin = lin + 1
        grid[lin] = {}

        local col = 0
        for j = screenTop, screenBottom, (Cell.squareSize+5) do
            col = col + 1
            local cell = Cell.new()
            cell.x = i
            cell.y = j
            grid[lin][col] = cell
        end
    end
end



-- Public

local function insertChildrenIn(grid, parent)
    for i = 1, #grid do
        for j = 1, #grid[i] do
            parent:insert(grid[i][j])
        end
    end
end

local function computeNextStep(grid)
    local aux = {}

    for i = 1, #grid do
        aux[i] = {}
        for j = 1, #grid[i] do
            aux[i][j] = grid[i][j].on
        end
    end

    for i = 1, #grid do
        for j = 1, #grid[i] do
            local cell = grid[i][j]
            local amountNeighbors = countAliveNeighbors(aux, i, j)

            if cell.on then
                if amountNeighbors < 2
                or amountNeighbors > 3 then
                    cell:turnOff()
                end
            else
                if amountNeighbors == 3 then
                    cell:turnOn()
                end
            end
        end
    end
end

local function new()
    local grid = {}

    Private.populateGrid(grid)
    grid.insertChildrenIn = insertChildrenIn
    grid.computeNextStep  = computeNextStep

    return grid
end

return {
    new = new
}