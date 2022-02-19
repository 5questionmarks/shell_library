local Shell = loadstring(game:HttpGet("https://raw.githubusercontent.com/5questionmarks/shell_library/main/base.lua"))()

local Shell_LIB = Shell:CreateLib("Steal Others Time")

local SwordPage = Shell_LIB:CreateTab("Sword",3)

local Send = print

local MiscPage = Shell_LIB:CreateTab("Misc",3)

local PlayerPage = Shell_LIB:CreateTab("Player",3)

SwordPage:CreateSlider("Sword Reach",16,5,function(reachsize)
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

MiscPage:CreateButton("Rejoin",function()
  local service = game:GetService("TeleportService")
  local player = game.Players.LocalPlayer
  local PlaceID = "5278850819"
  service:Teleport(PlaceID, player)
end)

MiscPage:CreateButton("ESP",function()
local ESP = Instance.new("BillboardGui")
local player = Instance.new("TextLabel",ESP) 

ESP.Name = "ESP"; 
ESP.ResetOnSpawn = false
ESP.AlwaysOnTop = true;
ESP.LightInfluence = 0;
ESP.Size = UDim2.new(1.75, 0, 1.75, 0);
player.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
player.BackgroundTransparency = 1 
player.Text = ""
player.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
player.BorderSizePixel = 4;
player.BorderColor3 = Color3.new(255, 255, 255)
player.BorderSizePixel = 0
player.Font = "GothamSemibold"
player.TextSize = 13
player.TextColor3 = Color3.fromRGB(255, 255, 255)

game:GetService("RunService").RenderStepped:Connect(function() 
	for i,v in pairs (game:GetService("Players"):GetPlayers()) do
		if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("ESP") == nil then 
			player.Text = "Player: "..v.Name
			ESP:Clone().Parent = v.Character.Head
		end
	end
end)
end)

MiscPage:CreateButton("Create Block",function()
    local Part = Instance.new("Part")
    Part.Parent = game.Workspace
    Part.Color = Color3.fromRGB(255,255,255)
    Part.Anchored = true
    Part.Size = Vector3.new(1000,0.1,1000)
    Part.Position = Vector3.new(-0.223445, 4.99795, -0.338424)
    Part.Transparency = 0.9
    local Send = print

    print('block: ' .. tostring(game.Players.LocalPlayer))
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
    game.Players.LocalPlayer.Character.Humanoid.Torso.CFrame = CFrame.new(-1.28283, 8.04746, -1.20013)
end)

PlayerPage:CreateSlider("WalkSpeed",54,16,function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end) 

function Bypass()
    local Send = print
    
    Send('bypass: ' .. tostring(game.Players.LocalPlayer))
    local Controller = game.Players.LocalPlayer.PlayerScripts.Client.Controller
    local Client = game.Players.LocalPlayer.PlayerScripts.Client
    local ControlModule = game.Players.LocalPlayer.PlayerScripts.PlayerModule.ControlModule
    local CameraModule = game.Players.LocalPlayer.PlayerScripts.PlayerModule.CameraModule
    local PlayerScripts = game.Players.LocalPlayer.PlayerScripts
    Controller.Parent = PlayerScripts
    CameraModule.Parent = PlayerScripts
    ControlModule.Parent = PlayerScripts
    for i,v in pairs (getconnections(Client.Changed)) do
    v:Disable()
    end
    
    local GiftsFolder = game:GetService("Workspace").Gifts
    local MainAc = game.Players.LocalPlayer.Character.Anticheat
    local StarterPlayerAC = game.StarterPlayer.StarterCharacterScripts.Anticheat

function ChangeMainAcPath()
    MainAc.Parent = GiftsFolder
end
function RemoveStarterPlayerAC()
    StarterPlayerAC:Destroy()
end
ChangeMainAcPath()
RemoveStarterPlayerAC()
wait(1)
local NewAntiCheatPath = game:GetService("Workspace").Gifts.Anticheat
NewAntiCheatPath:Destroy()
while true do wait()
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
         local service = game:GetService("TeleportService")
         local player = game.Players.LocalPlayer
         local PlaceID = "5278850819"
         service:Teleport(PlaceID, player)
    end
end
end

Bypass()
