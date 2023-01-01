if game.PlaceId ~= 4483381587 then return end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "sirius", -- The Discord invite code, do not include discord.gg/
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "Hello"
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

 Rayfield:LoadConfiguration()