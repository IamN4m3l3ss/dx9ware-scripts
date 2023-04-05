-- Settings
local playerEsp = true
local playerWeaponEsp = true

local atmEsp = true
local shopEsp = true
local safeEsp = true
local droppedCashEsp = true
local droppedToolEsp = true
local pileEsp = true


local playerEspColor = {84,170,255} -- Light Blue
local playerWeaponEspColor = {252,33,55} -- Light Red
local atmEspColor = {76,252,143} -- Light Green
local shopEspColor = {145,43,255} -- Purple
local safeEspColor = {255,126,33} -- Orange
local droppedCashEspColor = {42,158,3} -- Dark Green
local droppedToolEspColor = {255,213,43} -- Light-ish Yellow
local pileEspColor = {255,213,43} -- Light-ish Yellow



-- Code
local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")

local atm = dx9.FindFirstChild(dx9.FindFirstChild(ws, "Map"), "ATMz")
local shops = dx9.FindFirstChild(dx9.FindFirstChild(ws, "Map"), "Shopz")
local safes = dx9.FindFirstChild(dx9.FindFirstChild(ws, "Map"), "BredMakurz")
local cash = dx9.FindFirstChild(dx9.FindFirstChild(ws, "Filter"), "SpawnedBread")
local tools = dx9.FindFirstChild(dx9.FindFirstChild(ws, "Filter"), "SpawnedTools")
local piles = dx9.FindFirstChild(dx9.FindFirstChild(ws, "Filter"), "SpawnedPiles")

local players = dx9.FindFirstChild(ws, "Characters")

--dx9.ShowConsole(true)

for i,v in pairs(dx9.GetChildren(players)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "HumanoidRootPart"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    if playerEsp == true then
        dx9.DrawString({wts.x, wts.y}, playerEspColor, "["..dx9.GetName(v).." HP: "..math.floor(dx9.get_player(dx9.GetName(v)).Info.Health).."]")
    end
end

for i,v in pairs(dx9.GetChildren(players)) do
    for i2,v2 in pairs(dx9.GetChildren(v)) do
        if dx9.GetType(v2) == "Tool" then
            local pos = dx9.GetPosition(dx9.FindFirstChild(dx9.GetParent(v2), "HumanoidRootPart"))
            local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

            if playerWeaponEsp == true then
                dx9.DrawString({wts.x, wts.y+20}, playerWeaponEspColor, "["..dx9.GetName(v2).."]")
            end
        end
    end
end

for i,v in pairs(dx9.GetChildren(atm)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "MainPart"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    if atmEsp == true then
        dx9.DrawString({wts.x, wts.y}, atmEspColor, "["..dx9.GetName(v).."]")
    end
end

for i,v in pairs(dx9.GetChildren(shops)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "MainPart"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    if shopEsp == true then
        dx9.DrawString({wts.x, wts.y}, shopEspColor, "["..dx9.GetName(v):gsub("ArmoryDealer", "Armory").."]")
    end
end

for i,v in pairs(dx9.GetChildren(safes)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "MainPart"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})
    
    if safeEsp == true and dx9.GetBoolValue(dx9.FindFirstChild(dx9.FindFirstChild(v, "Values"), "Broken")) == "False" then
        dx9.DrawString({wts.x, wts.y}, safeEspColor, "["..dx9.GetName(v):gsub("%_", " ").."]")
    end
end

for i,v in pairs(dx9.GetChildren(cash)) do
    local pos = dx9.GetPosition(v)
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    if droppedCashEsp == true then
        dx9.DrawString({wts.x, wts.y}, droppedCashEspColor, "[CashDrop]")
    end
end

for i,v in pairs(dx9.GetChildren(tools)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "Handle"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    if droppedToolEsp == true then
        dx9.DrawString({wts.x, wts.y}, droppedToolEspColor, "[Tool/Weapon]")
    end
end

for i,v in pairs(dx9.GetChildren(piles)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "MeshPart"))
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    if pileEsp == true then
        dx9.DrawString({wts.x, wts.y}, pileEspColor, "[Pile]")
    end
end