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
