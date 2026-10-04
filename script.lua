-- Создаём интерфейс (окно)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50) -- По центру экрана
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Тёмно-серый фон
Frame.Parent = ScreenGui
Frame.Active = true -- Чтобы окно можно было перетаскивать
Frame.Draggable = true

-- Создаём кнопку
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 150, 0, 40)
Button.Position = UDim2.new(0.5, -75, 0.5, -20)
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный, когда выключено
Button.Text = "Speed: OFF"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.Parent = Frame

-- Логика включения/выключения
local speedEnabled = false

Button.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled -- Меняем состояние на противоположное
    
    if speedEnabled then
        Button.Text = "Speed: ON"
        Button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зелёный, когда включено
    else
        Button.Text = "Speed: OFF"
        Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный, когда выключено
        -- Возвращаем обычную скорость
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 16 -- Стандартная скорость
        end
    end
end)

-- Постоянная проверка (чтобы скорость не сбрасывалась)
game:GetService("RunService").Heartbeat:Connect(function()
    if speedEnabled then
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 100 -- Твоя быстрая скорость
        end
    end
end)
