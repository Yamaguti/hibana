
local Table = {}



function Table.shallowCopy(t)
    local t2 = {}
    for key, value in pairs(t) do
        t2[key] = value
    end
    return t2
end



return Table