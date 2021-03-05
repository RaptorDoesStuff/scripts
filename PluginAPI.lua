return {
    CreatePlugin = function(name,desc)
        return {
            Plugin = {
                PluginName = name,
                PluginDescription = desc,
                Commands = {}
            },
            AddCMD = function(self,name,desc,aliases,func)
                self.Plugin.Commands[name] = {
                    ListName = name,
                    Description = desc,
                    Aliases = aliases or {},
                    Function = func
                }
            end
        }
    end
}
