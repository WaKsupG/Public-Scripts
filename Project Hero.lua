--//Alright listen before you judge my code I know i could of done everything 100000000x easier i just wanted it to look good cause i like this game LOL
--//loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Public-Scripts/main/Project%20Hero.lua"))();

local create = loadstring(game:HttpGet("http://www.mene.world/WhoAmI.lua"))()
local Window = create:Win("Sex Man")
create:Notifile("10x UwU Rawr","Ty mene for ui lib sexy",3)
local Tap1 = Window:Taps("Project Hero")
local page1 = Tap1:newpage()
page1:Label("Autofarm")
page1:Line()

local Mob = {};

for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
    if v:IsA("Model") then
    table.insert(Mob,v.Name)
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
        if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ActiveQuest.Visible == true then
        for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
            if v:IsA("Model") then
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == _G.Mob and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    if not v:FindFirstChild(_G.Mob) then _G.Timer = 4 else _G.Timer = 0 end;
                    repeat wait()
                            v.HumanoidRootPart.Anchored = true
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -3)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position)
                            until v.Humanoid.Health <= 0 or not _G.Autofarm
                        end;
                    end;
                end;
            end;
        end;
    end;
end);

page1:Toggle("Auto Quest",false,function(value)
    _G.AutoQuest = value

    while _G.AutoQuest and wait(2) do
    if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ActiveQuest.Visible == false then
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
            end;
        end;
    end;
end);


page1:Drop("Quest NPC",false,{"Zak [Lv. 1-10]","Bus [Lv. 10-15]","Onix [Lv. 15-20]","Uraraka [Lv. 20-30]","Todoroki [Lv. 30-40]","Gun Head [Lv. 40-50]","Nomus [Lv. 50-60]","Jeff [Lv. 60-70]"},function(value)
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

page2:TextBox("Instant Time","Recommend 0 - 0.5",function(value)
    _G.TimeIns = value
end);



page2:Button("Copy Discord", function()
setclipboard("https://discord.gg/8XfrZSxyKk")
create:Notifile("Thanks","Copied To Clipboard",3)
end);
