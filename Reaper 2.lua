local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/un-named%20backups/jans", true))()

local Window = Library:CreateWindow("Autofarm")

local folder = Window:AddFolder("Main")

local folder2 = Window:AddFolder("Settings")

local Players = {};
for i,v in pairs(game.Players:GetChildren()) do
    table.insert(Players,v.Name)
end;

for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable();
end;


local plr = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
getgenv().speed = 300
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

game:GetService("RunService").Stepped:Connect(function()
if getgenv().Autofarm or getgenv().SP then
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
                 v.CanCollide = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            end;
        end;
    end;
end);

local Mob = {};
_G.DIS = 6
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

for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable();
end;

folder:AddToggle({text = "Autofarm", callback = function(value) 
    getgenv().Autofarm = value
    
    while getgenv().Autofarm and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == _G.Mob and v.Humanoid.Health > 0 then
                    repeat wait() 
                        local args = {[1] = {["inputType"] = Enum.UserInputType.MouseButton1,["keyCode"] = Enum.KeyCode.Unknown}}
                        game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(args))
                        if not game:GetService("Workspace").Food:FindFirstChildWhichIsA("Part") or not game:GetService("Workspace").Food:FindFirstChildWhichIsA("MeshPart") and _G.AutoEat then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,_G.DIS,0)
                        elseif not _G.AutoEat then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,_G.DIS,0)
                        end
                        until v.Humanoid.Health <= 0 or not getgenv().Autofarm
                    end;
                end;
            end;
        end);
    end;
end});

folder:AddToggle({text = "Auto Quest", callback = function(value) 
 _G.AutoQuest = value

while _G.AutoQuest and wait() do
pcall(function()
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("QuestsFrame2") then
        if not game:GetService("Players").LocalPlayer.PlayerGui.HUD.QuestsFrame2:FindFirstChild(_G.Quest) then wait(2)
                        game:GetService("ReplicatedStorage").Remotes.TakeQuest:FireServer(_G.Quest)
                    end;
                end;
            end;
        end);
    end;
end});

folder:AddList({text = "Mob", values = Mob, callback = function(value)
    _G.Mob = value
end});

folder:AddList({text = "Quests", values = Quest, callback = function(value)
    _G.Quest = value
end});


folder:AddSlider({text = 'Distance', min = 0, max = 10, callback = function(value) 
    _G.DIS = value
end});

folder2:AddToggle({text = "Auto Eat", callback = function(value) 
    _G.Eat = value
    while _G.Eat and wait() do
    pcall(function()
        for i, v in pairs(game:GetService("Workspace").Food:GetDescendants()) do
                if v:FindFirstChild("ProximityPrompt") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame - Vector3.new(0,-5,0)
                    fireproximityprompt(v.ProximityPrompt)
                end;
            end;
        end);
    end;
end});

folder2:AddToggle({text = "Auto Equip", callback = function(value) 
    _G.Equip = value

    while _G.Equip and wait(.3) do
        if game:GetService("Players").LocalPlayer.Status.Weapon.Value == nil then
            local a={[1]={["inputType"]=Enum.UserInputType.Keyboard,["keyCode"]=Enum.KeyCode.E}}game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(a))
        end;
    end;
end});

local Window2 = Library:CreateWindow("Specific")

local folder3 = Window2:AddFolder("Specific Farm")

folder3:AddToggle({text = "Autofarm", callback = function(value) 
    getgenv().SP = value
    
    while getgenv().SP and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == _G.SP1 or v.Name == _G.SP2 or v.Name == _G.SP3 or v.Name == _G.SP4 or v.Name == _G.SP5 and v.Humanoid.Health > 0 then
                    repeat wait() 
                        local args = {[1] = {["inputType"] = Enum.UserInputType.MouseButton1,["keyCode"] = Enum.KeyCode.Unknown}}
                        game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(args))
                        if not game:GetService("Workspace").Food:FindFirstChildWhichIsA("Part") or not game:GetService("Workspace").Food:FindFirstChildWhichIsA("MeshPart") and _G.AutoEat then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,_G.DIS,0)
                        elseif not _G.Eat then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,_G.DIS,0)
                        end
                        until v.Humanoid.Health <= 0 or not getgenv().SP
                    end;
                end;
            end;
        end);
    end;
end});

folder3:AddBox({text = 'Mob', callback = function(value)
    _G.SP1 = value
end});

folder3:AddBox({text = 'Mob', callback = function(value)
    _G.SP2 = value
end});

folder3:AddBox({text = 'Mob', callback = function(value)
    _G.SP3 = value
end});

folder3:AddBox({text = 'Mob', callback = function(value)
    _G.SP4 = value
end});

folder3:AddBox({text = 'Mob', callback = function(value)
    _G.SP5 = value
end});

Library:Init()
