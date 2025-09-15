-- HUD variables --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Key System -- 
setclipboard("https://loot-link.com/s?hz5B6yEo")

local Window = Rayfield:CreateWindow({
   Name = "Twooto hub ❤️",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Welcome to twooto hub!",
   LoadingSubtitle = "by twooto",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

    ConfigurationSaving = {
    Enabled = true,
    FolderName = false, -- Create a custom folder for your hub/game
    FileName = "Twooto Hub"
    },

    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
    Title = "twooto hub key system",
    Subtitle = "Key System",
    Note = "Link to get key in clipboard, non support universal key: twooto",
    FileName = "twooto_hubKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
    SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
    GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
    Key = {"twooto", "twooto_is_best"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- services --
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")

-- player variables --
local plr = game.Players.LocalPlayer
local placeInfo = MarketplaceService:GetProductInfo(game.PlaceId)

-- discord variables --
local discordInvite = "https://discord.gg/WYwXgHtdZW"
local url = "https://discord.com/api/webhooks/1417154206103765146/hjBmTpi5PD-ABUbdY3n4ggO9XwmL1TK9zPdgwOznS7bh82eixDThZPIVLSd_iWUDu3IE"
local public_url = "https://discord.com/api/webhooks/1411830171576832042/PwFvqixaPO1jHU3v2x3iSJgPodAskwK43ZVZ3J-Q10V7Ma6FeMJ8v36usYAvXw3l1k81"

-- private webhook --
local function sendembed(title, description, color, url)
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
    sendembed("Script Loaded", "Script was executed" .. " by: **" .. plr.Name .. "**\n playing game: " .. placeInfo.Name, 65280, url)

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
    sendembed("Script Loaded", "Script was executed" .. " by: **" .. plr.Name .. "**\n playing game: " .. placeInfo.Name , 65280, url)
elseif game.PlaceId == 76220848070434 then -- inf parts
    -- Load the remote code
    local scriptCode = game:HttpGet("https://raw.githubusercontent.com/twooto-bot/inf-parts-obf/refs/heads/main/inf%20parts%20obf.lua")
    local chunk = loadstring(scriptCode)

    -- Create a custom environment that includes your variables
    local env = getfenv()
    env.Window = Window
    env.Rayfield = Rayfield

    -- Assign that environment to the chunk
    setfenv(chunk, env)

    -- Run the script
    chunk()
    sendembed("Script Loaded", "Script was executed" .. " by: **" .. plr.Name .. "**\n playing game: " .. placeInfo.Name .. "\n highest area: " .. plr.leaderstats["Best Area"].Value, 65280, url)
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

-- public webhook --
sendembed("public Script Loaded", "Script was executed" .. " by: **" .. string.sub(plr.Name, 1, 3) .. "...**\n playing game: " .. placeInfo.Name, 65280, public_url)



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


-- load config --
Rayfield:LoadConfiguration()