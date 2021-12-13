local create = loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Tools/main/Yes%20UI%20Lib"))()
local Window = create:Win("Sex Man")
create:Notifile("10x UwU Rawr","Made this in like 10 mins sorry if it's not perfect",3)
local Tap1 = Window:Taps("Aincrad")
local page1 = Tap1:newpage()
page1:Label("Autofarm")
page1:Line()

page1:Toggle("Autofarm",false,function(value)
    _G.Autofarm = value

    while _G.Autofarm and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if string.find(v.Name, _G.Mob) and v.Humanoid.Health > 0 then
                    repeat wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -6.5)
                        until v:FindFirstChild("iFrames") or not _G.Autofarm
                    end;
                end;
            end;
        end);
    end;
end);

page1:Toggle("Kill Aura",false,function(value)
    _G.KillAura = value

    while _G.KillAura and wait() do
    pcall(function()
        game:GetService("ReplicatedStorage").Combat.M1:FireServer(1,false,Enum.HumanoidStateType.Running)
        game:GetService("ReplicatedStorage").Combat.M1:FireServer(2,false,Enum.HumanoidStateType.Running)
        game:GetService("ReplicatedStorage").Combat.M1:FireServer(3,false,Enum.HumanoidStateType.Running)
        game:GetService("ReplicatedStorage").Combat.M1:FireServer(4,false,Enum.HumanoidStateType.Running)       
        end);
    end;
end);

page1:Drop("Mob",false,{"Boar","Wolf","Fire","Mantis"},function(value)
    _G.Mob = value
end);
