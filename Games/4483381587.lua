if getgenv().SnowHubv2_AlreadyLoaded ~= nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.") return else
   getgenv().SnowHubv2_AlreadyLoaded = 0
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

if game.PlaceId ~= 4483381587 then return end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "SnowHubv2 | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    LoadingTitle = "SnowHubv2",
    LoadingSubtitle = "by Snomn",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Snow Hubv2", -- Create a custom folder for your hub/game
       FileName = "Configs_ALiteralBaseplate"
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
	Title = "Notification Title",
	Content = "Notification Content",
	Duration = 6.5,
	Image = 4483362458,
	Actions = { -- Notification Buttons
		Ignore = {
			Name = "Okay!",
			Callback = function()
				print("The user tapped Okay!")
			end
		},
	},
})

 local Tab = Window:CreateTab("Tab Example", icons.FluentIcons.Home) -- Title, Image

 local Section = Tab:CreateSection("Section Example")


 Rayfield:LoadConfiguration()
