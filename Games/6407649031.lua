-- anticheat bypass, ty WhoIsE (staff manager at the krnl discord server) for this

if getconnections then
    for _, connection in pairs(getconnections(game:GetService("LogService").MessageOut)) do
        connection:Disable()
    end
    
    for _, connection in pairs(getconnections(game:GetService("ScriptContext").Error)) do
        connection:Disable()
    end
end

-- CREDITS TO ROUGEHUB FOR ALMOST EVERYYHING

--[[
if _G.SnowHubv2_AlreadyLoaded ~= nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.") return else
    _G.SnowHubv2_AlreadyLoaded = 0
end
]]

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

-- Checks if the game = No-Scope Arcade
if game.PlaceId ~= 6407649031 then return end

-- Loadstring for UI Library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- region Performance Functions.
-- Inserts the table "Guns"
if getgc then
    local Guns = {}

    for i,v in ipairs(getgc(true)) do
        -- The reason I only do "RecoilMult" and "Damage" is because its really the only things that need to be identified to tell whether its a Gun Properties table or not.
        if type(v) == "table" and rawget(v, "RecoilMult") and rawget(v, "Damage") then
            table.insert(Guns, v)
        end
    end
    
    -- ModifyGuns Function
    function ModifyGuns(Mod, value)
        for i,v in ipairs(Guns) do
            v[Mod] = value
        end
    end
end


-- Idk anymore
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


-- Locals
local localPlr = game:GetService("Players").LocalPlayer
local camMod = require(game:GetService("ReplicatedStorage").GunSystem.GunClientAssets.Modules.Camera)
local isTyping = false
local isKilling = false


-- typing detector
game:GetService("UserInputService").InputBegan:Connect(function(input, typing)
    isTyping = typing
end)


-- Main Window
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
        Invite = "", -- The Discord invite code, do not include discord.gg/
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


Rayfield:Notify({
    Title = "SnowHubv2",
    Content = "SnowHubv2 has Loaded!",
    Duration = 6.5,
    Image = icons.NotificationIcons.Success,
})


-- Variables
_G.cameraShakeDone = false

-- Infinite Jump Variables
_G.infJump = false

-- Bunny Hop Variables
_G.bunnyHop = false

-- Gun Mods Variables
_G.noSpread = false
_G.noRecoil = false
_G.noFireRate = false
_G.instantReload = false

-- Walk Speed Variables
_G.walkSpeed = false


-- Functions
game:GetService("RunService").RenderStepped:Connect(function()
    -- Infinite Jump Function
    if not isTyping and _G.infJump and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
        localPlr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end

    -- Bunny Hop Function
    if _G.bunnyHop and localPlr.Character:WaitForChild("Humanoid") and localPlr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air and localPlr.Character.Humanoid.MoveDirection ~= Vector3.new(0,0,0) then
        localPlr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(2)
    end
--[[
    if localPlr.Character and #game:GetService("Workspace").CurrentCamera:GetChildren() ~= 0 then
        if not isKilling and localPlr:GetMouse().Target and localPlr:GetMouse().Target.Parent:FindFirstChild("Humanoid") and not localPlr:GetMouse().Target.Parent:FindFirstChild("ForceField") and getGun(localPlr:GetMouse().Target.Parent) ~= nil and localPlr:GetMouse().Target and localPlr:GetMouse().Target.Parent.Parent:FindFirstChild("Humanoid") and not localPlr:GetMouse().Target.Parent.Parent:FindFirstChild("ForceField") and getGun(localPlr:GetMouse().Target.Parent.Parent) ~= nil then
            game:GetService("VirtualUser"):ClickButton1(Vector2.new(-100,-100))
        end
    end ]]
end)


-- Tabs
local HomeTab = Window:CreateTab("Home", icons.FluentIcons.Home) -- Title, Image

local PlayerTab = Window:CreateTab("Player", icons.FluentIcons.Player) -- Title, Image

local WeaponTab = Window:CreateTab("Weapon", icons.FluentIcons.Aimbot) -- Title, Image


-- Sections
local WeaponsSection = WeaponTab:CreateSection("Weapon Modifications")


-- Buttons
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

local TeleportButton = HomeTab:CreateButton({
    Name = "Teleport",
    Callback = function()
        if localPlr.Status.Value == "Alive" and localPlr.Character:FindFirstChild("HumanoidRootPart") then
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= localPlr and v.Status.Value == "Alive" and localPlr.Character:FindFirstChild("HumanoidRootPart") then
                    repeat task.wait(0.4)
                        if v.Character and v.Character:FindFirstChild("Head") then
                            localPlr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,6,0)
                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v.Character.Head.Position)
                            
                            if _G.autoKill == true then
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new(-100,-100))
                            end
                        end
                    until v == nil or localPlr.Status.Value == "Dead" or v.Status.Value == "Dead" or not localPlr.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild("Head") == nil or v.Character == nil
                    
                    task.wait(1.5)
                end
            end
        end
    end
})


-- Label
local Label = PlayerTab:CreateLabel("")


-- Toggles
local AutoKillToggle = HomeTab:CreateToggle({
    Name = "Auto Kill When TP Is Activated",
    CurrentValue = false,
    Flag = "AutoKill", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.autoKill = true
    end,
 })


local InfJump = PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJumpToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.infJump = Value
    end,
})


local BunnyHop = PlayerTab:CreateToggle({
    Name = "Bunny Hop",
    CurrentValue = false,
    Flag = "BunnyHopToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.bunnyHop = Value
    end,
})


local NoSpreadToggle = WeaponTab:CreateToggle({
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

local NoRecoilToggle = WeaponTab:CreateToggle({
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

local NoFireRateToggle = WeaponTab:CreateToggle({
    Name = "No FireRate",
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

local InstantReloadToggle = WeaponTab:CreateToggle({
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


-- Label
local Label1 = PlayerTab:CreateLabel("")


-- Sliders
local WalkSpeedSlider = PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {20, 240},
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


-- KEEEP!!
Rayfield:LoadConfiguration()
