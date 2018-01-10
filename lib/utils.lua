
local Utils = {}

function Utils.setUtils()
    --stackoverflow:
    --https://stackoverflow.com/questions/9145432/load-lua-files-by-relative-path
    function relativeRequire(path, ...)
        local pathOfThisFile = ...
        local folderOfThisFile = pathOfThisFile:match("(.-)[^%.]+$")
        return require(folderOfThisFile .. path)
    end
end

Utils.setUtils()

return Utils
