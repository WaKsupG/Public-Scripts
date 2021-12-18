for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable();
end;

local UI = loadstring(game:HttpGet'https://raw.githubusercontent.com/10x00/Tools/main/Super%20Hot%20Monke%20UI')()

UI.Title.Text = "Hero's World"

UI.newTab("Main")


game:GetService("RunService").Stepped:Connect(function()
    if getgenv().Autofarm then
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
             v.CanCollide = false
             game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
          end;
       end;
    end;
end);

local Mob = {};
for i,v in pairs(game:GetService("Workspace").Alive:GetChildren()) do
if not table.find(Mob,v.Name) then
        table.insert(Mob,v.name)
    end;
end;

local Quest = {};
for i,v in pairs(game:GetService("Workspace").MissionMarkers:GetChildren()) do
    table.insert(Quest,v.name)
end;

UI.newDropDown(UI.Main,'Mob',Mob,function(value)
    _G.Mob = value
end);

UI.newDropDown(UI.Main,'Quest',Quest,function(value)
    _G.Quest = value
end);

UI.newCheckBox(UI.Main,'Autofarm',function(value)
    getgenv().Autofarm = value
    
    while getgenv().Autofarm and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Alive:GetChildren()) do
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == _G.Mob and v.Humanoid.Health > 0 then
                    repeat wait() 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -5)
                        game:GetService("Players").LocalPlayer.Character.HUDHandler.Event:FireServer("Input","1","Enum.UserInputType.MouseButton1")
                        until v.Humanoid.Health <= 0 or not getgenv().Autofarm
                    end;
                end;
            end;
        end);
    end;
end);

UI.newCheckBox(UI.Main,'Auto Quest',function(value)
    _G.AutoQuest = value

    while _G.AutoQuest and wait() do
        if game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.Toolbar.Missions.Mission.MissionName.Text == "No Current Mission" then
        game:GetService("ReplicatedStorage").Communications.RemoteEvents.ChatHandler:FireServer(_G.Quest)
        end;
    end;
end);
