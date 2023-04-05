local fovEnabled = true
local fov = 1000

local smoothness = 1
local sensitivity = 3

local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local training = dx9.FindFirstChild(ws, "Training")

local mouse = dx9.GetMouse()
local mouse2 = {mouse.x,mouse.y}

dx9.ShowConsole(true)

if fovEnabled == true then
    dx9.DrawCircle(mouse2, {255,255,255}, fov)
else
    fov = 10000
end

local closestEnemy = {position = {0,0}, distance = 10000000}
for i,v in pairs(dx9.GetChildren(training)) do
    if dx9.GetName(v) == "Gridshot" then
        for i2,v2 in pairs(dx9.GetChildren(dx9.FindFirstChild(v, "ActiveTargets"))) do

            local aimpart = dx9.GetPosition(v2)
            local awts = dx9.WorldToScreen({aimpart.x,aimpart.y,aimpart.z})

            function DM()
                local x = (mouse.x-awts.x)*(mouse.x-awts.x)
                local y = (mouse.y-awts.y)*(mouse.y-awts.y)
                return math.floor(math.sqrt(x+y))
            end

            if DM() <= fov and DM() < closestEnemy.distance then
                closestEnemy = {position = {awts.x,awts.y}, distance = DM()}
            end
        end
    end
end

dx9.FirstPersonAim(closestEnemy.position, smoothness, sensitivity)