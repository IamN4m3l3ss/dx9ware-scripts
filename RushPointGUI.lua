if  _G.supgLib == nil  then
	_G.supgLib = loadstring(dx9.Get("https://raw.githubusercontent.com/soupg/supg_ui/main/ui.lua"))
end  
_G.supgLib()

local version = "v1.3"

Lib:SetWatermark("Rush Point GUI | "..version, {Location = {110, 10}})

Lib:SetKeybind("[INSERT]")


--// GUI
local  GUI = Lib:CreateWindow("Rush Point GUI | "..version)

local aimbotTab = GUI:AddTab("Aimbot")
local espTab = GUI:AddTab("ESP")
local settingsTab = GUI:AddTab("Settings")
local colorTab = GUI:AddTab("GUI Color")

--// Aimbot
local aimbotGroup = aimbotTab:AddLeftGroupbox("Aimbot Settings")
local fovGroup = aimbotTab:AddRightGroupbox("FOV Settings")

local aimbotToggle = aimbotGroup:AddToggle("aimbotTog", {Default = false, Text = "Toggle Aimbot"})
local aimbotTeamToggle = aimbotGroup:AddToggle("aimbotTeamTog", {Default = true, Text = "Toggle Team Check"})
local aimbotPart = aimbotGroup:AddSlider("partSlid", {Default = 1, Text = "Aim Part", Min = 1, Max = 4, Suffix = ""})
aimbotGroup:AddLabel("1 = Head\n2 = HumanoidRootPart\n3 = UpperTorso\n4 = LowerTorso")

local aimbotSens = aimbotGroup:AddSlider("sensSlid", {Default = 1, Text = "Aimbot Sensitivity", Min = 1, Max = 100, Suffix = ""})
local aimbotSmooth = aimbotGroup:AddSlider("smoothSlid", {Default = 1, Text = "Aimbot Smoothness", Min = 1, Max = 100, Suffix = ""})

local fovToggle = fovGroup:AddToggle("fovTog", {Default = false, Text = "FOV Circle"})
local fovSize = fovGroup:AddSlider("fovSlid", {Default = 60, Text = "FOV Size", Min = 0, Max = 400, Suffix = ""})

fovGroup:AddBlank(5)
fovGroup:AddTitle("FOV Color")

local fovColor = fovGroup:AddColorPicker("fovPicker", {Default = {255,255,255}, Text = "FOV Color"})

--// ESP
local espGroup = espTab:AddLeftGroupbox("ESP Settings")
local espColorGroup = espTab:AddRightGroupbox("ESP Color Settings")

local espToggle = espGroup:AddToggle("espTog", {Default = false, Text = "Toggle ESP"})

local headDotToggle = espGroup:AddToggle("headTog", {Default = false, Text = "Toggle Head Dot ESP"})

local droppedWeaponEsp = espGroup:AddToggle("droppedTog", {Default = false, Text = "Toggle Dropped Weapon ESP"})

local equipedWeaponEsp = espGroup:AddToggle("equipedTog", {Default = false, Text = "Toggle Equiped Weapon ESP"})

espColorGroup:AddTitle("Text Color")

local redTextSlider = espColorGroup:AddSlider("redTextSlid", {Default = 255, Text = "Red", Min = 0, Max = 255, Suffix = ""})
local greenTextSlider = espColorGroup:AddSlider("greenTextSlid", {Default = 255, Text = "Green", Min = 0, Max = 255, Suffix = ""})
local blueTextSlider = espColorGroup:AddSlider("blueTextSlid", {Default = 255, Text = "Blue", Min = 0, Max = 255, Suffix = ""})

espColorGroup:AddTitle("Head Dot Color")

local redDotSlider = espColorGroup:AddSlider("redDotSlid", {Default = 36, Text = "Red", Min = 0, Max = 255, Suffix = ""})
local greenDotSlider = espColorGroup:AddSlider("greenDotSlid", {Default = 112, Text = "Green", Min = 0, Max = 255, Suffix = ""})
local blueDotSlider = espColorGroup:AddSlider("blueDotSlid", {Default = 255, Text = "Blue", Min = 0, Max = 255, Suffix = ""})

--// Settings
local settingsGroup = settingsTab:AddLeftGroupbox("Settings")

local watermarkToggle = settingsGroup:AddToggle("watermarkTog", {Default = false, Text = "Toggle Watermark"})

--// Credits
local credits = settingsTab:AddRightGroupbox("Credits")

credits:AddBlank(5)
credits:AddTitle("GUI Credits")
credits:AddLabel("- supg and supg's duck")
credits:AddTitle("Script Credits")
credits:AddLabel("- Nameless")
credits:AddBlank(5)

--// GUI Customisation
local colorGroup = colorTab:AddLeftGroupbox("Color Customisation")
local colorGroup2 = colorTab:AddRightGroupbox("Color Customisation.")

local rgbToggle = colorGroup:AddToggle("rgbTog", {Default = false, Text = "toggle RGB GUI"})

colorGroup:AddTitle("GUI Main Color")

local redMainSlider = colorGroup:AddSlider("redMainSlid", {Default = 28, Text = "Red", Min = 0, Max = 255, Suffix = ""})
local greenMainSlider = colorGroup:AddSlider("greenMainSlid", {Default = 28, Text = "Green", Min = 0, Max = 255, Suffix = ""})
local blueMainSlider = colorGroup:AddSlider("blueMainSlid", {Default = 28, Text = "Blue", Min = 0, Max = 255, Suffix = ""})

colorGroup:AddTitle("GUI Accent Color")

local redAccentSlider = colorGroup:AddSlider("redAccentSlid", {Default = 0, Text = "Red", Min = 0, Max = 255, Suffix = ""})
local greenAccentSlider = colorGroup:AddSlider("greenAccentSlid", {Default = 85, Text = "Green", Min = 0, Max = 255, Suffix = ""})
local blueAccentSlider = colorGroup:AddSlider("blueAccentSlid", {Default = 255, Text = "Blue", Min = 0, Max = 255, Suffix = ""})

colorGroup:AddTitle("GUI Background Color")

local redBGSlider = colorGroup:AddSlider("redBGSlid", {Default = 20, Text = "Red", Min = 0, Max = 255, Suffix = ""})
local greenBGSlider = colorGroup:AddSlider("greenBGSlid", {Default = 20, Text = "Green", Min = 0, Max = 255, Suffix = ""})
local blueBGSlider = colorGroup:AddSlider("bluebGSlid", {Default = 20, Text = "Blue", Min = 0, Max = 255, Suffix = ""})

colorGroup2:AddTitle("GUI Outline Color")

local redOutSlider = colorGroup2:AddSlider("redOutSlid", {Default = 50, Text = "Red", Min = 0, Max = 255, Suffix = ""})
local greenOutSlider = colorGroup2:AddSlider("greenOutSlid", {Default = 50, Text = "Green", Min = 0, Max = 255, Suffix = ""})
local blueOutSlider = colorGroup2:AddSlider("blueOutSlid", {Default = 50, Text = "Blue", Min = 0, Max = 255, Suffix = ""})

colorGroup2:AddTitle("GUI Font Color")

local redFontSlider = colorGroup2:AddSlider("redFontSlid", {Default = 255, Text = "Red", Min = 0, Max = 255, Suffix = ""})
local greenFontSlider = colorGroup2:AddSlider("greenFontSlid", {Default = 255, Text = "Green", Min = 0, Max = 255, Suffix = ""})
local blueFontSlider = colorGroup2:AddSlider("blueFontSlid", {Default = 255, Text = "Blue", Min = 0, Max = 255, Suffix = ""})

colorGroup2:AddTitle("Presets")

colorGroup2:AddButton("Nameless Preset", function()
    redFontSlider.Value = 255
    greenFontSlider.Value = 255
    blueFontSlider.Value = 255

    redMainSlider.Value = 30
    greenMainSlider.Value = 30
    blueMainSlider.Value = 30

    redBGSlider.Value = 30
    greenBGSlider.Value = 30
    blueBGSlider.Value = 30

    redAccentSlider.Value = 30
    greenAccentSlider.Value = 147
    blueAccentSlider.Value = 255

    redOutSlider.Value = 20
    greenOutSlider.Value = 20
    blueOutSlider.Value = 20
end)

colorGroup2:AddButton("Dark", function()
    redFontSlider.Value = 255
    greenFontSlider.Value = 255
    blueFontSlider.Value = 255

    redMainSlider.Value = 30
    greenMainSlider.Value = 30
    blueMainSlider.Value = 30

    redBGSlider.Value = 30
    greenBGSlider.Value = 30
    blueBGSlider.Value = 30

    redAccentSlider.Value = 50
    greenAccentSlider.Value = 50
    blueAccentSlider.Value = 50

    redOutSlider.Value = 20
    greenOutSlider.Value = 20
    blueOutSlider.Value = 20
end)

colorGroup2:AddButton("Light", function()
    redFontSlider.Value = 117
    greenFontSlider.Value = 240
    blueFontSlider.Value = 255

    redMainSlider.Value = 200
    greenMainSlider.Value = 200
    blueMainSlider.Value = 200

    redBGSlider.Value = 200
    greenBGSlider.Value = 200
    blueBGSlider.Value = 200

    redAccentSlider.Value = 170
    greenAccentSlider.Value = 170
    blueAccentSlider.Value = 170

    redOutSlider.Value = 130
    greenOutSlider.Value = 130
    blueOutSlider.Value = 130
end)


--// Code
GUI:SetRGB(rgbToggle.Value)
Lib:SetWatermarkVisibility(watermarkToggle.Value)

Lib.FontColor = {redFontSlider.Value, greenFontSlider.Value, blueFontSlider.Value}
Lib.MainColor = {redMainSlider.Value, greenMainSlider.Value, blueMainSlider.Value}
Lib.BackgroundColor = {redBGSlider.Value ,greenBGSlider.Value, blueBGSlider.Value}
Lib.AccentColor = {redAccentSlider.Value, greenAccentSlider.Value, blueAccentSlider.Value}
Lib.OutlineColor = {redOutSlider.Value, greenOutSlider.Value, blueOutSlider.Value}

--// Settings
local aimPart = {
    ["1"] = "Head",
    ["2"] = "HumanoidRootPart",
    ["3"] = "UpperTorso",
    ["4"] = "LowerTorso",
}

--Code
local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChild(game, "Workspace")
local playerfolder = dx9.FindFirstChild(dx9.FindFirstChild(ws, "MapFolder"), "Players")
local droppedWeapons = dx9.FindFirstChild(ws, "DroppedWeapons")

local players = dx9.FindFirstChild(game, "Players")
local lplr = dx9.get_localplayer()

local mouse = dx9.GetMouse()
local mouse2 = {mouse.x,mouse.y}

dx9.ShowConsole(true)

function GetTeam()
    if aimbotTeamToggle.Value == false then
        local status = "off"
        return status
    else
        for i,v in pairs(dx9.GetChildren(playerfolder)) do
            if dx9.GetName(v) == lplr.Info.Name then
                local LpTeam = dx9.GetStringValue(dx9.FindFirstChild(v, "Team"))
                return LpTeam
            end
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
    elseif dx9.GetName(v) == lplr.Info.Name then
    elseif espToggle.Value == true then
        dx9.DrawString({wts.x-55, wts.y-30}, {redTextSlider.Value, greenTextSlider.Value, blueTextSlider.Value}, "["..dx9.GetName(v).." | Studs: "..Distance().." | HP: "..math.floor(dx9.GetHealth(dx9.FindFirstChild(v, "Humanoid"))).."]")
    end
    if dx9.GetStringValue(dx9.FindFirstChild(v, "Team")) == GetTeam() then
    elseif dx9.GetName(v) == lplr.Info.Name then
    elseif headDotToggle.Value == true then
        dx9.DrawCircle({hwts.x, hwts.y}, {redDotSlider.Value, greenDotSlider.Value, blueDotSlider.Value}, 5)
    end
    if dx9.GetStringValue(dx9.FindFirstChild(v, "Team")) == GetTeam() then
    elseif dx9.GetName(v) == lplr.Info.Name then
    elseif equipedWeaponEsp.Value == true then
        dx9.DrawString({wts.x-55, wts.y-46}, {255,255,255}, "["..dx9.GetStringValue(dx9.FindFirstChild(dx9.FindFirstChild(v, "Weapon"), "WeaponName")).."]")
    end
end

for i,v in pairs(dx9.GetChildren(droppedWeapons)) do
    local dpos = dx9.GetPosition(dx9.FindFirstChild(v, "HitBox"))
    local dwts = dx9.WorldToScreen({dpos.x, dpos.y, dpos.z})

    if droppedWeaponEsp.Value == true then
        dx9.DrawString({dwts.x, dwts.y}, {255,255,255}, "["..dx9.GetName(v).."]")
    end
end

local closestEnemy = {position = {0,0}, distance = 10000000}
for i,v in pairs(dx9.GetChildren(playerfolder)) do
    local aimpart = dx9.GetPosition(dx9.FindFirstChild(v, aimPart[tostring(math.floor(aimbotPart.Value))]))
    local awts = dx9.WorldToScreen({aimpart.x,aimpart.y,aimpart.z})

    function DM()
        local x = (mouse.x-awts.x)*(mouse.x-awts.x)
        local y = (mouse.y-awts.y)*(mouse.y-awts.y)
        return math.floor(math.sqrt(x+y))
    end

    if dx9.GetStringValue(dx9.FindFirstChild(v, "Team")) == GetTeam() then
    elseif aimbotToggle.Value == true and DM() <= fovSize.Value and DM() < closestEnemy.distance then
        closestEnemy = {position = {awts.x,awts.y}, distance = DM()}
    end
end

if fovToggle.Value == true then
    dx9.DrawCircle(mouse2, fovColor.Value, fovSize.Value)
end

dx9.FirstPersonAim(closestEnemy.position, aimbotSmooth.Value, aimbotSens.Value)