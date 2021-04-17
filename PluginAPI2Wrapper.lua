loadstring(game:HttpGet("https://raw.githubusercontent.com/RaptorDoesStuff/scripts/main/PluginAPI2.lua"))()
return {
    CreatePlugin = function(name,desc)
        local plugin = pcreate(name,desc)
        plugin.AddCmd = function(self,name,listname,desc,aliases)
            local CmdEvent = Instance.new("BindableEvent")
            paddcmd(self,name,listname,desc,aliases,function(...)
                CmdEvent:Fire(...)
            end)
            return CmdEvent.Event
        end
    end
}
