if _G.SnowHubv2_AlreadyLoaded ~= nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.") return else
    _G.SnowHubv2_AlreadyLoaded = 0
end


local dwCamera = workspace.CurrentCamera
local dwRunService = game:GetService("RunService")
local dwUIS = game:GetService("UserInputService")
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer
local dwMouse = dwLocalPlayer:GetMouse()

local CurrentlyPressed = false

local Aiming = false


-- Variables
_G.Aimbot = false
_G.AutoLock = false
_G.Aimbot_AimPart = "Head"
_G.Aimbot_TeamCheck = false
_G.Aimbot_Draw_FOV = false
_G.Aimbot_FOV_Rainbow = false
_G.Aimbot_FOV_Radius = 50
_G.Aimbot_FOV_Color = Color3.fromRGB(255,255,255)

_G.TriggerBot = false
_G.HoldClick = false

_G.HitBoxExpander = false


-- FOV Circle
local fovcircle = Drawing.new("Circle")

fovcircle.Visible = _G.Aimbot_Draw_FOV
fovcircle.Radius = _G.Aimbot_FOV_Radius
fovcircle.Color = _G.Aimbot_FOV_Color
fovcircle.Thickness = 1
fovcircle.Filled = false
fovcircle.Transparency = 1

fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)


-- Is Aiming Function
dwUIS.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        Aiming = true
    end
end)

dwUIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        Aiming = false
    end
end)


-- RenderStepped:Connect Function
dwRunService.RenderStepped:Connect(function()

    -- Rainbow FOV Function
    if _G.Aimbot_FOV_Rainbow then
        local hue = tick() % 10 / 10
        local rainbow = Color3.fromHSV(hue, 1, 1)

        fovcircle.Color = rainbow
    end


    -- Aimbot Function
    local dist = math.huge
    local closest_char = nil

    if _G.Aimbot == true and Aiming or _G.Aimbot == true and _G.AutoLock == true then

        for i,v in next, dwEntities:GetChildren() do 

            if v ~= dwLocalPlayer and
            v.Character and
            v.Character:FindFirstChild("HumanoidRootPart") and
            v.Character:FindFirstChild("Humanoid") and
            v.Character:FindFirstChild("Humanoid").Health > 0 then

                if _G.Aimbot_TeamCheck == true and
                v.Team ~= dwLocalPlayer.Team or
                _G.Aimbot_TeamCheck == false then

                    local char = v.Character
                    local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[_G.Aimbot_AimPart].Position)

                    if is_onscreen then

                        local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude

                        if mag < dist and mag < _G.Aimbot_FOV_Radius then

                            dist = mag
                            closest_char = char

                        end
                    end
                end
            end
        end

        if closest_char ~= nil and
        closest_char:FindFirstChild("HumanoidRootPart") and
        closest_char:FindFirstChild("Humanoid") and
        closest_char:FindFirstChild("Humanoid").Health > 0 then

            dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[_G.Aimbot_AimPart].Position)
        end
    end


    -- HitBox Function
    if _G.HitBoxExpander == true then 
        for _, v in pairs(dwEntities:GetChildren()) do

            task.wait(2)

            if v.Name~= dwLocalPlayer.Name and v.Character.UpperTorso.Color ~= dwLocalPlayer.Character.UpperTorso.Color and v.Team ~= dwLocalPlayer.Team then
                v.Character.LowerTorso.CanCollide = false
                v.Character.LowerTorso.Material = "Neon"
                v.Character.LowerTorso.Transparency = 1
                v.Character.LowerTorso.Size=Vector3.new(15,15,15)
                v.Character.HumanoidRootPart.Size = Vector3.new(15,15,15)
            end
        end
    end


    if _G.TriggerBot == true then
        if dwMouse.Target and dwEntities:FindFirstChild(dwMouse.Target.Parent.Name) then

            local HitPlayer = dwEntities:FindFirstChild(dwMouse.Target.Parent.Name)

            if HitPlayer.Team ~= dwLocalPlayer.Team then
                if not CurrentlyPressed then
                    CurrentlyPressed = true
                    mouse1press()
                end
            end

        else
            CurrentlyPressed = false
            mouse1release()
        end
    end
end)


-- Icons
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



-- Loads UI Library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()


-- Window
local Window = Rayfield:CreateWindow({
    Name = "SnowHubv2 | Universal",
    LoadingTitle = "SnowHubv2",
    LoadingSubtitle = "by Snomn",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = "Snow Hubv2", -- Create a custom folder for your hub/game
       FileName = "Universal_Config"
    },
    Discord = {
       Enabled = true,
       Invite = "zw48cRPCGu", -- The Discord invite code, do not include discord.gg/
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
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


-- Start Up Prompt
Window:Prompt({
	Title = 'SnowHubv2',
	SubTitle = 'Universal',
	Content = 'This is the Universal version of SnowHub. Join the discord to find supported games. Its somewhere',
	Actions = {
		Accept = {
			Name = 'Okay',
			Callback = function()
				-- You know what a callback is...
			end,
		}
	}
})


-- Tab for Aimbot
local AimbotTab = Window:CreateTab("Aimbot", icons.FeatherIcons.Aimbot)


-- FOV Section
local AimbotSection = AimbotTab:CreateSection("Aimbot", false)


-- Toggle Aimbot
local AimbotToggle = AimbotTab:CreateToggle({
    Name = "Aimbot",
    Info = "Toggles Aimbot",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(Value)
        _G.Aimbot = Value
    end,
})


-- Toggle AutoLock
local AutoLockToggle = AimbotTab:CreateToggle({
    Name = "Auto Lock",
    Info = "Toggles Auto Lock",
    CurrentValue = false,
    Flag = "AutoLock",
    Callback = function(Value)
        _G.AutoLock = Value
    end,
})


-- Toggle TeamCheck
local TeamCheckToggle = AimbotTab:CreateToggle({
    Name = "Team Check",
    Info = "Checks if player isn't on your Team",
    CurrentValue = false,
    Flag = "TeamCheck",
    Callback = function(Value)
        _G.Aimbot_TeamCheck = Value
    end,
})


-- Trigger Section
local TriggerSection = AimbotTab:CreateSection("Trigger", false)


-- Trigger Bot
local TriggerBotToggle = AimbotTab:CreateToggle({
    Name = "Trigger Bot",
    Info = "Auto SHOOTS",
    CurrentValue = false,
    Flag = "TriggerBot",
    Callback = function(Value)
        _G.TriggerBot = Value
    end,
})


-- FOV Section
local FOVSection = AimbotTab:CreateSection("FOV", false)


-- Toggle FOV
local FOVToggle = AimbotTab:CreateToggle({
    Name = "FOV",
    Info = "Toggles FOV (Shows FOV or not)",
    CurrentValue = false,
    Flag = "FOV",
    Callback = function(Value)
        _G.Aimbot_Draw_FOV = Value

        fovcircle.Visible = _G.Aimbot_Draw_FOV
    end,
})


-- Toggle Rainbow For FOV
local RainbowFOVToggle = AimbotTab:CreateToggle({
    Name = "FOV Rainbow",
    Info = "Toggles Rainbow Color For FOV Circle",
    CurrentValue = false,
    Flag = "RainbowFOV",
    Callback = function(Value)
        _G.Aimbot_FOV_Rainbow = Value
    end,
})


-- FOV Radius Size Slider
local FOVRadiusSlider = AimbotTab:CreateSlider({
    Name = "FOV Size",
    Info = "Changes the size/radius of the FOV Circle",
    Range = {0, 300},
    Increment = 2,
    Suffix = "Size",
    CurrentValue = 50,
    Flag = "FOVRadius",
    Callback = function(Value)
        _G.Aimbot_FOV_Radius = Value

        fovcircle.Radius = _G.Aimbot_FOV_Radius
    end,
})



-- Visuals Tab
local VisualsTab = Window:CreateTab("Visuals", icons.FeatherIcons.Visuals)


local Label = VisualsTab:CreateLabel("Visuals Coming SOON!")



-- Misc Tab
local MiscTab = Window:CreateTab("Misc", icons.FeatherIcons.Misc)


-- Button HitboxExpander
local HitBoxExpanderButton = MiscTab:CreateButton({
    Name = "Expand Hitboxes",
    Info = "When Clicked, Expands The Hitboxes Of Everyone",
    Interact = 'Changable',
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/AEKnseLN"))()
    end,
})