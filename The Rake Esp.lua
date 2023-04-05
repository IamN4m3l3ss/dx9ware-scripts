local game = dx9.GetDatamodel()
local lplr = dx9.get_localplayer()
local workspace = dx9.FindFirstChild(game, "Workspace")
local cratepath = dx9.FindFirstChild(workspace, "Debris")
local cratepath2 = dx9.FindFirstChild(cratepath, "SupplyCrates")

--Rake esp
for i,v in pairs(dx9.GetChildren(workspace)) do
    if dx9.GetName(v) == "Rake" then
        local rake = dx9.FindFirstChild(workspace, "Rake")
        local root = dx9.FindFirstChild(rake, "Torso")
        local pos = dx9.GetPosition(root)

        local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

        function Distance()
            local lpos = lplr.Position
            local rpos = pos
            local x = (lpos.x-rpos.x)*(lpos.x-rpos.x)
            local y = (lpos.y-rpos.y)*(lpos.y-rpos.y)
            local z = (lpos.z-rpos.z)*(lpos.z-rpos.z)
            return math.floor(math.sqrt(x+y+z)+0.5)
        end


        dx9.DrawString({wts.x, wts.y}, {255,0,0}, "Rake ["..Distance().."]")
    end
end

--Crate esp
for i,v in pairs(dx9.GetChildren(cratepath2)) do
    if dx9.GetName(v) == "Box" then
        local crate = dx9.FindFirstChild(v, "HitBox")
        local pos = dx9.GetPosition(root)

        local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

        function DistanceCrate()
            local lpos = lplr.Position
            local cpos = pos
            local x = (lpos.x-cpos.x)*(lpos.x-cpos.x)
            local y = (lpos.y-cpos.y)*(lpos.y-cpos.y)
            local z = (lpos.z-cpos.z)*(lpos.z-cpos.z)
            return math.floor(math.sqrt(x+y+z)+0.5)
        end

        
        dx9.DrawString({wts.x, wts.y}, {0,255,0}, "Crate ["..DistanceCrate().."]")
    end
end

--Flaregun esp
for i,v in pairs(dx9.GetChildren(workspace)) do
    if dx9.GetName(v) == "FlareGunPickUp" then
        local gun = dx9.FindFirstChild(v, "FlareGun")
        local pos = dx9.GetPosition(gun)

        local wts = dx9.WorldToScreen({pos.x,pos.y,pos.z})

        function DistanceGun()
            local lpos = lplr.Position
            local gpos = pos
            local x = (lpos.x-gpos.x)*(lpos.x-gpos.x)
            local y = (lpos.y-gpos.y)*(lpos.y-gpos.y)
            local z = (lpos.z-gpos.z)*(lpos.z-gpos.z)
            return math.floor(math.sqrt(x+y+z)+0.5)
        end


        dx9.DrawString({wts.x, wts.y}, {0,255,0}, "Gun ["..DistanceGun().."]")
    end
end