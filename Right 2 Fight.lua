    local UI = loadstring(game:HttpGet'https://raw.githubusercontent.com/10x00/Tools/main/Super%20Hot%20Monke%20UI')()
    
    UI.Title.Text = "Homie Hub"
    
    UI.newTab("Main")
    
    local Mob = {};
    
    for i,v in pairs(game:GetService("Workspace").Bots.AI:GetDescendants()) do
    if v:FindFirstChild("TouchInterest") then
    if not table.find(Mob,v.Parent.Name) then
                table.insert(Mob,v.Parent.Name)
            end;
        end;
    end;
    local VirtualUser=game:service'VirtualUser'
    
    -- NoClip
    game:GetService("RunService").Stepped:Connect(function()
        if _G.OP then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
    
    
    UI.newDropDown(UI.Main,'Mob',Mob,function(value)
        _G.Mob = value
    end);
    
    UI.newCheckBox(UI.Main,'Autofarm',function(value)
        _G.OP = value
    
        while _G.OP and wait() do
        pcall(function()
        for i,v in pairs(game:GetService("Workspace").Bots.AI:GetChildren()) do
            if v.Name == _G.Mob then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame wait(15)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.HumanoidRootPart.TouchInterest, 0)
                    end;
                end;
            end);
        end;
    end);
    
    UI.newCheckBox(UI.Main,'Kill Aura',function(value)
        _G.Kill = value
    
        while _G.Kill and wait(.3) do
        pcall(function()
        for i,v in pairs(game:GetService("Workspace").Bots.AI:GetChildren()) do
                    local a={[1]={[1]="damage",[2]=v.UpperTorso,[3]=Vector3.new(v.HumanoidRootPart.Position),[4]=game:GetService("ReplicatedFirst").Moves.BTPunch1,[5]="Beast",[6]=0.041658869280167}}game:GetService("ReplicatedStorage").Events.ME:FireServer(unpack(a))
                    local a={[1]={[1]="damage",[2]=v.UpperTorso,[3]=Vector3.new(v.HumanoidRootPart.Position),[4]=game:GetService("ReplicatedFirst").Moves.BTStrike1,[5]="Beast",[6]=0.04905835467575}}game:GetService("ReplicatedStorage").Events.ME:FireServer(unpack(a))
                end;
            end);
        end;
    end);
