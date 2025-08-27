-- HUD variables --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Twooto hub ❤️",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Welcome to twooto hub!",
   LoadingSubtitle = "by twooto",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

})

-- services --
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")

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
    env.Rayfield = Rayfield

    -- Assign that environment to the chunk
    setfenv(chunk, env)

    -- Run the script
    chunk()

elseif game.PlaceId == 3823781113 then -- Saber Simulator
    -- Load the remote code
    local scriptCode = game:HttpGet("https://raw.githubusercontent.com/twooto-bot/Saber-Simulator-script-obf/refs/heads/main/Saber%20Simulator%20Script%20obf.lua")
    local chunk = loadstring(scriptCode)

    -- Create a custom environment that includes your variables
    local env = getfenv()
    env.Window = Window
    env.Rayfield = Rayfield

    -- Assign that environment to the chunk
    setfenv(chunk, env)

    -- Run the script
    chunk()

elseif game.PlaceId == 537413528 then 
    -- Load the remote code
    local scriptCode = game:HttpGet("")
    local chunk = loadstring(scriptCode)

    -- Create a custom environment that includes your variables
    local env = getfenv()
    env.Window = Window
    env.Rayfield = Rayfield

    -- Assign that environment to the chunk
    setfenv(chunk, env)

    -- Run the script
    chunk()
else
    Rayfield:Notify({
        Title = "Error",
        Content = "This script is not supported in this game.",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

-- info tab --
local infotab = Window:CreateTab("Info")

infotab:CreateLabel("Script made by twooto")
infotab:CreateLabel("Discord: " .. discordInvite)
infotab:CreateLabel("anti afk is automaticaly turned on")

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