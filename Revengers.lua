local create = loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Tools/main/Yes%20UI%20Lib"))()

local Window = create:Win("Sex Man")
create:Notifile("10x UwU Rawr","I cum in ur mom hahahaha",3)
local Tap1 = Window:Taps("Revengers")
local page1 = Tap1:newpage()
page1:Label("Auto-Train")
page1:Line()

local Stats = game:GetService("Players").LocalPlayer.Stats


page1:Toggle("Auto Train",false,function(value)
    _G.AutoMill = value

    while _G.AutoMill and wait() do
       for i,v in pairs(game:GetService("Workspace").Game.WorkOut:GetDescendants()) do
           if game:GetService("Players").LocalPlayer.Stats.Stamina.Value == game.Players.LocalPlayer.Character.INFO.MaxStamina.Value then
            if _G.Stat == "Treadmill" then
                fireclickdetector(game:GetService("Workspace").Game.WorkOut.Treadmill.Platform.ClickDetector)
                elseif _G.Stat == "Push Up" then
                    fireclickdetector(game:GetService("Workspace").Game.WorkOut.PushUp.Part.ClickDetector)
                elseif _G.Stat == "Squat" then
                    fireclickdetector(game:GetService("Workspace").Game.WorkOut.Squats.Part.ClickDetector)
                elseif _G.Stat == "Situp" then
                    fireclickdetector(game:GetService("Workspace").Game.WorkOut.SitUp.Part.ClickDetector)
                end;
            end;
        end;
    end;
end);

page1:Drop("Stat",false,{"Treadmill","Push Up","Squat","Situp"},function(value)
    _G.Stat = value
end);

local page2 = Tap1:newpage()

page2:Label("Auto Eat Just Keeps Eating Till U Poor")

page2:Toggle("Auto Eat (To Get Thic)",false,function(value)
_G.Lol = value

while _G.Lol and wait(1) do
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Hamburger") then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Hamburger"])
    elseif game.Players.LocalPlayer.Character:FindFirstChild("Hamburger") then
    	game.Players.LocalPlayer.Character.Hamburger:Activate()
    elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Hamburger") then
        fireclickdetector(game:GetService("Workspace").Game.Selling.Hamburger.ClickDetector)
        end;
    end;
end);

page2:Button("Copy Discord", function()
setclipboard("https://discord.gg/MAzdhG55er")
create:Notifile("Thanks","Copied To Clipboard",2.5)
end);
