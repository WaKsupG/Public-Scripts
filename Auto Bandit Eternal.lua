repeat wait() until game:IsLoaded()

if game.PlaceId ~= 8627695244 then
    local a={[1]=workspace.Interactions.BanditCamps.Data.ID,[2]={[1]="Let's go !"}}game:GetService("ReplicatedStorage").Requests.GetDialog:InvokeServer(unpack(a))
end;
    
while shared.autoBandit and wait() and game.PlaceId == 8627695244 do
pcall(function() for a,b in pairs(game:GetService("Workspace"):GetDescendants())do if b:IsA("TouchTransmitter")then firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,b.Parent,1)firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,b.Parent,0)end end
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and not v:FindFirstChild("LookDirection") then
            if v.Humanoid.Health > 0 then
                repeat wait() 
                    game:GetService("ReplicatedStorage").Requests.UseSkill:FireServer(shared.weapon,1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,6.5,0)
                    until v.Humanoid.Health <= 0 or not shared.autoBandit
                end;
            end;
        end;
    end);
end;
