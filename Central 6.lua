local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()

local ulib = library.new("Central Hoop", 5013109572)
    
local page = ulib:addPage("Main", 5012544693)
    
local section1 = page:addSection("Autofarms")
local section2 = page:addSection("Settings")

local Mouse = game.Players.LocalPlayer:GetMouse()
UIS = game:GetService("UserInputService")

section1:addToggle("Legit Aim",nil, function(value)
    _G.Aim = value

    Mouse.KeyDown:Connect(function(key)
    if key == _G.NKey and _G.Aim then
            game:GetService("ReplicatedStorage").Remotes.server.shoot:FireServer(true,"Idle",true)
        end;
    end);
end);

section1:addToggle("Force Shift Lock",nil, function(value)
	game:GetService('Players').LocalPlayer.DevEnableMouseLock = value
end)

section1:addToggle("Walkspeed",nil, function(value)
    _G.Speed = value

    while _G.Speed and wait() do
        if UIS:IsKeyDown(Enum.KeyCode.W) or UIS:IsKeyDown(Enum.KeyCode.A) or UIS:IsKeyDown(Enum.KeyCode.S) or UIS:IsKeyDown(Enum.KeyCode.D)  then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-Speed)
        end;
     end;
end);

section2:addSlider("Hip Height", 0, 0, 50, function(value)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = value
end);

section2:addTextbox("WalkSpeed", "0.1 Legit", function(value)
    Speed = value
end);

section2:addTextbox("Shoot Key", "Key", function(value)
    _G.NKey = value
end);
