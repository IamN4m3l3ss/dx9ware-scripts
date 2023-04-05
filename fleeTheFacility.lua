local game = dx9.GetDatamodel()
local lplr = dx9.get_localplayer()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local map = dx9.GetParent(dx9.FindFirstDescendant(ws, "ComputerTable"))

dx9.ShowConsole(true)

for i,v in pairs(dx9.GetChildren(map)) do
    if dx9.GetName(v) == "ComputerTable" then
        local pos = dx9.GetPosition(dx9.FindFirstChild(v, "Screen"))
        local wts = dx9.WorldToScreen({pos.x, pos.y, pos.z})

        function distPc()
            local lpos = lplr.Position
            local x = (lpos.x-pos.x)*(lpos.x-pos.x)
            local y = (lpos.y-pos.y)*(lpos.y-pos.y)
            local z = (lpos.z-pos.z)*(lpos.z-pos.z)
            return math.floor(math.sqrt(x+y+z))
        end

        dx9.DrawString({wts.x, wts.y},{255,255,255}, "[pc | studs: "..distPc().." ]")
    end
end