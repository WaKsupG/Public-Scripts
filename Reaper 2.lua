local plr = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
getgenv().speed = 200
function toTarget(target)
    local speed = getgenv().speed
    local info = TweenInfo.new((target.Position - plr.Character.HumanoidRootPart.Position).Magnitude / speed, Enum.EasingStyle.Linear)
    local _, err = pcall(function()
        tweenService:Create(plr.Character.HumanoidRootPart, info, {CFrame = target}):Play()
    end)
    if err then error("Couldn't create/start tween: ", err) end
end
function newIndexHook()
    local mt = getrawmetatable(game)
    local oldIndex = mt.__newindex
    setreadonly(mt, false)
    mt.__newindex = newcclosure(function(self, i, v)
        if checkcaller() and self == plr.Character.HumanoidRootPart and i == 'CFrame' then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            return toTarget(v) 
        end
        return oldIndex(self, i, v)
    end)

    setreadonly(mt, true)
end
newIndexHook()

local UI = loadstring(game:HttpGet'https://raw.githubusercontent.com/10x00/Tools/main/Super%20Hot%20Monke%20UI')()

UI.Title.Text = "Reaper 2"

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
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
if not table.find(Mob,v.Name) and not v:FindFirstChild("ClientHandler") then
        table.insert(Mob,v.name)
    end;
end;

local Quest = {};
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
pcall(function()
if v:IsA("Model") then
        table.insert(Quest,v.Dialogue["1"]["2"].Quest.Value)
        end;
    end);
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
        for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == _G.Mob and v.Humanoid.Health > 0 then
                    repeat wait() 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -5)
                        local args = {[1] = {["inputType"] = Enum.UserInputType.MouseButton1,["keyCode"] = Enum.KeyCode.Unknown}}
                        game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(args))
                    until v.Humanoid.Health <= 0 or not getgenv().Autofarm
                end;
            end;
        end;
    end;
end);

UI.newCheckBox(UI.Main,'Auto Quest',function(value)
_G.AutoQuest = value

while _G.AutoQuest and wait() do
    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
if not game:GetService("Players").LocalPlayer.PlayerGui.HUD.QuestsFrame2:FindFirstChild(_G.Quest) then
            game:GetService("ReplicatedStorage").Remotes.TakeQuest:FireServer(_G.Quest)
            end;
        end;
    end;
end);

