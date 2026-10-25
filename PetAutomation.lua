
-- Pet Automation GUI
-- LocalScript-compatible GUI code

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("PetAutomationGUI")
if oldGui then
    oldGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "PetAutomationGUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(260, 260)
frame.Position = UDim2.new(0.5, -130, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius =
    UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 45)
title.BackgroundTransparency = 1
title.Text = "🐾 Pet Automation"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local states = {
    ["Auto Steal"] = false,
    ["Teleport to Base"] = false,
    ["Auto Farm"] = false,
}

local function makeToggle(name, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -24, 0, 45)
    button.Position = UDim2.fromOffset(12, y)
    button.BackgroundColor3 =
        Color3.fromRGB(65, 65, 80)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextScaled = true
    button.Parent = frame

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 8)

    local function refresh()
        button.Text = name .. ": " ..
            (states[name] and "ON" or "OFF")

        button.BackgroundColor3 = states[name]
            and Color3.fromRGB(35, 160, 95)
            or Color3.fromRGB(65, 65, 80)
    end

    button.Activated:Connect(function()
        states[name] = not states[name]
        refresh()
        print(name, states[name] and "enabled" or "disabled")
    end)

    refresh()
end

makeToggle("Auto Steal", 55)
makeToggle("Teleport to Base", 110)
makeToggle("Auto Farm", 165)

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(28, 28)
close.Position = UDim2.new(1, -34, 0, 8)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(180, 55, 65)
close.Font = Enum.Font.GothamBold
close.Parent = frame

Instance.new("UICorner", close).CornerRadius =
    UDim.new(0, 6)

close.Activated:Connect(function()
    gui:Destroy()
end)
