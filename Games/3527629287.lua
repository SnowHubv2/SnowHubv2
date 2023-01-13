if _G.SnowHubv2_AlreadyLoaded ~= nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.") return else
    _G.SnowHubv2_AlreadyLoaded = 0
end


repeat task.wait() until game:IsLoaded()
if not hookmetamethod then game.Players.LocalPlayer:Kick('your exploit is not supported') end

if game.PlaceId ~= 3527629287 then return end


local players = game:GetService('Players')
local RunService = game:GetService('RunService')
local Teams = game:GetService('Teams')
local user_input_service = game:GetService('UserInputService')
local workspace = game:GetService('Workspace')

local camera = workspace.CurrentCamera
local wtvp = camera.WorldToViewportPoint
local localplayer = players.LocalPlayer

local function indexExists(object, index)
    local _, value = pcall(function() return object[index] end)
    return value
end

local function get_character(player) return indexExists(player, 'Character') end

local function get_mouse_location() return user_input_service:GetMouseLocation() end

local function is_alive(player) return player.Character and player.Character:FindFirstChild('Humanoid') and player.Character:FindFirstChild('Humanoid').Health > 0 end
local function is_team(player) return #Teams:GetChildren() > 0 and player.Team == localplayer.Team end

local function getClosestPlayerToCursor(fov)

    local maxDistance = fov or math.huge

    local closestPlayer = nil
    local closestPlayerDistance = math.huge

    for _, player in pairs(players:GetPlayers()) do

        if player ~= localplayer and not is_team(player) and get_character(player) and is_alive(player) then
            local pos, on_screen = wtvp(camera, get_character(player).Head.Position)

            if not on_screen then continue end

            local distance = (get_mouse_location() - Vector2.new(pos.X, pos.Y)).magnitude

            if distance <= maxDistance and distance < closestPlayerDistance then
                closestPlayer = player
                closestPlayerDistance = distance
            end
        end
    end

    return closestPlayer
end


--[[
 Icons (rbxassetid://)
 Credits to Vision-UI's iconlib
 All icons in here are from there ]]
 local icons = {
    FluentIcons = {
        Home = 9792462652,
        Aimbot = 9766671041,
        Visuals = 9766673555,
        Player = 9766672602,
        Misc = 9766671943,
        Settings = 9766674082,
        Credits = 9766675093,
        Exit = 9766676906
    },
    FeatherIcons = {
        Home = 9792650361,
        Aimbot = 9792632523,
        Visuals = 9792631281,
        Player = 9792631906,
        Misc = 9792634811,
        Settings = 9792633222,
        Credits = 9792634075,
        Exit = 9792635572
    },
    NotificationIcons = {
        Success = 9838874163,
        Warning = 9838873385,
        Error = 9838876113,
        Informational = 9838877673,
        Custom = 9838878267
    }
}



local version = "v1.1"
local localPlr = game:GetService("Players").LocalPlayer


local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()


-- Window
local Window = Rayfield:CreateWindow({
    Name = "SnowHubv2 | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. " " .. version,
    LoadingTitle = "SnowHubv2",
    LoadingSubtitle = "by Snomn",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Snow Hubv2/Configs", -- Create a custom folder for your hub/game
       FileName = "BigPaintball_Config"
    },
    Discord = {
       Enabled = false,
       Invite = "sirius", -- The Discord invite code, do not include discord.gg/
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Snow Hubv2",
        Subtitle = "Key System",
        Note = "Key System is under development. Currently the key is 'snowhub.key', in ONE word",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = "snowhub.key"
    }
})


local MainTab = Window:CreateTab("Main") -- Title, Image


local AimbotAndFOVButton = MainTab:CreateButton({
    Name = "Silent Aim & FOV",
    Info = "Gives you aimbot and draws an FOV on your screen",
    Interact = 'desc',
    Callback = function()
        shared.fov = 400
        local circle = Drawing.new('Circle')
        circle.Thickness = 2
        circle.NumSides = 12
        circle.Radius = shared.fov or 400
        circle.Filled = false
        circle.Transparency = 1
        circle.Color = Color3.new(1, 0, 0.384313)
        circle.Visible = true
        local target = nil
        RunService.Heartbeat:Connect(function(deltaTime)
            task.wait(deltaTime ^ 2)
            target = getClosestPlayerToCursor(shared.fov)
            circle.Position = get_mouse_location()
        end)

        local OldNamecall
        OldNamecall = hookmetamethod(workspace, '__namecall', newcclosure(function(...)
            local args = { ... }
            local method = string.lower(getnamecallmethod())
            local caller = getcallingscript()
            if method == 'findpartonraywithwhitelist' and tostring(caller) == 'First Person Controller' then

                local HitPart = target and target.Character and target.Character.Head or nil
                if HitPart then
                    local Origin = HitPart.Position + Vector3.new(0, 5, 0)
                    local Direction = (HitPart.Position - Origin)
                    args[2] = Ray.new(Origin, Direction)

                    return OldNamecall(unpack(args))
                else
                    return OldNamecall(...)
                end
            end
            return OldNamecall(...)
        end))

        Rayfield:Notify({
            Title = "SnowHubv2 Success!",
            Content = "Silent Aim has been Applied!",
            Duration = 4,
            Image = icons.NotificationIcons.Success,
        })
    end,
})


local ESPButton = MainTab:CreateButton({
    Name = "Highlight",
    Info = "Enables Highlight ESP",
    Interact = 'desc',
    Callback = function()
        -- Simple Highlight ESP :)
        local Highlight = Instance.new("Highlight")
        Highlight.Name = "Highlight"

        function ApplyToCurrentEnemyPlayers()
            for i,v in pairs(game.Players:GetPlayers()) do
                if v.Team ~= game.Players.LocalPlayer.Team then
                    repeat wait() until v.Character
                    if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                        local HighlightClone = Highlight:Clone()
                        HighlightClone.Adornee = v.Character
                        HighlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                        HighlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        HighlightClone.Name = "Highlight"
                    end
                end
            end
        end

        RunService.Heartbeat:Connect(function()
            ApplyToCurrentEnemyPlayers()
        end)

        Rayfield:Notify({
            Title = "SnowHubv2 Success!",
            Content = "Highlight ESP has been Applied!",
            Duration = 4,
            Image = icons.NotificationIcons.Success,
        })
    end,
})


Rayfield:LoadConfiguration()
