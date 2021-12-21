local plr = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager");
getgenv().speed = 500
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
getgenv().No = false

for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable();
end;

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
        for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
        if getgenv().getgenv().No == false then
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == _G.Mob and v.Humanoid.Health > 0 then
                    repeat wait() 
                        if not game:GetService("Workspace").Food:FindFirstChild("Hollow") or not game:GetService("Workspace").Food:FindFirstChild("Corrupted Brute") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,_G.DIS,0)
                        local args = {[1] = {["inputType"] = Enum.UserInputType.MouseButton1,["keyCode"] = Enum.KeyCode.Unknown}}
                        game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(args)) end;
                        until v.Humanoid.Health <= 0 or not getgenv().Autofarm
                        end;
                    end;
                end;
            end;
        end);
    end;
end);

UI.newCheckBox(UI.Main,'Auto Quest',function(value)
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
end);

UI.newCheckBox(UI.Main,'Auto Equip',function(value)
    _G.Equip = value

    while _G.Equip and wait(.3) do
        if game:GetService("Players").LocalPlayer.Status.Weapon.Value == nil then
            local a={[1]={["inputType"]=Enum.UserInputType.Keyboard,["keyCode"]=Enum.KeyCode.E}}game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(a))
        end;
    end;
end);

UI.newCheckBox(UI.Main,'Auto Eat',function(value)
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
end);

UI.newSlider(UI.Main,'Distance',0,10,function(amount)
    _G.DIS = amount
end);

UI.newButton(UI.Main,'Copy Discord',function()
    setclipboard("https://discord.gg/MAzdhG55er")
end);
