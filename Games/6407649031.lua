if _G.SnowHubv2_AlreadyLoaded~=nil then error("SnowHubv2 is already running, dumbass! or maybe you just have other scripts executed.")return else _G.SnowHubv2_AlreadyLoaded=0 end;if getconnections then for a,a in pairs(getconnections(game:GetService("LogService").MessageOut))do a:Disable()print("Connection LogService Disabled!")end;for a,a in pairs(getconnections(game:GetService("ScriptContext").Error))do a:Disable()print("Connection ScriptContext Disabled!")end end;if game.PlaceId~=6407649031 then return end;local a={FluentIcons={Home=9792462652,Aimbot=9766671041,Visuals=9766673555,Player=9766672602,Misc=9766671943,Settings=9766674082,Credits=9766675093,Exit=9766676906},FeatherIcons={Home=9792650361,Aimbot=9792632523,Visuals=9792631281,Player=9792631906,Misc=9792634811,Settings=9792633222,Credits=9792634075,Exit=9792635572},NotificationIcons={Success=9838874163,Warning=9838873385,Error=9838876113,Informational=9838877673,Custom=9838878267}}local function b()local a=game:GetService("HttpService"):JSONDecode(readfile("/Snow Hubv2/Extra/Quotes_For_SnowHubv2.txt"))return a[math.random(#a)]end;if getgc then local a={}for b,b in ipairs(getgc(true))do if type(b)=="table"and rawget(b,"RecoilMult")and rawget(b,"Damage")then table.insert(a,b)end end;function ModifyGuns(b,c)for a,a in ipairs(a)do a[b]=c end end end;local c;if getgc and hookfunction then for a,a in ipairs(getgc())do local b=isexecutorclosure or is_synapse_function or is_exploit_function;if type(a)=="function"and not b(a)and getinfo(a).name=="cambob"then c=a end end end;local function d(a)if#game:GetService("Workspace").CurrentCamera:GetChildren()==0 then return nil end;for a,a in ipairs(a:GetChildren())do if a:IsA("Model")and a:FindFirstChild("Fire")then return a end end end;local e=game:GetService("Workspace")local f=game:GetService("Players")local f=game:GetService("Players").LocalPlayer;local g=require(game:GetService("ReplicatedStorage").GunSystem.GunClientAssets.Modules.Camera)local h="v1.1"local i=false;local j=false;local k=false;local l;local m=false;game:GetService("UserInputService").InputBegan:Connect(function(a,a)k=a end)local n=loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()local h=n:CreateWindow({Name="SnowHubv2 | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." "..h,LoadingTitle="SnowHubv2",LoadingSubtitle="by Snomn",ConfigurationSaving={Enabled=true,FolderName="Snow Hubv2",FileName="NoScopeArcade_Config"},Discord={Enabled=false,Invite="sirius",RememberJoins=true},KeySystem=false,KeySettings={Title="Snow Hubv2",Subtitle="Key System",Note="Key System is under development. Currently the key is 'snowhub.key', in ONE word",FileName="Key",SaveKey=true,GrabKeyFromSite=false,Key="snowhub.key"}})n:Notify({Title="SnowHubv2",Content="SnowHubv2 Has Launched!",Duration=5,Image=a.NotificationIcons.Success})game:GetService("UserInputService").InputBegan:Connect(function(a)if a.UserInputType==Enum.UserInputType.MouseButton2 and i==false then i=true end end)game:GetService("UserInputService").InputEnded:Connect(function(a)if a.UserInputType==Enum.UserInputType.MouseButton2 and i then i=false end end)_G.infJump=false;_G.bunnyHop=false;local o=h:CreateTab("Player",a.FeatherIcons.Player)local p=o:CreateSection("Camera Modifications")local g=o:CreateButton({Name="120 FOV",Callback=function()if not _G.fovDone then g:ModifyFOV(120,120,120)_G.fovDone=true;n:Notify({Title="SnowHubv2 Success!",Content="120 FOV has been Applied!",Duration=4,Image=a.NotificationIcons.Success})else n:Notify({Title="SnowHubv2 Error!",Content="120 FOV is already Applied! (No you cant unapply it)",Duration=4,Image=a.NotificationIcons.Error})end end})local c=o:CreateButton({Name="No Camera Shake",Callback=function()if getgc and hookfunction then if not _G.cameraShakeDone then hookfunction(c,function()return end)_G.cameraShakeDone=true;n:Notify({Title="SnowHubv2 Success!",Content="No Camera Shake Has Been Applied!",Duration=4,Image=a.NotificationIcons.Success})else n:Notify({Title="SnowHubv2 Error!",Content="No Camera Shake is already Applied! (No you cant unapply it)",Duration=4,Image=a.NotificationIcons.Error})end end end})local c=o:CreateSection("Player")local c=o:CreateToggle({Name="Infinite Jump",CurrentValue=false,Flag="InfJumpToggle",Callback=function(a)_G.infJump=a end})local c=o:CreateToggle({Name="Bunny Hop",CurrentValue=false,Flag="BunnyHop",Callback=function(a)_G.bunnyHop=a end})local c=o:CreateSection("Speed")local c=o:CreateSlider({Name="Walk Speed",Range={20,120},Increment=2,Suffix="Speed",CurrentValue=20,Flag="WalkSpeed",Callback=function(a)if game:IsLoaded()==true then ModifyGuns("WalkSpeed",a)end end})_G.aimBotTog=false;_G.aimbotPart="Head"_G.autoLock=false;_G.fovShow=false;_G.fovRadius=150;_G.fovColor=Color3.fromRGB(255,255,255)_G.rainbowFOV=false;local c=h:CreateTab("Aimbot",a.FeatherIcons.Aimbot)local g=c:CreateSection("Aiming")local g=c:CreateToggle({Name="Aimbot",CurrentValue=false,Flag="Aimbot",Callback=function(a)_G.aimBotTog=a end})local g=c:CreateDropdown({Name="Part To Aim At",Options={"Head","Chest"},CurrentOption="Head",Flag="AimbotPart",Callback=function(a)if a=="Chest"then _G.aimbotPart="HumanoidRootPart"else _G.aimbotPart=a end end})local g=c:CreateToggle({Name="AutoLock",CurrentValue=false,Flag="AutoLock",Callback=function(a)_G.autoLock=a end})local g=c:CreateSection("FOV Circle")FOVCircle=Drawing.new("Circle")FOVCircle.Visible=false;FOVCircle.Radius=_G.fovRadius or 300;FOVCircle.Color=Color3.fromRGB(_G.fovColor or 255,255,255)FOVCircle.Thickness=2;FOVCircle.Filled=false;FOVCircle.Transparency=1;local g=c:CreateToggle({Name="FOV",CurrentValue=false,Flag="FOV",Callback=function(a)_G.fovShow=a;FOVCircle.Visible=_G.fovShow end})local g=c:CreateSlider({Name="FOV Radius",Range={0,300},Increment=1,Suffix="Radius",CurrentValue=150,Flag="FOVRadius",Callback=function(a)_G.fovRadius=a;FOVCircle.Radius=_G.fovRadius end})local g=c:CreateColorPicker({Name="FOV Color Picker",Color=Color3.fromRGB(255,255,255),Flag="FOVColor",Callback=function(a)_G.fovColor=a;FOVCircle.Color=_G.fovColor end})local o=c:CreateToggle({Name="Rainbow FOV",CurrentValue=false,Flag="RainBowFOV",Callback=function(a)_G.rainbowFOV=a end})local o=c:CreateSection("Trigger Help ;)")local c=c:CreateToggle({Name="Trigger Bot",CurrentValue=false,Flag="triggerBot",Callback=function(a)_G.triggerBot=a end})_G.playerESP=false;_G.distanceESP=false;_G.espTextSize=15;_G.espColor=Color3.fromRGB(255,255,255)_G.espRainbow=false;local function c(a,b,c)local d=Drawing.new("Text")d.Visible=false;d.Center=true;d.Outline=true;d.Font=3;d.Color=c;if _G.playerESP==false and d and connection then d.Visible=false;d:Remove()connection:Disconnect()end;local c;c=game:GetService("RunService").RenderStepped:Connect(function()if a.Parent~=nil and _G.playerESP and not a.Parent:FindFirstChild("Highlight")then local c,e=game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(a.Position)local f=(a.Position-game:GetService("Workspace").CurrentCamera.CFrame.Position).magnitude;if e and _G.playerESP and f<1000 and d and#game:GetService("Workspace").CurrentCamera:GetChildren()~=0 and not a.Parent:FindFirstChild("ForceField")then d.Position=Vector2.new(c.X,c.Y+math.clamp(f/10,10,30)-10)if _G.distanceESP then d.Text=b.." | "..tostring(math.floor(f)).." meters"else d.Text=b end;if _G.espRainbow then d.Color=l end;d.Visible=true;d.Size=_G.espTextSize else if d then d.Visible=false end end else d.Visible=false;d:Remove()c:Disconnect()end end)end;local o=h:CreateTab("Visuals",a.FeatherIcons.Visuals)local p=o:CreateToggle({Name="Player ESP",CurrentValue=false,Flag="PlayerESP",Callback=function(a)_G.playerESP=a;if _G.playerESP==true and game:IsLoaded()==true then for a,a in ipairs(game:GetService("Players"):GetPlayers())do if a~=f and a.Character and _G.playerESP==true then c(a.Character:WaitForChild("Head"),a.Name,Color3.fromRGB(255,255,255))a.CharacterAdded:Connect(function(b)c(b:WaitForChild("Head"),a.Name,Color3.fromRGB(255,255,255))end)end end end end})game:GetService("Players").PlayerAdded:Connect(function(a)if a~=f and a.Character and _G.playerESP==true then c(a.Character:WaitForChild("Head"),a.Name,Color3.fromRGB(255,255,255))elseif a~=f and _G.playerESP==true then a.CharacterAdded:Connect(function(b)c(a.Character:WaitForChild("Head"),a.Name,Color3.fromRGB(255,255,255))end)end end)local c=o:CreateToggle({Name="Rainbow ESP",CurrentValue=false,Flag="RainbowESP",Callback=function(a)_G.espRainbow=a;print(a)end})local c=o:CreateToggle({Name="Distance ESP",CurrentValue=false,Flag="DistanceESP",Callback=function(a)_G.distanceESP=a end})local c=o:CreateColorPicker({Name="ESP Color",Color=Color3.fromRGB(1,0,0),Flag="ESPColor",Callback=function(a)_G.espColor=a;l=_G.espColor end})local o=o:CreateSlider({Name="ESP Font Size",Range={10,100},Increment=1,Suffix="Size",CurrentValue=15,Flag="FontSize",Callback=function(a)_G.espTextSize=a end})_G.noSpread=false;_G.noRecoil=false;_G.noFireRate=false;_G.instantReload=false;_G.instantEquip=false;_G.infiniteClipSize=false;local o=h:CreateTab("Weapon Mods",a.FeatherIcons.Settings)local p=o:CreateSection("Mods")local p=o:CreateToggle({Name="No Spread",CurrentValue=false,Flag="NoSpread",Callback=function(a)if not game:IsLoaded()==true then return end;_G.noSpread=a;if _G.noSpread==true then ModifyGuns("Spread",0)else ModifyGuns("Spread",5)end end})local p=o:CreateToggle({Name="No Recoil",CurrentValue=false,Flag="NoRecoil",Callback=function(a)if not game:IsLoaded()==true then return end;_G.noRecoil=a;if _G.noRecoil==true then ModifyGuns("RecoilMult",0)else ModifyGuns("RecoilMult",4)end end})local p=o:CreateToggle({Name="No Fire-Rate",CurrentValue=false,Flag="NoFireRate",Callback=function(a)if not game:IsLoaded()==true then return end;_G.noFireRate=a;if _G.noFireRate==true then ModifyGuns("FireRate",0)else ModifyGuns("FireRate",0.25)end end})local p=o:CreateToggle({Name="Instant Reload",CurrentValue=false,Flag="InstantReload",Callback=function(a)if not game:IsLoaded()==true then return end;_G.instantReload=a;if _G.instantReload==true then ModifyGuns("ReloadTime",0)else ModifyGuns("ReloadTime",0.28)end end})local p=o:CreateToggle({Name="Instant Equip",CurrentValue=false,Flag="InstantEquip",Callback=function(a)if not game:IsLoaded()==true then return end;_G.equipInstantly=a;if _G.instantEquip==true then ModifyGuns("EquipTime",0)else ModifyGuns("EquipTime",0.4)end end})local o=o:CreateToggle({Name="Infinite Clip Size",CurrentValue=false,Flag="InfiniteClipSize",Callback=function(a)if not game:IsLoaded()==true then return end;_G.infiniteClipSize=a;if _G.infiniteClipSize==true then ModifyGuns("ClipSize",math.huge)else ModifyGuns("ClipSize",7)end end})_G.specificTPLoc=CFrame.new(0,0,0)_G.VerticalTPLoc=CFrame.new(0,0,0)local o=h:CreateTab("Teleport",a.FluentIcons.Misc)local p=o:CreateSection("Specific TP")local p=o:CreateButton({Name="Teleport",Callback=function()f.Character.HumanoidRootPart.CFrame=_G.specificTPLoc end})local p=o:CreateDropdown({Name="Specific TP Locations",Options={"Center Roof","Spawn"},CurrentOption="Center Roof",Flag="Specific_Teleport_Dropdown",Callback=function(a)if a=="Center Roof"then _G.specificTPLoc=CFrame.new(0,110,0)elseif a=="Spawn"then _G.specificTPLoc=CFrame.new(114,18,137)end end})local p=o:CreateSection("Up Or Down? Teleport")local p=o:CreateButton({Name="Teleport",Callback=function()f.Character.HumanoidRootPart.CFrame=f.Character.HumanoidRootPart.CFrame*_G.VerticalTPLoc end})local o=o:CreateDropdown({Name="Up Or Down?",Options={"Up","Down"},CurrentOption="Up",Flag="Up_Or_Down_Teleport_DropDown",Callback=function(a)if a=="Up"then _G.VerticalTPLoc=CFrame.new(0,60,0)elseif a=="Down"then _G.VerticalTPLoc=CFrame.new(0,-10,0)end end})_G.autoToxic=false;_G.tpDelay=1;_G.waitTime=0.4;_G.autoKill=false;_G.NoClip=false;local a=h:CreateTab("Misc",a.FeatherIcons.Misc)local h=a:CreateSection("Promote My Script Please :) (joke)")local b=a:CreateToggle({Name="Auto Toxic",CurrentValue=false,Flag="AutoToxic",Callback=function(a)_G.autoToxic=a;if _G.autoToxic==true then f.leaderstats.Kills:GetPropertyChangedSignal("Value"):Connect(function()if not _G.autoToxic==true then return end;game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(b(),"All")end)end end})local b=a:CreateSection("Teleport!!1!!1!!!")local b=a:CreateButton({Name="Teleport",Callback=function()if f.Status.Value=="Alive"and f.Character:FindFirstChild("HumanoidRootPart")then for a,a in pairs(game:GetService("Players"):GetPlayers())do if a~=f and a.Status.Value=="Alive"and f.Character:FindFirstChild("HumanoidRootPart")then repeat task.wait(_G.tpDelay)if a.Character and a.Character:FindFirstChild("Head")then f.Character.HumanoidRootPart.CFrame=a.Character.HumanoidRootPart.CFrame*CFrame.new(0,6,0)workspace.CurrentCamera.CFrame=CFrame.new(workspace.CurrentCamera.CFrame.Position,a.Character.Head.Position)if _G.autoKill==true then j=true;game:GetService("VirtualUser"):ClickButton1(Vector2.new(-100,-100))end end until a==nil or f.Status.Value=="Dead"or a.Status.Value=="Dead"or not f.Character:FindFirstChild("HumanoidRootPart")or a.Character:FindFirstChild("Head")==nil or a.Character==nil;j=false;task.wait(_G.waitTime)end end end end})local b=a:CreateSlider({Name="Teleport 'n kill Delay",Range={0.2,0.5},Increment=0.1,Suffix="Seconds",CurrentValue=0.4,Flag="TPDelay",Callback=function(a)_G.tpDelay=a end})local b=a:CreateSlider({Name="Waiting Time Between Kills",Range={0.5,1.5},Increment=0.1,Suffix="Seconds",CurrentValue=1,Flag="TPWaitingTime",Callback=function(a)_G.waitTime=a end})local b=a:CreateToggle({Name="Auto Kill When TP Is Activated",CurrentValue=false,Flag="AutoKill",Callback=function(a)_G.autoKill=a end})local b=a:CreateSection("Through walls and shit")local a=a:CreateToggle({Name="No Clip",CurrentValue=false,Flag="NoClip",Callback=function(a)_G.NoClip=a;if _G.NoClip==true then m=true;Stepped=game:GetService("RunService").Stepped:Connect(function()if not m==false then for a,a in pairs(e:GetChildren())do if a.Name==f.Name then for a,a in pairs(e[f.Name]:GetChildren())do if a:IsA("BasePart")then a.CanCollide=false end end end end else Stepped:Disconnect()end end)elseif _G.NoClip==false then m=false end end})game:GetService("RunService").RenderStepped:Connect(function()FOVCircle.Position=Vector2.new(f:GetMouse().X,f:GetMouse().Y+36)if _G.rainbowFOV then local a=tick()%10/10;local a=Color3.fromHSV(a,1,1)FOVCircle.Color=a;g:Set(a)end;if _G.espRainbow then local a=tick()%10/10;local a=Color3.fromHSV(a,1,1)c:Set(a)l=a end;if not k and _G.infJump and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space)then f.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)end;if _G.bunnyHop and f.Character:WaitForChild("Humanoid")and f.Character.Humanoid.FloorMaterial~=Enum.Material.Air and f.Character.Humanoid.MoveDirection~=Vector3.new(0,0,0)then f.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)task.wait(2)end;if f.Character and game:GetService("Workspace").CurrentCamera:GetChildren()~=0 then if _G.triggerBot==true and not j and f:GetMouse().Target and f:GetMouse().Target.Parent:FindFirstChild("Humanoid")and not f:GetMouse().Target.Parent:FindFirstChild("ForceField")and d(f:GetMouse().Target.Parent)~=nil or _G.triggerBot and f:GetMouse().Target and f:GetMouse().Target.Parent.Parent:FindFirstChild("Humanoid")and not f:GetMouse().Target.Parent.Parent:FindFirstChild("ForceField")and d(f:GetMouse().Target.Parent.Parent)~=nil then game:GetService("VirtualUser"):ClickButton1(Vector2.new(-100,-100))end end;if _G.aimBotTog==true and not j and i or _G.aimBotTog==true and _G.autoLock==true then for a,a in ipairs(game:GetService("Players"):GetPlayers())do if a~=f and a.Character and a.Status.Value~="Dead"and not a.Character:FindFirstChild("ForceField")and a.Character:FindFirstChild(_G.aimbotPart)then local b,c=game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(a.Character[_G.aimbotPart].Position)local d=game:GetService("Workspace").CurrentCamera:GetPartsObscuringTarget({a.Character[_G.aimbotPart].Position},{game:GetService("Workspace").CurrentCamera,f.Character,a.Character})if c and#d==0 then local c=math.huge;local b=(Vector2.new(f:GetMouse().X,f:GetMouse().Y)-Vector2.new(b.X,b.Y)).magnitude;if b<c and b<_G.fovRadius then c=b;closestPlayer=a.Character;game:GetService("Workspace").CurrentCamera.CFrame=CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.Position,closestPlayer[_G.aimbotPart].Position)end end end end end end)n:LoadConfiguration()
