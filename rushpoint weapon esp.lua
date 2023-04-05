--Variables
local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChild(game, "Workspace")
local droppedWeapons = dx9.FindFirstChild(ws, "DroppedWeapons")
local plantedBomb = dx9.FindFirstChild(dx9.FindFirstChild(ws, "MapFolder"), "Bomb")
local playerfolder = dx9.FindFirstChild(dx9.FindFirstChild(ws, "MapFolder"), "Players")

-- Code
dx9.ShowConsole(true)

for i,v in pairs(dx9.GetChildren(droppedWeapons)) do
    if dx9.FindFirstChild(v, "HitBox") then
    local dpos = dx9.GetPosition(dx9.FindFirstChild(v, "HitBox"))
    local dwts = dx9.WorldToScreen({dpos.x, dpos.y, dpos.z})

    elseif droppedWeaponEsp.Value == true then
        dx9.DrawString({dwts.x, dwts.y}, {255,255,255}, "["..dx9.GetName(v).."]")
    end
end

for i,v in pairs(dx9.GetChildren(plantedBomb)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(dx9.FindFirstChild(v, "Bomb"), "Neon"))
    local wts = dx9.WorldToScreen({pos.x, pos.y, pos.z})

    dx9.DrawString({wts.x, wts.y}, {255,255,255}, "["..dx9.GetName(v).."]")
end

for i,v in pairs(dx9.GetChildren(playerfolder)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "HumanoidRootPart"))
    local wts = dx9.WorldToScreen({pos.x, pos.y, pos.z})

    dx9.DrawString({wts.x, wts.y}, {255,255,255}, "["..dx9.GetStringValue(dx9.FindFirstChild(dx9.FindFirstChild(v, "Weapon"), "WeaponName")).."]")
end

--[[
local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChild(game, "Workspace")

local playerfolder = dx9.FindFirstChild(dx9.FindFirstChild(ws, "MapFolder"), "Players")

for i,v in pairs(dx9.GetChildren(playerfolder)) do
    local armor = dx9.FindFirstChild(v, "Armor")
    print(dx9.GetNumValue(armor))
end
]]--