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

game:GetService("RunService").Stepped:Connect(function()
    if _G.Autofarm then
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
             v.CanCollide = false
             game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
          end;
       end;
    end;
 end);

local ArmorTBL = {}
for i,v in pairs(game.Players.LocalPlayer.PlayerGui.UI.Background.ArmorContainer:GetChildren()) do
    if v:IsA("ImageLabel") then
        table.insert(ArmorTBL,v.Name)
    end;
end;
local Tool = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.UI.Background.WeaponContainer:GetChildren()) do
    if v.Name ~= "UIGridLayout" then
        table.insert(Tool,v.Name)
    end;
end;

local a={}for b,c in pairs(game:GetService("Workspace").NPCS.Knightsofblood:GetChildren())do if c:IsA("Part")then table.insert(a,c.Name)end end;for b,c in pairs(game:GetService("Workspace").NPCS.TitansHand:GetChildren())do if c:IsA("Part")then table.insert(a,c.Name)end end;for b,c in pairs(game:GetService("Workspace").NPCS.DivineDragon:GetChildren())do if c:IsA("Part")then table.insert(a,c.Name)end end;for b,c in pairs(game:GetService("Workspace").NPCS.AincradLiberation:GetChildren())do if c:IsA("Part")then table.insert(a,c.Name)end end;for b,c in pairs(game:GetService("Workspace").NPCS.Solo:GetChildren())do if c:IsA("Part")then table.insert(a,c.Name)end end;for b,c in pairs(game:GetService("Workspace").NPCS.Fuur:GetChildren())do if c:IsA("Part")then table.insert(a,c.Name)end end;for b,c in pairs(game:GetService("Workspace").NPCS.Goldenapple:GetChildren())do if c:IsA("Part")then table.insert(a,c.Name)end end;for b,c in pairs(game:GetService("Workspace").NPCS.LaughingCoffin:GetChildren())do if c:IsA("Part")then table.insert(a,c.Name)end end

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
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -_G.DIS)
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

page1:Slider("Distance",false,false,0,15,10,1,false,function(time)
    _G.DIS = time
end)


local page2 = Tap1:newpage()

page2:Label("Auto Quest Just get the quest once and start it")

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


page2:Toggle("Auto Sell",false,function(value)
    _G.Sell = value

    while _G.Sell and wait(1) do
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.UI.Background.ArmorContainer:GetChildren()) do
            if v:IsA("ImageLabel") then
                if v.Name == _G.ArmorT then
                game:GetService("ReplicatedStorage").Inventory.EquipArmor:FireServer(_G.ArmorT) wait(.2)
                game:GetService("ReplicatedStorage").Quest.sellarmor:FireServer()
                end;
            end;
        end;
    end;
end);

page2:Drop("Armor",false,ArmorTBL,function(value)
    _G.ArmorT = value
end);

page2:Drop("Weapon",false,Tool,function(value)
    _G.WeaponT = value
end);

page2:Button("Copy Discord", function()
setclipboard("https://discord.gg/MAzdhG55er")
create:Notifile("Thanks","Copied To Clipboard",2.5)
end);

local Tap2 = Window:Taps("Extra")
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

page3:Toggle("Monke",false,function(value)
    _G.Beat = value

    while _G.Beat and wait() do
        game:GetService("Workspace").Monkey1.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game:GetService("Workspace").Monkey1.RootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end;
end);

page3:Label("Makes you feel the pain the monke does")

page3:Button("Join Low Server", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Public-Scripts/main/Lowest%20Server"))()
end);

local page4 = Tap2:newpage()

page4:Drop("NPC",false,a,function(value)
    _G.NPCTP = value
end);

page4:Button("Teleport", function()
for i,v in pairs(game:GetService("Workspace").NPCS:GetDescendants()) do
    if v.Name == _G.NPCTP then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end;
    end;
end)
