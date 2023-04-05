-- Settings
local aimbotEnabled = true
local fov = 30
local fovColor = {255,255,255}
local smoothness = 4
local sensitivity = 1

local espEnabled = true
local textColor = {255,255,255}
local headDotColor = {255,0,0}


--Code
local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChild(game, "Workspace")
local playerfolder = dx9.FindFirstChild(ws, "characters")

local mouse = dx9.GetMouse()
local mouse2 = {mouse.x,mouse.y}

--dx9.ShowConsole(true)

for i,v in pairs(dx9.GetChildren(playerfolder)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "humanoid_root_part"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    local head = dx9.GetPosition(dx9.FindFirstChild(v, "head"))
    local hwts = dx9.WorldToScreen({head.x,head.y,head.z})

    if espEnabled == true then
        dx9.DrawString({wts.x-55, wts.y-30}, textColor, "[Player]")
        dx9.DrawCircle({hwts.x, hwts.y}, headDotColor, 5)
    else
        print("Esp = false")
    end
end


local closestEnemy = {position = {0,0}, distance = 10000000}
for i,v in pairs(dx9.GetChildren(playerfolder)) do
    local aimpart = dx9.GetPosition(dx9.FindFirstChild(v, "head"))
    local awts = dx9.WorldToScreen({aimpart.x,aimpart.y,aimpart.z})

    function DM()
        local x = (mouse.x-awts.x)*(mouse.x-awts.x)
        local y = (mouse.y-awts.y)*(mouse.y-awts.y)
        return math.floor(math.sqrt(x+y))
    end

    if aimbotEnabled == true and DM() <= fov and DM() < closestEnemy.distance then
        closestEnemy = {position = {awts.x,awts.y}, distance = DM()}
    end
end

if aimbotEnabled == true then
    dx9.DrawCircle(mouse2, fovColor, fov)
end

dx9.FirstPersonAim(closestEnemy.position, smoothness, sensitivity)