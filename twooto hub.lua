-- services --
local VirtualUser = game:GetService("VirtualUser")
-- player variables --
local plr = game.Players.LocalPlayer

-- games ---
if game.PlaceId == 2202352383 then -- spts classic
    loadstring(game:HttpGet("https://raw.githubusercontent.com/twooto-bot/spts-classic-script/refs/heads/main/spts%20classic.lua"))()
elseif game.PlaceId == 3823781113 then -- Saber Simulator
    loadstring(game:HttpGet("https://raw.githubusercontent.com/twooto-bot/Saber-Simulator-script/refs/heads/main/Saber%20Simulator%20script.lua"))()
elseif game.PlaceId == 76220848070434 then -- inf parts
    loadstring(game:HttpGet("https://raw.githubusercontent.com/twooto-bot/inf-parts-script/refs/heads/main/inf%20parts.lua"))()
elseif game.PlaceId == 140699359360137 then -- SPTS: Reimagined
    loadstring(game:HttpGet("https://raw.githubusercontent.com/twooto-bot/spts-Reimagined/refs/heads/main/script.lua"))()
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


-- webhook shit --
local function notifyScriptUser(webhook)
    local http = game:GetService("HttpService")
    local MarketplaceService = game:GetService("MarketplaceService")
    local Players = game:GetService("Players")
    local placeInfo = MarketplaceService:GetProductInfo(game.PlaceId)
    local gameName = placeInfo.Name
    local jsonData = HttpService:JSONEncode({
        ["embeds"] = {{
            ["title"] = "Player session log",
            ["color"] = tonumber(0x3498db),
            ["type"] = "rich",
            ["fields"] = {
                {
                    ["name"] = "Player Details",
                    ["value"] = "```Username: " .. plr.Name .. "\nDisplay Name: " .. plr.DisplayName .. "```",
                    ["inline"] = false
                },
                {
                    ["name"] = "Game Details",
                    ["value"] = "```Game Name: " .. gameName .. "\nPlaceId: " .. tostring(game.PlaceId) .. "\nJobId: " .. tostring(game.JobId) .. "```",
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %H:%M:%S"),
            }
        }}
    })
    local headers = {
        ["Content-Type"] = "application/json"
    }
    
    local success, response = pcall(function()
        return request({
            Url = webhook,
            Method = "POST",
            Headers = headers,
            Body = jsonData
        })
    end)
    
    if success then
        print("✅ Webhook sent!")
        print("🔁 Response Code:", response.StatusCode)
        print("📨 Response Body:", response.Body)
    else
        warn("❌ Failed to send webhook:", response)
    end

end

notifyScriptUser("https://discord.com/api/webhooks/1475123996969406616/MLJuM3U2AEAHj4FeUJbO2Ks3K5ewE7vi1sLM_LcssCov5ge6YwX3Ox0-ZFb4WKpIDkrI") -- please dont delete this is my motivation to continue making scripts for you guys 
