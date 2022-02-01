    Library = loadstring(game:HttpGet("https://solarishub.dev/SolarisLib.lua"))()
    
    local win = Library:New({
        Name = "Blox Fruits - 10x",
        FolderToSave = "Nope Hub"
     })
     
     --//Vars\\--
     local QName = "";
     local Num = "";
     local Mob = "";
     local virtualUser = game:GetService('VirtualUser')
     local player = game.Players.LocalPlayer
     local Value1 = game.Players.LocalPlayer.Character.Energy.Value
     local plr = game:GetService("Players").LocalPlayer
     local tweenService = game:GetService("TweenService")
     local VirtualUser=game:service'VirtualUser'
     getgenv().speed = 250
     tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
     
     function infs()
         game.Players.LocalPlayer.Character.Energy.Changed:connect(function()
             game.Players.LocalPlayer.Character.Energy.Value = Value1
         end)
     end
     
     --//Tools\\--
     local ToolTBL = {};
     for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
         if v:IsA("Tool") then
             table.insert(ToolTBL, v.Name)
         end;
     end;
     
     local function attack()
         wait(math.random(.1,.2))
         if player.Backpack:FindFirstChild(UseTool) then
             player.Character.Humanoid:EquipTool(player.Backpack[UseTool])
         elseif player.Character:FindFirstChild(UseTool) then
         end
     end
     
     function toTarget(target)
         local speed = getgenv().speed
         local info = TweenInfo.new((target.Position - plr.Character.HumanoidRootPart.Position).Magnitude / speed, Enum.EasingStyle.Linear)
         local _, err = pcall(function()
             tweenService:Create(plr.Character.HumanoidRootPart, info, {CFrame = target}):Play()
         end)
         if err then error("Couldn't create/start tween: ", err) end
     end
     function newIndexHook()
         local mt = getrawmetatable(game)
         local oldIndex = mt.__newindex
         setreadonly(mt, false)
         mt.__newindex = newcclosure(function(self, i, v)
             if checkcaller() and self == plr.Character.HumanoidRootPart and i == 'CFrame' then
                 game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                 return toTarget(v) 
             end
             return oldIndex(self, i, v)
         end)
     setreadonly(mt, true)
     end
     newIndexHook()
     
     game:GetService("RunService").Stepped:Connect(function()
         if _G.Autofarm then
         for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
             if v:IsA("BasePart") and v.CanCollide == true then
                  game.Workspace.Gravity = -25
                  v.CanCollide = false
                  game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
               else
                 game.Workspace.Gravity = 150
               end;
            end;
         end;
      end);
     
     local tab = win:Tab("Main")
     
     local sec = tab:Section("Blox Fruits - 10x")
     
     --sec:Toggle(title <string>,default <boolean>, flag <string>, callback <function>)
     local toggle = sec:Toggle("Level Farm", false,"Toggle", function(value)
         _G.Autofarm = value
     
         while _G.Autofarm and wait() do
             if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
             for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                 if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                     if v.Name == _G.Mob and v.Humanoid.Health > 0 then
                         if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                             repeat wait()
                             v.HumanoidRootPart.CanCollide = false v.HumanoidRootPart.Size = Vector3.new(15, 20, 15)
                             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,-15,0)
                             VirtualUser:ClickButton1(Vector2.new(1,1)) attack()
                             until v.Humanoid.Health <= 0 or _G.Autofarm == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                             end;
                         end;
                     end;
                 end;
             end;
     
         if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
             repeat wait() --//This is awful ik
                 local magnitude1 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1059.37, 15.4495, 1550.42)).Magnitude 
                 local magnitude2 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1598.09, 35.5501, 153.378)).Magnitude 
                 local magnitude3 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1598.09, 35.5501, 153.378)).Magnitude 
                 local magnitude4 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1141.07, 4.10002, 3831.55)).Magnitude 
                 local magnitude5 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1141.07, 4.10002, 3831.55)).Magnitude 
                 local magnitude6 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(894.489, 5.14001, 4392.43)).Magnitude 
                 local magnitude7 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(894.489, 5.14001, 4392.43)).Magnitude 
                 local magnitude8 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1387.93, 87.2986, -1297.77)).Magnitude 
                 local magnitude9 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1387.93, 87.2986, -1297.77)).Magnitude 
                 local magnitude10 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5037.97, 28.6778, 4325.81)).Magnitude 
                 local magnitude11 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4840.09, 717.695, -2620.98)).Magnitude 
                 local magnitude12 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1578.78, 7.41514, -2985.86)).Magnitude 
                 local magnitude13 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1578.78, 7.41514, -2985.86)).Magnitude 
                 local magnitude14 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5314.81, 12.2625, 8516.33)).Magnitude 
                 local magnitude15 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5314.81, 12.2625, 8516.33)).Magnitude 
                 local magnitude16 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4721.54, 845.303, -1952.62)).Magnitude 
                 local magnitude17 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.1, 5544.19, -381.476)).Magnitude 
                 local magnitude18 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(5257.77, 38.5269, 4049.8)).Magnitude 
     
     
                 if game.Players.LocalPlayer.Data.Level.Value >= 0 and game.Players.LocalPlayer.Data.Level.Value < 10 then
                     _G.Mob = "Bandit [Lv. 5]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1058.64197, 16.7308006, 1548.39612, -0.983058572, -3.62602854e-08, 0.183291733, -3.95900166e-08, 1, -1.45070391e-08, -0.183291733, -2.1517792e-08, -0.983058572) wait(1.3)
                     if magnitude1 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BanditQuest1",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 10 and game.Players.LocalPlayer.Data.Level.Value < 15 then
                     _G.Mob = "Monkey [Lv. 14]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1599.69519, 36.8521385, 152.229828, -0.223487794, -5.55977522e-08, -0.974706709, -3.58744567e-09, 1, -5.62179387e-08, 0.974706709, -9.06731579e-09, -0.223487794) wait(1.3)
                     if magnitude2 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","JungleQuest",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 15 and game.Players.LocalPlayer.Data.Level.Value < 30 then
                     _G.Mob = "Gorilla [Lv. 20]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1600.50122, 36.8779411, 153.310196, 0.0300687663, -1.05255404e-08, -0.999547899, 1.07905e-08, 1, -1.0205695e-08, 0.999547899, -1.04787468e-08, 0.0300687663) wait(1.3)
                     if magnitude3 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","JungleQuest",2) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 30 and game.Players.LocalPlayer.Data.Level.Value < 40  then
                     _G.Mob = "Pirate [Lv. 35]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1140.31445, 4.77785587, 3828.89331, -0.971619725, -4.04230853e-08, 0.236548603, -5.81681121e-08, 1, -6.8037636e-08, -0.236548603, -7.98663109e-08, -0.971619725) wait(1.3)
                     if magnitude4 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BuggyQuest1",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 40 and game.Players.LocalPlayer.Data.Level.Value < 60 then
                     _G.Mob = "Brute [Lv. 45]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1140.31445, 4.77785587, 3828.89331, -0.971619725, -4.04230853e-08, 0.236548603, -5.81681121e-08, 1, -6.8037636e-08, -0.236548603, -7.98663109e-08, -0.971619725) wait(1.3)
                     if magnitude5 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BuggyQuest1",2) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 60 and game.Players.LocalPlayer.Data.Level.Value < 75 then
                     _G.Mob = "Desert Bandit [Lv. 60]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(896.173096, 6.46426821, 4390.53418, -0.809399545, 9.13879958e-08, 0.587258399, 7.05387322e-08, 1, -5.8396747e-08, -0.587258399, -5.84183768e-09, -0.809399545) wait(1.3)
                     if magnitude6 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","DesertQuest",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 75 and game.Players.LocalPlayer.Data.Level.Value < 90 then
                     _G.Mob = "Desert Officer [Lv. 70]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(896.173096, 6.46426821, 4390.53418, -0.809399545, 9.13879958e-08, 0.587258399, 7.05387322e-08, 1, -5.8396747e-08, -0.587258399, -5.84183768e-09, -0.809399545) wait(1.3)
                     if magnitude7 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","DesertQuest",2) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 90 and game.Players.LocalPlayer.Data.Level.Value < 100 then
                     _G.Mob = "Snow Bandit [Lv. 90]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1391.94434, 87.2985916, -1299.81482, -0.403577954, -1.16358194e-07, 0.914945245, -8.48047765e-09, 1, 1.23434333e-07, -0.914945245, 4.20562039e-08, -0.403577954) wait(1.3)
                     if magnitude8 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","SnowQuest",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 100 and game.Players.LocalPlayer.Data.Level.Value < 120 then
                     _G.Mob = "Snowman [Lv. 100]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1391.94434, 87.2985916, -1299.81482, -0.403577954, -1.16358194e-07, 0.914945245, -8.48047765e-09, 1, 1.23434333e-07, -0.914945245, 4.20562039e-08, -0.403577954) wait(1.3)
                     if magnitude9 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","SnowQuest",2) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 120 and game.Players.LocalPlayer.Data.Level.Value < 150 then
                     _G.Mob = "Chief Petty Officer [Lv. 120]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5037.3999, 28.6778412, 4324.73145, 0.00520073576, 6.9433149e-08, 0.99998641, 6.0223897e-08, 1, -6.97473013e-08, -0.99998641, 6.0585819e-08, 0.00520073576) wait(1.3)
                     if magnitude10 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","MarineQuest2",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 150 and game.Players.LocalPlayer.Data.Level.Value < 225 then
                     _G.Mob = "Sky Bandit [Lv. 150]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4840.52197, 717.695374, -2621.18481, -0.88410145, 1.23148197e-07, -0.467294961, 1.18970128e-07, 1, 3.84479435e-08, 0.467294961, -2.16022595e-08, -0.88410145) wait(1.3)
                     if magnitude11 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","SkyQuest",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 225 and game.Players.LocalPlayer.Data.Level.Value < 275 then
                     _G.Mob = "Toga Warrior [Lv. 225]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1577.51843, 7.41514301, -2985.13721, 0.501454055, 9.87559261e-08, 0.865184307, -6.08054265e-08, 1, -7.89020262e-08, -0.865184307, -1.3042162e-08, 0.501454055) wait(1.3)
                     if magnitude12 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","ColosseumQuest",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 275 and game.Players.LocalPlayer.Data.Level.Value < 300 then
                     _G.Mob = "Gladiator [Lv. 275]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1577.51843, 7.41514301, -2985.13721, 0.501454055, 9.87559261e-08, 0.865184307, -6.08054265e-08, 1, -7.89020262e-08, -0.865184307, -1.3042162e-08, 0.501454055) wait(1.3)
                     if magnitude13 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","ColosseumQuest",2) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 300 and game.Players.LocalPlayer.Data.Level.Value < 330 then
                     _G.Mob = "Military Soldier [Lv. 300]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5315.37158, 12.2626343, 8516.5752, 0.521885574, -3.06323393e-08, -0.853015542, 6.98466351e-09, 1, -3.1637331e-08, 0.853015542, 1.05530384e-08, 0.521885574) wait(1.3)
                     if magnitude14 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","MagmaQuest",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 330 and game.Players.LocalPlayer.Data.Level.Value < 450 then
                     _G.Mob = "Military Spy [Lv. 330]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5315.37158, 12.2626343, 8516.5752, 0.521885574, -3.06323393e-08, -0.853015542, 6.98466351e-09, 1, -3.1637331e-08, 0.853015542, 1.05530384e-08, 0.521885574) wait(1.3)
                     if magnitude15 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","MagmaQuest",2) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 450 and game.Players.LocalPlayer.Data.Level.Value < 475 then
                     _G.Mob ="God's Guard [Lv. 450]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4721.53662, 845.302979, -1952.62, -0.998197973, 6.45860609e-08, 0.0600069761, 6.20202556e-08, 1, -4.46208901e-08, -0.0600069761, -4.08188328e-08, -0.998197973) wait(1.3)
                     if magnitude16 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","SkyExp1Quest",1) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 475 and game.Players.LocalPlayer.Data.Level.Value < 625 then
                     _G.Mob = "Shanda [Lv. 475]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7861.71533, 5545.51758, -381.970581, 0.505304635, -3.84226269e-08, -0.862941027, 5.78074655e-08, 1, -1.0675409e-08, 0.862941027, -4.44901005e-08, 0.505304635) wait(1.3)
                     if magnitude17 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","SkyExp1Quest",2) end;
                     elseif game.Players.LocalPlayer.Data.Level.Value >= 625 and game.Players.LocalPlayer.Data.Level.Value < 700 then
                     _G.Mob = "Galley Pirate [Lv. 625]"
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5257.77148, 38.5269432, 4049.80347, -0.0350184143, -8.86951241e-08, -0.999386668, -7.2408092e-08, 1, -8.62123883e-08, 0.999386668, 6.9344658e-08, -0.0350184143) wait(1.3)
                     if magnitude18 <= 4 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","FountainQuest",1) end;
                     end;
                 until game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true or _G.Autofarm == false
             end;
         end;
     end)
     
     local toggle = sec:Toggle("Auto Buso", false,"Toggle", function(value)
         _G.AutoBuso = value
     
         while _G.AutoBuso and wait() do
             for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
             end;
         end;
     end);
     
     
     local dropdown = sec:Dropdown("Melee",ToolTBL,"","Dropdown", function(t)
         UseTool = t
     end);
     
     local label = sec:Label("Note, Do Not Use Autobuso with no buso haki!")
     
     local label = sec:Label("Sea 2 & 3 Soon DW")
     
     
     local tab2 = win:Tab("Teleport")
     
     local sec2 = tab2:Section("Stuff")
     
     sec2:Button("The Colosseum", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1461.09448, 7.28632164, -2862.42725)
     end);
     
     sec2:Button("The Desert", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(911.543213, 6.60186195, 4143.49561)
     end);
     
     sec2:Button("Fishman Island", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(61352.3828, 14.71875, 1502.90918)
     end);
     
     sec2:Button("Snow Island", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1111.27, 7.30361, -1159.95)
     end);
     
     sec2:Button("Jungle Island", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1454.78, 11.852, 440.674)
     end);
     
     sec2:Button("Magma Island", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5237.77, 8.59014, 8443.45)
     end);
     
     sec2:Button("Marine Island", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4808.52, 20.7623, 4360.04)
     end);
     
     sec2:Button("Marine Starter Base", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2877.62, 41.4389, 2274.58)
     end);
     
     sec2:Button("Boss Island", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2843.11, 7.39225, 5328.86)
     end);
     
     sec2:Button("Pirate island", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1115.73, 4.75205, 3831.72)
     end);
     
     sec2:Button("Prison Base", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4851.15, 5.65206, 734.877)
     end);
     
     sec2:Button("Sky Island", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4847.87, 717.696, -2631.52)
     end);
     
     sec2:Button("Village", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(782.739, 5.77678, 1428.92)
     end);
     
     sec2:Button("Fountin City", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5231.15, 38.5011, 4069.96)
     end);
     
     local tab3 = win:Tab("Auto Stats")
     
     local sec3 = tab3:Section("Blox Fruits - 10x")
     
     sec3:Toggle("Auto Melee", nil,"Toggle", function(value)
     while value and wait(.5) do
         repeat wait()
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",1)
         until not value
         end;
     end);
         
     sec3:Toggle("Auto Defense", nil,"Toggle", function(value)
         while value and wait(.5) do
             repeat wait()
             game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",1)
             until not value
         end;
     end);
         
     sec3:Toggle("Auto Sword", nil,"Toggle", function(value)
         while value and wait(.5) do
         repeat wait()
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",1)
         until not value
         end;
     end);
         
     sec3:Toggle("Auto Gun", nil,"Toggle", function(value)
         while value and wait(.5) do
         repeat wait()
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",1)
         until not value
         end;
     end);
         
     sec3:Toggle("Auto Blox Fruit", nil,"Toggle", function(value)
         while value and wait(.5) do
             repeat wait()
             game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",1)
             until not value
         end;
     end);
     
     local tab4 = win:Tab("Other")
     
     local sec4 = tab4:Section("Extra Stuff")
     
     sec4:Toggle("Infinite Stamina", nil,"Toggle", function(value)
         _G.InfS = value
     
         while _G.InfS and wait() do
             pcall(function()
                 infs()
             end);
         end;
     end);
