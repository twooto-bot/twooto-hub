-- HUD variables --
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Twooto hub",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "OrionLib",
    IntroEnabled = true,
    IntroText = "Welcome to twooto hub!",
})

-- services --
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")

-- discord variables --
local discordInvite = "https://discord.gg/WYwXgHtdZW"
local url = "https://discord.com/api/webhooks/1407368525915623424/-nbhxJFTv7UJUZjbxZjcvZtjwO5igD2GHyN_1cUpP6qE8owUq2gCOW4CY84WfxqpMvbd"

-- games ---
if game.PlaceId == 2202352383 then -- spts classic
    -- variables --
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local rootPart = char:WaitForChild("HumanoidRootPart")
    local backpack = plr:WaitForChild("Backpack")
    -- guis --
    local PlayerGui = plr:WaitForChild("PlayerGui")
    local menuframe = PlayerGui.ScreenGui.MenuFrame
    local skillframe = menuframe.SkillFrame
    local infoframe = menuframe.InfoFrame

    -- game variables --
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")

    --script variables --
    local fistfarmrunning = true
    local btfarmrunning = true
    local msandjfrunning = true
    local meditaterunning = true
    local fastrespawnrunning = true
    local returnbydeathrunning = true
    local deathbtfarmrunning = true

    -- help functions --
    local function prefixtonumber(str)
        local numberPart = str:match("(%d+%.?%d*[KkMmBbTt][QqAaIi]?)") or str:match("(%d+%.?%d*)")

        local numStr, suffix = numberPart:match("^(%d+%.?%d*)(%a*)$")

        local num = tonumber(numStr) or 0

        if suffix then
            suffix = suffix:lower()
            if suffix == "k" then
                num = num * 1e3
            elseif suffix == "m" then
                num = num * 1e6
            elseif suffix == "b" then
                num = num * 1e9
            elseif suffix == "t" then
                num = num * 1e12
            elseif suffix == "qa" then
                num = num * 1e15
            elseif suffix == "qi" then
                num = num * 1e18
            end
        end

        return num
    end

    local function fastrespawnlogic(fastrespawn)
        if fastrespawn then
            local blur = game.Lighting:WaitForChild("Blur")
            task.wait(1)
            print("Player died, respawning...")
            RemoteEvent:FireServer({ "Respawn" })

            plr.CharacterAdded:Connect(function(character)
                char = character
                humanoid = char:WaitForChild("Humanoid")
                rootPart = char:WaitForChild("HumanoidRootPart")
            end)

            task.wait(2)
            plr.PlayerGui.IntroGui.Enabled = false
            blur.Enabled = false
            plr.PlayerGui.ScreenGui.Enabled = true
        end
    end

    local function flipplayer()
        local conn = RunService.Heartbeat:Connect(function()
            rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)

        end)

        return conn
    end

    -- farming functions --
    local function fistfarm()
        fistfarmrunning = not fistfarmrunning
        teleport = nil

        task.spawn(function()
            while fistfarmrunning do
                local fs = prefixtonumber(infoframe.FSTxt.Text)

                if skillframe.SkillTxt3.Text == "Invisibility" and skillframe.SkillTxt8.Text ~= "Fly : {Double Jump}" then
                    teleport = Vector3.new(407.9, 260.653, 979.38) -- teleport to stone
                elseif skillframe.SkillTxt8.Text == "Fly : {Double Jump}" and fs <= 1000000000 then
                    teleport = Vector3.new(-2276.68, 1955.56, 1051.59) -- teleport to crystall
                elseif fs <= 100000000000 and skillframe.SkillTxt8.Text == "Fly : {Double Jump}" then
                    teleport = Vector3.new(1176.43, 4776.36, -2293.09) -- teleport to blue star
                elseif fs <= 10000000000000 and skillframe.SkillTxt8.Text == "Fly : {Double Jump}" then
                    teleport = Vector3.new(1379.9, 9256.42, 1648.31) -- teleport to green star
                elseif fs >= 10000000000000 and skillframe.SkillTxt8.Text == "Fly : {Double Jump}" then
                    teleport = Vector3.new(-366.606, 15681.9, -9.951) -- teleport to red star
                end

                if teleport == nil then
                    print("Not strong enough for a location")
                else
                    rootPart.CFrame = CFrame.new(teleport) -- teleport player to training area
                end

                RemoteEvent:FireServer({ "Add_FS_Request" })
                if humanoid.Health < 1 then
                    fastrespawnlogic(fistfarmrunning)
                end
                task.wait()
            end
        end)
    end

    local function bodyToughnessFarm()
        btfarmrunning = not btfarmrunning
        teleport = nil

        if btfarmrunning then
            task.spawn(function()
                while btfarmrunning do
                    local bt = prefixtonumber(infoframe.BTTxt.Text)

                    if bt >= 100 then
                        local flipconn = flipplayer()
                    end
                    
                    if bt <= 100 then
                        teleport = nil
                    elseif bt <= 10000 then
                        teleport = Vector3.new(367.012, 245, -444.984) -- teleport to ice bath
                    elseif bt <= 100000 then
                        teleport = Vector3.new(356.39, 260, -493.115) -- teleport to firebath
                    elseif bt <= 1000000 then
                        teleport = Vector3.new(1635.67, 254, 2247.51) -- teleport to 100k ice bath
                    elseif bt <= 10000000 then
                        teleport = Vector3.new(-2301.51, 960, 1069.53) -- teleport to tornado
                    elseif bt <= 1000000000 then
                        teleport = Vector3.new(-2046.68, 710, -1879.83) -- teleport to volcano
                    elseif bt <= 100000000000 then
                        teleport = Vector3.new(-250.575, 282.5, 979.104) -- teleport to green fire bath
                    elseif bt <= 10000000000000 then
                        teleport = Vector3.new(-278.697, 277, 991.981) -- teleport to 100B green acid bath
                    elseif bt >= 10000000000000 then
                        teleport = Vector3.new(-278.582, 277, 1006.94) -- teleport to 10T red acid bath
                    end
                    
                    if teleport == nil then
                        RemoteEvent:FireServer({ "+BT1" })
                    else
                        rootPart.CFrame = CFrame.new(teleport) -- teleport player to training area
                    end

                    if humanoid.health < 1 then
                        fastrespawnlogic(btfarmrunning)
                    end
                    task.wait()
                end
                if flipconn and flipping then flipconn:Disconnect() end
            end)
        end
    end

    local function movementspeed_jump_power_farm(start)
        msandjfrunning = not msandjfrunning

        if msandjfrunning then
            task.spawn(function()
                while msandjfrunning do
                    RemoteEvent:FireServer({ "Add_JF_Request" })
                    RemoteEvent:FireServer({ "Add_MS_Request" })
                    task.wait()
                end
            end)
        end
    end

    local function psychic_power_farm()
        meditaterunning = not meditaterunning
        teleport = nil
        local tool = backpack:FindFirstChild("Meditate")

        task.spawn(function()
            while meditaterunning do
                if humanoid.Health < 1 then
                    tool.Parent = nil
                    fastrespawnlogic(meditaterunning)
                    task.wait(1)
                    tool = backpack:WaitForChild("Meditate")
                    tool.Parent = char
                end


                local psy = prefixtonumber(infoframe.PPTxt.Text)

                if psy >= 1000000 then
                    local flipconn = flipplayer()
                end

                if psy <= 1000000 then
                    teleport = nil
                elseif psy <= 1000000000 then
                    teleport = Vector3.new(-2534.12, 5480, -534.712) -- teleport to 1M zone
                elseif psy <= 1000000000000 then
                    teleport = Vector3.new(-2565.63, 5496, -441.123) -- teleport to 1B zone
                elseif psy <= 1000000000000000 then
                    teleport = Vector3.new(-2588.01, 5507, -504.737) -- teleport to 1T zone
                elseif psy >= 1000000000000000 then
                    teleport = Vector3.new(-2544.5, 5405, -488.805) -- teleport to 1Qa zone
                end

                if tool then
                    tool.Parent = char
                end

                if teleport and tool then
                    rootPart.CFrame = CFrame.new(teleport)
                end

                task.wait()
            end

            if flipconn and flipping then flipconn:Disconnect() end
            if tool then tool.Parent = backpack end
        end)
    end

    local function body_toughness_death_farm()
        deathbtfarmrunning = not deathbtfarmrunning
        teleport = nil

        if deathbtfarmrunning then
            local flipconn = flipplayer()
            task.spawn(function()
                while deathbtfarmrunning do
                    local bt = prefixtonumber(infoframe.BTTxt.Text)

                    if bt >= 30 then
                        local flipconn = flipplayer()
                    end
                    
                    if bt <= 30 then
                        teleport = nil
                    elseif bt <= 1000 then
                        teleport = Vector3.new(367.012, 245, -444.984) -- teleport to ice bath
                    elseif bt <= 10000 then
                        teleport = Vector3.new(356.39, 260, -493.115) -- teleport to firebath
                    elseif bt <= 100000 then
                        teleport = Vector3.new(1635.67, 254, 2247.51) -- teleport to 100k ice bath
                    elseif bt <= 1000000 then
                        teleport = Vector3.new(-2301.51, 960, 1069.53) -- teleport to tornado
                    elseif bt <= 100000000 then
                        teleport = Vector3.new(-2046.68, 710, -1879.83) -- teleport to volcano
                    elseif bt <= 10000000000 then
                        teleport = Vector3.new(-250.575, 282.5, 979.104) -- teleport to green fire bath
                    elseif bt <= 1000000000000 then
                        teleport = Vector3.new(-278.697, 277, 991.981) -- teleport to 100B green acid bath
                    elseif bt >= 1000000000000 then
                        teleport = Vector3.new(-278.582, 277, 1006.94) -- teleport to 10T red acid bath
                    end
                    
                    if teleport == nil then
                        RemoteEvent:FireServer({ "+BT1" })
                    else
                        rootPart.CFrame = CFrame.new(teleport) -- teleport player to training area
                    end

                    if humanoid.health < 1 then
                        fastrespawnlogic(deathbtfarmrunning)
                    end
                    task.wait()
                end
                if flipconn and flipping then flipconn:Disconnect() end
            end)
        end
    end

    local function generateESP()
        task.spawn(function()
            while true do
                task.wait(1)
                for _, player in pairs(game.Players:GetPlayers()) do

                    if player.Name == plr.Name or not player.Character or player.Character:FindFirstChild("Highlight") then
                        continue
                    end

                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.new(255, 0, 0)
                    highlight.FillTransparency = 0.25
                    highlight.OutlineColor = Color3.new(0, 0, 0)

                    local bilbordgui = Instance.new("BillboardGui")
                    bilbordgui.Parent = player.Character
                    bilbordgui.Size = UDim2.new(0, 236, 0, 63)
                    bilbordgui.AlwaysOnTop = true
                    bilbordgui.StudsOffset = Vector3.new(0, 4, 0)

                    local textlabel = Instance.new("TextLabel")
                    textlabel.Parent = bilbordgui
                    textlabel.Text = player.Name
                    textlabel.TextColor3 = Color3.new(1, 1, 1)
                    textlabel.BackgroundTransparency = 1
                    textlabel.Size = UDim2.new(1, 0, 1, 0)

                end
            end
        end)
    end

    local function fastrespawn()
        fastrespawnrunning = not fastrespawnrunning

        humanoid.Died:Connect(function()
            fastrespawnlogic(fastrespawnrunning)
        end)

        plr.CharacterAdded:Connect(function(character)
                char = character
                humanoid = char:WaitForChild("Humanoid")
                rootPart = char:WaitForChild("HumanoidRootPart")

            character.Humanoid.Died:Connect(function()
                fastrespawnlogic(fastrespawnrunning)
            end)
        end)
    end

    local function returnbydeath()
        returnbydeathrunning = not returnbydeathrunning

        local function died()
            if returnbydeathrunning then
                local blur = game.Lighting:WaitForChild("Blur")
                local pos = rootPart.Position
                task.wait(1)
                print("Player died, respawning...")
                RemoteEvent:FireServer({ "Respawn" })
                task.wait(2)
                rootPart.CFrame = CFrame.new(pos)
                task.wait(1)
                plr.PlayerGui.IntroGui.Enabled = false
                blur.Enabled = false
                plr.PlayerGui.ScreenGui.Enabled = true
            end
        end

        humanoid.Died:Connect(function()
            died()
        end)

        plr.CharacterAdded:Connect(function(character)
            char = character
            humanoid = char:WaitForChild("Humanoid")
            rootPart = char:WaitForChild("HumanoidRootPart")

            character.Humanoid.Died:Connect(function()
                died()
            end)
        end)
    end

    local function bt_teleports(selected)
        if selected == "ice bath" then
            rootPart.CFrame = CFrame.new(367.012, 248.478, -444.984) -- teleport to ice bath
        elseif selected == "firebath" then
            rootPart.CFrame = CFrame.new(356.39, 265.608, -493.115) -- teleport to firebath
        elseif selected == "ice berg bath" then
            rootPart.CFrame = CFrame.new(1635.67, 257.987, 2247.51) -- teleport to 100k ice bath
        elseif selected == "Tornado" then
            rootPart.CFrame = CFrame.new(-2301.51, 1003.84, 1069.53) -- teleport to tornado
        elseif selected == "Volcano" then
            rootPart.CFrame = CFrame.new(-2046.68, 710, -1879.83) -- teleport to volcano
        elseif selected == "Green Fire Bath" then
            rootPart.CFrame = CFrame.new(-250.575, 290.835, 979.104) -- teleport to green fire bath
        elseif selected == "100B Green Acid Bath" then
            rootPart.CFrame = CFrame.new(-278.697, 280.549, 991.981) -- teleport to 100B green acid bath
        elseif selected == "10T Red Acid Bath" then
            rootPart.CFrame = CFrame.new(-278.582, 280.503, 1006.94) -- teleport to 10T red acid bath
        end
    end

    local function fist_teleports(selected)
        if selected == "Stone" then
            rootPart.CFrame = CFrame.new(407.9, 260.653, 979.38) -- teleport to Stone
        elseif selected == "Crystal" then
            rootPart.CFrame = CFrame.new(-2276.68, 1955.56, 1051.59) -- teleport to Crystal
        elseif selected == "Blue star" then
            rootPart.CFrame = CFrame.new(1176.43, 4776.36, -2293.09) -- teleport to Blue star
        elseif selected == "Green star" then
            rootPart.CFrame = CFrame.new(1379.9, 9256.42, 1648.31) -- teleport to Green star
        elseif selected == "Red star" then
            rootPart.CFrame = CFrame.new(-366.606, 15681.9, -9.951) -- teleport to Red star
        end
    end

    local function psychic_teleports(selected)
        if selected == "1M zone" then
            rootPart.CFrame = CFrame.new(-2534.12, 5489.83, -534.712) -- teleport to 1M zone
        elseif selected == "1B zone" then
            rootPart.CFrame = CFrame.new(-2565.63, 5506.4, -441.123) -- teleport to 1B zone
        elseif selected == "1T zone" then
            rootPart.CFrame = CFrame.new(-2588.01, 5522.44, -504.737) -- teleport to 1T zone
        elseif selected == "Waterfall" then
            rootPart.CFrame = CFrame.new(-2544.5, 5412.83, -488.805) -- teleport to Waterfall
        end
    end

    local function misc_teleports(selected)
        if selected == "Sath" then
            rootPart.CFrame = CFrame.new(497.415, 246.871, 896.683) -- teleport to Sath
        elseif selected == "leaderboards" then
            rootPart.CFrame = CFrame.new(-758.094, 249.445, 746.374) -- teleport to leaderboards
        elseif selected == "bridge" then
            rootPart.CFrame = CFrame.new(-83.6734, 311.612, 212.23) -- teleport to bridge
        elseif selected == "safe spot" then
            rootPart.CFrame = CFrame.new(487.367, 24900000.415, 899.618) -- teleport to safe spot
        end
    end

    -- refresh player -- 
    plr.CharacterAdded:Connect(function(character)
        char = character
        humanoid = char:WaitForChild("Humanoid")
        rootPart = char:WaitForChild("HumanoidRootPart")
        backpack = plr:WaitForChild("Backpack")
    end)

    -- HUD --
    -- training tab --
    local trainingtab = Window:MakeTab({
        Name = "Training",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    trainingtab:AddToggle({
        Name = "farm fist",
        Default = false,
        Callback = function(Value)
            fistfarm()
        end
    })

    trainingtab:AddToggle({
        Name = "farm Body toughness",
        Default = false,
        Callback = function(Value)
            bodyToughnessFarm()
        end
    })

    trainingtab:AddToggle({
        Name = "farm MS and JP",
        Default = false,
        Callback = function(Value)
            movementspeed_jump_power_farm()
        end
    })

    trainingtab:AddToggle({
        Name = "farm psychic power",
        Default = false,
        Callback = function(Value)
            psychic_power_farm()
        end
    })

    trainingtab:AddToggle({
        Name = "BT death farm",
        Default = false,
        Callback = function(Value)
            body_toughness_death_farm()
        end
    })

    -- combat tab --
    local combattab = Window:MakeTab({
        Name = "Combat",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    combattab:AddButton({
        Name = "ESP",
        Callback = function()
            generateESP()
        end
    })

    -- misc toggles --
    local misctab = Window:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    misctab:AddToggle({
        Name = "Fast Respawn",
        Default = false,
        Callback = function(Value)
            fastrespawn()
        end
    })

    misctab:AddToggle({
        Name = "Return by Death",
        Default = false,
        Callback = function(Value)
            returnbydeath()
        end
    })

    -- teleports tab --
    local teleportstab = Window:MakeTab({
        Name = "Teleports",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    teleportstab:AddDropdown({
        Name = "BT teleports!",
        Default = "",
        Options = {
            "ice bath",
            "firebath",
            "ice berg bath",
            "Tornado",
            "Volcano",
            "Green Fire Bath",
            "100B Green Acid Bath",
            "10T Red Acid Bath"
        },
        Callback = function(Value)
            bt_teleports(Value)
        end
    })

    teleportstab:AddDropdown({
        Name = "Fist teleports!",
        Default = "",
        Options = {
            "Stone",
            "Crystal",
            "Blue star",
            "Green star",
            "Red star"
        },
        Callback = function(Value)
            fist_teleports(Value)
        end
    })

    teleportstab:AddDropdown({
        Name = "Psychic teleports!",
        Default = "",
        Options = {
            "1M zone",
            "1B zone",
            "1T zone",
            "Waterfall"
        },
        Callback = function(Value)
            psychic_teleports(Value)
        end
    })

    teleportstab:AddDropdown({
        Name = "Misc teleports!",
        Default = "",
        Options = {
            "Sath",
            "leaderboards",
            "bridge",
            "safe spot"
        },
        Callback = function(Value)
            misc_teleports(Value)
        end
    })

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