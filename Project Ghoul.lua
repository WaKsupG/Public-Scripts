local plr = game:GetService("Players").LocalPlayer local tweenService = game:GetService("TweenService") getgenv().speed = 75
function toTarget(target)
    local speed = getgenv().speed
    local info = TweenInfo.new((target.Position - plr.Character.HumanoidRootPart.Position).Magnitude / speed, Enum.EasingStyle.Linear)
    local _, err = pcall(function()
        tweenService:Create(plr.Character.HumanoidRootPart, info, {CFrame = target}):Play()
    end);
    if err then error("Couldn't create/start tween: ", err) end
end;
function newIndexHook()
    local mt = getrawmetatable(game)
    local oldIndex = mt.__newindex
    setreadonly(mt, false)
    mt.__newindex = newcclosure(function(self, i, v)
        if checkcaller() and self == plr.Character.HumanoidRootPart and i == 'CFrame' then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            return toTarget(v) 
        end;
        return oldIndex(self, i, v)
    end);
    setreadonly(mt, true)
end;
newIndexHook()

game:GetService("RunService").Stepped:Connect(function()
    if shared.autoFarm then
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            end;
        end;
    end;
end);

--//Anti-AFK
local VirtualUser = game:service("VirtualUser")
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end);

--//Defaults
shared.belowLevel = 300
shared.Method = "Behind"
shared.distanceMob = 10
shared.eatDistance = 50

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacks/Utilities/main/UI.lua", true))()

local Window = Library:CreateWindow("Project Ghoul")

local folder = Window:AddFolder('Farming')

folder:AddToggle({text = "Autofarm", callback = function(value)
    shared.autoFarm = value

    while shared.autoFarm and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").NPCs.Alive:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v:FindFirstChild("VisualName") then
                    if v.data.stats.level.Value <= shared.belowLevel then
                    repeat wait()
                        if shared.Method == "Below" and not shared.autoEat then --//Little messy and aids sorry
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,shared.distanceMob,0)
                            game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("Attack",{})
                        elseif shared.Method == "Behind" and not shared.autoEat then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -shared.distanceMob)
                                game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("Attack",{}) 
                        elseif shared.Method == "Behind" and shared.autoEat then if not game:GetService("Workspace").Live:FindFirstChild(" ") then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -shared.distanceMob) game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("Attack",{}) end;
                            elseif shared.Method == "Below" and shared.autoEat then if not game:GetService("Workspace").Live:FindFirstChild(" ") then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,shared.distanceMob,0) game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("Attack",{}) end;
                        end;
                        until v.Humanoid.Health <= 0 or not shared.autoFarm
                    end
                end;
            end;
        end);
    end;
end});

folder:AddToggle({text = "Auto Equip", callback = function(value)
shared.autoEquip = value

while shared.autoEquip and wait() do
    if game:GetService("Players").LocalPlayer.data.notSavable.weaponEquipped.Value == false then
            game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("RequestEquip")
        end;
    end;
end});

folder:AddToggle({text = "Auto Eat", callback = function(value)
    shared.autoEat = value
    
    while shared.autoEat and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Live:GetChildren()) do
            if v.Name == " " then
                if v:FindFirstChild("ClickDetector") and v:FindFirstChild("HumanoidRootPart") then
                    local mags = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if mags <= shared.eatDistance then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        fireclickdetector(v.ClickDetector)
                        end;
                    end;
                end;
            end;
        end);
    end;
end});

folder:AddSlider({text = 'Target Level', min = 1, max = 1000, callback = function(value) 
    shared.belowLevel = value
end});

folder:AddButton({text = 'Discord', callback = function()
    setclipboard("https://discord.gg/Mgn9E7ywg8")
end});

folder:AddButton({text = 'Auto Eat Buggy In Public', callback = function()
    setclipboard("https://discord.gg/Mgn9E7ywg8")
end});

folder:AddButton({text = 'Script Discontinued', callback = function()
    setclipboard("https://discord.gg/Mgn9E7ywg8")
end});

local Window2 = Library:CreateWindow("Settings")

local folder2 = Window2:AddFolder('Custom')

folder2:AddList({text = 'TP Method', values = {"Behind","Below"}, callback = function(value)
    shared.Method = value
end});

folder2:AddSlider({text = 'Distance', min = 1, max = 15, callback = function(value) 
    shared.distanceMob = value
end});

folder2:AddSlider({text = 'Eat Distance', min = 1, max = 150, callback = function(value) 
    shared.eatDistance = value
end});

folder2:AddSlider({text = 'Speed', min = 1, max = 100, callback = function(value) 
    getgenv().speed = value
end});

folder:AddButton({text = 'Remove Seats', callback = function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Seat") then
            v:Destroy()
        end;
    end;
end});

Library:Init();
