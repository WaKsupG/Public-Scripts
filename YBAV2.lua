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
    shared.Mob = value
end});

folder:AddToggle({text = "Autofarm", callback = function(value) 
    shared.Autofarm = value
    
    while shared.Autofarm and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
            if not v:FindFirstChild(shared.Mob) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(170.16456604004, 877.81109619141, 290.9909362793) end;
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == shared.Mob and v.Humanoid.Health > 0 then
                    repeat wait()
                        if v:FindFirstChild("RagdollScript") then v:FindFirstChild("RagdollScript"):remove() end;
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -3)
                        game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer("Attack","m1")
                        if v:FindFirstChild("Health") and v.Health.Value <= 0 then v:remove() end
                        until not shared.Autofarm
                    end;
                end;
            end
        end);
    end;
end});

folder:AddList({text = "Quest", values = QuestTBL, callback = function(value)
    shared.Quest = value
end});

folder:AddToggle({text = "Auto Quest", callback = function(value) 
    shared.AutoQuest = value

    while shared.AutoQuest and wait() do
    pcall(function()
    local QFrame = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Main.Frames.Quest.Quests

    if shared.Quest == "Officer Sam [Lvl. 1+]" then
        if not QFrame:FindFirstChild("Take down 5 thugs") then
        local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Officer Sam",["Speaker"]="Officer Sam [Lvl. 1+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(2)local a={[1]="ReturnQuest",[2]="Take down 5 thugs"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Officer Sam",["Option"]="Option1",["Dialogue"]="Dialogue5"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))local a={[1]="ReturnData"}game:GetService("Players").LocalPlayer.QuestsRemoteFunction:InvokeServer(unpack(a)) end;
        elseif shared.Quest == "Deputy Bertrude [Lvl. 10+]" then
            if not QFrame:FindFirstChild("Take down 5 corrupt police") then
            local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Deputy Bertrude",["Speaker"]="Deputy Bertrude [Lvl. 10+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(1)local a={[1]="ReturnQuest",[2]="Take down 5 corrupt police"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Deputy Bertrude",["Option"]="Option1",["Dialogue"]="Dialogue5"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
        elseif shared.Quest == "Lion [Lvl 15+]" then
            if not QFrame:FindFirstChild("Take down 5 alpha thugs") then
            local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Lion Abbacho's Partner",["Speaker"]="Lion Abbacho's Partner [Lvl 15+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(1)local a={[1]="ReturnQuest",[2]="Take down 5 alpha thugs"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Lion Abbacho's Partner",["Option"]="Option1",["Dialogue"]="Dialogue7"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
        elseif shared.Quest == "Dracula [Lvl. 20+]" then
            if not QFrame:FindFirstChild("Take down 3 zombie henchmans") then
            local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Dracula",["Speaker"]="Dracula [Lvl. 20+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait(1)local a={[1]="ReturnQuest",[2]="Take down 3 zombie henchmans"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait(1)local a={[1]="EndDialogue",[2]={["NPC"]="Dracula",["Option"]="Option1",["Dialogue"]="Dialogue4"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
        elseif shared.Quest == "Dracula [Lvl. 20+]" then
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
    shared.AutoStand = value

    while shared.AutoStand and wait(.3) do
    pcall(function()
        if game.Players.LocalPlayer.Character.SummonedStand.Value == false then
                game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer("ToggleStand","Toggle")
            end;
        end);
    end;
end});

local folder1 = Window1:AddFolder("Skills")

folder1:AddToggle({text = "Auto E", callback = function(value)
    shared.E = value

    while shared.E and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.E}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto R", callback = function(value)
    shared.R = value

    while shared.R and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.R}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto T", callback = function(value)
    shared.T = value

    while shared.T and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.T}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto Y", callback = function(value)
    shared.Y = value

    while shared.Y and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.Y}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto U", callback = function(value)
    shared.U = value

    while shared.U and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.U}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto G", callback = function(value)
    shared.G = value

    while shared.G and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.G}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto H", callback = function(value)
    shared.H = value

    while shared.H and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.H}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto J", callback = function(value)
    shared.J = value

    while shared.J and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.J}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto X", callback = function(value)
    shared.X = value

    while shared.X and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.X}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto C", callback = function(value)
    shared.C = value

    while shared.C and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.C}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto V", callback = function(value)
    shared.V = value

    while shared.V and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.V}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

folder1:AddToggle({text = "Auto B", callback = function(value)
    shared.B = value

    while shared.B and wait() do
        local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.B}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
    end;
end});

Library:Init()
