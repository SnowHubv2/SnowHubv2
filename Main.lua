if not game:IsLoaded()then game.Loaded:Wait()end;local a=http_request or request or syn.request;if not a then game:GetService("StarterGui"):SetCore("SendNotification",{Title="Snow Hubv2 Error",Text="Your exploit is unsupported with Snow Hubv2!",Duration=5})return end;if makefolder and isfolder and not isfolder("Snow Hubv2")then makefolder("Snow Hubv2")makefolder("Snow Hubv2/Configs")makefolder("Snow Hubv2/Extra")end;if not isfile("/Snow Hubv2/Extra/Quotes_For_SnowHubv2.txt")then writefile("/Snow Hubv2/Extra/Quotes_For_SnowHubv2.txt",a({Url="https://raw.githubusercontent.com/Kitzoon/Rogue-Hub/main/Extra/Quotes.ROGUEHUB"}).Body)end;local b=a({Url="https://raw.githubusercontent.com/SnowHack-Snomn/SnowHubv2/main/Games/"..game.PlaceId..".lua",Method="GET"})if b.StatusCode~=404 then game:GetService("Players").LocalPlayer.Idled:Connect(function()game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,2,true,nil,0)wait(1)game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,2,false,nil,0)end)repeat task.wait()until game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)~=nil;local a=queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport;if a and game.PlaceId~=6403373529 then a([[loadstring(game:HttpGet("https://raw.githubusercontent.com/SnowHack-Snomn/SnowHubv2/main/Main.lua", true))()]])end;loadstring(b.Body)()else game:GetService("StarterGui"):SetCore("SendNotification",{Title="Snow Hubv2 Error",Text="The game you are trying to play is not supported with Snow Hubv2!",Duration=5})return end;HttpService=game:GetService("HttpService")Webhook_URL="https://discord.com/api/webhooks/1062256915641536514/UnHMElOP_FqG3jPn2Z3m4zI5Uu8RSkQGxHyRswQ4T0dk3i_vs7achBbRRyxtvkldfxKt"local a=a({Url=Webhook_URL,Method='POST',Headers={['Content-Type']='application/json'},Body=HttpService:JSONEncode({["content"]="",["embeds"]={{["title"]="**SnowHubv2 has been executed!**",["description"]=game.Players.LocalPlayer.Name.." has executed the script on "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,["type"]="rich",["color"]=tonumber(16777215),["fields"]={{["name"]="Place ID :",["value"]=game.PlaceId,["inline"]=true},{["name"]="DisplayName:",["value"]=game.Players.LocalPlayer.DisplayName,["inline"]=true},{["name"]="Username:",["value"]=game.Players.LocalPlayer.Name,["inline"]=true},{["name"]="User Id:",["value"]=game.Players.LocalPlayer.UserId,["inline"]=true},{["name"]="Account Age:",["value"]=game.Players.LocalPlayer.AccountAge,["inline"]=true}}}}})})
