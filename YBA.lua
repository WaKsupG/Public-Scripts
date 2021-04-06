    local MobsTBL = {
    "Zombie Henchman","Security Guard","Deovolo","Vampire","Thug","Bruce Brunorati","Alpha Thug","Deo","Corrupt Police","Joe","Ice Cube","Leaking Eye Luke"
    }
    
    --//Quest\\--
    local Quests = {""};
    for i,v in pairs(game:GetService("Workspace").Dialogues:GetChildren()) do
        if v:IsA("Model") and v.Name:match("+") then
            table.insert(Quests,v.Name)
        end;
    end;
    
    --//Vars\\--
    local serv = {}; --//Also JexyTD
    setmetatable(serv, {__index = function(a,b) return game:GetService(b) end, __newindex = function(t,k) t[k] = nil return end});
    local QuestN = "";
    local MobVal = "";
    local cam = workspace.CurrentCamera;
    local plr = serv.Players.LocalPlayer;
    local Distance = {0, 0, 4};
    local Speed = 100;
    getgenv().AutoQuest = false
    
    --//Tween Function\\--
    --Stolen From JexyTD So Credits To Him LOL--
    local function TweenTP(a, b, c, d) 
        if not type(c) == "table" then return end 
        if typeof(b) == "CFrame" then IsCFrame = true end 
        local a = a or plr; 
        pcall(function() 
            if IsCFrame then 
                local cframe = b; 
                local vector3 = cframe.p; 
                local Info = TweenInfo.new(a:DistanceFromCharacter(vector3 + Vector3.new(unpack(c))) / d, Enum.EasingStyle.Linear, Enum.EasingDirection.Out); 
                local tweens = game:service'TweenService':Create(a.Character.HumanoidRootPart, Info, {CFrame = cframe + Vector3.new(unpack(c))}):Play(); 
                wait(a:DistanceFromCharacter(vector3 + Vector3.new(unpack(c))) / d); 
            else 
                local Info = TweenInfo.new(a:DistanceFromCharacter(b.Position + Vector3.new(unpack(c))) / d, Enum.EasingStyle.Linear, Enum.EasingDirection.Out); 
                local tweens = game:service'TweenService':Create(a.Character.HumanoidRootPart, Info, {CFrame = b.CFrame * CFrame.new(unpack(c))}):Play(); 
                wait(a:DistanceFromCharacter(b.Position + Vector3.new(unpack(c))) / d); 
            end 
        end) 
    end
    
    
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Tools/main/Venyx%20UI"))()
    
    local library = library.new("Epic Hub", 5013109572)
    
    --//Page Starting\\--
    local page = library:addPage("Main", 5012544693)
    
    local section1 = page:addSection("Autofarms")
    local section2 = page:addSection("Settings")
    
    section1:addDropdown("Quest",Quests, function(value)
        QuestN = value
    end);
    
    section1:addDropdown("Mob",MobsTBL, function(value)
        MobVal = value
    end);
    
    section1:addToggle("Autofarm",false, function(value)
    getgenv().Autofarm = value
    
    while getgenv().Autofarm and wait() do
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
            if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                if v.Name == MobVal and v.Humanoid.Health > 0 then
                    repeat wait()
                        if v:FindFirstChild("RagdollScript") then v:FindFirstChild("RagdollScript"):remove() end;
                        TweenTP(nil, v.HumanoidRootPart, Distance, Speed)
                        game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer("Attack","m1")
                        if v:FindFirstChild("Health") and v.Health.Value <= 0 then v:remove() end
                        until v.Health.Value <= 0 or not getgenv().Autofarm
                        end;
                    end;
                end
            end);
        end;
    end);
    
    section1:addToggle("Auto Quest",false, function(value)
        getgenv().AutoQuest = value
        
        while getgenv().AutoQuest and wait() do
        for i,v in pairs(game:GetService("Workspace").Dialogues:GetChildren()) do
            if v.Name == QuestN then mouse1click()
                repeat wait()
                    if game:GetService("Players").LocalPlayer.PlayerStats.QuestProgress.Value == game:GetService("Players").LocalPlayer.PlayerStats.QuestMaxProgress.Value then
                    TweenTP(nil, v.HumanoidRootPart, Distance, Speed)
                    fireclickdetector(v.TalkBox.ClickDetector)
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Dialogue") then
                    mousemoveabs(650.4, 690.718) end; end;
                    until not getgenv().AutoQuest
                end;
            end;
        end;
    end);
    
    section2:addToggle("Coming Soon :D",false, function(value)
    
    end);

    section2:addToggle("Credits To JexyTD For Some Functions I Stole LOL",false, function(value)

    end);
