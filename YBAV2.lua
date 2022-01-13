local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/un-named%20backups/jans", true))()

local Window = Library:CreateWindow("10x - YBA")

local folder = Window:AddFolder("Autofarms")

local MobsTBL = {"Zombie Henchman","Security Guard","Deovolo","Vampire","Thug","Bruce Brunorati","Alpha Thug","Deo","Corrupt Police","Joe","Ice Cube","Leaking Eye Luke"}
local QuestTBL = {"Officer Sam [Lvl. 1+]","Deputy Bertrude [Lvl. 10+]","Lion [Lvl 15+]","Dracula [Lvl. 20+]","Deo [Lvl. 35+]"}
local Hook;
Hook = hookfunction(getrawmetatable(game).__namecall, newcclosure(function(self, ...)
    local args = {...}
        if getnamecallmethod() == "InvokeServer" then
            if args[1] == "idklolbrah2de" then
            return "  ___XP DE KEY"
        end;
    end;
    return Hook(self, ...)
end));

folder:AddList({text = "Mob", values = MobsTBL, callback = function(value)
    _G.Mob = value
end});

folder:AddToggle({text = "Autofarm", callback = function(value) 
    _G.Autofarm = value
    
    while _G.Autofarm and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
            if not v:FindFirstChild(_G.Mob) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(170.16456604004, 877.81109619141, 290.9909362793) end;
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == _G.Mob and v.Humanoid.Health > 0 then
                    repeat wait()
                        if v:FindFirstChild("RagdollScript") then v:FindFirstChild("RagdollScript"):remove() end;
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -3)
                        game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer("Attack","m1")
                        if v:FindFirstChild("Health") and v.Health.Value <= 0 then v:remove() end
                        until not _G.Autofarm
                    end;
                end;
            end
        end);
    end;
end});

folder:AddList({text = "Quest", values = QuestTBL, callback = function(value)
    _G.Quest = value
end});

folder:AddToggle({text = "Auto Quest", callback = function(value) 
    _G.AutoQuest = value

    while _G.AutoQuest and wait() do
    pcall(function()
    local QFrame = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Main.Frames.Quest.Quests

    if _G.Quest == "Officer Sam [Lvl. 1+]" then
        if not QFrame:FindFirstChild("Take down 5 thugs") then
        local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Officer Sam",["Speaker"]="Officer Sam [Lvl. 1+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(2)local a={[1]="ReturnQuest",[2]="Take down 5 thugs"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Officer Sam",["Option"]="Option1",["Dialogue"]="Dialogue5"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))local a={[1]="ReturnData"}game:GetService("Players").LocalPlayer.QuestsRemoteFunction:InvokeServer(unpack(a)) end;
        elseif _G.Quest == "Deputy Bertrude [Lvl. 10+]" then
            if not QFrame:FindFirstChild("Take down 5 corrupt police") then
            local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Deputy Bertrude",["Speaker"]="Deputy Bertrude [Lvl. 10+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(1)local a={[1]="ReturnQuest",[2]="Take down 5 corrupt police"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Deputy Bertrude",["Option"]="Option1",["Dialogue"]="Dialogue5"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
        elseif _G.Quest == "Lion [Lvl 15+]" then
            if not QFrame:FindFirstChild("Take down 5 alpha thugs") then
            local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Lion Abbacho's Partner",["Speaker"]="Lion Abbacho's Partner [Lvl 15+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(1)local a={[1]="ReturnQuest",[2]="Take down 5 alpha thugs"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Lion Abbacho's Partner",["Option"]="Option1",["Dialogue"]="Dialogue7"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
        elseif _G.Quest == "Dracula [Lvl. 20+]" then
            if not QFrame:FindFirstChild("Take down 3 zombie henchmans") then
            local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Dracula",["Speaker"]="Dracula [Lvl. 20+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(1)local a={[1]="ReturnQuest",[2]="Take down 3 zombie henchmans"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Dracula",["Option"]="Option1",["Dialogue"]="Dialogue4"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
        elseif _G.Quest == "Dracula [Lvl. 20+]" then
            if not QFrame:FindFirstChild("Defeat Joe") then
                local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Deo",["Speaker"]="Deo [Lvl. 35+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(1)local a={[1]="ReturnQuest",[2]="Defeat Joe"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Deo",["Option"]="Option1",["Dialogue"]="Dialogue4"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
            end;
        end);
    end;
end});

folder:AddButton({text = "Discord", callback = function()
    setclipboard("https://discord.com/invite/MAzdhG55er")
end});

local Window1 = Library:CreateWindow("Stuff")

local folder2 = Window1:AddFolder("Extra")

folder2:AddToggle({text = "Auto Stand", callback = function(value)
    _G.AutoStand = value

    while _G.AutoStand and wait(.3) do
    pcall(function()
        if game.Players.LocalPlayer.Character.SummonedStand.Value == false then
                game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer("ToggleStand","Toggle")
            end;
        end);
    end;
end});

local folder1 = Window1:AddFolder("Skills")

folder1:AddToggle({text = "Auto E", callback = function(value)
    _G.E = value

    while _G.E and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.E}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto R", callback = function(value)
    _G.R = value

    while _G.R and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.R}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto T", callback = function(value)
    _G.T = value

    while _G.T and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.T}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto Y", callback = function(value)
    _G.Y = value

    while _G.Y and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.Y}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto U", callback = function(value)
    _G.U = value

    while _G.U and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.U}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto G", callback = function(value)
    _G.G = value

    while _G.G and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.G}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto H", callback = function(value)
    _G.H = value

    while _G.H and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.H}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto J", callback = function(value)
    _G.J = value

    while _G.J and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.J}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto X", callback = function(value)
    _G.X = value

    while _G.X and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.X}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto C", callback = function(value)
    _G.C = value

    while _G.C and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.C}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto V", callback = function(value)
    _G.V = value

    while _G.V and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.V}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto B", callback = function(value)
    _G.B = value

    while _G.B and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.B}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

Library:Init()
