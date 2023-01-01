if getgenv().SnowHubv2_AlreadyLoaded ~= nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.") return else
   getgenv().SnowHubv2_AlreadyLoaded = 0
end

if game.PlaceId ~= 4483381587 then return end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "SnowHubv2 | " .. game.PlaceId.Name,
    LoadingTitle = "SnowHubv2",
    LoadingSubtitle = "by Snomn",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Snow Hubv2", -- Create a custom folder for your hub/game
       FileName = "Configs baseplate"
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

 local Tab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Section Example")

 Window:Prompt({
	Title = 'Interface Prompt',
	SubTitle = 'SubTitle',
	Content = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
	Actions = {
		Accept = {
			Name = 'Accept',
			Callback = function()
				-- You know what a callback is...
			end,
		}
	}
})

local Button = Tab:CreateButton({
    Name = "Button Example",
    Info = "Button info/Description.", -- Speaks for itself, Remove if none.
    Interact = 'Changable',
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Toggle Example",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })

 local Slider = Tab:CreateSlider({
   Name = "Slider Example",
   Info = "Button info/Description.", -- Speaks for itself, Remove if none.
   Range = {0, 100},
   Increment = 10,
   Suffix = "Bananas",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the slider changes
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})

 Rayfield:LoadConfiguration()
