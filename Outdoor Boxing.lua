
        local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Tools/main/Venyx%20UI"))()
        local ulib = library.new("Chicago", 5013109572)
    
        --//Page Starting\\--
        local page = ulib:addPage("Main", 5012544693)
    
        local section1 = page:addSection("Autofarms")
        local section2 = page:addSection("Settings")
    
        --//Vars\\--
        local QName = "";
        local Num = "";
        local Mob = "";
        local virtualUser = game:GetService('VirtualUser')
    
        section1:addToggle("Job Farm", nil, function(value)
            getgenv().Job = value

            while getgenv().Job and wait() do
            if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Frame.Visible == false then
                repeat wait()
                    game:GetService("Workspace").QuestBoard.ClickDetector.MaxActivationDistance = math.huge
                    fireclickdetector(game:GetService("Workspace").QuestBoard.ClickDetector)
                    until game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Frame.Visible == true or not getgenv().Job
                end;

            if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Frame.Type.Text == "Clean 10 Patches of Dirt." then
                for i,v in pairs(game:GetService("Workspace").Dirts:GetChildren()) do
                repeat wait()
                v.ClickDetector.MaxActivationDistance = math.huge
                fireclickdetector(v.ClickDetector)
                until string.find(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Frame.Type.Text, "Clean 0") or not getgenv().Job
                end;
            end;

            if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Frame.Type.Text == "Place 10 Posters up." then
                for i,v in pairs(game:GetService("Workspace").Posters:GetChildren()) do
                    repeat wait()
                    v.ClickDetector.MaxActivationDistance = math.huge
                    fireclickdetector(v.ClickDetector)
                    until string.find(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Frame.Type.Text, "Place 0") or not getgenv().Job
                end;
            end;

            if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Frame.Type.Text == "Visit your grandma in the hospital." then
                repeat wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919.434326, 1187.46936, 1488.95996, -0.993300915, 3.25503642e-08, -0.115556277, 3.17786402e-08, 1, 8.52063753e-09, 0.115556277, 4.79133622e-09, -0.993300915)
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
                until game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Frame.Visible == false or not getgenv().Job
                end;   
            end;           
        end);

        section1:addToggle("Steal Styles/Modes/Moves", nil, function(value)
            getgenv().LOL = value

            while getgenv().LOL and wait(2) do
                for i,v in pairs(game.Players:GetDescendants()) do
                    if v:IsA("Tool") then
                        v.Parent = game:GetService("Players").LocalPlayer.Backpack
                    end;
                end;
                for i,v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("Tool") then
                        v.Parent = game:GetService("Players").LocalPlayer.Backpack
                    end;
                end;
            end;
        end);
