if _G.SnowHubv2_AlreadyLoaded ~= nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.") return else
    _G.SnowHubv2_AlreadyLoaded = 0
end

-- anticheat bypass, ty WhoIsE (staff manager at the krnl discord server) for this

if getconnections then
    for _, connection in pairs(getconnections(game:GetService("LogService").MessageOut)) do
        connection:Disable()
        print("Connection Disabled!")
    end
    
    for _, connection in pairs(getconnections(game:GetService("ScriptContext").Error)) do
        connection:Disable()
        print("Connecting2 Disabled!")
    end
end


if game.PlaceId ~= 6407649031 then return end


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


-- Looks for "RecoilMult" and "Damage" to find gun properties
if getgc then
    local Guns = {}

    for i,v in ipairs(getgc(true)) do
        -- You dont need anything else to identifie a gun propertie!
        if type(v) == "table" and rawget(v, "RecoilMult") and rawget(v, "Damage") then
            table.insert(Guns, v)
        end
    end    

    function ModifyGuns(Mod, value)
        for i,v in ipairs(Guns) do
            v[Mod] = value
        end
    end
end


-- find cambob function (camera shake, move and shit when its not disabled)
local cambobFunc

if getgc and hookfunction then
    for _, v in ipairs(getgc()) do
        local exploitFunction = isexecutorclosure or is_synapse_function or is_exploit_function	

        if type(v) == "function" and not exploitFunction(v) and getinfo(v).name == "cambob" then
            cambobFunc = v
        end
    end
end

-- Gets The Gun Model Of A Player. Player must be the character not the Player object
local function getGun(player)
    if #game:GetService("Workspace").CurrentCamera:GetChildren() == 0 then return nil end

    for _, v in ipairs(player:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Fire") then
            return v
        end
    end
end

local localPlr = game:GetService("Players").LocalPlayer
local camMod = require(game:GetService("ReplicatedStorage").GunSystem.GunClientAssets.Modules.Camera)
local mouseDown = false
local isKilling = false
local isTyping = false

-- Typing detector
game:GetService("UserInputService").InputBegan:Connect(function(input, typing)
    isTyping = typing
end)


-- loadstring for UI library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


-- Window
local Window = Rayfield:CreateWindow({
    Name = "SnowHubv2 | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    LoadingTitle = "SnowHubv2",
    LoadingSubtitle = "by Snomn",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Snow Hubv2", -- Create a custom folder for your hub/game
       FileName = "Configs_NoScopeArcade"
    },
    Discord = {
       Enabled = false,
       Invite = "sirius", -- The Discord invite code, do not include discord.gg/
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
        Title = "Snow Hubv2",
        Subtitle = "Key System",
        Note = "snowhub.key is the key",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = "snowhub.key"
    }
})


-- MouseDown Check
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 and mouseDown == false then
        mouseDown = true
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 and mouseDown then
        mouseDown = false
    end
end)



-- Player Tab Variables

-- Infinite Jump
_G.infJump = false

-- Bunny Hop
_G.bunnyHop = false


-- Player Tab
local PlayerTab = Window:CreateTab("Player", icons.FeatherIcons.Player) -- Title, Image


-- Camera Modifications Section
local CameraModsSection = PlayerTab:CreateSection("Camera Modifications")

-- 120 FOV Button
local FOVButton = PlayerTab:CreateButton({
    Name = "120 FOV",
    Callback = function()
        if not _G.fovDone then
            camMod:ModifyFOV(120,120,120)
            _G.fovDone = true

            Rayfield:Notify({
                Title = "SnowHubv2 Success!",
                Content = "120 FOV has been Applied!",
                Duration = 4,
                Image = icons.NotificationIcons.Success,
            })
        else
            Rayfield:Notify({
                Title = "SnowHubv2 Error!",
                Content = "120 FOV is already Applied! (No you cant unapply it)",
                Duration = 4,
                Image = icons.NotificationIcons.Error,
            })
        end
    end,
})

-- No Camera Shake Button
local NoCameraShakeButton = PlayerTab:CreateButton({
    Name = "No Camera Shake",
    Callback = function()
        if getgc and hookfunction then
            if not _G.cameraShakeDone then
                hookfunction(cambobFunc, function() return end)
                _G.cameraShakeDone = true

                Rayfield:Notify({
                    Title = "SnowHubv2 Success!",
                    Content = "No Camera Shake Has Been Applied!",
                    Duration = 4,
                    Image = icons.NotificationIcons.Success,
                })
            else
                Rayfield:Notify({
                    Title = "SnowHubv2 Error!",
                    Content = "No Camera Shake is already Applied! (No you cant unapply it)",
                    Duration = 4,
                    Image = icons.NotificationIcons.Error,
                })
            end
        end
    end
})


-- Player Section
local PlayerSection = PlayerTab:CreateSection("Player")

-- Infinite Jump (Fly kinda)
local InfJump = PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJumpToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.infJump = Value
    end,
})

local BunnyHopToggle = PlayerTab:CreateToggle({
    Name = "Bunny Hop",
    CurrentValue = false,
    Flag = "BunnyHop", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.bunnyHop = Value
    end,
})


-- Speed Section
local SpeedSection = PlayerTab:CreateSection("Speed")

-- Walk Speed Slider
local WalkSpeedSlider = PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {20, 120},
    Increment = 2,
    Suffix = "Speed",
    CurrentValue = 20,
    Flag = "WalkSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if game:IsLoaded() == true then
            ModifyGuns("WalkSpeed", Value)
        end
    end,
})



-- Weapon Mods

-- Weapon Mods Variables
_G.noSpread = false
_G.noRecoil = false
_G.noFireRate = false
_G.instantReload = false
_G.instantEquip = false
_G.infiniteClipSize = false


-- Weapon Mods tab
local WeaponModsTab = Window:CreateTab("Weapon Mods", icons.FeatherIcons.Visuals) -- Title, Image

-- Mods Section
local ModsSection = WeaponModsTab:CreateSection("Mods")


-- Mods:


-- No Spread Toggle
local NoSpreadToggle = WeaponModsTab:CreateToggle({
    Name = "No Spread",
    CurrentValue = false,
    Flag = "NoSpread", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if not game:IsLoaded() == true then return end
        _G.noSpread = Value

        if _G.noSpread == true then
            ModifyGuns("Spread", 0)
        else
            ModifyGuns("Spread", 5)
        end
    end,
})


-- No Recoil Toggle
local NoRecoilToggle = WeaponModsTab:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Flag = "NoRecoil", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if not game:IsLoaded() == true then return end
        _G.noRecoil = Value

        if _G.noRecoil == true then
            ModifyGuns("RecoilMult", 0)
        else
            ModifyGuns("RecoilMult", 4)
        end
    end,
})


-- No Fire-Rate Toggle
local NoFireRateToggle = WeaponModsTab:CreateToggle({
    Name = "No Fire-Rate",
    CurrentValue = false,
    Flag = "NoFireRate", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if not game:IsLoaded() == true then return end
        _G.noFireRate = Value

        if _G.noFireRate == true then
            ModifyGuns("FireRate", 0)
        else
            ModifyGuns("FireRate", 0.25)
        end
    end,
})


-- Instant Reload Toggle
local InstantReloadToggle = WeaponModsTab:CreateToggle({
    Name = "Instant Reload",
    CurrentValue = false,
    Flag = "InstantReload", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if not game:IsLoaded() == true then return end
        _G.instantReload = Value

        if _G.instantReload == true then
            ModifyGuns("ReloadTime", 0)
        else
            ModifyGuns("ReloadTime", 0.28)
        end
    end,
})


-- Instant Equip Toggle
local InstantEquipToggle = WeaponModsTab:CreateToggle({
    Name = "Instant Equip",
    CurrentValue = false,
    Flag = "InstantEquip", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if not game:IsLoaded() == true then return end
        _G.equipInstantly = Value

        if _G.instantEquip == true then
            ModifyGuns("EquipTime", 0)
        else
            ModifyGuns("EquipTime", 0.4)
        end
    end,
})


-- Infinite Clip Size Toggle
local InfiniteClipSizeToggle = WeaponModsTab:CreateToggle({
    Name = "Infinite Clip Size",
    CurrentValue = false,
    Flag = "InfiniteClipSize", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if not game:IsLoaded() == true then return end
        _G.infiniteClipSize = Value

        if _G.infiniteClipSize == true then
            ModifyGuns("ClipSize", math.huge)
        else
            ModifyGuns("ClipSize", 7)
        end
    end,
})



-- Aimbot

-- Aimbot Variables
_G.aimBotTog = false
_G.aimbotPart = "Head"
_G.autoLock = false

-- FOV Variables
_G.fovShow = false
_G.fovRadius = 150
_G.fovColor = Color3.fromRGB(255,255,255)
_G.rainbowFOV = false


-- Aimbot Tab
local AimbotTab = Window:CreateTab("Aimbot", icons.FeatherIcons.Aimbot) -- Title, Image


-- Aiming Section
local AimingSection = AimbotTab:CreateSection("Aiming")


-- Aimbot Toggle
local AimbotToggle = AimbotTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Aimbot", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.aimBotTog = Value
    end,
})


-- What Part Aimbot Aims At
-- Aimbot Part Dropdown
local AimbotPartdropdown = AimbotTab:CreateDropdown({
    Name = "Part To Aim At",
    Options = {"Head","Chest"},
    CurrentOption = "Head",
    Flag = "AimbotPart", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
        if Option == "Chest" then
            _G.aimbotPart = "HumanoidRootPart"
        else
            _G.aimbotPart = Option
        end
    end,
})


-- Auto Lock On Player Toggle
local AutoLockoggle = AimbotTab:CreateToggle({
    Name = "AutoLock",
    CurrentValue = false,
    Flag = "AutoLock", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.autoLock = Value
    end,
})


-- FOV Section
local FOVSection = AimbotTab:CreateSection("FOV Circle")


-- Drawing Circle (FOV)
FOVCircle = Drawing.new("Circle")

-- Circle Properties
FOVCircle.Visible = false
FOVCircle.Radius = _G.fovRadius or 300
FOVCircle.Color = Color3.fromRGB(_G.fovColor or 255, 255, 255)
FOVCircle.Thickness = 2
FOVCircle.Filled = false
FOVCircle.Transparency = 1


-- FOV Show Toggle
local FOVToggle = AimbotTab:CreateToggle({
    Name = "FOV",
    CurrentValue = false,
    Flag = "FOV",
    Callback = function(Value)
        _G.fovShow = Value

        FOVCircle.Visible = _G.fovShow
    end,
})


-- FOV Radius Slider
local FOVRadiusSlider = AimbotTab:CreateSlider({
    Name = "FOV Radius",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Radius",
    CurrentValue = 150,
    Flag = "FOVRadius",
    Callback = function(Value)
        _G.fovRadius = Value

        FOVCircle.Radius = _G.fovRadius
    end,
})


-- FOV Color Picker
local FOVColorPicker = AimbotTab:CreateColorPicker({
    Name = "FOV Color Picker",
    Color = Color3.fromRGB(255,255,255),
    Flag = "FOVColor",
    Callback = function(Value)
        _G.fovColor = Value

        FOVCircle.Color = _G.fovColor
    end
})


-- FOV Rainbow Color Toggle
local RainbowFOVToggle = AimbotTab:CreateToggle({
    Name = "Rainbow FOV",
    CurrentValue = false,
    Flag = "RainBowFOV",
    Callback = function(Value)
        _G.rainbowFOV = Value
    end,
})

-- Trigger Section HEHEHHE
local TriggerSection = AimbotTab:CreateSection("Trigger Help ;)")

-- Toggle for triggerbot
local TriggerBotToggle = AimbotTab:CreateToggle({
    Name = "Trigger Bot",
    CurrentValue = false,
    Flag = "triggerBot", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.triggerBot = Value
    end,
})


-- Misc Tab Variables

-- Teleport Delay
_G.tpDelay = 1

-- Waiting Time
_G.waitTime = 0.4

-- Auto Kill
_G.autoKill = false


-- Misc Tab
local MiscTab = Window:CreateTab("Misc", icons.FeatherIcons.Misc) -- Title, Image


-- Teleport Button. Teleports you to a player and if Auto Kill is toggled, shoots and kills for you.
local TeleportButton = MiscTab:CreateButton({
    Name = "Teleport",
    Callback = function()
        if localPlr.Status.Value == "Alive" and localPlr.Character:FindFirstChild("HumanoidRootPart") then
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= localPlr and v.Status.Value == "Alive" and localPlr.Character:FindFirstChild("HumanoidRootPart") then
                    repeat task.wait(_G.tpDelay)
                        if v.Character and v.Character:FindFirstChild("Head") then
                            localPlr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,6,0)
                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v.Character.Head.Position)
                            
                            -- Kill if autoKill is set to true
                            if _G.autoKill == true then
                                isKilling = true
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new(-100,-100))
                            end
                        end
                    until v == nil or localPlr.Status.Value == "Dead" or v.Status.Value == "Dead" or not localPlr.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild("Head") == nil or v.Character == nil
                    isKilling = false

                    task.wait(_G.waitTime)
                end
            end
        end
    end
})


-- Teleport Delay Slider
local TeleportDelaySlider = MiscTab:CreateSlider({
    Name = "Teleport 'n kill Delay",
    Range = {0.2, 0.5},
    Increment = 0.1,
    Suffix = "Seconds",
    CurrentValue = 0.4,
    Flag = "TPDelay", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.tpDelay = Value
    end,
})


-- Waiting Time Slider
local WaitingTimeSlider = MiscTab:CreateSlider({
    Name = "Waiting Time Between Kills",
    Range = {0.5, 1.5},
    Increment = 0.1,
    Suffix = "Seconds",
    CurrentValue = 0.4,
    Flag = "WaitingTime", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.waitTime = Value
    end,
})


-- Auto Kill Toggle
local AutoKillToggle = MiscTab:CreateToggle({
    Name = "Auto Kill When TP Is Activated",
    CurrentValue = false,
    Flag = "AutoKill", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.autoKill = Value
    end,
})


-- RunService Function
-- BIG FUNCTION
game:GetService("RunService").RenderStepped:Connect(function()

    -- FOV Sets Position To Cursor/Middle of the screen/Crosshair
    FOVCircle.Position = Vector2.new(localPlr:GetMouse().X, localPlr:GetMouse().Y + 36)


    -- FOV Rainbow Function
    if _G.rainbowFOV then
        local hue = tick() % 10 / 10
        local rainbow = Color3.fromHSV(hue, 1, 1)

        FOVCircle.Color = rainbow
        FOVColorPicker:Set(rainbow)    
    end


    -- Infinite Jump Function
    if not isTyping and _G.infJump and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
        localPlr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end


    -- Bunny Hop Function
    if _G.bunnyHop and localPlr.Character:WaitForChild("Humanoid") and localPlr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air and localPlr.Character.Humanoid.MoveDirection ~= Vector3.new(0,0,0) then
        localPlr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(2)
    end


    -- TriggerBot Function
    if localPlr.Character and game:GetService("Workspace").CurrentCamera:GetChildren() ~= 0 then
        if _G.triggerBot == true and not isKilling and localPlr:GetMouse().Target and localPlr:GetMouse().Target.Parent:FindFirstChild("Humanoid") and not
localPlr:GetMouse().Target.Parent:FindFirstChild("ForceField") and getGun(localPlr:GetMouse().Target.Parent) ~= nil or _G.triggerBot and
localPlr:GetMouse().Target and localPlr:GetMouse().Target.Parent.Parent:FindFirstChild("Humanoid") and not
localPlr:GetMouse().Target.Parent.Parent:FindFirstChild("ForceField") and getGun(localPlr:GetMouse().Target.Parent.Parent) ~= nil then
            game:GetService("VirtualUser"):ClickButton1(Vector2.new(-100,-100))
        end
    end


    -- Aimbot Function!
    if _G.aimBotTog == true and not isKilling and mouseDown or _G.aimBotTog == true and _G.autoLock == true then
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= localPlr and player.Character and player.Status.Value ~= "Dead" and not player.Character:FindFirstChild("ForceField") and player.Character:FindFirstChild(_G.aimbotPart) then
                local partPos, onScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(player.Character[_G.aimbotPart].Position)
                local obsParts = game:GetService("Workspace").CurrentCamera:GetPartsObscuringTarget({player.Character[_G.aimbotPart].Position}, {game:GetService("Workspace").CurrentCamera, localPlr.Character, player.Character})

                -- Looks at player's (aimbotPart)
                if onScreen and #obsParts == 0 then
                    local distance = math.huge
                    local mag = (Vector2.new(localPlr:GetMouse().X, localPlr:GetMouse().Y) - Vector2.new(partPos.X, partPos.Y)).magnitude
                    
                    if mag < distance and mag < _G.fovRadius then
                        distance = mag
                        closestPlayer = player.Character
                        game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.Position, closestPlayer[_G.aimbotPart].Position)
                    end
                end
            end
        end
    end
end)


-- KEEEP!!
Rayfield:LoadConfiguration()
