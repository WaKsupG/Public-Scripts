local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()

local ulib = library.new("Shinden", 5013109572)
    
local page = ulib:addPage("Main", 5012544693)
    
local section1 = page:addSection("Autofarms")
local section2 = page:addSection("Other")

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall


--//Others\\--

section2:addToggle("No Slow",nil, function(value)
    _G.NoSlow = value
end);

section2:addToggle("No Fall",nil, function(value)
    _G.NoFall = value
end);

section2:addSlider("Speed", 0, 0, 500, function(value)
    _G.Speed = value
end)

section2:addToggle("Walkspeed",nil, function(value)
    _G.WalkSpeed = value

    while _G.WalkSpeed and wait() do
        game:GetService("Players").LocalPlayer.SpeedBuff.Value = _G.Speed
    end;
end);

mt.__namecall = newcclosure(function(self, ...)
local method = getnamecallmethod()
    if method == "FireServer" and self.Name == "SelfHarm" and _G.NoFall then
        return wait(9e9)
    elseif method == "FireServer" and self.Name == "Slow" and _G.NoSlow then
        return wait(9e9)
    end;
    return old(self, ...)
end);
