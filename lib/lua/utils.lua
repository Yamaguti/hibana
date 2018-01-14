
local filePath = ...
local Utils    = {}



function Utils.setUtils()
    relativeRequire("utils.serializetable", filePath)
    function printTable(...)
        print(Utils.serializeTable(...))
    end
end



return Utils
