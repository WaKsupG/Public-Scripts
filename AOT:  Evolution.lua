repeat wait() until game:IsLoaded()

rconsolename('AOT Evolution') rconsoleprint('@@GREEN@@') rconsoleprint('Script By: 10x - https://www.unocha.org/ukraine') wait(1)

--//Script\\--

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local X = Material.Load({
    Title = "AOT: 10x",
    Style = 2,
    SizeX = 500,
    SizeY = 350,
    Theme = "Dark",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(60,60,60)
    }
})

local Y = X.New({
    Title = "Main"
})

local Y2 = X.New({
    Title = "Settings"
})

--//Def\\--
local mt = getrawmetatable(game)
make_writeable(mt)
local namecall = mt.__namecall

local epicList = {"Easy","Medium","Hard"};
local readDifficulty = readfile("Diff.txt");
shared.npcLevel = readDifficulty

Y.Toggle({Text = "Autofarm",Callback = function(value)
shared.autoFarm = value
    
while shared.autoFarm and wait() do
pcall(function()
for i,v in pairs(game:GetService("Workspace").Titans:GetChildren()) do
    if v:FindFirstChild("Humanoid") then
        if game.Players.LocalPlayer.Character and v:FindFirstChild("Head") then
                repeat wait() 
                        for i,v in pairs(game:GetService("Workspace").Titans:GetChildren()) do game:GetService("RunService").POST:FireServer(true,"Slash",v,"Nape",400,true) end;
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Head.CFrame - Vector3.new(5,10,5)
                        until not shared.autoFarm or not v:FindFirstChild("Humanoid")
                    end;
                end;
            end;
        end);
    end;
end});

Y.Toggle({Text = "God Mode",Callback = function(value)
    shared.godMode = value
end});

Y2.Toggle({Text = "Kill Aura",Callback = function(value)
    shared.killAura = value

    while shared.killAura and wait() do
        for i,v in pairs(game:GetService("Workspace").Titans:GetChildren()) do
            game:GetService("RunService").POST:FireServer(true,"Slash",v,"Nape",400,true)
        end;
    end;
end});

Y2.Toggle({Text = "Auto Vote",Callback = function(value)
    shared.autoVote = value

    while shared.autoVote and wait() do
        pcall(function()
            game:GetService("RunService").GET:InvokeServer("Vote",shared.npcLevel,"PvE")
        end);
    end;
end});

Y2.Dropdown({Text = "Difficulty", Options = epicList, Callback = function(value)
    writefile("Diff.txt",shared.npcLevel)
end});

mt.__namecall = newcclosure(function(self, ...)
    local methodGet = getnamecallmethod()
    local argsGet = {...}
    if methodGet == "FireServer" and argsGet[2] == "Hitbox" and shared.godMode then
        return wait(9e9)
    end;
    if methodGet == "FireServer" and argsGet[2] == "Hitbox" or shared.autoFarm then
        return wait(9e9)
    end;
    return namecall(self, ...)
end);
