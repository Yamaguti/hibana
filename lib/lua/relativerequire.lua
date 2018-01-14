--stackoverflow reference link:
--https://stackoverflow.com/questions/9145432/load-lua-files-by-relative-path

local Private    = {}

function Private.processPath(pathString)
    local goBacks = 0

    local it = pathString:gmatch("%.%./")
    while it() do
        goBacks = goBacks + 1
    end

    local path = pathString:match("[^%.%./].*")
    return goBacks, path
end

function Private.processFolder(folder, goBacks)
    for _ = 1, goBacks do
        folder = folder:gsub("[^%.]+%.?$", "")
    end

    return folder
end


function relativeRequire(path, pathOfThisFile)
    local goBacks, processedPath = Private.processPath(path)
    local folderOfThisFile = pathOfThisFile:match("(.-)[^%.]+$")

    local folder = Private.processFolder(folderOfThisFile, goBacks)
    return require(folder .. processedPath)
end