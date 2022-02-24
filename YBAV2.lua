   --//Start Script Here Please...
   local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

   local X = Material.Load({
       Title = "Project 10x",
       Style = 2,
       SizeX = 500,
       SizeY = 350,
       Theme = "Dark",
       ColorOverrides = {
           MainFrame = Color3.fromRGB(60,60,60)
       }
   })

   for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
       v:Disable();
   end;    
   
   local Y = X.New({
       Title = "Main"
   })
   
   local Y2 = X.New({
       Title = "Skills"
   })

   local Y3 = X.New({
       Title = "Extra"
   })
   
   local MobsTBL = {"Zombie Henchman","Security Guard","Deovolo","Vampire","Thug","Bruce Brunorati","Alpha Thug","Deo","Corrupt Police","Joe","Ice Cube","Leaking Eye Luke"}
   local QuestTBL = {"Officer Sam [Lvl. 1+]","Deputy Bertrude [Lvl. 10+]","Lion [Lvl 15+]","Dracula [Lvl. 20+]","Dopey [Lvl. 30+]","Deo [Lvl. 35+]"}
   local mt = getrawmetatable(game)
   local old = mt.__newindex

   local hook;
   hook = hookfunction(getrawmetatable(game).__namecall, newcclosure(function(self, ...)
       local args = {...}
           if getnamecallmethod() == "InvokeServer" then
               if args[1] == "idklolbrah2de" then
               return "  ___XP DE KEY"
           end;
       end;
       return hook(self, ...)
   end));


   local M = Y.Dropdown({Text = "Mob", Options = MobsTBL, Callback = function(value)
       _G.Mob = value
   end})
   
   local A = Y.Toggle({Text = "Autofarm",Callback = function(value)
       _G.Autofarm = value
       while _G.Autofarm and wait() do
       pcall(function()
           for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
                   if v.Name == _G.Mob and v.Health.Value > 0 then
                       repeat wait()
                       if v.Health.Value > 0 then
                       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + (v.HumanoidRootPart.CFrame.lookVector * -_G.DIS)
                       game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer("Attack","m1") end;
                       if v.Health.Value <= 0 then
                           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(170.16456604004, 877.81109619141, 290.9909362793)
                       end;
                       until not _G.Autofarm or v.Health.Value <= 0
                   end;
               end;
           end);
       end;
   end})
   
   local DQ = Y.Dropdown({Text = "Quest", Options = QuestTBL, Callback = function(value)
       _G.Quest = value
   end})
   
   local Q = Y.Toggle({Text = "Auto Quest", Callback = function(value)
       _G.AutoQuest = value
   
       while _G.AutoQuest and wait(1) do
       pcall(function()
       local QFrame = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Main.Frames.Quest.Quests
   
       if _G.Quest == "Officer Sam [Lvl. 1+]" then
           if not QFrame:FindFirstChild("Take down 5 thugs") then
           local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Officer Sam",["Speaker"]="Officer Sam [Lvl. 1+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait()local a={[1]="ReturnQuest",[2]="Take down 5 thugs"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait()local a={[1]="EndDialogue",[2]={["NPC"]="Officer Sam",["Option"]="Option1",["Dialogue"]="Dialogue5"}} end;
           elseif _G.Quest == "Deputy Bertrude [Lvl. 10+]" then
               if not QFrame:FindFirstChild("Take down 5 corrupt police") then
               local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Deputy Bertrude",["Speaker"]="Deputy Bertrude [Lvl. 10+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait()local a={[1]="ReturnQuest",[2]="Take down 5 corrupt police"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait()local a={[1]="EndDialogue",[2]={["NPC"]="Deputy Bertrude",["Option"]="Option1",["Dialogue"]="Dialogue5"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
           elseif _G.Quest == "Lion [Lvl 15+]" then
               if not QFrame:FindFirstChild("Take down 5 alpha thugs") then
               local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Lion Abbacho's Partner",["Speaker"]="Lion Abbacho's Partner [Lvl 15+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait()local a={[1]="ReturnQuest",[2]="Take down 5 alpha thugs"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait()local a={[1]="EndDialogue",[2]={["NPC"]="Lion Abbacho's Partner",["Option"]="Option1",["Dialogue"]="Dialogue7"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
           elseif _G.Quest == "Dracula [Lvl. 20+]" then
               if not QFrame:FindFirstChild("Take down 3 zombie henchmans") then
               local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Dracula",["Speaker"]="Dracula [Lvl. 20+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait()local a={[1]="ReturnQuest",[2]="Take down 3 zombie henchmans"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait()local a={[1]="EndDialogue",[2]={["NPC"]="Dracula",["Option"]="Option1",["Dialogue"]="Dialogue4"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
            elseif _G.Quest == "Dopey [Lvl. 30+]" then
                if not QFrame:FindFirstChild("Defeat Deo") then
                    local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Dopey",["Speaker"]="Dopey [Lvl. 30+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait()local a={[1]="EndDialogue",[2]={["NPC"]="Dopey",["Option"]="Option1",["Dialogue"]="Dialogue5"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
           elseif _G.Quest == "Deo [Lvl. 35+]" then
               if not QFrame:FindFirstChild("Defeat Joe") then
                   local a={[1]="DialogueInteracted",[2]={["DialogueName"]="Deo",["Speaker"]="Deo [Lvl. 35+]"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))wait()local a={[1]="ReturnQuest",[2]="Defeat Joe"}game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(a))wait()local a={[1]="EndDialogue",[2]={["NPC"]="Deo",["Option"]="Option1",["Dialogue"]="Dialogue4"}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a)) end;
               end;
           end);
       end;
   end})

   local C = Y.Slider({Text = "Distance",Min = 0,Max = 6,Def = 4.5,Callback = function(value)
       _G.DIS = value
   end})

    Y.Toggle({Text = "Auto Detect Level", Callback = function(value)
        _G.Detect = value
 
        while _G.Detect and wait(1) do
        pcall(function()
            if game:GetService("Players").LocalPlayer.PlayerStats.Level.Value >= 1 and game:GetService("Players").LocalPlayer.PlayerStats.Level.Value <= 10 then
                _G.Mob = "Thug"
                _G.Quest = "Officer Sam [Lvl. 1+]"
            elseif game:GetService("Players").LocalPlayer.PlayerStats.Level.Value >= 10 and game:GetService("Players").LocalPlayer.PlayerStats.Level.Value <= 15 then
                _G.Mob = "Corrupt Police"
                _G.Quest = "Deputy Bertrude [Lvl. 10+]"
            elseif game:GetService("Players").LocalPlayer.PlayerStats.Level.Value >= 15 and game:GetService("Players").LocalPlayer.PlayerStats.Level.Value <= 20 then
                _G.Mob = "Alpha Thug"
                _G.Quest = "Lion [Lvl 15+]"
            elseif game:GetService("Players").LocalPlayer.PlayerStats.Level.Value >= 20 and game:GetService("Players").LocalPlayer.PlayerStats.Level.Value <= 30 then
                _G.Mob = "Zombie Henchman"
                _G.Quest = "Dracula [Lvl. 20+]"
            elseif game:GetService("Players").LocalPlayer.PlayerStats.Level.Value >= 30 and game:GetService("Players").LocalPlayer.PlayerStats.Level.Value <= 35 then
                _G.Mob = "Deo"
                _G.Quest = "Dopey [Lvl. 30+]"
            elseif game:GetService("Players").LocalPlayer.PlayerStats.Level.Value >= 35 and game:GetService("Players").LocalPlayer.PlayerStats.Level.Value <= 50 then
                _G.Mob = "Joe"
                _G.Quest = "Deo [Lvl. 35+]"
                end;
            end);
        end;
    end})
       
   
   --//Second Tab
   
   local AS = Y2.Toggle({Text = "Auto Stand",Callback = function(value)
       _G.AutoStand = value
   
       while _G.AutoStand and wait(.3) do
       pcall(function()
       if game.Players.LocalPlayer.Character:FindFirstChild("SummonedStand") then
           if game.Players.LocalPlayer.Character.SummonedStand.Value == false then
                   game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer("ToggleStand","Toggle")
                   end;
               end;
           end);
       end;
   end})

   pcall(function()
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
            if _G.Autofarm then
                A:SetState(false) wait(2)
                A:SetState(true)
            end;
        end);
    end);

    pcall(function()
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            if _G.AutoStand then
                AS:SetState(false) wait(2)
                AS:SetState(true)
            end;
        end);
    end);
   
   Y2.Toggle({Text = "Skill E",Callback = function(value)
       _G.E = value
   
       while _G.E and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.E}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill R",Callback = function(value)
       _G.R = value
   
       while _G.R and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.R}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill T",Callback = function(value)
       _G.T = value
   
       while _G.T and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.T}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill Y",Callback = function(value)
       _G.Y = value
   
       while _G.Y and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.Y}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})

   Y2.Toggle({Text = "Skill Z",Callback = function(value)
    _G.Z = value

    while _G.Z and wait() do
            local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.Z}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
        end;
    end})
   
   Y2.Toggle({Text = "Skill U",Callback = function(value)
       _G.U = value
   
       while _G.U and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.U}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill G",Callback = function(value)
       _G.G = value
   
       while _G.G and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.G}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill H",Callback = function(value)
       _G.H = value
   
       while _G.H and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.H}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill J",Callback = function(value)
       _G.J = value
   
       while _G.J and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.J}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill X",Callback = function(value)
       _G.X = value
   
       while _G.X and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.X}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill C",Callback = function(value)
       _G.C = value
   
       while _G.C and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.C}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill V",Callback = function(value)
       _G.V = value
   
       while _G.V and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.V}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})
   
   Y2.Toggle({Text = "Skill B",Callback = function(value)
       _G.B = value
   
       while _G.B and wait() do
           local a={[1]="InputBegan",[2]={["Input"]=Enum.KeyCode.B}}game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(a))
       end;
   end})

   Y3.Toggle({Text = "WalkSpeed",Callback = function(value)
       _G.WSOn = value
   end})

   Y3.Slider({Text = "Speed",Min = 16, Max = 500, Def = 0,Callback = function(value)
       _G.WSValue = value
   end})

   Y3.Toggle({Text = "JumpPower",Callback = function(value)
       _G.JPOn = value
   end})

   Y3.Slider({Text = "Power",Min = 16, Max = 500, Def = 0,Callback = function(value)
       _G.JPValue = value
   end})

   Y3.Button({Text = "Kill Yourself",Callback = function()
       game.Players.LocalPlayer.Character.Humanoid.Health = 0
   end})

   setreadonly(mt, false);
   mt.__newindex = newcclosure(function(f,k,v)
       if tostring(f) == "Humanoid" and tostring(k) == "WalkSpeed" and _G.WSOn then
           return old(f,k,_G.WSValue);
       end;
       if tostring(f) == "Humanoid" and tostring(k) == "JumpPower" and _G.JPOn then
           return old(f,k,_G.JPValue);
       end;
       return old(f,k,v);
   end);
