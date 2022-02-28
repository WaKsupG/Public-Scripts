repeat wait() until game:IsLoaded()

--//Def\\--
local mt = getrawmetatable(game)
make_writeable(mt)
local namecall = mt.__namecall

if game.PlaceId == 7229033818 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1.214784860610962, 19.135841369628906, 29.709033966064453)
end;
    
while shared.autoFarm and wait() and game.PlaceId == 7942446389 do
pcall(function()
    for i,v in pairs(game:GetService("Workspace").Titans:GetChildren()) do
    if v:FindFirstChild("Humanoid") then
        if game.Players.LocalPlayer.Character and v:FindFirstChild("Head") then
                repeat wait() 
                    for i,v in pairs(game:GetService("Workspace").Titans:GetChildren()) do game:GetService("RunService").POST:FireServer(true,"Slash",v,"Nape",400,true) end;
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Head.CFrame - Vector3.new(2,2,2)
                    until not shared.autoFarm or not v:FindFirstChild("Humanoid")
                end;
            end;
        end;
    end);
end;


mt.__namecall = newcclosure(function(self, ...)
    local methodGet = getnamecallmethod()
    local argsGet = {...}
    if methodGet == "FireServer" and argsGet[2] == "Hitbox" then
        return wait(9e9)
    end;
    return namecall(self, ...)
end);
