if _G.ArtifactFinder then
    local res = messagebox("Attempt to execute script again when it has already been ran. Execute anyway?","Artifact Finder",4)
    if res ~= 6 then
        return
    end
end
_G.ArtifactFinder = true
rconsoleclear()
local LocalPlayer = game:GetService("Players").LocalPlayer
local CreateGui = function(shard)
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 50, 0, 50)
    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TextLabel.Size = UDim2.new(0, 50, 0, 50)
    TextLabel.Font = Enum.Font.Nunito
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14.000
    BillboardGui.Parent = shard.CenterPoint
    coroutine.wrap(function()
        while wait(0.1) do
            TextLabel.Text = shard.Name .. ": " .. tostring(math.floor(LocalPlayer:DistanceFromCharacter(shard.CenterPoint.Position) + 0.5))
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
