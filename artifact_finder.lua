if _G.ArtifactFinder then
    local res = messagebox("Attempt to execute script again when it has already been ran. Execute anyway?","Artifact Finder",4)
    if res ~= 6 then
        return
    end
end
_G.ArtifactFinder = true
rconsoleclear()
local ESP_UPDATE_TICK = ({...}) or 0.1
local LocalPlayer = game:GetService("Players").LocalPlayer
local BillboardGui_TEMPLATE = Instance.new("BillboardGui")
local TextLabel_TEMPLATE = Instance.new("TextLabel")
BillboardGui_TEMPLATE.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui_TEMPLATE.Active = true
BillboardGui_TEMPLATE.AlwaysOnTop = true
BillboardGui_TEMPLATE.LightInfluence = 1.000
BillboardGui_TEMPLATE.Size = UDim2.new(0, 50, 0, 50)
TextLabel_TEMPLATE.Parent = BillboardGui_TEMPLATE
TextLabel_TEMPLATE.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextLabel_TEMPLATE.Size = UDim2.new(0, 50, 0, 50)
TextLabel_TEMPLATE.Font = Enum.Font.Nunito
TextLabel_TEMPLATE.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_TEMPLATE.TextSize = 14.000
TextLabel_TEMPLATE.Text = string.lower(string.sub("AJdSSUsgAjsV",5,7)) -- amogus
local CreateGui = function(shard)
    local Gui = BillboardGui_TEMPLATE:Clone()
    Gui.Parent = shard.CenterPoint
    coroutine.wrap(function()
        while true do
            Gui.TextLabel.Text = shard.Name .. ": " .. tostring(math.floor(LocalPlayer:DistanceFromCharacter(shard.CenterPoint.Position) + 0.5))
            wait(ESP_UPDATE_TICK)
        end
    end)()
end
rconsolename("Artifact Finder")
rconsoleprint("@@WHITE@@")
rconsoleprint("Your current position is (" .. tostring(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position) .. ")\n\n")
local num = 0
for _, shard in ipairs(workspace.Artifacts:GetChildren()) do
    rconsoleprint("@@CYAN@@")
    rconsoleprint("Found an artifact (" .. shard.Name .. ") at position (" .. tostring(shard.CenterPoint.Position) .. ")\n")
    CreateGui(shard)
    num += 1
end
if num == 0 then
    rconsoleprint("@@RED@@")
    rconsoleprint("Found no artifacts\n")
end
