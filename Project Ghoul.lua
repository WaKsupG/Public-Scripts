local plr = game:GetService("Players").LocalPlayer local tweenService = game:GetService("TweenService") getgenv().speed = 500
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

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/un-named%20backups/jans", true))()

local Window = Library:CreateWindow("Project Ghoul")

local folder = Window:AddFolder('Farming')

folder:AddToggle({text = "Autofarm", callback = function(value)
    shared.autoFarm = value

    while shared.autoFarm and wait() do
        for i,v in pairs(game:GetService("Workspace").NPCs.Alive:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v:FindFirstChild("VisualName") then
                    if v.data.stats.level.Value <= shared.belowLevel then
                    repeat wait()
                        if shared.Method == "Below" then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,shared.distanceMob,0)
                            game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("Attack",{})
                        elseif shared.Method == "Behind" then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -shared.distanceMob)
                                game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("Attack",{})
                            end;
                        until v.Humanoid.Health <= 0 or not shared.autoFarm
                    end
                end;
            end;
    end;
end});

folder:AddSlider({text = 'Target Level', min = 1, max = 1000, callback = function(value) 
    shared.belowLevel = value
end});

folder:AddButton({text = 'Discord', callback = function()
    setclipboard("https://discord.gg/Mgn9E7ywg8")
end});

local Window2 = Library:CreateWindow("Settings")

local folder2 = Window2:AddFolder('Custom')

folder2:AddList({text = 'TP Method', values = {"Behind","Below"}, callback = function(value)
    shared.Method = value
end});

folder2:AddSlider({text = 'Distance', min = 1, max = 15, callback = function(value) 
    shared.distanceMob = value
end})


Library:Init();
