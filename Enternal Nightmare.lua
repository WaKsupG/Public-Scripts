repeat wait() until game:IsLoaded()

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local X = Material.Load({
    Title = "Eternal Nightmare - 10x",
    Style = 2,
    SizeX = 500,
    SizeY = 350,
    Theme = "Dark",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(60,60,60)
    }
})

for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable();
end;    

local Y = X.New({
    Title = "Main"
})

local Y3 = X.New({
    Title = "Extra"
})

local Y2 = X.New({
    Title = "Bandit"
})

game:GetService("RunService").Stepped:Connect(function()
    if shared.autoFarm or shared.autoBandit then
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            end;
        end;
    end;
end);

if isfile("Eternal Nightmare.txt") and isfile("WhatWeaponBro.txt") then
    print("It's there")
else
    writefile("Eternal Nightmare.txt","")
    writefile("WhatWeaponBro.txt","")
end;

local weaponList = {};
local readWeapon = readfile("WhatWeaponBro.txt")
shared.mobDistance = 6.3
shared.weapon = readWeapon
shared.resetAt = 40

for i,v in pairs(game:GetService("ReplicatedStorage").ClientSidedActions:GetChildren()) do
    if string.find(v.Name, "Basic") then
        table.insert(weaponList, v.Name)
    end;
end;

Y.Toggle({Text = "Autofarm",Callback = function(value)
shared.autoFarm = value
    
while shared.autoFarm and wait() do
pcall(function()
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and not v:FindFirstChild("LookDirection") then
            if v.Humanoid.Health > 0 then
                repeat wait() 
                    game:GetService("ReplicatedStorage").Requests.UseSkill:FireServer(shared.weapon,1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,shared.mobDistance,0)
                    until v.Humanoid.Health <= 0 or not shared.autoFarm
                    end;
                end;
            end;
        end);
    end;
end});

Y.Dropdown({Text = "Weapon", Options = weaponList, Callback = function(value)
    shared.weapon = value 
    writefile("WhatWeaponBro.txt",value) 
end});

Y.Toggle({Text = "Item Farm",Callback = function(value)
shared.itemFarm = value

while shared.itemFarm and wait() do
for i,v in pairs(game:GetService("Workspace").Interactions:GetChildren()) do
            game:GetService("ReplicatedStorage").Requests.GetNodeData:InvokeServer(workspace.Interactions:FindFirstChild(v.Name))
        end;
    end;
end});

Y.Toggle({Text = "Hide Identity",Callback = function(value)
shared.hideName = value

while shared.hideName and wait() do
    pcall(function()
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Overhead") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Overhead:Destroy()
            end;
        end);
    end;
end});

Y.Slider({Text = "Distance",Min = -10,Max = 10,Def = 6.5,Callback = function(value)
    shared.mobDistance = value
end});

Y3.Toggle({Text = "No Cooldown",Callback = function(value)
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

local IF = Y3.Toggle({Text = "Infinite Lives",Callback = function(value)
shared.godMode = value

while shared.godMode and wait() do
pcall(function()
if game.Players.LocalPlayer.Character.Humanoid.Health <= shared.resetAt then 
                game.Players.LocalPlayer.Character.Humanoid:Destroy() 
            end;
        end);
    end;
end});

Y3.Slider({Text = "Reset Lives At",Min = 0,Max = 70,Def = 35,Callback = function(value)
    shared.resetAt = value
end});

Y3.Toggle({Text = "Kill Aura",Callback = function(value)
    shared.killAura = value

    while shared.killAura and wait() do
        game:GetService("ReplicatedStorage").Requests.UseSkill:FireServer(shared.weapon,1)
    end;
end});

Y3.Button({Text = "Don't Use Farm + Kill Aura",Callback = function()

end});

Y3.Button({Text = "Discord",Callback = function()
    setclipboard("https://discord.gg/FZdxeYc8WC")
end})

Y2.Button({Text = "Warp Bandit Camp",Callback = function()
    local a={[1]=workspace.Interactions.BanditCamps.Data.ID,[2]={[1]="Let's go !"}}game:GetService("ReplicatedStorage").Requests.GetDialog:InvokeServer(unpack(a))
end})

local B = Y2.Toggle({Text = "Auto Bandit",Enabled = nil,Callback = function(value) --//CLOSE YOU EYES WE ARE UNDER ATTACK THE CODE IS AWFUL OGHEUGGHUW BOOM OH GOD GET ODWN FUWEGFYIWEGY8WEGEWYFGWE BOOM BOOM
    shared.autoBandit = value

    if shared.autoBandit then 
        writefile("Eternal Nightmare.txt","shared.autoBandit = true") 
    end;
        
    while shared.autoBandit and wait() do
    if game.PlaceId ~= 8627695244 then
    local a={[1]=workspace.Interactions.BanditCamps.Data.ID,[2]={[1]="Let's go !"}}game:GetService("ReplicatedStorage").Requests.GetDialog:InvokeServer(unpack(a)) end;
    pcall(function()
        for a,b in pairs(game:GetService("Workspace"):GetDescendants()) do if b:IsA("TouchTransmitter")then firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,b.Parent,1)firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,b.Parent,0)end end
        for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and not v:FindFirstChild("LookDirection") then
                if v.Humanoid.Health > 0 then
                    repeat wait()
                        if game.Players.LocalPlayer.Character.Humanoid.Health <= shared.resetAt then game.Players.LocalPlayer.Character.Humanoid:Destroy() end;
                        game:GetService("ReplicatedStorage").Requests.UseSkill:FireServer(shared.weapon,1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,shared.mobDistance,0)
                        until v.Humanoid.Health <= 0 or not shared.autoBandit
                    end;
                end;
            end;
        end);
    end;
end});

Y2.Button({Text = "Auto Bandit Off",Callback = function()
    writefile("Eternal Nightmare.txt","spencerlikesdudes123") 
end});

if readfile("Eternal Nightmare.txt") == "shared.autoBandit = true" then
    B:SetState(true)
end;
