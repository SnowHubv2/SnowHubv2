if _G.SnowHubv2_AlreadyLoaded ~= nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.") return else
    _G.SnowHubv2_AlreadyLoaded = 0
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

if game.PlaceId ~= 8750997647 then return end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Main Window
local Window = Rayfield:CreateWindow({
    Name = "SnowHubv2 | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    LoadingTitle = "SnowHubv2",
    LoadingSubtitle = "by Snomn",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Snow Hubv2", -- Create a custom folder for your hub/game
       FileName = "Configs_TappingLegends"
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

-- Values
_G.autoTap = true

_G.autoRebirth = true
_G.autoRebirthCooldown = 0.5
_G.amountRebirth = 1

_G.autoHatch = true
_G.autoHatchCooldown = 1.0
_G.selectEgg = "Basic Egg"
_G.amountEggs = 1

-- Functions
function AutoTap()
    while _G.autoTap == true do
        game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
        wait(0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001)
    end
end

function AutoRebirth()
    while _G.AutoRebirth == true do
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(_G.amountRebirth)
        wait(_G.autoRebirthCooldown)
    end
end

function AutoHatch()
    while _G.autoHatch == true do
        game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(_G.selectEgg,_G.amountEggs)
        wait(_G.autoHatchCooldown)
    end
end


function EquipBest()
    game:GetService("ReplicatedStorage").Remotes.UnequipAll:InvokeServer()
    game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
end

-- Tabs
local FarmTab = Window:CreateTab("AutoFarm")

local EggsTab = Window:CreateTab("EggsTab")

local MiscTab = Window:CreateTab("Misc")


-- Toggles
local AutoTapToggle = FarmTab:CreateToggle({
    Name = "Auto Tap",
    CurrentValue = false,
    Flag = "AutoTapToggle", 
    Callback = function(Value)
        _G.autoTap = Value
        AutoTap()
    end,
})

local AutoRebirthToggle = FarmTab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Flag = "AutoRebirthToggle", 
    Callback = function(Value)
        _G.AutoRebirth = Value
        AutoRebirth()
    end,
})

local AutoHatchToggle = EggsTab:CreateToggle({
    Name = "Auto Hatch",
    CurrentValue = false,
    Flag = "AutoHatchToggle",
    Callback = function(Value)
        _G.autoHatch = Value
        AutoHatch()
    end,
})


-- Sliders
local AutoRebirthCooldownSlider = FarmTab:CreateSlider({
    Name = "Auto Rebirth Cooldown",
    Range = {0.1, 5},
    Increment = 0.1,
    Suffix = "Seconds",
    CurrentValue = 0.5,
    Flag = "AutoRebirthCooldownSlider",
    Callback = function(Value)
        _G.autoRebirthCooldown = Value
    end,
})

local AutoHatchCooldownSlider = EggsTab:CreateSlider({
    Name = "Auto Hatch Cooldown",
    Range = {0.1, 1},
    Increment = 0.1,
    Suffix = "Seconds",
    CurrentValue = 0.5,
    Flag = "AutoHatchCooldownSlider",
    Callback = function(Value)
        _G.autoHatchCooldown = Value
    end,
})


-- Dropdowns
local AmountRebirthDropdown = FarmTab:CreateDropdown({
    Name = "Ammount of Rebirths",
    Options = {1, 2, 3, 4, 5, 6, 7, 8},
    CurrentOption = 1,
    Flag = "amountEggsDropdown",
    Callback = function(Option)
        _G.amountRebirth = Option
    end,
})

local SelectEggDropdown = EggsTab:CreateDropdown({
    Name = "Select Egg",
    Options = {"Basic Egg","Rare Egg"},
    CurrentOption = "Basic Egg",
    Flag = "SelectEggDropdown",
    Callback = function(Option)
        _G.selectEgg = Option
        print(_G.selectEgg)
    end,
})

local AmountEggsDropdown = EggsTab:CreateDropdown({
    Name = "Amount Of Eggs",
    Options = {1, 3, 4},
    CurrentOption = 1,
    Flag = "amountEggsDropdown",
    Callback = function(Option)
        _G.amountEggs = Option
    end,
})


-- Buttons
local Button = MiscTab:CreateButton({
    Name = "Equip Best Pets",
    Callback = function()
        EquipBest()
    end,
})

-- Space In Misc Tab
local Label = MiscTab:CreateLabel("")


-- Keybinds
local Keybind = MiscTab:CreateKeybind({
    Name = "SelfDestruct",
    CurrentKeybind = "RightControl",
    HoldToInteract = false,
    Flag = "SelfDestruct", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Keybind)
        Rayfield:Destroy()
    end,
})


Rayfield:LoadConfiguration()
