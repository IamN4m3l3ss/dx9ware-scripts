local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local lplr = dx9.get_localplayer()

local mouse = dx9.GetMouse()
local mouse2 = {mouse.x,mouse.y}

dx9.ShowConsole(true)

for i,v in pairs(dx9.GetChildren(ws)) do
    for i2,v2 in pairs(dx9.GetChildren(v)) do
        local test = dx9.FindFirstDescendant(v2, "HumanoidRootPart")
        if dx9.GetName(dx9.GetParent(test)) == lplr.Info.Name then
            print(dx9.GetName(dx9.GetParent(test)))
        elseif dx9.GetType(test) == "Part" and dx9.FindFirstChild(test, "Climbing") then
            local pos = dx9.GetPosition(test)
            local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

            dx9.DrawString({wts.x,wts.y}, {255,255,255}, "Player")
            dx9.ThirdPersonAim({wts.x,wts.y}, 1, 1)
        end
    end
end

local closestEnemy = {position = {0,0}, distance = 10000000}
for i,v in pairs(dx9.GetChildren(ws)) do
    for i2,v2 in pairs(dx9.GetChildren(v)) do
        local test = dx9.FindFirstDescendant(v2, "HumanoidRootPart")
        if dx9.GetName(dx9.GetParent(test)) == lplr.Info.Name then
            print("")
        elseif dx9.GetType(test) == "Part" and dx9.FindFirstChild(test, "Climbing") then
            local pos = dx9.GetPosition(test)
            local awts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

        function DM()
            local x = (mouse.x-awts.x)*(mouse.x-awts.x)
            local y = (mouse.y-awts.y)*(mouse.y-awts.y)
            return math.floor(math.sqrt(x+y))
        end

        if aimbotEnabled == true and DM() <= fov and DM() < closestEnemy.distance then
            closestEnemy = {position = {awts.x,awts.y}, distance = DM()}
        end
    end
end

if aimbotEnabled == true then
    dx9.DrawCircle(mouse2, fovColor, fov)
end

dx9.ThirdPersonAim(closestEnemy.position, 1, 1)