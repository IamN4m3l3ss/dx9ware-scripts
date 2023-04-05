local aimPart = "HumanoidRootPart"

local aimbotEnabled = true
local fov = 40
local fovColor = {255,255,255}
local smoothness = 6
local sensitivity = 1

local espEnabled = true
local textColor = {255,255,255}
local headDotColor = {36,112,255}



local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local mode = dx9.GetStringValue(dx9.FindFirstChild(dx9.FindFirstChild(ws, "Game"), "Mode"))

local players = dx9.FindFirstChildOfClass(game, "Players")
local lplr = dx9.get_localplayer()

local mouse = dx9.GetMouse()
local mouse2 = {mouse.x,mouse.y}

dx9.ShowConsole(true)

print(mode)

function GetTeam()
    for i,v in pairs(dx9.GetChildren(players)) do
        if dx9.GetName(v) == lplr.Info.Name then
            local LpTeam = dx9.GetStringValue(dx9.FindFirstChild(dx9.FindFirstChild(v, "GameStats"), "Team"))
            return LpTeam
        end
    end
end

for i,v in pairs(dx9.GetChildren(players)) do
    if dx9.GetCharacter(v) == 0 then
    else
        local pos = dx9.GetPosition(dx9.FindFirstChild(dx9.GetCharacter(v), "HumanoidRootPart"))
        local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

        local head = dx9.GetPosition(dx9.FindFirstChild(dx9.GetCharacter(v), "Head"))
        local hwts = dx9.WorldToScreen({head.x,head.y,head.z})

        function Distance()
            local lpos = lplr.Position
            local x = (lpos.x-pos.x)*(lpos.x-pos.x)
            local y = (lpos.y-pos.y)*(lpos.y-pos.y)
            local z = (lpos.z-pos.z)*(lpos.z-pos.z)
            return math.floor(math.sqrt(x+y+z))
        end

        if dx9.GetStringValue(dx9.FindFirstChild(dx9.FindFirstChild(v, "GameStats"), "Team")) == GetTeam() then
        elseif dx9.GetName(v) == lplr.Info.Name then
        elseif espEnabled == true then
            dx9.DrawString({wts.x, wts.y}, textColor, "["..dx9.GetName(v).." | Studs: "..Distance().."]")
        end
    end
end

local closestEnemy = {position = {0,0}, distance = 10000000}
for i,v in pairs(dx9.GetChildren(players)) do
    if dx9.GetCharacter(v) == 0 then
    else
        local aimpart = dx9.GetPosition(dx9.FindFirstChild(dx9.GetCharacter(v), aimPart))
        local awts = dx9.WorldToScreen({aimpart.x,aimpart.y,aimpart.z})

        function DM()
            local x = (mouse.x-awts.x)*(mouse.x-awts.x)
            local y = (mouse.y-awts.y)*(mouse.y-awts.y)
            return math.floor(math.sqrt(x+y))
        end

        if dx9.GetStringValue(dx9.FindFirstChild(dx9.FindFirstChild(v, "GameStats"), "Team")) == GetTeam() and dx9.GetName(v) == lplr.Info.Name then
        elseif dx9.GetName(v) == lplr.Info.Name then
        elseif aimbotEnabled == true and DM() <= fov and DM() < closestEnemy.distance then
            closestEnemy = {position = {awts.x,awts.y}, distance = DM()}
        end
    end
end

if aimbotEnabled == true then
    dx9.DrawCircle(mouse2, fovColor, fov)
end

dx9.FirstPersonAim(closestEnemy.position, smoothness, sensitivity)