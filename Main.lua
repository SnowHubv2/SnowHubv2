if not game:IsLoaded() then
    game.Loaded:Wait()
end

local req = http_request or request or syn.request

if not req then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "SnowHubv2 Error",
        Text = "Your exploit does not support SnowHubv2",
        Duration = 5
    })
    return
end

local response = req({
    Url = "https://raw.githubusercontent.com/Kitzoon/Rogue-Hub/main/Games/" .. game.PlaceId .. ".lua",
    Method = "GET"
})
