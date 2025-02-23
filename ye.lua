loadstring(readfile("yes/config.bin"))()
if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(...)
        return (...)
    end
    LPH_JIT_ULTRA = function(...)
        return (...)
    end
end
LPH_JIT_MAX(
    function()
        
        local Drawing, FromRGB = Drawing.new, Color3.fromRGB
        local UIS, Players, MPS, RunService, Camera, Tween =
            game:GetService("UserInputService"),
            game:GetService("Players"),
            game:GetService("MarketplaceService"),
            game:GetService("RunService"),
            game:GetService("Workspace").CurrentCamera,
            {}
        function Direction(Value, Two)
            return Vector2.new(Value / kst["Size"].X, Two / kst["Size"].Y)
        end
        local cam = workspace.CurrentCamera
        local x = cam.ViewportSize.X
        local y = cam.ViewportSize.Y
        local newx = math.floor(x * 0.51)
        local newy = math.floor(y * 0.44)
        local Title = Drawing("Text")
        local Value = Drawing("Text")
        local Part = Drawing("Text")
        if kst["Main"]["Intro"] == true then
            local Intro = Instance.new("ScreenGui")
            Intro.Name = "kstIntro"
            Intro.Parent = game.CoreGui
            
            local LogoText = Instance.new("TextLabel")
            LogoText.Size = UDim2.new(0.5, 0, 0.1, 0)
            LogoText.Position = UDim2.new(0.25, 0, 0.45, 0)
            LogoText.BackgroundTransparency = 1
            LogoText.Text = "kst.cc"
            LogoText.TextColor3 = Color3.fromRGB(255, 0, 0)
            LogoText.TextSize = 48
            LogoText.Font = Enum.Font.GothamBold
            LogoText.Parent = Intro
            LogoText.TextTransparency = 1
            
            local TweenService = game:GetService("TweenService")
            TweenService:Create(LogoText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
            task.wait(2)
            TweenService:Create(LogoText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
            task.wait(0.5)
            Intro:Destroy()
        end
        wait(0.15)

        local function Table()
            local hitparts = kst.Silent.Redirection["HitPart"]["Validated Parts"]

            Title.Position, Title.Size =
                Direction(Camera.ViewportSize.X * 0.05, Camera.ViewportSize.Y),
                kst["UITitle"].Size
            Value.Position, Value.Size =
                Direction(Camera.ViewportSize.X * 0.05, Camera.ViewportSize.Y + 400),
                kst["UITitle"].Size
            Part.Position, Part.Size =
                Direction(Camera.ViewportSize.X * 0.05, Camera.ViewportSize.Y + 600),
                kst["UITitle"].Size


            if kst["Main"]["UI"] then
                Title.Text, Title.Font =
                    tostring(
                        kst["UITitle"].Text ..
                            " " ..
                                kst["UITitle"].Extension.Fringe ..
                                    game.Stats.Workspace.Heartbeat:GetValueString() .. kst["UITitle"].Extension.End
                    ),
                    2
                Title.Visible, Title.Outline, Title.Color, Title.OutlineColor =
                    kst["Main"]["Visible Text"],
                    true,
                    kst["Color"].Inline,
                    kst["Color"].Outline

                Value.Font, Value.Visible, Value.Inline, Value.Color, Value.OutlineColor =
                    2,
                    kst["Main"]["Visible Text"],
                    true,
                    kst["Color"].Inline,
                    kst["Color"].Outline

                Part.Font, Part.Visible, Part.Inline, Part.Color, Part.OutlineColor =
                    2,
                    kst["Main"]["Visible Text"],
                    true,
                    kst["Color"].Inline,
                    kst["Color"].Outline

                if kst.Silent.Redirection["Info"].Enabled then
                    Value.Text = "   " .. "Silent" .. " = " .. "On"
                    Part.Text = tostring("HitPart" .." = " .. (kst.Silent["Redirection"]["HitPart"]["Target"]):lower())
                    
                    if isSpeedEnabled and enable then
                        Part.Text = Part.Text .. "\n   Speed = " .. tostring(getgenv().kst.WalkSpeed.Options.DefaultSpeed)
                    end
                else
                    Part.Text = ""
                    Value.Text = "   " .. "Silent" .. " = " .. "Off"
                    
                    if isSpeedEnabled and enable then
                        Part.Text = "   Speed = " .. tostring(getgenv().kst.WalkSpeed.Options.DefaultSpeed)
                    end
                end
            else
            end
        end

        local Utilitie = {}
        Utilitie.Toggle = false

        UIS.InputBegan:Connect(
            function(Two, Input)
                if not Input then
                    if Two.KeyCode.Name == kst["Main"]["Keybind"] then
                        Utilitie.Toggle = not Utilitie.Toggle
                        if Utilitie.Toggle then
                            RunService:BindToRenderStep("Table!", 1, Table)
                            for i = 0, 1, kst["Fade Speed"].Intro do
                                wait(0)
                                Title.Transparency = i
                                Value.Transparency = i
                                Part.Transparency = i
                            end

                            kst["Main"]["UI"] = true
                            kst["Main"]["Visible Text"] = true
                        elseif not Utilitie.Toggle then
                            RunService:UnbindFromRenderStep("Table")
                            kst["Main"]["UI"] = false

                            Title.Transparency = 0.9
                            Value.Transparency = 0.9
                            Part.Transparency = 0.9
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.8
                            Value.Transparency = 0.8
                            Part.Transparency = 0.8
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.7
                            Value.Transparency = 0.7
                            Part.Transparency = 0.7
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.6
                            Value.Transparency = 0.6
                            Part.Transparency = 0.6
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.5
                            Value.Transparency = 0.5
                            Part.Transparency = 0.5
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.4
                            Value.Transparency = 0.4
                            Part.Transparency = 0.4
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.3
                            Value.Transparency = 0.3
                            Part.Transparency = 0.3
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.2
                            Value.Transparency = 0.2
                            Part.Transparency = 0.2
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.1
                            Value.Transparency = 0.1
                            Part.Transparency = 0.1
                            wait(kst["Fade Speed"].Outro)
                            Title.Transparency = 0.1
                            Value.Transparency = 0.1
                            Part.Transparency = 0.1
                            wait(kst["Fade Speed"].Outro)

                            Title.Transparency = 0
                            Value.Transparency = 0
                            Part.Transparency = 0
                        end
                    end
                end
            end
        )

        WTS = (function(Object)
            local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
            return Vector2.new(ObjectVector.X, ObjectVector.Y)
        end)

        local FOV = {}
        FOV.MouseLink = Drawing("Circle")
        FOV.ClosestPoint = Drawing("Circle")
        FOV.Line = Drawing("Line")
        FOV.LineOutline = Drawing("Line")
        FOV.Circle = {
            Outline = Drawing("Circle"),
            Inline = Drawing("Circle")
        }
        
        FOV.Box = {
            Outline = Drawing("Square"),
            Inline = Drawing("Square")
        }
        FOV.Line.Thickness = 3
        FOV.Line.Transparency = 0.8
        FOV.Line.Color = Color3.fromRGB(255, 255, 255)
        FOV.Line.Visible = false

        FOV.LineOutline.Thickness = 7
        FOV.LineOutline.Transparency = 0.4
        FOV.LineOutline.Color = Color3.fromRGB(255, 255, 255)
        FOV.LineOutline.Visible = false
        FOV.ClosestPoint.Radius = 4
        FOV.ClosestPoint.Filled = true
        FOV.ClosestPoint.Transparency = 1
        FOV.ClosestPoint.Color = Color3.fromRGB(255, 0, 0)
        FOV.ClosestPoint.Visible = false

        FOV.MouseLink.Radius = 20
        FOV.MouseLink.Thickness = 0.4
        FOV.MouseLink.Filled = false
        FOV.MouseLink.Transparency = 1
        FOV.MouseLink.Color = Color3.fromRGB(255, 255, 255)
        FOV.MouseLink.Visible = false

        FOV.Circle.Inline.Visible = false
        FOV.Circle.Inline.Radius = kst.Misc.FOV.Esp.Radius
        FOV.Circle.Inline.Transparency = kst.Misc.FOV.Esp.Inline.Transparency
        FOV.Circle.Inline.Color = kst.Misc.FOV.Esp.Inline.Color
        FOV.Circle.Inline.Thickness = 3
        FOV.Circle.Inline.Filled = true

        FOV.Circle.Outline.Visible = false
        FOV.Circle.Outline.Radius = kst.Misc.FOV.Esp.Radius
        FOV.Circle.Outline.Transparency = kst.Misc.FOV.Esp.Outline.Transparency
        FOV.Circle.Outline.Color = kst.Misc.FOV.Esp.Outline.Color
        FOV.Circle.Outline.Thickness = 4
        FOV.Circle.Outline.Filled = false

        FOV.Box.Inline.Visible = false
        FOV.Box.Inline.Size = Vector2.new(kst.Misc.FOV.Esp.BoxSize.X, kst.Misc.FOV.Esp.BoxSize.Y)
        FOV.Box.Inline.Transparency = kst.Misc.FOV.Esp.Inline.Transparency
        FOV.Box.Inline.Color = kst.Misc.FOV.Esp.Inline.Color
        FOV.Box.Inline.Thickness = 3
        FOV.Box.Inline.Filled = true

        FOV.Box.Outline.Visible = false
        FOV.Box.Outline.Size = Vector2.new(kst.Misc.FOV.Esp.BoxSize.X, kst.Misc.FOV.Esp.BoxSize.Y)
        FOV.Box.Outline.Transparency = kst.Misc.FOV.Esp.Outline.Transparency
        FOV.Box.Outline.Color = kst.Misc.FOV.Esp.Outline.Color
        FOV.Box.Outline.Thickness = 4
        FOV.Box.Outline.Filled = false

        local function UpdateFOVPosition(position)
            if kst.Misc.FOV.Esp.Style == "Circle" then
                FOV.Circle.Inline.Position = position
                FOV.Circle.Outline.Position = position
                FOV.Circle.Inline.Visible = kst.Misc.FOV.Esp.Enabled
                FOV.Circle.Outline.Visible = kst.Misc.FOV.Esp.Enabled
                FOV.Box.Inline.Visible = false
                FOV.Box.Outline.Visible = false
            else
                FOV.Box.Inline.Position = position - (FOV.Box.Inline.Size / 2)
                FOV.Box.Outline.Position = position - (FOV.Box.Outline.Size / 2)
                FOV.Box.Inline.Visible = kst.Misc.FOV.Esp.Enabled
                FOV.Box.Outline.Visible = kst.Misc.FOV.Esp.Enabled
                FOV.Circle.Inline.Visible = false
                FOV.Circle.Outline.Visible = false
            end
        end

        local function GetClosestPointOnFOV(center, target)
            if kst.Misc.FOV.Esp.Style == "Circle" then
                local direction = (target - center).Unit
                return center + direction * FOV.Circle.Inline.Radius
            else
                local halfSize = FOV.Box.Inline.Size / 2
                local relative = target - center
                local clamped = Vector2.new(
                    math.clamp(relative.X, -halfSize.X, halfSize.X),
                    math.clamp(relative.Y, -halfSize.Y, halfSize.Y)
                )
                return center + clamped
            end
        end

        local GameInfo = game.PlaceId

        local LocalPlayer = Players.LocalPlayer
        local Mouse = LocalPlayer:GetMouse()

        local IgnoreList = {LocalPlayer.Character, Camera}
        local StickyTarget = nil

        local function PartVisible(Part)
            if kst.Misc.Check["VisCheck"] and Part and Part.Head then
                local Hit =
                    workspace:FindPartOnRayWithIgnoreList(
                    Ray.new(Camera.CFrame.Position, Part.Head.Position - Camera.CFrame.Position),
                    IgnoreList
                )
                if Hit and Hit:IsDescendantOf(Part) then
                    return true
                end
                return false
            else
                return true
            end
        end

        function ClosestToCursor()
            if StickyTarget and StickyTarget.Character and StickyTarget.Character:FindFirstChild("HumanoidRootPart") and
                (kst.Misc["Check"]["TeamCheck"] == true and (StickyTarget.Team ~= LocalPlayer.Team) or
                    kst.Misc["Check"]["TeamCheck"] ~= true)
            then
                local MouseLocation = UIS:GetMouseLocation()
                local Vector, IsVisible = Camera:WorldToViewportPoint(StickyTarget.Character.HumanoidRootPart.Position)
                
                if IsVisible and PartVisible(StickyTarget.Character) then
                    return StickyTarget
                end
            end

            if not StickyTarget then
            local Closest = nil
                local Distance = FOV.Circle.Inline.Radius
            for i, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                    (kst.Misc["Check"]["TeamCheck"] == true and (v.Team ~= LocalPlayer.Team) or
                        kst.Misc["Check"]["TeamCheck"] ~= true)
                then
                    local MouseLocation = UIS:GetMouseLocation()
                    local Vector, IsVisible = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    local Magnitude = (Vector2.new(Vector.X, Vector.Y) - Vector2.new(MouseLocation.X, MouseLocation.Y)).magnitude

                    if Magnitude < Distance and IsVisible and PartVisible(v.Character) then
                        Closest = v
                        Distance = Magnitude
                    end
                end
            end

            if GameInfo == 2788229376 and kst.Misc["Check"]["PlayerKnockCheck"] then
                if Closest and Closest.Character and not Closest.Character:FindFirstChild("GRABBING_CONSTRAINT") and
                        not Closest.Character:FindFirstChild("BodyEffects")["K.O"].Value
                then
                        StickyTarget = Closest
                    return Closest
                end
                return nil
            end
            
            if GameInfo ~= 2788229376 and kst.Misc["Check"]["PlayerKnockCheck"] then
                if Closest and Closest.Character and Closest.Character.Humanoid.Health > 0 then
                        StickyTarget = Closest
                    return Closest
                end
                return nil
            end

                StickyTarget = Closest
            return Closest
            end
            
            return nil
        end

        local player = game:GetService("Players").LocalPlayer
        local runService = game:GetService("RunService")
        local defaultSpeed = 16
        local isSpeedEnabled = false
        local function updateSpeed()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                if isSpeedEnabled and kst.WalkSpeed.Options.Enabled then
                    player.Character.Humanoid.WalkSpeed = kst.WalkSpeed.Options.Speed
                end
            end
        end
        local speedConnection = runService.RenderStepped:Connect(updateSpeed)
        player.CharacterAdded:Connect(function(character)
            character:WaitForChild("Humanoid")
            updateSpeed()
        end)
        UIS.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode.Name == kst.WalkSpeed.Options.Keybind then
                isSpeedEnabled = not isSpeedEnabled
                print("x14512:", isSpeedEnabled)
                if isSpeedEnabled then
                    print("2342323:", kst.WalkSpeed.Options.Speed)
                    player.Character.Humanoid.WalkSpeed = kst.WalkSpeed.Options.Speed
                    if kst.WalkSpeed.Options.AutoEmote then
                        local VirtualInputManager = game:GetService("VirtualInputManager")
                        
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[kst.WalkSpeed.Options.EmoteKey], false, game)
                        task.wait(kst.WalkSpeed.Options.EmoteDelay)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[kst.WalkSpeed.Options.EmoteKey], false, game)
                        
                        task.wait(kst.WalkSpeed.Options.EmoteDelay)
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[kst.WalkSpeed.Options.EmoteSlot], false, game)
                        task.wait(kst.WalkSpeed.Options.EmoteDelay)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[kst.WalkSpeed.Options.EmoteSlot], false, game)
                    end
                else
                    print("xdef")
                    player.Character.Humanoid.WalkSpeed = defaultSpeed
                end
            end
        end)
        UIS.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode.Name == kst.Silent.Redirection.Info.Keybind then
                if StickyTarget then
                    StickyTarget = nil
                else
                    local MouseLocation = UIS:GetMouseLocation()
                    local Closest = nil
                    local Distance = FOV.Circle.Inline.Radius
                    
                    for i, v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local Vector, IsVisible = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                            local Magnitude = (Vector2.new(Vector.X, Vector.Y) - Vector2.new(MouseLocation.X, MouseLocation.Y)).magnitude

                            if Magnitude < Distance and IsVisible and PartVisible(v.Character) then
                                Closest = v
                                Distance = Magnitude
                            end
                        end
                    end
                    
                    if Closest then
                        StickyTarget = Closest
                    end
                end
            end
        end)

        local Meta = getrawmetatable(game)
        local backupindex = Meta.__index
        setreadonly(Meta, false)

        Meta.__index = function(t, k)
            if k:lower() == "hit" and kst.Silent.Redirection.Info.Enabled then
                local TargetPlayer = ClosestToCursor()
                
                if TargetPlayer and TargetPlayer.Character then
                    local Chance = not kst.Silent.Redirection.HitChance.Enabled or 
                                (kst.Silent.Redirection.HitChance.Amount >= math.random(1, 100))
                    
                    if not Chance then
                        return backupindex(t, k)
                    end
                    local Part = TargetPlayer.Character:FindFirstChild(kst.Silent["Redirection"]["HitPart"].Target)
                    if not Part then
                        for _, validPart in ipairs(kst.Silent.Redirection["HitPart"]["Validated Part"]) do
                            Part = TargetPlayer.Character:FindFirstChild(validPart)
                            if Part then break end
                        end
                    end

                    if Part then
                        if kst.Silent.Redirection.AntiCurve.Enabled then
                            local AntiCurve = CFrame.Angles(
                                math.rad(kst.Silent.Redirection.AntiCurve.X),
                                math.rad(kst.Silent.Redirection.AntiCurve.Y),
                                math.rad(kst.Silent.Redirection.AntiCurve.Z)
                            )
                            local Direction = (Part.Position - Camera.CFrame.Position).Unit
                            Direction = AntiCurve:VectorToWorldSpace(Direction)
                            return CFrame.new(Part.Position) * CFrame.fromMatrix(Vector3.new(), Direction:Cross(Vector3.new(0, 1, 0)), Vector3.new(0, 1, 0), Direction)
                        else
                        return Part.CFrame
                        end
                    end
                end
            end
            return backupindex(t, k)
        end
        LocalPlayer.Chatted:Connect(
            function(message)
                if kst.ChatCommands.Enabled then
                    local args = string.split(message, " ")
                    if args[1] == kst.ChatCommands.Fov and args[2] ~= nil then
                        kst.Misc.FOV.Esp.Radius = tonumber(args[2])
                    end

                    if kst.ChatCommands.Enabled then
                        local args = string.split(message, " ")
                        if args[1] == kst.ChatCommands.Prediction and args[2] ~= nil then
                            kst.Silent.Redirection.Prediction.Amount = tonumber(args[2])
                        end
                    end
                end
            end
        )
        local MouseLoop =
            RunService.Heartbeat:Connect(
            function()
                local MouseLocation = UIS:GetMouseLocation()
                if kst.Misc.FOV["Esp"]["Control"]["Stick To Target"] and StickyTarget and StickyTarget.Character then
                    local Root = StickyTarget.Character[kst.Silent["Redirection"]["HitPart"].Target]
                    local RootToViewportPoint, IsVisible = Camera.WorldToViewportPoint(Camera, Root.Position)

                    UpdateFOVPosition(Vector2.new(RootToViewportPoint.X, RootToViewportPoint.Y))
                else
                    UpdateFOVPosition(Vector2.new(MouseLocation.X, MouseLocation.Y))
                end
                if kst.Misc.FOV.Esp.Control.ShowClosestPoint and StickyTarget and StickyTarget.Character then
                    local Root = StickyTarget.Character[kst.Silent["Redirection"]["HitPart"].Target]
                    local RootToViewportPoint, IsVisible = Camera.WorldToViewportPoint(Camera, Root.Position)
                    local TargetPos = Vector2.new(RootToViewportPoint.X, RootToViewportPoint.Y)
                    local ClosestPoint = GetClosestPointOnFOV(MouseLocation, TargetPos)
                    
                    FOV.ClosestPoint.Position = ClosestPoint
                    FOV.ClosestPoint.Visible = IsVisible and kst.Misc.FOV.Esp.Enabled
                else
                    FOV.ClosestPoint.Visible = false
                end
                if kst.Silent.Redirection.Info.Enabled and kst.Silent.Redirection.Visualizetarget.Tracer.Enabled and StickyTarget and StickyTarget.Character then
                    local Root = StickyTarget.Character[kst.Silent["Redirection"]["HitPart"].Target]
                    local RootToViewportPoint, IsVisible = Camera.WorldToViewportPoint(Camera, Root.Position)
                    
                    FOV.Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    FOV.Line.To = Vector2.new(RootToViewportPoint.X, RootToViewportPoint.Y)
                    FOV.Line.Color = kst.Silent.Redirection.Visualizetarget.Tracer.Color
                    FOV.Line.Thickness = kst.Silent.Redirection.Visualizetarget.Tracer.Thickness
                    FOV.Line.Transparency = kst.Silent.Redirection.Visualizetarget.Tracer.Transparency
                    FOV.Line.Visible = true

                    FOV.LineOutline.From = FOV.Line.From
                    FOV.LineOutline.To = FOV.Line.To
                    FOV.LineOutline.Visible = true
                else
                    FOV.Line.Visible = false
                    FOV.LineOutline.Visible = false
                end
                if kst.Silent.Redirection.Info.Enabled and kst.Silent.Redirection.Visualizetarget.Enabled and StickyTarget and StickyTarget.Character then
                    local Root = StickyTarget.Character[kst.Silent["Redirection"]["HitPart"].Target]
                    local RootToViewportPoint, IsVisible = Camera.WorldToViewportPoint(Camera, Root.Position)
                    FOV.MouseLink.Color = kst.Silent["Redirection"]
                    FOV.MouseLink.Transparency = 1
                    FOV.MouseLink.Thickness = 0.4
                    FOV.MouseLink.Filled = false
                    FOV.MouseLink.Radius = 20
                    FOV.MouseLink.Visible = true
                    FOV.MouseLink.Position = Vector2.new(RootToViewportPoint.X, RootToViewportPoint.Y)
                else
                    FOV.MouseLink.Position = Vector2.new()
                    FOV.MouseLink.Visible = false
                end
            end
        )
        local function GetClosestPlayer()
            local MaxDist = math.huge
            local Target = nil
            
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and 
                v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild(kst.Camlock.HitPart) then
                    local ScreenPos, OnScreen = Camera:WorldToScreenPoint(v.Character[kst.Camlock.HitPart].Position)
                    local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(ScreenPos.X, ScreenPos.Y)).Magnitude
                    
                    if Distance < MaxDist and OnScreen then
                        MaxDist = Distance
                        Target = v
                    end
                end
            end
            
            return Target
        end
        local Target
        local Enabled = false
        local Holding = false
        UIS.InputBegan:Connect(function(Input)
            if Input.KeyCode == Enum.KeyCode[kst.Camlock.Key] then
                if kst.Camlock.Toggle then
                    Enabled = not Enabled
                    if Enabled then
                        Target = GetClosestPlayer()
                    else
                        Target = nil
                    end
                else
                    Holding = true
                    Target = GetClosestPlayer()
                end
            end
            
            if Input.KeyCode == Enum.KeyCode[kst.Silent.Redirection.Visualizetarget.Tracer.Key] then
                kst.Silent.Redirection.Visualizetarget.Tracer.Enabled = not kst.Silent.Redirection.Visualizetarget.Tracer.Enabled
            end
        end)
        UIS.InputEnded:Connect(function(Input)
            if Input.KeyCode == Enum.KeyCode[kst.Camlock.Key] and not kst.Camlock.Toggle then
                Holding = false
                Target = nil
            end
        end)
        RunService.RenderStepped:Connect(function()
            if (Enabled or Holding) and Target and Target.Character and Target.Character:FindFirstChild(kst.Camlock.HitPart) then
                local TargetPos = Target.Character[kst.Camlock.HitPart].Position
                if kst.Camlock.Prediction.Enabled then
                    local Velocity = Target.Character[kst.Camlock.HitPart].Velocity
                    local Distance = (Target.Character[kst.Camlock.HitPart].Position - Camera.CFrame.Position).Magnitude
                    local TimeToTarget = Distance / 1000
                    TargetPos = TargetPos + (Velocity * kst.Camlock.Prediction.Amount)
                end
                if kst.Camlock.Shake.Enabled then
                    TargetPos = TargetPos + Vector3.new(
                        math.random(-kst.Camlock.Shake.X, kst.Camlock.Shake.X) / 100,
                        math.random(-kst.Camlock.Shake.Y, kst.Camlock.Shake.Y) / 100,
                        math.random(-kst.Camlock.Shake.Z, kst.Camlock.Shake.Z) / 100
                    )
                end
                local CameraPosition = Camera.CFrame.Position
                local TargetPosition = TargetPos
                local TargetCFrame = CFrame.lookAt(CameraPosition, TargetPosition)
                if kst.Camlock.Smoothness.Enabled then
                    local LerpAmount = kst.Camlock.Smoothness.Amount
                    
                    if kst.Camlock.AimAssist.Enabled then
                        local ScreenPos, OnScreen = Camera:WorldToScreenPoint(TargetPosition)
                        if OnScreen then
                            local ScreenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                            local Distance = (Vector2.new(ScreenPos.X, ScreenPos.Y) - ScreenCenter).Magnitude
                            
                            if Distance < 150 then
                                LerpAmount = LerpAmount * (1 + kst.Camlock.AimAssist.Strength)
                            end
                        end
                    end
                    local CurrentCFrame = Camera.CFrame
                    local NewCFrame = CurrentCFrame:Lerp(TargetCFrame, LerpAmount)
                    Camera.CFrame = CFrame.new(CurrentCFrame.Position) * NewCFrame.Rotation
                else
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position) * TargetCFrame.Rotation
                end
            end
        end)
        local TriggerEnabled = false
        local LastShot = 0
        local TriggerHolding = false
        UIS.InputBegan:Connect(function(Input)
            if Input.KeyCode == Enum.KeyCode[kst.Triggerbot.Key] and kst.Triggerbot.Enabled then
                if kst.Triggerbot.Hold then
                    TriggerHolding = true
                    TriggerEnabled = true
                else
                    TriggerEnabled = not TriggerEnabled
                end
            end
        end)
        UIS.InputEnded:Connect(function(Input)
            if Input.KeyCode == Enum.KeyCode[kst.Triggerbot.Key] and kst.Triggerbot.Hold then
                TriggerHolding = false
                TriggerEnabled = false
            end
        end)
        RunService.RenderStepped:Connect(function()
            if TriggerEnabled and kst.Triggerbot.Enabled and (not kst.Triggerbot.Hold or TriggerHolding) then
                local MouseLocation = UIS:GetMouseLocation()
                local NearestPlayer = nil
                local ShortestDistance = kst.Triggerbot.Distance
                for _, Player in pairs(Players:GetPlayers()) do

                    if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                        if kst.Triggerbot.CheckTeam and Player.Team == LocalPlayer.Team then
                            continue
                        end
                        if kst.Triggerbot.CheckKnocked and game.PlaceId == 2788229376 then
                            if Player.Character:FindFirstChild("GRABBING_CONSTRAINT") or 
                            Player.Character:FindFirstChild("BodyEffects")["K.O"].Value then
                                continue
                            end
                        end

                        local Vector, IsVisible = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
                        if IsVisible then
                            if kst.Triggerbot.VisibilityCheck then
                                local Ray = Ray.new(Camera.CFrame.Position, (Player.Character.Head.Position - Camera.CFrame.Position).Unit * 500)
                                local Hit, Position = workspace:FindPartOnRayWithIgnoreList(Ray, {LocalPlayer.Character, Camera})
                                
                                if not Hit or not Hit:IsDescendantOf(Player.Character) then
                                    continue
                                end
                            end

                            local Distance = (Vector2.new(Vector.X, Vector.Y) - MouseLocation).Magnitude
                            if Distance < ShortestDistance then
                                ShortestDistance = Distance
                                NearestPlayer = Player
                            end
                        end
                    end
                end

                if NearestPlayer and tick() - LastShot > kst.Triggerbot.Delay then
                    mouse1click()
                    LastShot = tick()
                end
            end
        end)
    end
)()
getgenv().Loaded = true
