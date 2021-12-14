local create = loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Tools/main/Yes%20UI%20Lib"))()
local Window = create:Win("Sex Man")
create:Notifile("10x UwU Rawr","Made this in like 10 mins sorry if it's not perfect",3)
local Tap1 = Window:Taps("Aincrad")
local page1 = Tap1:newpage()
page1:Label("Autofarm")
page1:Line()

for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable();
end;

local ArmorTBL = {}

for i,v in pairs(game.Players.LocalPlayer.PlayerGui.UI.Background.ArmorContainer:GetChildren()) do
    if v:IsA("ImageLabel") then
        table.insert(ArmorTBL,v.Name)
    end;
end;

game:GetService("RunService").Stepped:Connect(function()
    if _G.KillAura then
        game:GetService("ReplicatedStorage").Combat.M1:FireServer(1,false,Enum.HumanoidStateType.Running)
    end;
end);

page1:Toggle("Autofarm",false,function(value)
    _G.Autofarm = value

    while _G.Autofarm and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == _G.Mob and v.Humanoid.Health > 0 then
                    repeat wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -15)
                 
                        until v:FindFirstChild("iFrames") or not _G.Autofarm
                    end;
                end;
            end;
        end);
    end;
end);


page1:Toggle("Kill Aura",false,function(value)
    _G.KillAura = value
end);

page1:Drop("Mob",false,{"Boar","Wolf","Fire Wolf","Mantis","Monkey"},function(value)
    _G.Mob = value

    if _G.Mob == "Fire Wolf" then
        _G.Mob = "FireWolf1"
    elseif _G.Mob == "Boar" then
        _G.Mob = "Boar1"
    elseif _G.Mob == "Mantis" then
    _G.Mob = "Mantis1"
    elseif _G.Mob == "Wolf" then
        _G.Mob = "Wolf1"
    elseif _G.Mob == "Monkey" then
        _G.Mob = "Monkey1"
    end;
end);


local page2 = Tap1:newpage()

page1:Label("Auto Quest Just get the quest once and start it")

page2:Toggle("Auto Quest",false,function(value)
_G.AutoRedo = value

while _G.AutoRedo and wait(2) do
pcall(function()
if game.Players.LocalPlayer.PlayerGui.UI.Redoquest.Visible == true then
    for _, v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.UI.Redoquest.Accept.MouseButton1Click)) do
                    v:Fire()
                end;
            end;
        end);
    end;
end);


page2:Toggle("Auto Sell Armor",false,function(value)
    _G.Sell = value

    while _G.Sell and wait() do
        game:GetService("ReplicatedStorage").Inventory.EquipArmor:FireServer(_G.ArmorT) wait(1)
        game:GetService("ReplicatedStorage").Quest.sellarmor:FireServer()
    end;
end);

page2:Drop("Armor",false,ArmorTBL,function(value)
    _G.ArmorT = value
end);

page2:Button("Copy Discord", function()
setclipboard("https://discord.gg/8XfrZSxyKk")
create:Notifile("Thanks","Copied To Clipboard",3)
end);

local Tap2 = Window:Taps("OP")
local page3 = Tap2:newpage()

page3:Toggle("Infinite Block",false,function(value)
    _G.InfBlock = value

    while _G.InfBlock and wait() do
        pcall(function()
           if game.Players.LocalPlayer.Character:FindFirstChild("Blockbar") then
            game.Players.LocalPlayer.Character.Blockbar:Destroy()
           end;
        end);
    end;
end);

page3:Toggle("Infinite Money",false,function(value)
    _G.InfM = value

    while _G.InfM and wait(.1) do
        for i = 1,50 do
        game:GetService("ReplicatedStorage").Inventory.EquipItem:FireServer("Coldstormscroll")
        end;
    end;
end);

page3:Button("Join Low Server", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Public-Scripts/main/Lowest%20Server"))()
end);
