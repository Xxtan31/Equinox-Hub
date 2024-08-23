repeat task.wait() until game:IsLoaded()

if _G.EquinoxHub_Aimbot_Initialized == false or _G.EquinoxHub_Aimbot_Initialized == nil then
    _G.EquinoxHub_Aimbot_Initialized = true
else
    return
end

_G.EquinoxHub_Aimbot_Initialized = true

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local userId = LocalPlayer.UserId
local loclname = LocalPlayer.Name

--[Local Player Thumbnail]--
local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=150&height=150&format=png"
--[Local Player Thumbnail]--

local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+[]{}|;:,.<>?/`~"

local function generateRandomString(length)
    local result = ""
    for i = 1, length do
        local randomIndex = math.random(1, #charset)
        result = result .. charset:sub(randomIndex, randomIndex)
    end
    return result
end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

local aimFrame = Instance.new("Frame")
aimFrame.Size = UDim2.new(0, 35, 0, 35)
aimFrame.Position = UDim2.new(0, 399.871, 0, 161)
aimFrame.AnchorPoint = Vector2.new(0.5, 0.5)
aimFrame.BackgroundTransparency = 1
aimFrame.Visible = false
aimFrame.Parent = screenGui

local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 5
uiStroke.Color = Color3.fromRGB(0, 0, 0)
uiStroke.Parent = aimFrame

local function createFrame(name, parent, pos, size, visible, trans)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.Size = size
    frame.Position = pos
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = trans
    frame.Visible = visible
    frame.Parent = parent
    return frame
end

local function createScrollingFrame(name, parent, pos, size, visible, trans, canvasSize, scrollBarThickness)
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = name
    scrollingFrame.Size = size
    scrollingFrame.Position = pos
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    scrollingFrame.BackgroundTransparency = trans
    scrollingFrame.Visible = visible
    scrollingFrame.Parent = parent
    
    scrollingFrame.CanvasSize = canvasSize or UDim2.new(0, 0, 2, 0)
    scrollingFrame.ScrollBarThickness = scrollBarThickness or 5
    scrollingFrame.ScrollBarImageColor3 = Color3.new(1, 1, 1)

    return scrollingFrame
end

local function createImageLabel(name, parent, pos, size, image, visible, transparency, color)
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = name
    imageLabel.Size = size
    imageLabel.Position = pos
    imageLabel.Image = image or ""
    imageLabel.Visible = visible
    imageLabel.BackgroundTransparency = transparency
    imageLabel.ImageColor3 = color or Color3.new(1, 1, 1)
    imageLabel.Parent = parent
    return imageLabel
end

local function createText(name, parent, pos, size, text, vis, rot)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Size = size
    label.Position = pos
    label.BackgroundTransparency = 1
    label.Text = text
    label.Visible = vis
    label.TextColor3 = Color3.fromRGB(255, 255, 255)    
    label.TextScaled = true
    label.Font = Enum.Font.PatrickHand
    label.Parent = parent
    label.Rotation = rot
    return label
end

local function createButton(name, parent, pos, size, visible, text, trans)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = size
    button.Position = pos
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    button.BackgroundTransparency = trans
    button.Parent = parent
    button.Visible = visible
    return button
end

local function createTextBox(name, parent, pos, size, visible, text, trans)
    local textBox = Instance.new("TextBox")
    textBox.Name = name
    textBox.Size = size
    textBox.Position = pos
    textBox.Text = text
    textBox.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.BackgroundTransparency = trans
    textBox.Parent = parent
    textBox.Visible = visible
    return textBox
end

local function createuiCorner(name, parent, radius)
    local uiCorner = Instance.new("UICorner")
    uiCorner.Name = name
    uiCorner.Parent = parent
    uiCorner.CornerRadius = radius
    return uiCorner
end

local function createUIStroke(name, parent, thickness, color)
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Name = name
    uiStroke.Thickness = thickness or 1
    uiStroke.Color = color or Color3.fromRGB(0, 0, 0)
    uiStroke.Parent = parent
    return uiStroke
end

local function createTween(parent, time, size)
    local tweenInfo = TweenInfo.new(
        time,
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        0,
        false, 
        0 
    )

    local tween = TweenService:Create(parent, tweenInfo, {Size = size})
    return tween
end

local function createTweenPos(parent, time, pos)
    local twninfo = TweenInfo.new(
        time,
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        0,
        false, 
        0 
    )

    local twn = TweenService:Create(parent, twninfo, {Position = pos})
    return twn
end

local mainFrame = createFrame("mainFrame", screenGui, UDim2.new(0, 202, 0, -10), UDim2.new(0, 300, 0, 43), true, 0)
local destroyAccFrame = createFrame("destroyAccFrame", screenGui, UDim2.new(0, 300, 0, 60), UDim2.new(0, 200, 0, 170), false, 0.1)
local fullframe = createFrame("fullframe", mainFrame, UDim2.new(0, 0, 0, 45), UDim2.new(0, 150, 0, 254), false, 0)
fullframe.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
local frm = createFrame("frm", mainFrame, UDim2.new(0, 0, 0, 45), UDim2.new(0, 150, 0, 20), false, 0)
frm.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
frm.BorderSizePixel = 0
local frm1 = createFrame("frm1", mainFrame, UDim2.new(0, 130, 0, 45), UDim2.new(0, 20, 0, 255), false, 0)
frm1.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
frm1.BorderSizePixel = 0
local MainThick = createFrame("MainThick", mainFrame, UDim2.new(0, 12, 0, 246.5), UDim2.new(0, 30, 0, 30), false, 1)
local MainThick1 = createFrame("MainThick1", MainThick, UDim2.new(0, 0, 0, 0), UDim2.new(0, 30, 0, 30), true, 0.3)
MainThick1.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
local imageLBL = createImageLabel("imageLBL", MainThick1, UDim2.new(0, 0, 0, 0), UDim2.new(0, 30, 0, 30), "", true, 1, nil)
imageLBL.Image = avatarUrl

local scroolFrame = createScrollingFrame("scroolFrame", mainFrame, UDim2.new(0, 151, 0, 46), UDim2.new(0, 195, 0, 206), false, 1, UDim2.new(0, 0, 1, 0), 0)
local scroolFrame1 = createScrollingFrame("scroolFrame1", mainFrame, UDim2.new(0, 151, 0, 46), UDim2.new(0, 195, 0, 206), false, 1, UDim2.new(0, 0, 1, 0), 0)
local scroolFrame2 = createScrollingFrame("scroolFrame2", mainFrame, UDim2.new(0, 151, 0, 46), UDim2.new(0, 195, 0, 206), false, 1, UDim2.new(0, 0, 1, 0), 0)

local circleFrm = createFrame("circleFrm", scroolFrame, UDim2.new(0, 162, 0, 10), UDim2.new(0, 30, 0, 30), true, 0)
circleFrm.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

local AimTargetFrame = createFrame("AimTargetFrame", scroolFrame, UDim2.new(0, 5, 0, 55), UDim2.new(0, 175, 0, 30), true, 0.3)
AimTargetFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)

local slith = createFrame("slith", scroolFrame1, UDim2.new(0, 5, 0, 40), UDim2.new(0, 180, 0, 16), true, 0)
slith.BackgroundColor3 = Color3.fromRGB(32, 32, 32)

local slithre = createFrame("slithre", slith, UDim2.new(0, 1, 0, 0), UDim2.new(0, 0, 1, 0), true, 0)
slithre.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local slithres = createFrame("slithres", slith, UDim2.new(0.3, -10, 0, -10), UDim2.new(0, 35, 0, 37), true, 1)
local circleslithres = createFrame("circleslithres", slithres, UDim2.new(0, -2, 0, -2), UDim2.new(0, 35, 0, 37), true, 0)
circleslithres.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

 local WallcheckButtonFrame = createFrame("WallcheckButtonFrame", scroolFrame, UDim2.new(0, 5, 0, 95), UDim2.new(0, 185, 0, 30), true, 1)
 local TeamCheckButtonFrame = createFrame("TeamCheckButtonFrame", scroolFrame, UDim2.new(0, 5, 0, 135), UDim2.new(0, 185, 0, 30), true, 1)
 
local circleFrm2 = createFrame("circleFrm2", WallcheckButtonFrame, UDim2.new(0, 159, 0, 2), UDim2.new(0, 30, 0, 30), true, 0)
circleFrm2.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
local circleFrm3 = createFrame("circleFrm3", TeamCheckButtonFrame, UDim2.new(0, 159, 0, 2), UDim2.new(0, 30, 0, 30), true, 0)
circleFrm3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

local line = createFrame("line", mainFrame, UDim2.new(0, 0, 0, 44), UDim2.new(1, 0, 0, 1), false, 0.8)
line.BorderSizePixel = 0
line.BackgroundColor3 = Color3.fromRGB(221, 221, 221)
local line1 = createFrame("line1", mainFrame, UDim2.new(0, 150, 0, 45), UDim2.new(0, 1, 0, 255), false, 0.8)
line1.BorderSizePixel = 0
line1.BackgroundColor3 = Color3.fromRGB(221, 221, 221)
local line2 = createFrame("line2", mainFrame, UDim2.new(0, 0, 0, 235), UDim2.new(0, 150, 0, 1), false, 0.8)
line2.BorderSizePixel = 0
line2.BackgroundColor3 = Color3.fromRGB(221, 221, 221)


local Button = createButton("Button", mainFrame, UDim2.new(0, mainFrame.Size.X.Offset - 46, 0, 0), UDim2.new(0, 43, 0, 43), true, "", 0)
local Button1 = createButton("Button1", mainFrame, UDim2.new(0, mainFrame.Size.X.Offset - 91, 0, 0), UDim2.new(0, 43, 0, 43), true, "", 0)
local Button2 = createButton("Button2", destroyAccFrame, UDim2.new(0, 10, 0, 120), UDim2.new(0, 85, 0, 43), true, "Yes", 0)
Button2.BackgroundColor3 = Color3.fromRGB(51, 255, 255)
Button2.TextColor3 = Color3.fromRGB(0, 0, 0)
local Button3 = createButton("Button3", destroyAccFrame, UDim2.new(0, 105, 0, 120), UDim2.new(0, 85, 0, 43), true, "No", 0)
Button3.BackgroundColor3 = Color3.fromRGB(54, 57, 62)
Button3.TextColor3 = Color3.fromRGB(0, 0, 0)
local Button4 = createButton("Button4", mainFrame, UDim2.new(0, 2, 0, 47), UDim2.new(0, 147, 0, 30), false, "", 1)
local Button5 = createButton("Button5", mainFrame, UDim2.new(0, 2, 0, 77), UDim2.new(0, 147, 0, 30), false, "", 1)
local Button6 = createButton("Button6", mainFrame, UDim2.new(0, 2, 0, 107), UDim2.new(0, 147, 0, 30), false, "", 1)
local Button7 = createButton("Button7", scroolFrame, UDim2.new(0, 5, 0, 5), UDim2.new(0, 155, 0, 40), true, "Aimbot Active", 0.3)
Button7.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
local Button8 = createButton("Button8", AimTargetFrame, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30), true, "HEAD", 0.3)
Button8.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
local UpChest = createButton("UpChest", AimTargetFrame, UDim2.new(0, 0, 0, 34), UDim2.new(1, 0, 0, 30), false, "CHEST", 0.3)
UpChest.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
local downChest = createButton("downChest", AimTargetFrame, UDim2.new(0, 0, 0, 68), UDim2.new(1, 0, 0, 30), false, "CHEST", 0.3)
downChest.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
local PELVIS = createButton("PELVIS", AimTargetFrame, UDim2.new(0, 0, 0, 68), UDim2.new(1, 0, 0, 30), false, "PELVIS", 0.3)
PELVIS.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
local HEAD = createButton("HEAD", AimTargetFrame, UDim2.new(0, 0, 0, 34), UDim2.new(1, 0, 0, 30), false, "HEAD", 0.3)
HEAD.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
local Button9 = createButton("Button9", WallcheckButtonFrame, UDim2.new(0, 0, 0, 0), UDim2.new(0, 155, 0, 30), true, "Wall Check", 0.3)
Button9.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
local Button10 = createButton("Button10", TeamCheckButtonFrame, UDim2.new(0, 0, 0, 0), UDim2.new(0, 155, 0, 30), true, "Team Check", 0.3)
Button10.BackgroundColor3 = Color3.fromRGB(32, 32, 32)

local textbox = createTextBox("TextBox", scroolFrame2, UDim2.new(0, 150, 0, 20), UDim2.new(0, 40, 0, 40), true, "0, 0, 0", 0)
textbox.Font = Enum.Font.ArialBold
textbox.TextSize = 10
textbox.BorderSizePixel = 0


local text = createText("Text", mainFrame, UDim2.new(0, 5, 0, 10), UDim2.new(0, 120, 0, 20), "Equinox Hub Aimbot", true, 0)
text.Font = Enum.Font.ArimoBold

local text1 = createText("Text1", Button, UDim2.new(0, -9.5, 0, 10), UDim2.new(0, 60, 0, 20), "x", true, 180)
text1.Font = Enum.Font.ArimoBold
text1.TextSize = 23

local text2 = createText("Text2", Button1, UDim2.new(0, -9.5, 0, 10), UDim2.new(0, 60, 0, 20), "+", true, 0)
text2.Font = Enum.Font.ArimoBold
text2.TextSize = 23

local text3 = createText("Text3", destroyAccFrame, UDim2.new(0, 46, 0, 5), UDim2.new(0, 100, 0, 20), "Are You Sure?", true, 0)
text3.Font = Enum.Font.ArimoBold
text3.TextSize = 23

local text4 = createText("Text4", destroyAccFrame, UDim2.new(0, 20, 0, 50), UDim2.new(0, 160, 0, 60), "If you click the Yes button, the gui will close.", true, 0)
text4.Font = Enum.Font.ArimoBold
text4.TextSize = 23

local text5 = createText("Text5", mainFrame, UDim2.new(0, 70, 0, 240), UDim2.new(0, 30, 0, 20), "Hey,", false, 0)
text5.Font = Enum.Font.ArimoBold
text5.TextSize = 23

local text6 = createText("Text6", mainFrame, UDim2.new(0, 50, 0, 254), UDim2.new(0, 80, 0, 20), loclname, false, 0)

local text7 = createText("Text7", Button4, UDim2.new(0, 28, 0, 5), UDim2.new(0, 90, 0, 20), "Aimbot Settings", true, 0)
text7.Font = Enum.Font.GothamMedium
text7.TextSize = 14
text7.TextColor3 = Color3.fromRGB(240, 240, 240)
text7.BorderColor3 = Color3.fromRGB(27, 42, 53)
text7.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
local text8 = createText("Text8", Button5, UDim2.new(0, 28, 0, 5), UDim2.new(0, 90, 0, 20), "Aimbot Fov Settings", true, 0)
text8.Font = Enum.Font.GothamMedium
text8.TextSize = 14
text8.TextColor3 = Color3.fromRGB(240, 240, 240)
text8.BorderColor3 = Color3.fromRGB(27, 42, 53)
text8.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
local text9 = createText("Text9", Button6, UDim2.new(0, 28, 0, 5), UDim2.new(0, 90, 0, 20), "Aimbot Fov Color", true, 0)
text9.Font = Enum.Font.GothamMedium
text9.TextSize = 14
text9.TextColor3 = Color3.fromRGB(240, 240, 240)
text9.BorderColor3 = Color3.fromRGB(27, 42, 53)
text9.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
local text10 = createText("Text10", scroolFrame2, UDim2.new(0, 5, 0, 25), UDim2.new(0, 140, 0, 30), "Circle color, RGB code example (255,255,255)", 0)
text10.Font = Enum.Font.ArimoBold
text10.TextSize = 23
local text11 = createText("Text11", scroolFrame1, UDim2.new(0, 10, 0, 10), UDim2.new(0, 80, 0, 20), "Aimbot Fov: ", 0)
text11.Font = Enum.Font.ArimoBold
text11.TextSize = 23
local text12 = createText("Text12", scroolFrame1, UDim2.new(0, 77, 0, 10), UDim2.new(0, 60, 0, 20), "150", 0)
text12.Font = Enum.Font.ArimoBold
text12.TextSize = 23

local UIStroke = createUIStroke("UIStroke", MainThick, 1, nil)
UIStroke.Color = Color3.fromRGB(102, 102, 102)

local uic = createuiCorner("uic", mainFrame, UDim.new(0, 13))
local uic1 = createuiCorner("uic1", Button, UDim.new(0, 13))
local uic2 = createuiCorner("uic2", Button1, UDim.new(0, 13))
local uic3 = createuiCorner("uic3", destroyAccFrame, UDim.new(0, 13))
local uic4 = createuiCorner("uic4", Button2, UDim.new(0, 14))
local uic5 = createuiCorner("uic5", Button3, UDim.new(0, 14))
local uic6 = createuiCorner("uic6", line, UDim.new(0, 14))
local uic7 = createuiCorner("uic7", line1, UDim.new(0, 14))
local uic8 = createuiCorner("uic8", fullframe, UDim.new(0, 13))
local uic9 = createuiCorner("uic9", line2, UDim.new(0, 14))
local uic10 = createuiCorner("uic10", MainThick, UDim.new(1, 1))
local uic11 = createuiCorner("uic11", MainThick1, UDim.new(1, 1))
local uic12 = createuiCorner("uic12", Button7, UDim.new(0, 14))
local uic13 = createuiCorner("uic13", circleFrm, UDim.new(1, 1))
local uic14 = createuiCorner("uic14", AimTargetFrame, UDim.new(0, 14))
local uic15 = createuiCorner("uic15", Button8, UDim.new(0, 14))
local uic16 = createuiCorner("uic16", UpChest, UDim.new(0, 14))
local uic17 = createuiCorner("uic17", downChest, UDim.new(0, 14))
local uic18 = createuiCorner("uic18", PELVIS, UDim.new(0, 14)) 
local uic19 = createuiCorner("uic19", HEAD, UDim.new(0, 14))
local uic20 = createuiCorner("uic20", textbox, UDim.new(0, 14))
local uic21 = createuiCorner("uic21", aimFrame, UDim.new(1, 1))
local uic22 = createuiCorner("uic22", slith, UDim.new(0, 14))
local uic23 = createuiCorner("uic23", slithre, UDim.new(0, 14))
local uic24 = createuiCorner("uic24", circleslithres, UDim.new(1, 1))
local uic25 = createuiCorner("uic25", circleFrm2, UDim.new(1, 1))
local uic26 = createuiCorner("uic26", Button9, UDim.new(0, 14))
local uic27 = createuiCorner("uic27", Button10, UDim.new(0, 14))
local uic28 = createuiCorner("uic28", circleFrm3, UDim.new(1, 1))

local aimTarget = {
    {
        Head = true,
        Chest = false,
        Pelvis = false
    },
    {
        TeamCheck = false
    },
    {
        WallCheck = false
    },
    {   
        maxDistance = math.huge
    }
}


--[AİMBOT SETTİNGS]--
local isAimLocked = false
local player = game:FindFirstChild("Players - Client").LocalPlayer
local camera = game:FindFirstChild("Workspace - Client").CurrentCamera

local function isPlayerOnDifferentTeam(otherPlayer)
    if aimTarget[2].TeamCheck then
        return otherPlayer.Team ~= player.Team
    else
        return true
    end
end

local function isPlayerVisible(otherPlayer)
    local ray = Ray.new(camera.CFrame.Position, (otherPlayer.Character.Head.Position - camera.CFrame.Position).unit * 3000)
    local part = game:FindFirstChild("Workspace - Client"):FindPartOnRay(ray, player.Character, false, true)
    
    if aimTarget[3].WallCheck then
        return part and part:IsDescendantOf(otherPlayer.Character)
    else
        return true
    end
end

local function getClosestVisiblePlayer()
    local closestPlayer = nil
    local shortestDistance = aimTarget[4].maxDistance

    for _, otherPlayer in pairs(game:FindFirstChild("Players - Client"):GetPlayers()) do
        if isPlayerOnDifferentTeam(otherPlayer) and otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Head") then
            local pos, isVisible = camera:WorldToScreenPoint(otherPlayer.Character.Head.Position)
            local screenPoint = Vector2.new(pos.X, pos.Y)
            local distance = (screenPoint - Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)).Magnitude

            if isVisible and distance < shortestDistance and distance <= (aimFrame.Size.X.Offset / 2) and isPlayerVisible(otherPlayer) then
                closestPlayer = otherPlayer
                shortestDistance = distance
            end
        end
    end

    return closestPlayer
end

local function updateAimLock()
    if isAimLocked then
        local closestPlayer = getClosestVisiblePlayer()

        if closestPlayer and closestPlayer.Character then
            local targetPart
            if aimTarget[1].Head == true and closestPlayer.Character:FindFirstChild("Head") then
                targetPart = closestPlayer.Character.Head
            elseif aimTarget[1].Chest == true and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                targetPart = closestPlayer.Character.HumanoidRootPart
            elseif aimTarget[1].Pelvis == true and closestPlayer.Character:FindFirstChild("LowerTorso") then
                targetPart = closestPlayer.Character.LowerTorso
            end

            if targetPart then
                camera.CFrame = CFrame.new(camera.CFrame.Position, targetPart.Position)
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(updateAimLock)
--[AİMBOT SETTİNGS]--

--[TWEEN FUNCTİONS]--
local function one()
    local mainFrameTween = createTween(mainFrame, 1, UDim2.new(0, 350, 0, 300))
    mainFrameTween:Play()
end

local function two()
    local mainFramebackTween = createTween(mainFrame, 1, UDim2.new(0, 300, 0, 43))
    mainFramebackTween:Play()
end

local function three()
    local AimTargetFrameFor = createTween(AimTargetFrame, 0.3, UDim2.new(0, 175, 0, 100))
    AimTargetFrameFor:Play()
   if aimTarget[1].Head then
     task.wait(0.4)
     UpChest.Visible = true
     PELVIS.Visible = true
   elseif aimTarget[1].Chest then
     task.wait(0.4)
     HEAD.Visible = true
     PELVIS.Visible = true
   elseif aimTarget[1].Pelvis then
     task.wait(0.4)
     HEAD.Visible = true
     downChest.Visible = true
   end
end

local function four()
    HEAD.Visible = false
    PELVIS.Visible = false
    downChest.Visible = false
    UpChest.Visible = false
    local AimTargetFrameForBack = createTween(AimTargetFrame, 0.3, UDim2.new(0, 175, 0, 30))
    AimTargetFrameForBack:Play()
end

local function five()
    local tweenPosForward = createTweenPos(WallcheckButtonFrame, 0.3, UDim2.new(0, 5, 0, 165))
    tweenPosForward:Play()    
end

local function six()
    local tweenPosBackward = createTweenPos(WallcheckButtonFrame, 0.3, UDim2.new(0, 5, 0, 95))
    tweenPosBackward:Play()    
end

local function seven()
    local tweenPosForward = createTweenPos(TeamCheckButtonFrame, 0.3, UDim2.new(0, 5, 0, 205))
    tweenPosForward:Play()    
end

local function eight()
    local tweenPosBackward = createTweenPos(TeamCheckButtonFrame, 0.3, UDim2.new(0, 5, 0, 135))
    tweenPosBackward:Play()    
end


--[TWEEN FUNCTİONS]--

--[BUTTON CLİCK EVENTS]--
Button.MouseButton1Click:Connect(function()
      if destroyAccFrame.Visible == false then
         destroyAccFrame.Visible = true
    end
end)

local Button1Control = false
local debounce = false

local Button4Control = false
local Button5Control = false
local Button6Control = false
local ButtonDisabled = false
local Button5Disabled = false
local Button6Disabled = false

local TweenControl = false
local antispam = false


Button1.MouseButton1Click:Connect(function()
      if debounce then return end
         debounce = true
          Button4Control = false
          Button5Control = false
          Button6Control = false
          ButtonDisabled = false
          Button5Disabled = false
          Button6Disabled = false
 if not Button1Control then
        one()
        Button1Control = true
        task.wait(1)
        line.Visible = true
        line1.Visible = true
        line2.Visible = true
        fullframe.Visible = true
        frm.Visible = true
        frm1.Visible = true
        MainThick.Visible = true
        text5.Visible = true
        text6.Visible = true
        text13.Visible = true
        
        Button4.Visible = true
        Button5.Visible = true
        Button6.Visible = true
    else
        line.Visible = false
        line1.Visible = false
        line2.Visible = false
        fullframe.Visible = false
        frm.Visible = false
        frm1.Visible = false
        MainThick.Visible = false
        text5.Visible = false
        text6.Visible = false
        text13.Visible = false
        scroolFrame.Visible = false
        scroolFrame1.Visible = false
        scroolFrame2.Visible = false
        Button4.Visible = false
        Button5.Visible = false
        Button6.Visible = false
        text7.Font = Enum.Font.GothamMedium
        text8.Font = Enum.Font.GothamMedium
        text9.Font = Enum.Font.GothamMedium
        
        two()
        Button1Control = false
        
    end
    task.wait(1)
    debounce = false
    
end)

Button2.MouseButton1Click:Connect(function()
       _G.EquinoxHub_Aimbot_Initialized = nil
       isAimLocked = false
       screenGui:Destroy()
end)

Button3.MouseButton1Click:Connect(function()
       destroyAccFrame.Visible = false
end)



Button4.MouseButton1Click:Connect(function()
     if ButtonDisabled then return end
       ButtonDisabled = true
       Button5Disabled = false
       Button5Control = false
       Button6Disabled = false
       Button6Control = false
       scroolFrame1.Visible = false
       scroolFrame2.Visible = false
     if not Button4Control then
       text8.Font = Enum.Font.GothamMedium
       text9.Font = Enum.Font.GothamMedium
       text7.Font = Enum.Font.GothamBlack
       scroolFrame.Visible = true
       Button4Control = true
     end
end)

Button5.MouseButton1Click:Connect(function()
     if Button5Disabled then return end
        Button5Disabled = true
        ButtonDisabled = false
        Button4Control = false
        Button6Disabled = false
        Button6Control = false
        scroolFrame.Visible = false
        scroolFrame2.Visible = false
        TweenControl = false
     if not Button5Control then
       text7.Font = Enum.Font.GothamMedium
       text9.Font = Enum.Font.GothamMedium
       text8.Font = Enum.Font.GothamBlack
       scroolFrame1.Visible = true
       Button5Control = true
     end
end)

Button6.MouseButton1Click:Connect(function()
      if Button6Disabled then return end
        Button6Disabled = true
        Button4Control = false
        Button5Control = false
        ButtonDisabled = false
        Button5Disabled = false
        scroolFrame.Visible = false
        scroolFrame1.Visible = false
        TweenControl = false
      if not Button6Control then
        text7.Font = Enum.Font.GothamMedium
        text8.Font = Enum.Font.GothamMedium
        text9.Font = Enum.Font.GothamBlack
        scroolFrame2.Visible = true
        Button6Control = true
     end
end)

local CircleRedGreen = false
Button7.MouseButton1Click:Connect(function()
     if not CircleRedGreen then
      CircleRedGreen = true
      circleFrm.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
      aimFrame.Visible = true
      isAimLocked = true
     else
      circleFrm.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
      aimFrame.Visible = false
      CircleRedGreen = false
      isAimLocked = false
    end
end)

Button8.MouseButton1Click:Connect(function()
    if antispam then return end
      antispam = true
    if not TweenControl then
       five()
       seven()
       three()
       TweenControl = true
    else
       four()
       six()
       eight()
       TweenControl = false
   end       
      task.wait(1)
      antispam = false
end)

UpChest.MouseButton1Click:Connect(function()
      aimTarget[1].Head = false
      aimTarget[1].Chest = true
      aimTarget[1].Pelvis = false
      Button8.Text = "CHEST"
      four()
      six()
      eight()
      TweenControl = false
end)

downChest.MouseButton1Click:Connect(function()
      aimTarget[1].Head = false
      aimTarget[1].Chest = true
      aimTarget[1].Pelvis = false
      Button8.Text = "CHEST"
      four()
      six()
      eight()
      TweenControl = false
end)

PELVIS.MouseButton1Click:Connect(function()
      aimTarget[1].Head = false
      aimTarget[1].Chest = false
      aimTarget[1].Pelvis = true
      Button8.Text = "PELVIS"
      four()
      six()
      eight()
      TweenControl = false
end)

HEAD.MouseButton1Click:Connect(function()
      aimTarget[1].Head = true
      aimTarget[1].Chest = false
      aimTarget[1].Pelvis = true
      Button8.Text = "HEAD"
      four()
      six()
      eight()
      TweenControl = false
end)

Button9.MouseButton1Click:Connect(function()
    if not aimTarget[3].WallCheck then
     circleFrm2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
     aimTarget[3].WallCheck = true
   else
     circleFrm2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
     aimTarget[3].WallCheck = false
     end
end)

Button10.MouseButton1Click:Connect(function()
    if not aimTarget[2].TeamCheck then
     circleFrm3.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
     aimTarget[2].TeamCheck = true
   else
     circleFrm3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
     aimTarget[2].TeamCheck = false
     end
end)
--[BUTTON CLİCK EVENTS]--

--[Mouse Enter Events]--
local function ButtonMouseEnter()
    Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end

local function ButtonMouseLeave()
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
end

Button.MouseEnter:Connect(ButtonMouseEnter)
Button.MouseLeave:Connect(ButtonMouseLeave)

local function Button1MouseEnter()
    Button1.BackgroundColor3 = Color3.fromRGB(51, 255, 255)
end

local function Button1MouseLeave()
    Button1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
end

Button1.MouseEnter:Connect(Button1MouseEnter)
Button1.MouseLeave:Connect(Button1MouseLeave)
--[Mouse Enter Events]--

--[BUTTON UPDATE????]--
local function updateButtonPositions()
    Button.Position = UDim2.new(0, mainFrame.Size.X.Offset - 46, 0, 0)
    Button1.Position = UDim2.new(0, mainFrame.Size.X.Offset - 91, 0, 0)
end

game:GetService("RunService").RenderStepped:Connect(updateButtonPositions)
--[BUTTON UPDATE????]--

--[Aimbot Fov Color Check]--
local function isValidRGB(text)
    local r, g, b = text:match("(%d+),%s*(%d+),%s*(%d+)")
    r, g, b = tonumber(r), tonumber(g), tonumber(b)
    if r and g and b then
        if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
            return true, Color3.fromRGB(r, g, b)
        end
    end
    return false, Color3.fromRGB(0, 0, 0)
end

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local isValid, color = isValidRGB(textbox.Text)
        if isValid then
            uiStroke.Color = color
        else
            uiStroke.Color = Color3.fromRGB(0, 0, 0)
        end
    end
end)
--[Aimbot Fov Color Check]--

--[Fov Scale]--
local function updateSliderPosition(inputPosition)
    local relativePosition = math.clamp((inputPosition.X - slith.AbsolutePosition.X) / slith.AbsoluteSize.X, 0, 1)
    local value = math.floor(relativePosition * 500)
    
    slithres.Position = UDim2.new(relativePosition, -5, 0, -5)
    slithre.Size = UDim2.new(relativePosition, 0, 1, 0)
    
    text12.Text = tostring(value)
    aimFrame.Size = UDim2.new(0, value, 0, value)
end
local function updateSliderPosition(input)
    local relativePosition = math.clamp((input.Position.X - slith.AbsolutePosition.X) / slith.AbsoluteSize.X, 0, 1)
    local value = math.floor(relativePosition * 500)
    
    slithres.Position = UDim2.new(relativePosition, -5, 0, -5)
    slithre.Size = UDim2.new(relativePosition, 0, 1, 0)
    
    text12.Text = tostring(value)
    aimFrame.Size = UDim2.new(0, value, 0, value)
end

local dragging = false
slithres.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        updateSliderPosition(input)
    end
end)

slithres.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateSliderPosition(input)
    end
end)

slithres.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

updateSliderPosition({Position = Vector3.new(slith.AbsolutePosition.X + slith.AbsoluteSize.X * 0.3, 0, 0)})
--[Fov Scale]--

local guiElements = {screenGui, aimFrame, uiStroke, mainFrame, destroyAccFrame, fullframe, frm, frm1, MainThick, MainThick1, imageLBL, scroolFrame, scroolFrame1, scroolFrame2, circleFrm, AimTargetFrame, slith, slithre, slithres, circleslithres, WallcheckButtonFrame, TeamCheckButtonFrame, circleFrm2, circleFrm3, line, line1, line2, Button, Button1, Button2, Button3, Button4, Button5, Button6, Button7, Button8, UpChest, downChest, PELVIS, HEAD, Button9, Button10, textbox, text, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, UIStroke, uic, uic1, uic2, uic3, uic4, uic5, uic6, uic7, uic8, uic9, uic10, uic11, uic12, uic13, uic14, uic15, uic16, uic17, uic18, uic19, uic20, uic21, uic22, uic23, uic24, uic25, uic26, uic27, uic28}

   for _, guiElement in pairs(guiElements) do
        guiElement.Name = generateRandomString(14)
end