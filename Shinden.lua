local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()

local ulib = library.new("Shinden", 5013109572)
    
local page = ulib:addPage("Main", 5012544693)
    
local section1 = page:addSection("Autofarms")
local section2 = page:addSection("Other")

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall

local plr = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
getgenv().speed = 300

function toTarget(target)
    local speed = getgenv().speed
    local info = TweenInfo.new((target.Position - plr.Character.HumanoidRootPart.Position).Magnitude / speed, Enum.EasingStyle.Linear)
    local _, err = pcall(function()
        tweenService:Create(plr.Character.HumanoidRootPart, info, {CFrame = target}):Play()
    end);
    if err then error("Couldn't create/start tween: ", err) end
end;
function newIndexHook()
    local oldIndex = mt.__newindex
    setreadonly(mt, false)
    mt.__newindex = newcclosure(function(self, i, v)
        if checkcaller() and self == plr.Character.HumanoidRootPart and i == 'CFrame' then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            return toTarget(v) 
        end;
        return oldIndex(self, i, v)
    end);
end;
newIndexHook()

game:GetService("RunService").Stepped:Connect(function()
    if _G.Farm then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            end;
        end;
    end;
end);


section2:addDropdown("Village", {"Cloud","Sand","Mist","Leaf","Stone"}, function(value)
    game:GetService("RunService").Stepped:Connect(function()
        _G.Village = value
    end);
end);

section1:addToggle("Mission Farm",nil, function(value)
    _G.Farm = value

    while _G.Farm and wait() do
    pcall(function()
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionDesc") and game:GetService("Players").LocalPlayer.PlayerGui.MissionDesc.Frame.N.Text == "Deliver The Supplies" then _G.Job = "Deliver" else _G.Job = "" end; --//This code is very aids but the quest system is aids so yes
        for i,v in pairs(game:GetService("Workspace").Thrown:GetChildren()) do
            if string.find(v.Name,"m") or string.find(v.Name,"*") or string.find(v.Name,")") and v:IsA("Part") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                fireclickdetector(v.ClickDetector)
            elseif string.find(v.Name,"m") or string.find(v.Name,"*") or string.find(v.Name,")") and v:IsA("MeshPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            elseif _G.Job == "Deliver" and not string.find(v.Name,"m") and not string.find(v.Name,")") then 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-540.05969238281, 1161.0283203125, 849.72106933594)
            else
                    fireclickdetector(game:GetService("Workspace").MissionBoard[_G.Village].MissionBoard.ClickDetector)
                end;
            end;
        end);
    end;
end);

--//Others\\--

section2:addToggle("No Slow",nil, function(value)
    _G.NoSlow = value
end);

section2:addToggle("No Fall",nil, function(value)
    _G.NoFall = value
end);

section2:addSlider("Speed", 0, 0, 500, function(value)
    _G.Speed = value
end)

section2:addToggle("Walkspeed",nil, function(value)
    _G.WalkSpeed = value

    if _G.WalkSpeed then
        game:GetService("Players").LocalPlayer.SpeedBuff.Value = _G.Speed
    elseif not _G.WalkSpeed then
        game:GetService("Players").LocalPlayer.SpeedBuff.Value = 0
    end;
end);

mt.__namecall = newcclosure(function(self, ...)
local method = getnamecallmethod()
    if method == "FireServer" and self.Name == "SelfHarm" and _G.NoFall then
        return wait(9e9)
    elseif method == "FireServer" and self.Name == "Slow" and _G.NoSlow then
        return wait(9e9)
    end;
    return old(self, ...)
end);
