-- Settings
local espEnabled = true
local textColor = {255,255,255}


--Code
local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")



dx9.ShowConsole(true)

for i,v in pairs(dx9.GetChildren(ws)) do
    local players = dx9.FindFirstChild(v, "HumanoidRootPart")

    local pos = dx9.GetPosition(players)
    local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

    dx9.DrawString({wts.x, wts.y}, textColor, "[Player]")
    end
end