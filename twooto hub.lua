-- HUD variables --
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Twooto hub <3",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "OrionLib",
    IntroEnabled = true,
    IntroText = "Welcome to twooto hub!",
})

-- services --
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")

-- discord variables --
local discordInvite = "https://discord.gg/WYwXgHtdZW"
local url = "https://discord.com/api/webhooks/1407368525915623424/-nbhxJFTv7UJUZjbxZjcvZtjwO5igD2GHyN_1cUpP6qE8owUq2gCOW4CY84WfxqpMvbd"

-- games ---
if game.PlaceId == 2202352383 then -- spts classic
    -- Load the remote code
    local scriptCode = game:HttpGet("https://raw.githubusercontent.com/twooto-bot/spts-classic-script-obf/refs/heads/main/spts%20classic%20script%20obf.lua")
    local chunk = loadstring(scriptCode)

    -- Create a custom environment that includes your variables
    local env = getfenv()
    env.Window = Window
    env.OrionLib = OrionLib

    -- Assign that environment to the chunk
    setfenv(chunk, env)

    -- Run the script
    chunk()

elseif game.PlaceId == 3823781113 then -- spts remastered
    -- Load the remote code
    local scriptCode = game:HttpGet("https://raw.githubusercontent.com/twooto-bot/Saber-Simulator-script-obf/refs/heads/main/Saber%20Simulator%20Script%20obf.lua")
    local chunk = loadstring(scriptCode)

    -- Create a custom environment that includes your variables
    local env = getfenv()
    env.Window = Window
    env.OrionLib = OrionLib

    -- Assign that environment to the chunk
    setfenv(chunk, env)

    -- Run the script
    chunk()
else
    OrionLib:MakeNotification({
        Name = "Error",
        Content = "This script is not supported in this game.",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

-- info tab --
local infotab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

infotab:AddLabel("Script made by twooto")
infotab:AddLabel("Discord: " .. discordInvite)
infotab:AddButton({
    Name = "Copy Discord Invite",
    Callback = function()
        setclipboard(discordInvite)
        StarterGui:SetCore("SendNotification", {
            Title = "Discord Invite",
            Text = "Invite copied! Paste it in your browser to join.",
            Duration = 50
        })
    end
})
infotab:AddLabel("anti afk is automaticaly turned on")

-- webhook log --
local function sendembed(title, description, color)
    local data = {
        username = "Script Logger",
        embeds = {{
            title = title,
            description = description,
            footer = {
                text = os.date("%Y-%m-%d %H:%M:%S"),
            },
            color = color
        }}
    }

    local json = game:GetService("HttpService"):JSONEncode(data)

    request = http_request or request or syn.request
    request({
        Url = url,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = json
    })
end
local plr = game.Players.LocalPlayer
local placeInfo = MarketplaceService:GetProductInfo(game.PlaceId)
sendembed("Script Loaded", "Script was executed" .. " by: **" .. plr.Name .. "**\n playing game: " .. placeInfo.Name, 65280)

-- discord invite -- 
setclipboard(discordInvite)

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Invite copied! Paste it in your browser to join.",
    Duration = 50
})

-- anti afk --
plr.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- finishing script --
OrionLib:Init()