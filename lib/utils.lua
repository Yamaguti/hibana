
local utils = {}

function utils.setUtils()
    function relativeRequire(path)
        return require(path)
    end
end

return utils
