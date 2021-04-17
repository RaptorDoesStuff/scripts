pcreate = function(name,desc)
    return {
        PluginName = name,
        PluginDescription = desc,
        Commands = {}
    }
end
paddcmd = function(plugin,name,listname,desc,aliases,func)
    plugin.Commands[name] = {
        ListName = listname,
        Description = desc,
        Aliases = aliases or {},
        Function = func
    }
end
