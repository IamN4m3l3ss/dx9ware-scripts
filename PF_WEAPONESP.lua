--Settings
local weaponESP = true
local weaponESPColor = {255,255,255}
local keybind = "[B]"
--Keybind list https://cultofintellect.com/dx9ware/docs/DX9WARE/DX9WARE%20LUA/GetKey.html

--Code
local active = nil
local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local key = dx9.GetKey()

local droppedWeapons = dx9.FindFirstChild(dx9.FindFirstChild(ws, "Ignore"), "GunDrop")

dx9.ShowConsole(true)

if key == keybind then
    active = not active
end

if active then
    weaponESP = true
else
    weaponESP = false
end

for i,v in pairs(dx9.GetChildren(droppedWeapons)) do
    local pos = dx9.GetPosition(dx9.FindFirstChild(v, "Slot1"))
    local wts = dx9.WorldToScreen({pos.x, pos.y, pos.z})

    if weaponESP == true then
        dx9.DrawString({wts.x, wts.y}, weaponESPColor, "["..dx9.GetStringValue(dx9.FindFirstChild(v, "Gun")).."]")
    end
end