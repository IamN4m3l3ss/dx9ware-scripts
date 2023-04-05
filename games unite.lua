local fov = 40
local fovColor = {255,255,255}
local smoothness = 1
local sensitivity = 1

local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local plrs = dx9.FindFirstChild(ws, "Playermodels")


local mouse = dx9.GetMouse()
local mouse2 = {mouse.x,mouse.y}


dx9.ShowConsole(true)

for i,v in pairs(dx9.GetChildren(plrs)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(dx9.FindFirstChild(v, "Accessories"), "Accessory"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    function GetDistance()
        local lpos = lplr.Position
        local x = (lpos.x-pos.x)*(lpos.x-pos.x)
        local y = (lpos.y-pos.y)*(lpos.y-pos.y)
        local z = (lpos.z-pos.z)*(lpos.z-pos.z)
        return math.floor(math.sqrt(x+y+z))
    end

    dx9.DrawString({wts.x,wts.y}, {255,255,255}, "[ "..GetDistance().." ]")
end

local closestEnemy = {position = {0,0}, distance = 10000000}
for i,v in pairs(dx9.GetChildren(plrs)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(dx9.FindFirstChild(v, "Accessories"), "Accessory"))
    local awts = dx9.WorldToScreen({pos.x,pos.y-1.5,pos.z})

    function DM()
        local x = (mouse.x-awts.x)*(mouse.x-awts.x)
        local y = (mouse.y-awts.y)*(mouse.y-awts.y)
        return math.floor(math.sqrt(x+y))
    end

    if DM() <= fov and DM() < closestEnemy.distance then
        dx9.DrawCircle(mouse2, fovColor, fov)
        closestEnemy = {position = {awts.x,awts.y}, distance = DM()}
    end
end

dx9.FirstPersonAim(closestEnemy.position, smoothness, sensitivity)