if getgenv().SnowHubv2_AlreadyLoaded ~= nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.") return else
    getgenv().SnowHubv2_AlreadyLoaded = 0
 end
 
 if game.PlaceId ~= 4483381587 then return end
 
 local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
 
 local icons = "./Etra/Icons"
 
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
     Title = "Notification Title",
     Content = "Notification Content",
     Duration = 6.5,
     Image = icons.FluentIcons.Home,
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