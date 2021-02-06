-- Init Msg
rconsoleprint("Remote Spy by an epic haxxor\n\n")

-- Variables
local Classes = {FireServer = "RemoteEvent",InvokeServer = "RemoteFunction",Fire = "BindableEvent",Invoke = "BindableFunction"}
local IgnoreEvents = {MessagesChanged = 0,ChatBarFocusChanged = 0,MessagePosted = 0,Event = 0}

-- Functions
local HandleRemote = function(instance,name,class,args,isSyn)
    if IgnoreEvents[name] == 0 then return end
    local path = instance:GetFullName()
    rconsoleprint("Name: " .. name .. "\nClass: " .. class .. "\nPath: " .. ((path == name and "nil") or "game." .. path) .. "\nArgs: ")
    for _, arg in ipairs(args) do
        rconsoleprint(((type(arg) == "string" and "\"" .. arg .. "\"") or tostring(arg)) .. ", ")
    end
    rconsoleprint("\nIs Synapse Call: " .. tostring(isSyn) .. "\n\n")
end

-- Hook
local gameMt = getrawmetatable(game)
local oldNc = gameMt.__namecall
setreadonly(gameMt,false)
gameMt.__namecall = newcclosure(function(s,...)
    local Class = Classes[getnamecallmethod()]
    if Class ~= nil then
        HandleRemote(s,s.Name,Class,{...},checkcaller())
    end
    return oldNc(s,...)
end)
setreadonly(gameMt,true)

-- Test
local ExampleEvent = Instance.new("RemoteEvent")
ExampleEvent.Name = "ExampleEvent"
ExampleEvent:FireServer("This is an example remote event",69,true)
