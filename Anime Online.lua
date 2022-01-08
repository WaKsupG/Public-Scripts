local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()

local ulib = library.new("Anime Online", 5013109572)
    
--//Page Starting\\--
local page = ulib:addPage("Main", 5012544693)
    
local section1 = page:addSection("Autofarm")

local section2 = page:addSection("Stuff")


--//Anti-AFK\\--
for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable();
end;

local plr = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
getgenv().speed = 500000000
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
    if getgenv().Autofarm then
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            end;
        end;
    end;
end);

section1:addToggle("Autofarm",nil, function(value)
    getgenv().Autofarm = value
    
    while getgenv().Autofarm and wait() do
    pcall(function()
        for i,v in pairs(game.Players:GetChildren()) do
                if v.Character.Humanoid.Health > 0 and v.Character.Name ~= game.Players.LocalPlayer.Name then
                repeat wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame + (v.Character.HumanoidRootPart.CFrame.lookVector * -3)
                until v.Character.Humanoid.Health <= 0 or not getgenv().Autofarm
                end;
            end;
        end);
    end;
end);
section1:addToggle("Auto Attack",nil, function(value)
    _G.Attack = value

    while _G.Attack and wait() do
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            game:GetService("Players").LocalPlayer.Backpack[v.Name].Combat:FireServer("Combo1")
        end;
    end;
end);

section2:addToggle("No Stun",nil, function(value)
    _G.NoStun = value

    while _G.NoStun and wait() do
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:FindFirstChild("Stun") then
                v:Destroy()
            end;
        end;
    end;
end);

section2:addToggle("No Jump CD",nil, function(value)
    _G.NoJump = value

    while _G.NoJump and wait() do
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:FindFirstChild("JumpCD") then
                v:Destroy()
            end;
        end;
    end;
end);

section2:addButton("Copy Discord", function()
    setclipboard("https://discord.com/invite/MAzdhG55er")
end);
