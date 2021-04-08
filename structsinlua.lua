struct = function(tab)
    setmetatable(tab,{
        __newindex = function(s,i,v)
            if s[i] == nil then
                error("Attempted to create new value in struct",2)
                return
            end
            s[i] = v
        end
    })
    return tab
end
