local Shell = loadstring(game:HttpGet("https://raw.githubusercontent.com/5questionmarks/shell_library/main/base.lua"))()

local Shell_LIB = Shell:CreateLib("Flex Your Time")
--^ LIB Setup
local PlayerPage = Shell_LIB:CreateTab("Player")
--^ Player Page
PlayerPage:CreateButton("Fly - LeftAlt",function()
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
				char.PrimaryPart:FindFirstChild("fly").Velocity = cam.CFrame.LookVector * 50
			end
			if s then
				char.PrimaryPart:FindFirstChild("fly").Velocity = cam.CFrame.LookVector * -50
			end
			if a then
				char.PrimaryPart:FindFirstChild("fly").Velocity = cam.CFrame.RightVector * -50
			end
			if d then
				char.PrimaryPart:FindFirstChild("fly").Velocity = cam.CFrame.RightVector * 50
			end
		else
			wait()
		end
	end
end)

PlayerPage:CreateSlider("WalkSpeed",55,16,function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerPage:CreateButton("Rejoin",function()
     local service = game:GetService("TeleportService")
     local player = game.Players.LocalPlayer
     local PlaceID = "5278850819"
     service:Teleport(PlaceID, player)
end)

local SwordPage = Shell_LIB:CreateTab("Sword")
--^ SwordPage

SwordPage:CreateSlider("Sword Reach",20,10,function(reachsize)
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

local ChatPage = Shell_LIB:CreateTab("Chat")

ChatPage:CreateDropDown("Messages",{"Shell Shock on top!","Not hacks, just Gaming Chair.","Hacks? What's that? I'm new.."},function(arg)
    if arg == "Shell Shock on top!" then
        local Message = "Shell Shock on top!"
        local All = "All"
        local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
        Event:FireServer(Message, All)
    end
    if arg == "Not hacks, just Gaming Chair." then
        local Message = "Not hacks, just Gaming Chair."
        local All = "All"
        local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
        Event:FireServer(Message, All)
    end
    if arg == "Hacks? What's that? I'm new.." then
        local Message = "Hacks? What's that? I'm new.."
        local All = "All"
        local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
        Event:FireServer(Message, All)
    end
end)

--^ Bypass
function AntiBan()
    local GiftsFolder = game:GetService("Workspace").Gifts
    local MainAc = game.Players.LocalPlayer.Character.Anticheat
    local StarterPlayerAC = game.StarterPlayer.StarterCharacterScripts.Anticheat

    function ChangeMainAcPath()
        MainAc.Parent = GiftsFolder
    end

    function RemoveStarterPlayerAC()
        StarterPlayerAC:Disable()
        wait(1)
        StarterPlayerAC:Destroy()
    end

    game:GetService("RunService").RenderStepped:Connect(function() 
        ChangeMainAcPath()
        RemoveStarterPlayerAC()
    end)
    wait(1)
    print('Disabled StarterPlayer AntiCheat, Moved Main AntiCheat Path')
    wait()
    
    local NewAntiCheatPath = game:GetService("Workspace").Gifts.Anticheat
    NewAntiCheatPath:Destroy()
    print('Removed Main AntiCheat')
    while true do wait()
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
            local service = game:GetService("TeleportService")
            local player = game.Players.LocalPlayer
            local PlaceID = "5278850819"
            service:Teleport(PlaceID, player)
        end
    end
end

AntiBan()
