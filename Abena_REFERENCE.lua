--______________________________________________________________
--| I did not make this script, it is only here for a reference |
--|_____________________________________________________________|

-- ABena Gui By Itrywaytoohard1 on V3rmillion
	-- Version 3

	local getvalid = tostring(game:HttpGet('https://pastebin.com/raw/bcXX7ntt'))
	if getvalid ~= "true" then

	end

	local notifications = true

	local function sendnotification(bodytext)
		if notifications == true then
			game:GetService("StarterGui"):SetCore("SendNotification", {Title = "ABena Client";Text = tostring(bodytext);Duration = 2;});
		end
	end

	local function activategod()
		if game.Players.LocalPlayer.Character:FindFirstChild("NameTag") then
			game.Players.LocalPlayer.Character.NameTag:Destroy()
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("Wanted") then
			game.Players.LocalPlayer.Character.Wanted:Destroy()
		end
	end

	noclip = false
	game:GetService('RunService').Stepped:connect(function()
		if noclip then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)

		if key == "n" then
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			if noclip == true then
				sendnotification("Noclip Activated")
			else
				sendnotification("Noclip Deactivated")
			end
		end
	end)

	local speed = 5000
	local bodyvelocityenabled = false

	local Imput = game:GetService("UserInputService")
	local Plr = game.Players.LocalPlayer
	local Mouse = Plr:GetMouse()

	function To(position)
		local Chr = Plr.Character
		if Chr ~= nil then
			local ts = game:GetService("TweenService")
			local char = game.Players.LocalPlayer.Character
			local hm = char.HumanoidRootPart
			local dist = (hm.Position - Mouse.Hit.p).magnitude
			local tweenspeed = dist/tonumber(speed)
			local ti = TweenInfo.new(tonumber(tweenspeed), Enum.EasingStyle.Linear)
			local tp = {CFrame = CFrame.new(position)}
			ts:Create(hm, ti, tp):Play()
			if bodyvelocityenabled == true then
				local bv = Instance.new("BodyVelocity")
				bv.Parent = hm
				bv.MaxForce = Vector3.new(100000,100000,100000)
				bv.Velocity = Vector3.new(0,0,0)
				wait(tonumber(tweenspeed))
				bv:Destroy()
			end
		end
	end
	local clicktpenabled = false

	local antinlr = false
	local autoantinlr = coroutine.wrap(function()
		while antinlr == true do
			wait(5)
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "NL" then
					v:Destroy()
				end
			end
		end
		coroutine.yield()
	end)

	local stealplace = function(person)
		local mainpart = ""
		local brickcol = ""
		local brickmat = ""
		print("Node")
		local longfile = "game.ReplicatedStorage.Events.BuildingEvent:FireServer(1, " .. '"' .. tostring(game.Workspace.Buildings[person].Node.Node.Name) .. '"' .. ", " .. "CFrame.new(" .. tostring(game.Workspace.Buildings[person].Node.Node.CFrame) .. ")" .. ")"
		for i,v in pairs(game.Workspace.Buildings[person]:GetDescendants()) do
			if v:IsA("Model") and v.Name ~= "Node" then
				print(v)
				if v:FindFirstChild("Main") then
					mainpart = "Main"
				elseif v:FindFirstChild("Part") then
					mainpart = "Part"
				elseif v:FindFirstChild("MAIN") then
					mainpart = "MAIN"
				end
				if tostring(v[mainpart].BrickColor) == "Institutional White" then
					brickcol = nil
				else
					brickcol = tostring(v[mainpart].BrickColor)
				end
				if v[mainpart].Material == Enum.Material.Air then
					brickmat = nil
				else
					brickmat = tostring(v[mainpart].Material)
					brickmat = string.sub(tostring(brickmat), 15, #brickmat)
				end
				if brickcol ~= nil and brickmat ~= nil then
					longfile = longfile .. "\ngame.ReplicatedStorage.Events.BuildingEvent:FireServer(1, " .. '"' .. tostring(v.Name) .. '"' .. ", " .. "CFrame.new(" .. tostring(v[mainpart].CFrame) .. ")" .. ", nil, " .. 'BrickColor.new(' .. '"' .. tostring(brickcol) .. '"' .. "), nil, nil, " .. '"' ..  tostring(brickmat) .. '"' .. ")"
				elseif brickcol == nil and brickmat ~= nil then
					longfile = longfile .. "\ngame.ReplicatedStorage.Events.BuildingEvent:FireServer(1, " .. '"' .. tostring(v.Name) .. '"' .. ", " .. "CFrame.new(" .. tostring(v[mainpart].CFrame) .. ")" .. ", nil, " .. 'BrickColor.new(' .. 'nil' .. "), nil, nil, " .. '"' ..  tostring(brickmat) .. '"' .. ")"
				elseif brickcol ~= nil and brickmat == nil then
					longfile = longfile .. "\ngame.ReplicatedStorage.Events.BuildingEvent:FireServer(1, " .. '"' .. tostring(v.Name) .. '"' .. ", " .. "CFrame.new(" .. tostring(v[mainpart].CFrame) .. ")" .. ", nil, " .. 'BrickColor.new(' .. '"' .. tostring(brickcol) .. '"' .. "), nil, nil, " .. 'nil' .. ")"
				end
			end
		end
		writefile(tostring(person) .. ".txt", longfile)
	end

	local function createesp(part, colornum, txt ,tcol)
		local color = BrickColor.new("Institutional white")
		if colornum == 1 then
			color = BrickColor.new("Light brick yellow")
		elseif colornum == 2 then
			color = BrickColor.new("Dark grey metallic")
		elseif colornum == 3 then
			color = BrickColor.new("Light grey")
		elseif colornum == 4 then
			color = BrickColor.new("Maroon")
		end
		local a = Instance.new("BillboardGui")
		a.Parent = part
		a.Name = "espp"
		a.Size = UDim2.new(0,20,0,20)
		a.AlwaysOnTop = true
		local b = Instance.new("Frame")
		b.Parent = a
		b.Size = UDim2.new(0,20,0,20)
		b.BorderSizePixel = 0
		b.BackgroundColor = color
		local c = Instance.new("TextLabel")
		c.Parent = b
		c.BackgroundTransparency = 1
		if tcol == 1 then
			c.TextColor3 = Color3.new(0,0,0)
		else
			c.TextColor3 = Color3.new(255,255,255)
		end
		c.Size = UDim2.new(0,20,0,20)
		c.Text = txt
	end

	local espenabled = false

	local MeshPart = ""
	local doesp = coroutine.wrap(function()
		while espenabled == true do
			for i,v in pairs(game.Workspace.Entities:GetChildren()) do
				wait()
				if v:IsA("Model") and v:FindFirstChildOfClass("MeshPart") or v:FindFirstChildOfClass("Part") then
					if v:FindFirstChildOfClass("MeshPart") then
						MeshPart = tostring(v:FindFirstChildOfClass("MeshPart"))
					else
						MeshPart = tostring(v:FindFirstChildOfClass("Part"))
					end
					if v[MeshPart]:FindFirstChild("espp") == nil then
						if v.Name == "Bloxy Cola Shipment" or v.Name == "M1911 Shipment" or v.Name == "Deagle Shipment" then
							createesp(v[MeshPart], 1, tostring(v.Name), 2)
						elseif v.Name == "Jetpack Shipment" or v.Name == "AK Shipment" or v.Name == "Lockpick Shipment" or v.Name == "Recaller Shipment" or v.Name == "C4 Shipment" or v.Name == "Bike" or v.Name == "Gun" or v.Name == "Bike Keys Shipment" or v.Name == "M4 Shipment" then
							createesp(v[MeshPart], 2, tostring(v.Name), 2)
						end
					end
				end
			end
			for i,v in pairs(game.Workspace.MoneyPrinters:GetChildren()) do
				wait()
				if v:IsA("Model") and v:FindFirstChild("Main") then
					if v.Main:FindFirstChild("espp") == nil then
						if v.Name == "Money Printer Basic" then
							createesp(v.Main, 3, tostring(v.Name), 2)
						elseif v.Name == "Money Printer Advanced" then
							createesp(v.Main, 4, tostring(v.Name), 2)
						end
					end
				end
			end
			for i,v in pairs(game.Workspace.Buildings:GetChildren()) do
				wait()
				for i,v in pairs(v:GetChildren()) do
					if v:IsA("Model") and v.Name == "Banker Vault" then
						if v.Main:FindFirstChild("espp") == nil then
							createesp(v.Main, 3, tostring(v.Name), 2)
						end
					end
				end
			end
			wait(1)
		end
		coroutine.yield()
	end)


	local searchplayers = function(input)
		local count = 0
		local inp = string.lower(input)
		for i,v in pairs(game.Players:GetChildren()) do
			if string.match(tostring(string.lower(v.Name)), tostring(inp)) ~= nil then
				count = count + 1
			end
		end
		if count == 1 then
			for i,v in pairs(game.Players:GetChildren()) do
				if string.match(tostring(string.lower(v.Name)), tostring(inp)) ~= nil then
					return(tostring(v.Name))
				end
			end
		else
			return("")
		end
	end

	local actualkillaura = function()
		for i,v in pairs(game.Players:GetChildren()) do
			if v.Flagged.Value == true and v.Name ~= game.Players.LocalPlayer.Name then
				local plrname = v.Name
				local me = game.Players.LocalPlayer.Name
				if game.Workspace:FindFirstChild(plrname) then
					if game.Workspace[plrname]:FindFirstChild("NameTag") and game.Workspace[plrname].NameTag:FindFirstChild("TextLabel") then
						_G.labcolor = tostring(game.Workspace[plrname].NameTag.TextLabel.TextColor)
					end
					if game.Workspace[plrname]:FindFirstChild("HumanoidRootPart") and game.Workspace[plrname]:FindFirstChild("Humanoid") and game.Workspace:FindFirstChild(me) and game.Workspace[me]:FindFirstChild("HumanoidRootPart") and _G.labcolor ==  "Really red" then
						if (game.Workspace[plrname].HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < tonumber(_G.killaurarange) then
							local gun = ""
							local num1 = 2
							local dmg = 100
							if game.Players.LocalPlayer.Character:FindFirstChild("M4") then
								gun = game.Players.LocalPlayer.Character.M4
								num1 = 2
								dmg = 26
							elseif game.Players.LocalPlayer.Character:FindFirstChild("AK") then
								gun = game.Players.LocalPlayer.Character.AK
								num1 = 2
								dmg = 26
							elseif game.Players.LocalPlayer.Character:FindFirstChild("Deagle") then
								gun = game.Players.LocalPlayer.Character.Deagle
								num1 = 1
								dmg = 35
							elseif game.Players.LocalPlayer.Character:FindFirstChild("M1911") then
								gun = game.Players.LocalPlayer.Character.M1911
								num1 = 1
								dmg = 24
							end
							game.ReplicatedStorage.Events.MenuActionEvent:FireServer(33, game.Workspace[plrname].HumanoidRootPart.CFrame, num1, game.Workspace[plrname].Humanoid, dmg, gun)
						end
					end
				end
			end
		end
	end

	local killaura = false

	local kill = coroutine.wrap(function()
		while killaura == true do
			wait(0.3)
			-- Do nothing
		end
		coroutine.yield()
	end)

	-- Instances:
	_G.killaurarange = 100
	local infinitejump = false
	local toplr = ""
	local ESDRPGUI = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local SemiGod = Instance.new("TextButton")
	local ClickTP = Instance.new("TextButton")
	local AntiNL = Instance.new("TextButton")
	local PlayerTP = Instance.new("TextButton")
	local CopySong = Instance.new("TextButton")
	local Noclip = Instance.new("TextButton")
	local CopyNode = Instance.new("TextButton")
	local InfJump = Instance.new("TextButton")
	local ESP = Instance.new("TextButton")
	local TopLabel = Instance.new("TextLabel")
	local Drag = Instance.new("Frame")
	local TextBox = Instance.new("TextBox")
	local Killaura = Instance.new("TextButton")
	local SetKillauraRadius = Instance.new("TextButton")
	local ToggleNotif = Instance.new("TextButton")

	--Properties:

	ESDRPGUI.Name = "ESDRPGUI"
	ESDRPGUI.Parent = game.CoreGui
	ESDRPGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ESDRPGUI
	MainFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.29880476, 0, 0.249291778, 0)
	MainFrame.Size = UDim2.new(0, 504, 0, 353)
	MainFrame.Active = true
	MainFrame.Draggable = true

	SemiGod.Name = "SemiGod"
	SemiGod.Parent = MainFrame
	SemiGod.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	SemiGod.BorderColor3 = Color3.fromRGB(255, 255, 255)
	SemiGod.BorderSizePixel = 5
	SemiGod.Position = UDim2.new(0.029761903, 0, 0.169971675, 0)
	SemiGod.Size = UDim2.new(0, 132, 0, 37)
	SemiGod.Font = Enum.Font.SourceSans
	SemiGod.Text = "Semi Godmode"
	SemiGod.TextColor3 = Color3.fromRGB(255, 255, 255)
	SemiGod.TextSize = 20.000

	ClickTP.Name = "ClickTP"
	ClickTP.Parent = MainFrame
	ClickTP.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	ClickTP.BorderColor3 = Color3.fromRGB(255, 255, 255)
	ClickTP.BorderSizePixel = 5
	ClickTP.Position = UDim2.new(0.369047612, 0, 0.169971675, 0)
	ClickTP.Size = UDim2.new(0, 132, 0, 37)
	ClickTP.Font = Enum.Font.SourceSans
	ClickTP.Text = "Enable Click Tp"
	ClickTP.TextColor3 = Color3.fromRGB(255, 255, 255)
	ClickTP.TextSize = 20.000

	AntiNL.Name = "AntiNL"
	AntiNL.Parent = MainFrame
	AntiNL.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	AntiNL.BorderColor3 = Color3.fromRGB(255, 255, 255)
	AntiNL.BorderSizePixel = 5
	AntiNL.Position = UDim2.new(0.708333313, 0, 0.169971675, 0)
	AntiNL.Size = UDim2.new(0, 132, 0, 37)
	AntiNL.Font = Enum.Font.SourceSans
	AntiNL.Text = "Enable Anti NL"
	AntiNL.TextColor3 = Color3.fromRGB(255, 255, 255)
	AntiNL.TextSize = 20.000

	PlayerTP.Name = "PlayerTP"
	PlayerTP.Parent = MainFrame
	PlayerTP.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	PlayerTP.BorderColor3 = Color3.fromRGB(255, 255, 255)
	PlayerTP.BorderSizePixel = 5
	PlayerTP.Position = UDim2.new(0.708333313, 0, 0.339943349, 0)
	PlayerTP.Size = UDim2.new(0, 132, 0, 37)
	PlayerTP.Font = Enum.Font.SourceSans
	PlayerTP.Text = "TP To Player"
	PlayerTP.TextColor3 = Color3.fromRGB(255, 255, 255)
	PlayerTP.TextSize = 20.000

	CopySong.Name = "CopySong"
	CopySong.Parent = MainFrame
	CopySong.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	CopySong.BorderColor3 = Color3.fromRGB(255, 255, 255)
	CopySong.BorderSizePixel = 5
	CopySong.Position = UDim2.new(0.369047612, 0, 0.339943349, 0)
	CopySong.Size = UDim2.new(0, 132, 0, 37)
	CopySong.Font = Enum.Font.SourceSans
	CopySong.Text = "Copy Song"
	CopySong.TextColor3 = Color3.fromRGB(255, 255, 255)
	CopySong.TextSize = 20.000

	Noclip.Name = "Noclip"
	Noclip.Parent = MainFrame
	Noclip.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	Noclip.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Noclip.BorderSizePixel = 5
	Noclip.Position = UDim2.new(0.0297619104, 0, 0.339943349, 0)
	Noclip.Size = UDim2.new(0, 132, 0, 37)
	Noclip.Font = Enum.Font.SourceSans
	Noclip.Text = "Enable Noclip(N)"
	Noclip.TextColor3 = Color3.fromRGB(255, 255, 255)
	Noclip.TextSize = 20.000

	CopyNode.Name = "CopyNode"
	CopyNode.Parent = MainFrame
	CopyNode.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	CopyNode.BorderColor3 = Color3.fromRGB(255, 255, 255)
	CopyNode.BorderSizePixel = 5
	CopyNode.Position = UDim2.new(0.0297619104, 0, 0.515580773, 0)
	CopyNode.Size = UDim2.new(0, 132, 0, 37)
	CopyNode.Font = Enum.Font.SourceSans
	CopyNode.Text = "Copy Node"
	CopyNode.TextColor3 = Color3.fromRGB(255, 255, 255)
	CopyNode.TextSize = 20.000

	InfJump.Name = "InfJump"
	InfJump.Parent = MainFrame
	InfJump.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	InfJump.BorderColor3 = Color3.fromRGB(255, 255, 255)
	InfJump.BorderSizePixel = 5
	InfJump.Position = UDim2.new(0.369047612, 0, 0.515580773, 0)
	InfJump.Size = UDim2.new(0, 132, 0, 37)
	InfJump.Font = Enum.Font.SourceSans
	InfJump.Text = "Enable Inf Jump"
	InfJump.TextColor3 = Color3.fromRGB(255, 255, 255)
	InfJump.TextSize = 20.000

	ESP.Name = "ESP"
	ESP.Parent = MainFrame
	ESP.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	ESP.BorderColor3 = Color3.fromRGB(255, 255, 255)
	ESP.BorderSizePixel = 5
	ESP.Position = UDim2.new(0.708333313, 0, 0.515580773, 0)
	ESP.Size = UDim2.new(0, 132, 0, 37)
	ESP.Font = Enum.Font.SourceSans
	ESP.Text = "Enable ESP"
	ESP.TextColor3 = Color3.fromRGB(255, 255, 255)
	ESP.TextSize = 20.000

	TopLabel.Name = "TopLabel"
	TopLabel.Parent = MainFrame
	TopLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopLabel.BackgroundTransparency = 1.000
	TopLabel.BorderSizePixel = 0
	TopLabel.Position = UDim2.new(0.301587313, 0, 0.0651558042, 0)
	TopLabel.Size = UDim2.new(0, 200, 0, 29)
	TopLabel.Font = Enum.Font.SourceSans
	TopLabel.Text = "ABena Client"
	TopLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TopLabel.TextSize = 25.000
	TopLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

	Drag.Name = "Drag"
	Drag.Parent = MainFrame
	Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Drag.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Drag.BorderSizePixel = 0
	Drag.Size = UDim2.new(0, 504, 0, 11)

	TextBox.Parent = MainFrame
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.210317463, 0, 0.847025454, 0)
	TextBox.Size = UDim2.new(0, 292, 0, 45)
	TextBox.Font = Enum.Font.SourceSans
	TextBox.Text = "Player Name"
	TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.TextSize = 20.000

	Killaura.Name = "Killaura"
	Killaura.Parent = MainFrame
	Killaura.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	Killaura.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Killaura.BorderSizePixel = 5
	Killaura.Position = UDim2.new(0.0297619104, 0, 0.688385308, 0)
	Killaura.Size = UDim2.new(0, 132, 0, 37)
	Killaura.Font = Enum.Font.SourceSans
	Killaura.Text = "Enable Killaura"
	Killaura.TextColor3 = Color3.fromRGB(255, 255, 255)
	Killaura.TextSize = 20.000

	SetKillauraRadius.Name = "SetKillauraRadius"
	SetKillauraRadius.Parent = MainFrame
	SetKillauraRadius.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	SetKillauraRadius.BorderColor3 = Color3.fromRGB(255, 255, 255)
	SetKillauraRadius.BorderSizePixel = 5
	SetKillauraRadius.Position = UDim2.new(0.369047612, 0, 0.688385308, 0)
	SetKillauraRadius.Size = UDim2.new(0, 132, 0, 37)
	SetKillauraRadius.Font = Enum.Font.SourceSans
	SetKillauraRadius.Text = "Set Killaura Range"
	SetKillauraRadius.TextColor3 = Color3.fromRGB(255, 255, 255)
	SetKillauraRadius.TextSize = 20.000

	ToggleNotif.Name = "ToggleNotif"
	ToggleNotif.Parent = MainFrame
	ToggleNotif.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	ToggleNotif.BorderColor3 = Color3.fromRGB(255, 255, 255)
	ToggleNotif.BorderSizePixel = 5
	ToggleNotif.Position = UDim2.new(0.708333313, 0, 0.688385308, 0)
	ToggleNotif.Size = UDim2.new(0, 132, 0, 37)
	ToggleNotif.Font = Enum.Font.SourceSans
	ToggleNotif.Text = "Disable Notifications"
	ToggleNotif.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleNotif.TextSize = 20.000

	SemiGod.MouseButton1Down:Connect(function()
		activategod()
		sendnotification("Semi Godmode Activated")
	end)

	ClickTP.MouseButton1Down:Connect(function()
		if clicktpenabled == true then
			clicktpenabled = false
			ClickTP.Text = "Enable Click Tp"
			sendnotification("Click TP Disabled")
		else
			clicktpenabled = true
			ClickTP.Text = "Disable Click Tp"
			sendnotification("Click TP Enabled")
		end
	end)

	AntiNL.MouseButton1Down:Connect(function()
		if antinlr == true then
			AntiNL.Text = "Enable Anti NL"
			antinlr = false
			sendnotification("Anti NL Disabled")
		else
			AntiNL.Text = "Disable Anti NL"
			antinlr = true
			autoantinlr()
			sendnotification("Anti NL Enabled")
		end
	end)

	PlayerTP.MouseButton1Down:Connect(function()
		toplr = searchplayers(TextBox.Text)
		if game.Workspace:FindFirstChild(toplr) then
			if game.Workspace[toplr]:FindFirstChild("HumanoidRootPart") then
				To(game.Workspace[toplr].HumanoidRootPart.Position)
			end
		else
			sendnotification("Player Not Found Or Multiple Matches Found")
		end
	end)

	CopySong.MouseButton1Down:Connect(function()
		local text = searchplayers(tostring(TextBox.Text))
		if game.Workspace.Buildings:FindFirstChild(text) then
			if game.Workspace.Buildings[text]:FindFirstChild("Jukebox") then
				local audiofiles = ""

				pcall(function()
					audiofiles = readfile("audios.txt")
				end)

				if audiofiles == "" then
					writefile("audios.txt", "--Audio copier by Itrywaytoohard1")
				end

				local previoustext = readfile("audios.txt")
				local copytext = previoustext .. "\r" .. text .. " " .. tostring(game.Workspace.Buildings[text].Jukebox.Speaker.Sound.SoundId)
				local title = tostring("audios.txt")
				writefile(title, copytext)
				sendnotification("Copied song to audios.txt")
			else
				sendnotification("Jukebox not found")
			end
		else
			sendnotification("Jukebox not found")
		end
	end)

	Noclip.MouseButton1Down:Connect(function()
		if noclip == true then
			noclip = false
			sendnotification("Noclip Deactivated")
		else
			noclip = true
			sendnotification("Noclip Activated")
		end
	end)

	CopyNode.MouseButton1Down:Connect(function()
		local target = searchplayers(tostring(TextBox.Text))
		if game.Workspace.Buildings:FindFirstChild(target) then
			stealplace(target)
			sendnotification("Node Copied")
		else
			sendnotification("Player Not Found Or Multiple Matches Found")
		end
	end)

	InfJump.MouseButton1Down:Connect(function()
		if infinitejump == true then
			infinitejump = false
			InfJump.Text = "Enable Infinite Jump"
			sendnotification("Infinite Jump Disabled")
		else
			infinitejump = true
			InfJump.Text = "Disable Infinite Jump"
			sendnotification("Infinite Jump Enabled")
		end
	end)

	ESP.MouseButton1Down:Connect(function()
		if espenabled == true then
			espenabled = false
			ESP.Text = "Enable ESP"
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if v.Name == "espp" then
					v:Destroy()
				end
			end
			sendnotification("ESP Disabled")
		else
			ESP.Text = "Disable ESP"
			espenabled = true
			doesp()
			sendnotification("ESP Enabled")
		end
	end)

	Imput.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and Imput:IsKeyDown(Enum.KeyCode.LeftControl) and clicktpenabled == true then
			To(Mouse.Hit.p)
		elseif Imput:IsKeyDown(Enum.KeyCode.RightControl) then
			if MainFrame.Visible == true then
				MainFrame.Visible = false
				sendnotification("GUI Hidden")
			else
				MainFrame.Visible = true
				sendnotification("GUI Shown")
			end
		end
	end)

	Killaura.MouseButton1Down:Connect(function()
		if killaura == true then
			killaura = false
			Killaura.Text = "Enable Killaura"
			sendnotification("Killaura Disabled")
		else
			killaura = true
			Killaura.Text = "Disable Killaura"
			--kill()
			sendnotification("Killaura Enabled")
		end
	end)

	ToggleNotif.MouseButton1Down:Connect(function()
		if notifications == true then
			notifications = false
		else
			notifications = true
		end
	end)

	SetKillauraRadius.MouseButton1Down:Connect(function()
		_G.killaurarange = tonumber(TextBox.Text)
		sendnotification("Set Killaura Range To" .. tostring(TextBox.Text))
	end)

	game:GetService("UserInputService").JumpRequest:connect(function()
		if infinitejump == true then
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
	end)
