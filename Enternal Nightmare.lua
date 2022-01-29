local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacks/Utilities/main/UI.lua"))();

local Window = Library:CreateWindow("Autofarm")

local folder = Window:AddFolder("Main")

local folder2 = Window:AddFolder("Extra")

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

folder:AddToggle({text = "Autofarm", callback = function(value) 
shared.autoFarm = value
    
while shared.autoFarm and wait() do
pcall(function()
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and not v:FindFirstChild("LookDirection") then
            if v.Humanoid.Health > 0 then
                repeat wait() 
                    v.Humanoid.Health = 0
                    game:GetService("ReplicatedStorage").Requests.UseSkill:FireServer("DaggerBasic",1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,shared.mobDistance,0)
                    until v.Humanoid.Health <= 0 or not shared.autoFarm
                    end;
                end;
            end;
        end);
    end;
end});

folder:AddToggle({text = "Hide Identity", callback = function(value) 
shared.hideName = value

while shared.hideName and wait() do
    pcall(function()
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Overhead") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Overhead:Destroy()
            end;
        end);
    end;
end});

folder:AddSlider({text = 'Distance', min = 0, max = 10, incrementalMode = true, callback = function(value) 
    shared.mobDistance = value
end});

folder2:AddToggle({text = "No Cooldown", callback = function(value)
    shared.noCooldown = value

    game.Players.LocalPlayer.Character.Cooldowns.ChildAdded:Connect(function(nopeLol1)
    if shared.noCooldown then
            nopeLol1.Name = "Hi"
        end;
    end);
    
    game.Players.LocalPlayer.Character.Cooldowns.DescendantAdded:Connect(function(nopeLol2)
    if shared.noCooldown then
            nopeLol2.Name = "Hi There Buddy"
        end;
    end);
end});

folder2:AddButton({text = "Discord", callback = function(value) 
    setclipboard("https://discord.gg/FZdxeYc8WC")
end})

folder2:AddButton({text = "Warp Bandit Camp", callback = function(value) 
    local a={[1]=workspace.Interactions.BanditCamps.Data.ID,[2]={[1]="Let's go !"}}game:GetService("ReplicatedStorage").Requests.GetDialog:InvokeServer(unpack(a))
end})

Library:Init()
