
relativeRequire("utils.serializetable", ...)

local Utils = {}



function Utils.setUtils()
    function printTable(...)
        print(Utils.serializeTable(...))
    end
end



return Utils
