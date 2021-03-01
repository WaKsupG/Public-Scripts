local library = loadstring(game:HttpGet("https://pastebin.com/raw/zH17BK2a", true))()


--//Credits To {} I Kinda stole his autoquest idea lmaoo\\--

local example = library:CreateWindow({
  text = "Main"
})

local Set = library:CreateWindow({
    text = "Settings"
})

local extra = library:CreateWindow({
    text = "Credits"
  })

--//Quest Table\\--
local QuestTbl = {};

for i,v in pairs(game:GetService("ReplicatedStorage").Package.Quests:GetChildren()) do
    table.insert(QuestTbl,v.Name)
end;

--//Npc Table\\--
local NPC = {};

for i,v in pairs(game:GetService("Workspace").Others.NPCSpawns:GetChildren()) do
    table.insert(NPC,v.Name)
end;

--//Vars\\--
local CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local Player = game:GetService("Players").LocalPlayer;
local Human = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
local MobP = "";
local QuestP = "";
local USERID = game.Players.LocalPlayer.UserId
local DIS = -3

--//Main Section\\--

example:AddToggle("Autofarm", function(value)
    _G.Autofarm = value

    while _G.Autofarm and wait() do
        for i,v in pairs(game.Workspace.Living:GetChildren()) do
        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if _G.AutoQuest and game:GetService("ReplicatedStorage").Datas[USERID].QuestProgress.Value == 0 then 
                    game:GetService("ReplicatedStorage").Package.Events.GetQuest:InvokeServer(QuestP) end; 
                        if string.match(v.Name, MobP) and v.Humanoid.Health > 0 then
                        repeat wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * DIS)
                        game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(1) game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(2) game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(3) game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(4) game:GetService("ReplicatedStorage").Package.Events.Combat:FireServer(5)
                    until v.Humanoid.Health <= 0 or not _G.Autofarm
                end;
            end;
        end;
    end;
end);

example:AddToggle("Auto Quest", function(value)
    _G.AutoQuest = value
end);

example:AddLabel("Mob");

local dropdown;
dropdown = example:AddDropdown(NPC, function(value)
    MobP = value
end);

example:AddLabel("Quest");

local dropdown;
dropdown = example:AddDropdown(QuestTbl, function(value)
    QuestP = value
end);

--//Settings\\--

Set:AddLabel("Skills");

Set:AddToggle("Use Skills", function(value)
_G.UseSkills = value
end);

Set:AddToggle("First Skill", function(value)
    _G.Skill1 = value

    while _G.UseSkills and _G.Skill1 and wait() do
        local a={[1]="1",[2]="Down",[3]={["Mobile"]=false}}game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(a))
    end;
end);

Set:AddToggle("Second Skill", function(value)
    _G.Skill2 = value

    while _G.UseSkills and _G.Skill2 and wait() do
        local a={[1]="2",[2]="Down",[3]={["Mobile"]=false}}game:GetService("ReplicatedStorage").Package.Events.Skill:InvokeServer(unpack(a))
    end;
end);

Set:AddLabel("Autofarm");

Set:AddBox("Distance", function(Goul, Reg)
    DIS = tonumber(Goul.Text) or -3
end);

Set:AddToggle("Auto Equip", function(value)
    _G.Equip = value
    while _G.Equip and wait() do
        if game:GetService("Players").LocalPlayer.Status.Weapon.Value == "None" then
            game:GetService("ReplicatedStorage").Package.Events.EquipUnequip:InvokeServer()
        end;
    end;
end);

--//Credits & Options Section\\--

extra:AddToggle("Hide Name", function(value)
    _G.HideN = value

    while _G.HideN and wait() do
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v.Name == 'Pants' or v.ClassName == "Accessory" or v.Name == 'Shirt' or v.Name == 'Title' then
                 v:Destroy()
            end;
        end; 
    end;
end);

extra:AddButton("Copy Discord", function()
    setclipboard('https://discord.gg/Tcdx6RwjGR')
end);
