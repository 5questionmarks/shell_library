print('Shell Loaded')
local Shell = loadstring(game:HttpGet("https://raw.githubusercontent.com/5questionmarks/shell_library/main/base.lua"))()  

local Shell_LIB = Shell:CreateLib("Steal Others Time")

local SwordPage = Shell_LIB:CreateTab("Sword",3)

SwordPage:CreateSlider("Sword Reach",20,5,function(reachsize)
    local plr = game.Players.LocalPlayer
    plr.Character:WaitForChild("Humanoid"):UnequipTools()
        local tool = plr.Backpack:FindFirstChildOfClass("Tool")
    if tool.Handle:FindFirstChild("SelectionBox") == nil then
        local a = Instance.new("SelectionBox",tool.Handle)
        a.Adornee=tool.Handle
    end
    tool.Parent = plr.Backpack
    tool.Handle.Size = Vector3.new(reachsize,reachsize,reachsize)
    tool.Handle.Massless = true
    wait()
    tool.Parent = plr.Character
    wait()
    tool:Activate()
end)

local MiscPage = Shell_LIB:CreateTab("Misc",3)
MiscPage:CreateButton("Spawn Block (Do Once)",function()

    local Part = Instance.new("Part")
    Part.Parent = game.Workspace
    Part.Color = Color3.fromRGB(43, 135, 27)
    Part.Anchored = true
    Part.Size = Vector3.new(1000,1,1000)
    Part.Position = Vector3.new(3.89764, 6.0017, 0.220905)
    Part.Transparency = 0.5
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid.Torso.CFrame = CFrame.new(3.89764, 6.0017, 0.220905)
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid.Torso.CFrame = CFrame.new(-5.39735508, 12.8283367, -487.432007, -0.99995482, 0.00712524401, 0.0062773861, 0.00712538464, 0.999974608, 1.17231224e-07, -0.00627722591, 4.48460232e-05, -0.999980211)
end)
MiscPage:CreateButton("Anti Afk",function()
	game:service'Players'.LocalPlayer.Idled:connect(function()
		local V_User =game:service'VirtualUser'
		V_User:CaptureController()
	end)
   print('antiafk: ' .. tostring(game.Players.LocalPlayer))
end)

MiscPage:CreateButton("Server Hop",function()
    wait(3)
    local service = game:GetService("TeleportService")
    local player = game.Players.LocalPlayer
    local PlaceID = "6361937392"
    service:Teleport(PlaceID, player)
end)

local PlayerPage = Shell_LIB:CreateTab("Player",3)
PlayerPage:CreateButton("Fly - Left Alt",function()
    local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()

	local cam = workspace.CurrentCamera
	local uis = game:GetService("UserInputService")

	local idleAnim ;
	local forwardAnim;


	local w = false
	local s = false
	local a = false
	local d = false

	local flying = false
	uis.InputBegan:Connect(function(key, chat)
		if key.KeyCode == Enum.KeyCode.LeftAlt then
			if flying then --Stop Flying
				flying = false
				char.Animate.Disabled = false

			else --Start Flying
				flying = true

				char.Animate.Disabled = true

				local bodyvel = Instance.new("BodyVelocity", char.PrimaryPart)
				bodyvel.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				bodyvel.Velocity = Vector3.new(0,0,0)
				bodyvel.Name = "fly"

				repeat wait(0.1) until flying == false
				bodyvel:Destroy()
				end
		end

		if key.KeyCode == Enum.KeyCode.W then
			w = true
		elseif key.KeyCode == Enum.KeyCode.S then
			s = true
		elseif key.KeyCode == Enum.KeyCode.A then
			a = true
		elseif key.KeyCode == Enum.KeyCode.D then
			d = true
		end
	end)

	uis.InputEnded:Connect(function(key)	
		if key.KeyCode == Enum.KeyCode.W then
			w = false
		elseif key.KeyCode == Enum.KeyCode.S then
			s = false
		elseif key.KeyCode == Enum.KeyCode.A then
			a = false
		elseif key.KeyCode == Enum.KeyCode.D then
			d = false
		end
	end)

	while wait() do
		if flying then
			char.PrimaryPart:FindFirstChild("fly").Velocity = Vector3.new(0,0,0)
			
			if w then
				char.PrimaryPart:FindFirstChild("fly").Velocity = cam.CFrame.LookVector * 17
			end
			if s then
				char.PrimaryPart:FindFirstChild("fly").Velocity = cam.CFrame.LookVector * -17
			end
			if a then
				char.PrimaryPart:FindFirstChild("fly").Velocity = cam.CFrame.RightVector * -17
			end
			if d then
				char.PrimaryPart:FindFirstChild("fly").Velocity = cam.CFrame.RightVector * 17
			end
		else
			wait()
		end
	end
end)

function Bypass()
    local old
    old = hookfunction(Instance.new("RemoteEvent").FireServer,function(self, ...) 
        return
    end)
    local Send = print
    Send('bypass: ' .. tostring(game.Players.LocalPlayer))
end

Bypass()
