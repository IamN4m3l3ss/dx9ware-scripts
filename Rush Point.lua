-- Settings
local aimPart = "Head"

local aimbotEnabled = true
local fov = 40
local fovColor = {255,255,255}
local smoothness = 6
local sensitivity = 1

local espEnabled = true
local textColor = {255,255,255}
local headDotColor = {36,112,255}


--Code
local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChild(game, "Workspace")
local playerfolder = dx9.FindFirstChild(dx9.FindFirstChild(ws, "MapFolder"), "Players")

local players = dx9.FindFirstChild(game, "Players")
local lplr = dx9.get_localplayer()

local mouse = dx9.GetMouse()
local mouse2 = {mouse.x,mouse.y}

--dx9.ShowConsole(true)

function GetTeam()
    for i,v in pairs(dx9.GetChildren(playerfolder)) do
        if dx9.GetName(v) == lplr.Info.Name then
            local LpTeam = dx9.GetStringValue(dx9.FindFirstChild(v, "Team"))
            return LpTeam
        end
    end
end

for i,v in pairs(dx9.GetChildren(playerfolder)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "HumanoidRootPart"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    local head = dx9.GetPosition(dx9.FindFirstChild(v, "Head"))
    local hwts = dx9.WorldToScreen({head.x,head.y,head.z})

    function Distance()
        local lpos = lplr.Position
        local x = (lpos.x-pos.x)*(lpos.x-pos.x)
        local y = (lpos.y-pos.y)*(lpos.y-pos.y)
        local z = (lpos.z-pos.z)*(lpos.z-pos.z)
        return math.floor(math.sqrt(x+y+z))
    end

    if dx9.GetStringValue(dx9.FindFirstChild(v, "Team")) == GetTeam() then
        print(GetTeam())
    elseif espEnabled == true then
        dx9.DrawString({wts.x-55, wts.y-30}, textColor, "["..dx9.GetName(v).." | Studs: "..Distance().." | HP: "..dx9.GetHealth(dx9.FindFirstChild(v, "Humanoid")).."]")
        -- DO NOT ENABLE GETNUMVALUE IS CURRENTLY BROKEN!! dx9.DrawString({wts.x-55, wts.y-40}, textColor, "[Armor :"..dx9.GetNumValue(dx9.FindFirstChild(v, "Armor")).."]")
        dx9.DrawCircle({hwts.x, hwts.y}, headDotColor, 5)
    else
        print("Esp = false")
    end
end


local closestEnemy = {position = {0,0}, distance = 10000000}
for i,v in pairs(dx9.GetChildren(playerfolder)) do
    local aimpart = dx9.GetPosition(dx9.FindFirstChild(v, aimPart))
    local awts = dx9.WorldToScreen({aimpart.x,aimpart.y,aimpart.z})

    function DM()
        local x = (mouse.x-awts.x)*(mouse.x-awts.x)
        local y = (mouse.y-awts.y)*(mouse.y-awts.y)
        return math.floor(math.sqrt(x+y))
    end

    if dx9.GetStringValue(dx9.FindFirstChild(v, "Team")) == GetTeam() then
        print("TeamCheck Success")
    elseif aimbotEnabled == true and DM() <= fov and DM() < closestEnemy.distance then
        closestEnemy = {position = {awts.x,awts.y}, distance = DM()}
    end
end

if aimbotEnabled == true then
    dx9.DrawCircle(mouse2, fovColor, fov)
end

dx9.FirstPersonAim(closestEnemy.position, smoothness, sensitivity)