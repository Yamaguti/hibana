
local utils = {}

function utils.setUtils()
    --stackoverflow:
    --https://stackoverflow.com/questions/9145432/load-lua-files-by-relative-path
    function relativeRequire(path, ...)
        local pathOfThisFile = ...
        local folderOfThisFile = pathOfThisFile:match("(.-)[^%.]+$")
        return require(folderOfThisFile .. path)
    end
end

utils.setUtils()

return utils
