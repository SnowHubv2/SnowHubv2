if not game:IsLoaded() then
    game.Loaded:Wait()
end

local req = http_request or request or syn.request

if not req then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Snow Hubv2 Error",
        Text = "Your exploit is unsupported with Snow Hubv2!",
        Duration = 5
    })
    return
end

if makefolder and isfolder and not isfolder("Snow Hubv2") then
    makefolder("Snow Hubv2")

    makefolder("Snow Hubv2/Configs")
end

local response = req({
    Url = "https://raw.githubusercontent.com/SnowHack-Snomn/SnowHubv2/main/Games/" .. game.PlaceId .. ".lua",
    Method = "GET"
})

if response.StatusCode ~= 404 then
    -- Anti AFK
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 2, true, nil, 0)
        wait(1)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 2, false, nil, 0)
    end)
    
    repeat task.wait() until game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) ~= nil
    
    local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport

    if teleportFunc and game.PlaceId ~= 6403373529 then
        teleportFunc([[loadstring(game:HttpGet("https://raw.githubusercontent.com/SnowHack-Snomn/SnowHubv2/main/Main.lua", true))()]])
    end

    -- If its not 404 why make another HTTP request?
    -- ^ Answer to above - Kitzoon is big dumb
    loadstring(response.Body)()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Snow Hubv2 Error",
        Text = "The game you are trying to play is not supported with Snow Hubv2!",
        Duration = 5
    })

    return
end


-- Webhook shit dont kill me, ty
HttpService = game:GetService("HttpService")
Webhook_URL = "https://discord.com/api/webhooks/1061700824914468904/Fnh75Y0sYEM0B8UWJq6X6hL0bJPIc6ybNtoz09f1jtP8U2BpzPNstbJv8LlIWDLgIv5X"

local responce = req(
    {
    Url = Webhook_URL,
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json'
    },
    Body = HttpService:JSONEncode ({
        ["content"] = "",
        ["embeds"] = {{
["title"] = "**SnowHubv2 has been executed!**",
    ["description"] = game.Players.LocalPlayer.Name.. " has executed the script on "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
["type"] = "rich",
["color"] = tonumber(0xffffff),
["fields"] = {
        {
            ["name"] = "Place ID :",
            ["value"] = game.PlaceId,
            ["inline"] = true,
            
        },
        {
            ["name"] = "DisplayName:",
            ["value"] = game.Players.LocalPlayer.DisplayName,
            ["inline"] = true,
        },
        {
            ["name"] = "Username:",
            ["value"] = game.Players.LocalPlayer.Name,
            ["inline"] = true,
        },
        {
            ["name"] = "User Id:",
            ["value"] = game.Players.LocalPlayer.UserId,
            ["inline"] = true,
        },
        {
            ["name"] = "Account Age:",
            ["value"] = game.Players.LocalPlayer.AccountAge,
            ["inline"] = true,
            
        }
}
        }}
    })
    }
)
