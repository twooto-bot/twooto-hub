-- services --
local VirtualUser = game:GetService("VirtualUser")
-- player variables --
local plr = game.Players.LocalPlayer

-- games ---
if game.PlaceId == 2202352383 then -- spts classic
    game:HttpGet("https://raw.githubusercontent.com/twooto-bot/NEW-spts-classic-script/refs/heads/main/spts%20classic%20recode.lua")
elseif game.PlaceId == 3823781113 then -- Saber Simulator
    game:HttpGet("https://raw.githubusercontent.com/twooto-bot/Saber-Simulator-script/refs/heads/main/Saber%20Simulator%20script.lua")
elseif game.PlaceId == 76220848070434 then -- inf parts
    game:HttpGet("https://raw.githubusercontent.com/twooto-bot/inf-parts/refs/heads/main/inf%20parts.lua")
else
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui", player.PlayerGui)
    local frame = Instance.new("Frame", gui)

    frame.Size = UDim2.new(0, 200, 0, 50)
    frame.Position = UDim2.new(0.5, -100, 0.1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local text = Instance.new("TextLabel", frame)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.Text = "Game not suported!"

    task.wait(60)

    gui:Destroy()
end

-- anti afk --
plr.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)