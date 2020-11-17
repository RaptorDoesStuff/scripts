-- Init
local ver = "1.0"
local plr = game:GetService("Players").LocalPlayer
local SysMsg = function(txt)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "PrisonHaxx v" .. ver,
        Text = txt
    })
end
if not isfolder("PrisonHaxx") or not isfile("PrisonHaxx/UI.lua") then
	SysMsg("Downloading UI")
	makefolder("PrisonHaxx")
	writefile("PrisonHaxx/UI.lua",game:HttpGet("https://raw.githubusercontent.com/Kiwi-i/wallys-ui-fork/master/lib.lua",true))
end
local lib = loadfile("PrisonHaxx/UI.lua")()
local Remotes = {
    ItemHandler = function(type,item,event)
        game:GetService("Workspace").Remote.ItemHandler:InvokeServer(game:GetService("Workspace").Prison_ITEMS[type][item][event])
    end,
    Arrest = function(part)
        game:GetService("Workspace").Remote.arrest:InvokeServer(part)
	end,
	MeleeEvent = function(instance)
		game:GetService("ReplicatedStorage").meleeEvent:FireServer(instance)
	end
}
local ModGun = function(gun,tab)
	gun = plr.Backpack:WaitForChild(gun)
	gun.Name = tab.Name
    local gunModule = require(gun.GunStates)
    for i, v in pairs(tab) do
        gunModule[i] = v
    end
end
local TeleportPlr = function(...)
	local pos = {...}
	local hrp = plr.Character.HumanoidRootPart
	if pos[2] == nil then
		hrp.CFrame = pos
		return
	end
	hrp.CFrame = CFrame.new(Vector3.new(pos[1],pos[2],pos[3]))
end
SysMsg("Initialization Complete")

-- Player Window
local PlrWin = lib:CreateWindow("Player")
local Admin = PlrWin:Button("Infinite Yield Admin",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",true))()
end)
local RemoveDoors = PlrWin:Button("Remove Doors",function()
	game:GetService("Workspace").Doors:Destroy()
end)
local ModAK = PlrWin:Button("Mod AK-47",function()
    ModGun("AK-47",{
		Name = "High Energy Laser Pointer",
        MaxAmmo = math.huge,
        CurrentAmmo = math.huge,
        FireRate = 0,
        ReloadTime = 0,
        Bullets = 8
    })
end)
local ModRem = PlrWin:Button("Mod Remington",function()
    ModGun("Remington 870",{
		Name = "Machine Shotgun",
        MaxAmmo = math.huge,
        CurrentAmmo = math.huge,
        FireRate = 0,
        ReloadTime = 0,
        Bullets = 20,
        AutoFire = true
    })
end)
local ModM9 = PlrWin:Button("Mod M9",function()
    ModGun("M9",{
		Name = ".50 Caliber M9",
        MaxAmmo = math.huge,
        CurrentAmmo = math.huge,
        FireRate = 0,
        ReloadTime = 0,
        Bullets = 50
    })
end)
local ModTaser = PlrWin:Button("Mod Taser",function()
    ModGun("Taser",{
		Name = "Inmate Annoyance Device",
        AutoFire = true,
        MaxAmmo = math.huge,
        CurrentAmmo = math.huge,
        FireRate = 0,
        ReloadTime = 0
    })
end)
local ClickArrest = PlrWin:Button("Click Arrest",function()
    local mouse = plr:GetMouse()
    mouse.Button1Down:Connect(function()
        Remotes.Arrest(mouse.Target)
    end)
end)
local SuperPunch = PlrWin:Button("Super Punch",function() 
	-- Script isn't mine originally, I modified it for readability, original here https://v3rmillion.net/showthread.php?tid=558620
	local mainRemotes = game.ReplicatedStorage
	local meleeRemote = mainRemotes['meleeEvent']
	local mouse = game.Players.LocalPlayer:GetMouse()
	local punching = false
	local cooldown = false
	local punch = function()
		cooldown = true
		local part = Instance.new("Part", game.Players.LocalPlayer.Character)
		part.Transparency = 1
		part.Size = Vector3.new(5, 2, 3)
		part.CanCollide = false
		local w1 = Instance.new("Weld", part)
		w1.Part0 = game.Players.LocalPlayer.Character.Torso
		w1.Part1 = part
		w1.C1 = CFrame.new(0,0,2)
		part.Touched:Connect(function(hit)
		if game.Players:FindFirstChild(hit.Parent.Name) then
			local plr = game.Players:FindFirstChild(hit.Parent.Name)
				if plr.Name ~= game.Players.LocalPlayer.Name then
					part:Destroy()
					for i = 1,100 do
						meleeRemote:FireServer(plr)
					end
				end
			end
		end)
		wait(1)
		cooldown = false
		part:Destroy()
	end
	mouse.KeyDown:Connect(function(key)
		if cooldown == false then
			if key:lower() == "f" then
				punch()
			end
		end
	end)
end)
local WsBox = PlrWin:Box("WalkSpeed",{
    flag = "WS"
},function(new,old,enter)
    plr.Character.Humanoid.WalkSpeed = new
end)
local JpBox = PlrWin:Box("JumpPower",{
    flag = "JP"
},function(new,old,enter)
    plr.Character.Humanoid.JumpPower = new
end)

-- Teleports Window
local TpWin = lib:CreateWindow("Teleports")
local CrimBaseTp = TpWin:Button("TP Into Criminal Base",function()
	TeleportPlr(-927.978271, 94.1287613, 2062.55957)
end)
local YardTp = TpWin:Button("TP Into Prison Yard",function()
	TeleportPlr(822.62616, 130.039948, 2570.91821)
end)
local PrisonTp = TpWin:Button("TP Into Prison",function()
	TeleportPlr(911.934753, 99.9900055, 2379.67603)
end)
local GuardRoomTp = TpWin:Button("TP Into Guard Room",function()
	TeleportPlr(829.638184, 99.9900055, 2301.35254)
end)
local TpGuns = TpWin:Button("TP Guns To You",function()
	SysMsg("Button not currently functioning")
	--[[ code broken
    local hrpCFrame = plr.Character.HumanoidRootPart.CFrame
    local Items = game:GetService("Workspace").Prison_ITEMS.giver
    Items["Remington 870"].ITEMPICKUP.CFrame = hrpCFrame
    Items.M9.ITEMPICKUP.CFrame = hrpCFrame
    Items["AK-47"].ITEMPICKUP.CFrame = hrpCFrame]]
end)

-- Complete MSG
SysMsg("Loading Complete")
