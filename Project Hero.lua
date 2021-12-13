--//Alright listen before you judge my code I know i could of done everything 100000000x easier i just wanted it to look good cause i like this game LOL
--//loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Public-Scripts/main/Project%20Hero.lua"))();

local create = loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Tools/main/Yes%20UI%20Lib"))()
local Window = create:Win("Sex Man")
create:Notifile("10x UwU Rawr","Ty mene for ui lib sexy",3)
local Tap1 = Window:Taps("Project Hero")
local page1 = Tap1:newpage()
page1:Label("Autofarm")
page1:Line()
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__newindex
local Mob = {};
for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
    if v:IsA("Model") then
    table.insert(Mob,v.Name)
    end;
end;

local TBL = {}

for i,v in pairs(game:GetDescendants()) do
    if v:IsA("Tool") then
        if v:FindFirstChild("Skills") then
        table.insert(TBL,v.Name)
        end;
    end;
end;


local function attack()
    wait(math.random(.1,.2))
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Combat"])
    elseif game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
    	game.Players.LocalPlayer.Character.Combat:Activate()
    end
end

page1:Toggle("Autofarm",false,function(value)
    _G.Autofarm = value

    while _G.Autofarm and wait(_G.Timer) do
    pcall(function()
        if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ActiveQuest.Visible == true and not _G.InvisTest then
        for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
            if not v:FindFirstChild(_G.Mob) then _G.Timer = 4 else _G.Timer = 0 end;
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") then
                if v.Name == _G.Mob and v.Humanoid.Health > 0 then
                    repeat wait()
                        v.HumanoidRootPart.Anchored = true
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -3)
                        until v.Humanoid.Health <= 0 or not _G.Autofarm
                        end;
                    end;
                end;
            end;
        end);
    end;
end);

page1:Toggle("Auto Quest",false,function(value)
    _G.AutoQuest = value

    while _G.AutoQuest and wait(2) do
    pcall(function()
    if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ActiveQuest.Visible == false and not _G.InvisTest then
        if _G.Quest == "Zak [Lv. 1-10]" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").QuestNPCs.Zak.HumanoidRootPart.CFrame wait(.2)
            game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("KillNeighbor")
        elseif _G.Quest == "Bus [Lv. 10-15]" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1030.8057861328, 1179.1821289062, -493.85900878906) wait(.2)
            game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("Help Bus Driver")
        elseif _G.Quest == "Onix [Lv. 15-20]" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1004.469543457, 1180.1822509766, -112.51270294189)
            game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("Defeat Onix Hero")
        elseif _G.Quest == "Uraraka [Lv. 20-30]" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-273.63955688477, 1180.1822509766, 204.02272033691)
            game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("Defeat Uraraka ALT")
        elseif _G.Quest == "Todoroki [Lv. 30-40]" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(464.34393310547, 1180.1821289062, -63.160873413086)
            game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("Defeat Todorki Hero")
        elseif _G.Quest == "Gun Head [Lv. 40-50]" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(945.04498291016, 1180.1823730469, -1116.1037597656)
            game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("DefeatGunHeadStudents")
        elseif _G.Quest == "Nomus [Lv. 50-60]" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1125.4204101562, 1179.1822509766, 355.70474243164)
            game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("Help Defeat Nomus")
        elseif _G.Quest == "Jeff [Lv. 60-70]" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-468.70086669922, 1180.1823730469, -1135.6849365234)
            game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("Defeat musce Vilain")
        elseif _G.Quest == "Lerion [Lv. 60-70]" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-632.16473388672, 1180.1821289062, -1121.3626708984)
                game:GetService("ReplicatedStorage").Quests.AcceptQuest:FireServer("Defeat Muscle")
                end;
            end;
        end);
    end;
end);


page1:Drop("Quest NPC",false,{"Zak [Lv. 1-10]","Bus [Lv. 10-15]","Onix [Lv. 15-20]","Uraraka [Lv. 20-30]","Todoroki [Lv. 30-40]","Gun Head [Lv. 40-50]","Nomus [Lv. 50-60]","Jeff [Lv. 60-70]","Lerion [Lv. 60-70]"},function(value)
    _G.Quest = value
end);

page1:Drop("Mob",false,{"Neighbor","Prisoner","OnixBoss","Uraraka","Shoto Todoroki","GunheadStudent","Nomu","Muscle Boss"},function(value)
    _G.Mob = value
end);

local page2 = Tap1:newpage()

page2:Drop("Attack Method",false,{"Instant","Normal"},function(value)
    _G.Method = value
end);

page2:Toggle("Hide Name",false,function(value)
    _G.HideName = value

    while _G.HideName and wait() do
    pcall(function()
        if game.Players.LocalPlayer.Character.Head:FindFirstChild("OverheadUI") then
                game.Players.LocalPlayer.Character.Head.OverheadUI:Destroy()
            end;
        end);
    end;
end);

page2:Toggle("Auto Attack",false,function(value)
    _G.Attack = value

    while _G.Attack and wait(_G.TimeIns) do
        if _G.Method == "Normal" then
            attack()
        else
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("Handle_Combat",game:GetService("Players").LocalPlayer.Character,6)
        end;
    end;
end);

page2:TextBox("Instant Time","Recommend 0.1 - 0.5",function(value)
    _G.TimeIns = value
end);

page2:Drop("Quirk",false,TBL,function(value)
    _G.Steal = value
end);

page2:Button("Rob Quirk", function()
for i,v in pairs(game:GetDescendants()) do
    if v.Name == _G.Steal then
            v.Parent = game.Players.LocalPlayer.Backpack
        end;
    end;
end);

page2:Button("Copy Discord", function()
setclipboard("https://discord.gg/8XfrZSxyKk")
create:Notifile("Thanks","Copied To Clipboard",3)
end);


local Tap3 = Window:Taps("Auto Stats")
local page4 = Tap3:newpage()

page4:Toggle("Auto Strength",false,function(value)
_G.S = value

while _G.S and wait(1) do
        game:GetService("ReplicatedStorage").Remotes.To_Server.AddStat:FireServer("StrengthUp",1)
    end;
end);

page4:Toggle("Auto Defense",false,function(value)
    _G.D = value

    while _G.D and wait(1) do
        game:GetService("ReplicatedStorage").Remotes.To_Server.AddStat:FireServer("DurabilityUp",1)
    end;
end);

page4:Toggle("Auto Stamina",false,function(value)
    _G.SS = value

    while _G.SS and wait(1) do
        game:GetService("ReplicatedStorage").Remotes.To_Server.AddStat:FireServer("StaminaUp",1)
    end;
end);

page4:Toggle("Auto Quirk",false,function(value)
    _G.Q = value
    
    while _G.Q and wait(1) do
        game:GetService("ReplicatedStorage").Remotes.To_Server.AddStat:FireServer("QuirkMasteryUp",1)
    end;
end);


local Tap2 = Window:Taps("Extra")
local page3 = Tap2:newpage()

page3:Label("Cum Tbh")

page3:Toggle("God Mode",false,function(value)
    _G.GodMode = value

    while _G.GodMode and wait() do
        pcall(function()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.Name == ("Grip_Ting") or v.Name == ("is_grip_asdasd") or v.Name == ("KnockedOut") then
                    v:Destroy()
                end;
            end;
        end);
    end;
end);

page3:Toggle("Anti-Ragdoll",false,function(value)
    _G.NoStun = value

    while _G.NoStun and wait() do
        pcall(function()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.Name == ("Stun") or v.Name == ("RagDoll") then
                    v:Destroy()
                end;
            end;
        end);
    end;
end);

page3:Slider("WalkSpeed",false,false,0,500,10,1,false,function(value)
_G.Speed = value
mt.__newindex = newcclosure(function(o, k, v)
    if tostring(o) == "Humanoid" and tostring(k) == "WalkSpeed" then
      return old(o, k, _G.Speed)
    end;
    return old(o, k, v)
  end);
end);
