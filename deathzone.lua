--workspace GameStructures (table of cities) Items MainPart

local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local GameStructures = dx9.FindFirstChild(ws, "GameStructures")
local Cars = dx9.FindFirstChild(ws, "Cars")

for i,v in pairs(dx9.GetChildren(GameStructures)) do
    if dx9.FindFirstChild(v, "Items")  then
        local ItemFolder = dx9.FindFirstChild(v, "Items")
        for i2,v2 in pairs(dx9.GetChildren(ItemFolder)) do
            local ipos = dx9.GetPosition(dx9.FindFirstChild(v2, "MainPart"))
            local iwts = dx9.WorldToScreen({ipos.x, ipos.y, ipos.z})

            if iwts.x ~= 0 and iwts.y ~= 0 then
                dx9.DrawString({iwts.x, iwts.y}, {0,255,150}, "["..dx9.GetName(v2).."]")
            end
        end
    end
end

for i,v in pairs(dx9.GetChildren(Cars)) do
    print(v)
    local cpos = dx9.GetPosition(dx9.FindFirstChild(v, "Chassis"))
    local cwts = dx9.WorldToScreen({cpos.x, cpos.y, cpos.z})

    if cwts.x ~= 0 and cwts.y ~= 0 then
        dx9.DrawString({cwts.x, cwts.y}, {150,255,0}, "["..dx9.GetName(v).."]")
    end
end