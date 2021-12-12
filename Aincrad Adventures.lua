local create = loadstring(game:HttpGet("http://www.mene.world/WhoAmI.lua"))()
local Window = create:Win("Sex Man")
create:Notifile("10x UwU Rawr","Made this in like 10 mins sorry if it's not perfect",3)
local Tap1 = Window:Taps("Aincrad")
local page1 = Tap1:newpage()
page1:Label("Autofarm")
page1:Line()

game:GetService("RunService").Stepped:Connect(function()
    if _G.Autofarm then
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
             v.CanCollide = false
             game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
             game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
          end;
       end;
    end;
 end);

page1:Toggle("Autofarm",false,function(value)
    _G.Autofarm = value

    while _G.Autofarm and wait() do
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:IsA("Model") then
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    if string.match(v.Name, "Boar") then
                    repeat wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,_G.DIS,0)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(math.rad(90),0,0)
                            until v.Humanoid.Health <= 0 or not _G.Autofarm
                        end;
                    end;
                end;
            end;
        end;
    end;
end);

page1:Toggle("Kill Aura",false,function(value)
    _G.KillAura = value

    while _G.KillAura and wait() do
    game:GetService("ReplicatedStorage").Combat.M1:FireServer(1,false,Enum.HumanoidStateType.Running)
    game:GetService("ReplicatedStorage").Combat.M1:FireServer(2,false,Enum.HumanoidStateType.Running)
    game:GetService("ReplicatedStorage").Combat.M1:FireServer(3,false,Enum.HumanoidStateType.Running)
    game:GetService("ReplicatedStorage").Combat.M1:FireServer(4,false,Enum.HumanoidStateType.Running)
    end;
end);

page1:Slider("Distance",false,false,0,10,0,-10,false,function(value)
    _G.DIS = value
end)
