--Settings
local aimPart = "Head"

local aimbotEnabled = true
local fovEnabled = true
local fov = 40
local fovColor = {255,255,255}
local smoothness = 4
local sensitivity = 1

local espEnabled = true
--visit https://cultofintellect.com/dx9ware/docs/GetKey.html to  see all different keys you can use.
local espToggle = "[F5]"
local textColor = {255,255,255}
local headDotColor = {255,255,0}


--Code
if _G.toggle == nil then
    _G.toggle = true
end

local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local plrs = dx9.FindFirstChildOfClass(game, "Players")
local lplr = dx9.get_localplayer()

local mouse = dx9.GetMouse()
local mouse2 = {mouse.x,mouse.y}

dx9.ShowConsole(true)

if dx9.GetKey() ~= espToggle then
elseif _G.toggle == true then
    _G.toggle = false
elseif _G.toggle == false then
    _G.toggle = true
end

for i,v in pairs(dx9.GetChildren(ws)) do
    if dx9.FindFirstChild(v, "HumanoidRootPart") then
        local pos = dx9.GetPosition(dx9.FindFirstChild(v, "HumanoidRootPart"))
        local hpos = dx9.GetPosition(dx9.FindFirstChild(v, "Head"))
        local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})
        local hwts = dx9.WorldToScreen({hpos.x,hpos.y,hpos.z})

        function dist()
            local lpos = lplr.Position
            local x = (lpos.x-pos.x)*(lpos.x-pos.x)
            local y = (lpos.y-pos.y)*(lpos.y-pos.y)
            local z = (lpos.z-pos.z)*(lpos.z-pos.z)
            return math.floor(math.sqrt(x+y+z))
        end

        if v == dx9.GetCharacter(dx9.FindFirstChild(plrs, lplr.Info.Name)) then
        elseif espEnabled == true and _G.toggle == true and wts.x ~= 0 and wts.y ~= 0 then
            dx9.DrawCircle({hwts.x,hwts.y}, headDotColor, 5)
            dx9.DrawString({wts.x,wts.y}, textColor, "| "..dist().." |")
        end
    end
end


local closestEnemy = {position = {0,0}, distance = 10000000}
for i,v in pairs(dx9.GetChildren(ws)) do
    if dx9.FindFirstChild(v, "HumanoidRootPart") then
        local aimpart = dx9.GetPosition(dx9.FindFirstChild(v, aimPart))
        local awts = dx9.WorldToScreen({aimpart.x,aimpart.y,aimpart.z})

        function DM()
            local x = (mouse.x-awts.x)*(mouse.x-awts.x)
            local y = (mouse.y-awts.y)*(mouse.y-awts.y)
            return math.floor(math.sqrt(x+y))
        end

        if v == dx9.GetCharacter(dx9.FindFirstChild(plrs, lplr.Info.Name)) then
        elseif aimbotEnabled == true and DM() <= fov and DM() < closestEnemy.distance then
            closestEnemy = {position = {awts.x,awts.y}, distance = DM()}
        end
    end
end

if aimbotEnabled == true and fovEnabled == true then
    dx9.DrawCircle(mouse2, fovColor, fov)
end

if aimbotEnabled == true then
    dx9.FirstPersonAim(closestEnemy.position, smoothness, sensitivity)
end