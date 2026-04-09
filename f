(function() 
    
    pcall(function() loadstring(game:HttpGet('https://cdn.shouko.dev/neyoshiiuem/anti.lua'))() end)
    if os.time() >= 1756319996 then 
    end 
    print = function() end
    function CheckKick(v)
        if v.Name == 'ErrorPrompt' then
            task.wait(2)
            print(v.TitleFrame.ErrorTitle.Text)
            if v.TitleFrame.ErrorTitle.Text == 'Teleport Failed' then
                if string.find(v.MessageArea.ErrorFrame.ErrorMessage, 'Unable to join game') then
                    return
                end
            else 
                game:GetService('TeleportService'):Teleport(game.PlaceId)
                v:Destroy()
            end
        end
    end
    

    
    

    game:GetService('CoreGui').RobloxPromptGui.promptOverlay.ChildAdded:Connect(CheckKick)
    Config = {
        Team = "Pirates",
        Configuration = {
            HopWhenIdle = true,
            AutoHop = true,
            AutoHopDelay = 60 * 60,
            FpsBoost = true
        },
        Items = {

            AutoFullyMelees = true,

            Saber = true,
            CursedDualKatana = false,

            SoulGuitar = true,


            RaceV2 = false

        },
        Settings = {
            StayInSea2UntilHaveDarkFragments = false
        }
    }
        
    local LogService = game:GetService('LogService')
    local GameName = "Blox Fruit" 

    pcall(function() 
        GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end) 

    local StartTime = os.time()

    function Report(Message) end

    function mmb() 
        
    local player = game.Players.LocalPlayer
    local Lighting = game:GetService("Lighting")

    local function formatNumber(n)
        n = tonumber(n) or 0
        if n >= 1e6 then return string.format("%.1fM", n / 1e6) end
        if n >= 1e3 then return string.format("%.1fK", n / 1e3) end
        return tostring(n)
    end

    local blur = Instance.new("BlurEffect")
    blur.Name   = "SPBlur"
    blur.Size   = 0
    blur.Parent = Lighting

    local StatusGui = Instance.new("ScreenGui")
    StatusGui.Name         = "KaitunStatus"
    StatusGui.Parent       = player.PlayerGui
    StatusGui.ResetOnSpawn = false
    StatusGui.DisplayOrder = 10

    local shadow = Instance.new("Frame")
    shadow.Name                   = "Shadow"
    shadow.Parent                 = StatusGui
    shadow.AnchorPoint            = Vector2.new(0.5, 0)
    shadow.BackgroundTransparency = 1
    shadow.Position               = UDim2.new(0.5, 0, 0.02, 0)
    shadow.Size                   = UDim2.new(0, 380, 0, 58)

    local main = Instance.new("Frame")
    main.Name                   = "Main"
    main.Parent                 = shadow
    main.AnchorPoint            = Vector2.new(0.5, 0.5)
    main.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
    main.BackgroundTransparency = 0.45
    main.BorderSizePixel        = 0
    main.Position               = UDim2.new(0.5, 0, 0.5, 0)
    main.Size                   = UDim2.new(1, 0, 1, 0)

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 6)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color     = Color3.fromRGB(255, 185, 0)
    uiStroke.Thickness = 2
    uiStroke.Parent    = main

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Name                   = "Title"
    titleLbl.Parent                 = main
    titleLbl.AnchorPoint            = Vector2.new(0.5, 0)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Position               = UDim2.new(0.5, 0, 0, 5)
    titleLbl.Size                   = UDim2.new(1, -10, 0, 18)
    titleLbl.FontFace               = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
    titleLbl.Text                   = "Kaitun | Loading..."
    titleLbl.TextColor3             = Color3.fromRGB(255, 185, 0)
    titleLbl.TextSize               = 14

    local statusLbl = Instance.new("TextLabel")
    statusLbl.Name                   = "Status"
    statusLbl.Parent                 = main
    statusLbl.AnchorPoint            = Vector2.new(0.5, 0)
    statusLbl.BackgroundTransparency = 1
    statusLbl.Position               = UDim2.new(0.5, 0, 0, 28)
    statusLbl.Size                   = UDim2.new(1, -10, 0, 18)
    statusLbl.FontFace               = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
    statusLbl.Text                   = "Status: Starting..."
    statusLbl.TextColor3             = Color3.fromRGB(255, 255, 255)
    statusLbl.TextSize               = 13

    getgenv().SetStatus = function(text)
        pcall(function() statusLbl.Text = "Status: " .. tostring(text) end)
    end

    local Interface = {
        Instances = {}
    } 

    function SetText(Name, Text)
        pcall(function()
            if Name == "MainTextLabel" or Name == "Task1" then
                statusLbl.Text = "Status: " .. tostring(Text)
            end
        end)
    end

    function ToggleUI(State) end
    Interface.SetText = SetText
    Interface.ToggleUI = ToggleUI
    Interface.ToggleInterface = function() end
    Interface.RegisterForBlur = function() end

        local Animation = Instance.new('Animation')
        Animation.AnimationId = 'http://www.roblox.com/asset/?id=1elutruahuabuahd'
        
        getgenv().alert = function(t1, t2)
            pcall(function()
                local msg = tostring(t1 or "")
                if t2 then msg = msg .. " - " .. tostring(t2) end
                statusLbl.Text = "Status: " .. msg
            end)
        end

        task.spawn(function()
            local data = player:WaitForChild("Data", 30)
            if not data then return end
            while task.wait(1) do
                pcall(function()
                    local level = (data:FindFirstChild("Level") and data.Level.Value) or 0
                    local money = (data:FindFirstChild("Money") and data.Money.Value) or 0
                    local frags = (data:FindFirstChild("Fragments") and data.Fragments.Value) or 0
                    titleLbl.TextColor3 = Color3.fromRGB(255, 185, 0)
                    titleLbl.Text = "Kaitun | Lv." .. level
                        .. "  Beli:" .. formatNumber(money)
                        .. "  Frags:" .. formatNumber(frags)
                end)
            end
        end)
        
        local CDN_HOST = "https://files.lumitone.xyz/"
        

        
        
        
        
        StartTime = os.time()
        
        OldSessionTime = isfile(".tdif-" .. game.Players.LocalPlayer.Name) and
                            tonumber(readfile(".tdif-" .. game.Players.LocalPlayer.Name)) or 0
        
        repeat
            task.wait()
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", Config.Team)
        
        until game.Players.LocalPlayer.Character
        repeat wait() until game.Players.LocalPlayer.Character
        spawn(function()
            game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild('NewIslandLOD', 9999):Destroy() 
            game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild('IslandLOD', 9999):Destroy() 
        end)

 
        local Segmants = {"RawConstants", "Utilly", "QuestManager", "SpawnRegionLoader", "TweenController", "AttackController",
                        "CombatController", "FunctionsHandler", "Hooks", "Debug", "Hop", "Storage"}
        
        
        StartTick = tick()
        repeat
            task.wait()
        until SetText
        SetText("MainTextLabel", "Initalizing Script...")
        
        local FolderPath = "Rua_Hub/Blox_Fruit/Assets/"
        
        
        ScriptStorage = {
            IsInitalized = false,
            PlayerData = {},
            Melees = {},
            CurrentMeleeData = {},
            Enemies = {},
            Tools = {},
            Backpack = {},
            IgnoreStoreFruits = {},
            Connections = {
                LocalPlayer = {}
            },
            Task = {},
            Tracebacks = {},
            TaskController = {},
            TracebackUpdater = {},
            Interface = Interface,
            NPCs = {}
        }
        
        Players = game.Players
        LocalPlayer = Players.LocalPlayer
        Character = LocalPlayer.Character
        
        Humanoid = Character:WaitForChild("Humanoid")
        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
        
        PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
        Lighting = game:GetService("Lighting")
        
        Services = {}
        
        setmetatable(Services, {
            __index = function(_, Index)
                return game:GetService(Index)
            end
        });
        
        setmetatable(ScriptStorage.Enemies, {
            __index = function(_, Index)
                return Services.Workspace.Enemies:FindFirstChild(Index) or Services.ReplicatedStorage:FindFirstChild(Index)
            end
        })
        
        setmetatable(ScriptStorage.Tools, {
            __index = function(Self, Index)
                return LocalPlayer.Character:FindFirstChild(Index) or LocalPlayer.Backpack:FindFirstChild(Index)
            end
        })
        
        setmetatable(ScriptStorage.NPCs, {
            __index = function(_, Index)
                return workspace.NPCs:FindFirstChild(Index) or game.ReplicatedStorage.NPCs:FindFirstChild(Index)
            end
        })
        
        function CreateTraceback(Index, Value)
        
            table.insert(ScriptStorage.Tracebacks,
                (GetCurrentDateTime() .. " ( " .. DispTime(os.time() - StartTime, true) .. " ) after execution | " .. Index ..
                    " | " .. Value))
        end
        
        function SetTask(Index, Value)
        
            if ScriptStorage.Task[Index] == Value then
                return
            end
            local Parser = {
                MainTask = "Task1",
                SubTask = "Task2"
            }
            if Parser[Index] then
                if SetText then
                    SetText(Parser[Index], Index .. " : " .. Value)
                end
        
            end
            ScriptStorage.Task[Index] = Value
            ScriptStorage.Task[Index .. "-d"] = os.time()
        
        end
        
        Remotes = {}
        print(1)
        setmetatable(Remotes, {
            __index = function(Self, Key)
        
                if Key ~= "CommF_" then
                    print("captured unregistered signal", key)
                    return Services.ReplicatedStorage.Remotes[Key]
                end
        
                local tbl = {
                    InvokeServer = function(Self, ...)
                        print("remote fired", ...)
                        return Services.ReplicatedStorage.Remotes.CommF_:InvokeServer(...)
                    end
                }
        
                return tbl
            end
        })
        
        Tasks = {}
        
        function AwaitUntilPlayerLoaded(Player, Timeout)
            repeat
                task.wait()
            until Player.Character
        
            Player.Character:WaitForChild("Humanoid")
        
            repeat
                task.wait()
            until Player.Character.Humanoid.Health > 0
        end
        
        function AddPoint()
            local PointsValue = {}
            local Result
        
            for _, CInst in LocalPlayer.Data.Stats:GetChildren() do
                if CInst and CInst:FindFirstChild("Level") then
                    PointsValue[CInst.Name] = CInst.Level.Value
                end
            end
            if PointsValue.Defense < MaxLevel and
                (PointsValue.Defense < (ScriptStorage.PlayerData.Level / 80) or MaxLevel - PointsValue.Melee < 100) then
                Result = "Defense"
            elseif PointsValue.Melee < MaxLevel then
                Result = "Melee"
            else
                Result = "Sword"
            end
        
            Remotes.CommF_:InvokeServer("AddPoint", Result, 999)
        end
        
        local Colors = {
            Currencies = {
                Level = "#00FF40",
                Beli = "#FF7800",
                Fragments = "#6600FF"
            },
            Races = {}
        }
        function RefreshPlayerData()
            for _, ChildInstance in LocalPlayer.Data:GetChildren() do
                pcall(function()
                    ScriptStorage.PlayerData[ChildInstance.Name] = ChildInstance.Value
                end)
            end
        
            local Currencies = ""
            for Index, Value in ScriptStorage.PlayerData do
                local Color = Colors.Currencies[Index]
                if Color then
                    Currencies = Currencies .. '<font color="' .. Color .. '">' .. Index .. '</font>: ' .. Value .. ' '
                end
            end
        
            if ScriptStorage.Interface then
                SetText("Currencies", Currencies)
            end
        
        end
        
        function RefreshRace()
            local v27, v28 = Remotes.CommF_:InvokeServer("Alchemist", "1"), Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
            ScriptStorage.PlayerData.RaceLevel = 1
            if LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                ScriptStorage.PlayerData.RaceLevel = 4
            elseif v28 == -2 then
                ScriptStorage.PlayerData.RaceLevel = 3
            elseif v27 == -2 then
                ScriptStorage.PlayerData.RaceLevel = 2
            end
        end
        
        function RefreshInventory()
            ScriptStorage.Backpack2 = {}
            for _, Value in Remotes.CommF_:InvokeServer("getInventory") do
                ScriptStorage.Backpack2[Value.Name] = Value
            end
        
            ScriptStorage.Backpack = ScriptStorage.Backpack2
        end
        
        function ResearchMoves(Child)
            if Child and tostring(Child) == "V" then
                if ScriptStorage.Connections.BurstCheck then
        
                    ScriptStorage.Connections.BurstCheck:Disconnect()
                    task.wait(1)
                end
                print("[ Debug ] Registering burst", Child)
                ScriptStorage.Connections.BurstCheck = Child.Cooldown:GetPropertyChangedSignal("AbsoluteSize"):Connect(
                    function()
                        if EnablingBurstDebounce and os.time() - EnablingBurstDebounce < 10 then
                            return
                        end
                        local Value = Child.Cooldown.AbsoluteSize.X
                        if Value < 3 then
                            EnablingBurstDebounce = os.time()
        
                            task.wait(5)
                            SendKey("V", 0)
                        end
                    end)
            end
        end
        
        function CheckMeleeBurstMove(Child)
            if Child.Name == "Black Leg" or Child.Name == "Death Step" then
                local UI = PlayerGui.Main.Skills:WaitForChild(Child.Name, 9)
        
                ResearchMoves(UI:WaitForChild("V"))
        
            end
        end
        
        function RefreshMelees(ReturnOrSet)
            local Result = ""
        
            for MeleeName, Level in ScriptStorage.Melees do
                Result = Result .. MeleeName .. ": " .. Level .. " "
            end
            Result = Result == "" and "[0]" or Result
            if ReturnOrSet then
                return Result
            end
        
            if ScriptStorage.Interface then
                SetText("Melees", Result)
            end
        end
        function MeleeCheck(Child)
            print("Melee check", Child)
        
            if Child and typeof(Child) == "Instance" and Child:IsA("Tool") then
                if Child.ToolTip == "Melee" then
        
        
                    if ScriptStorage.Connections.Melees then
        
                        ScriptStorage.Connections.Melees:Disconnect()
                    end
        
                    ScriptStorage.CurrentMeleeData.Name = Child.Name
                    pcall(function()
                        ScriptStorage.Connections.Melees:Destroy()
                    end)
        
                    ScriptStorage.Connections.Melees = Child.Level.Changed:Connect(function(Value)
        
                        ScriptStorage.Melees[Child.Name] = Value
                        RefreshMelees()
                    end)
                    ScriptStorage.Melees[Child.Name] = Child.Level.Value
                    RefreshMelees()
        
                elseif string.find(tostring(Child), "Fruit") then
                    task.spawn(function()
        
                        if table.find(ScriptStorage.IgnoreStoreFruits, Child:GetAttribute("OriginalName")) then
                            return
                        end
                        local StoreResult = Remotes.CommF_:InvokeServer("StoreFruit", Child:GetAttribute("OriginalName"), Child)
        
                    end)
                end
            end
        end
        SetText("MainTextLabel", "Refreshing Player Data")
        
        MeleeCheck(LocalPlayer.Character:FindFirstChildOfClass("Tool"))
        
        RefreshPlayerData()
        
        function RegisterLocalPlayerEventsConnection()
        
            task.spawn(function()
                task.wait(6)
                if LocalPlayer.Character:FindFirstChild("HasBuso") then
                    return
                end
                Remotes.CommF_:InvokeServer("Buso")
            end)
        
            for _, Connection in ScriptStorage.Connections.LocalPlayer do
                pcall(function()
                    Connection:Disconnect()
                end)
            end
        
            AwaitUntilPlayerLoaded(LocalPlayer)
        
            LocalPlayer:SetAttribute("IsAvailable", true)
        
            ScriptStorage.Connections.LocalPlayer["HealthCheck"] = LocalPlayer.Character:WaitForChild("Humanoid")
                :GetPropertyChangedSignal("Health"):Connect(function()
        
                    local Health = LocalPlayer.Character.Humanoid.Health
        
                    LocalPlayer:SetAttribute("IsAvailable", Health > 10)
                    ScriptStorage.LocalPlayerHealth = Health
                end)
        
            ScriptStorage.Connections.LocalPlayer["Melee"] = LocalPlayer.Character.ChildAdded:Connect(MeleeCheck)
            ScriptStorage.Connections.LocalPlayer["Fruit"] = LocalPlayer.Backpack.ChildAdded:Connect(MeleeCheck)
        
            table.foreach(LocalPlayer.Backpack:GetChildren(), function(_, Melee)
                MeleeCheck(Melee)
            end)
        
            LastIdleCheck = os.time()
            ScriptStorage.Connections.LocalPlayer.PositionChecker =
                LocalPlayer.Character.HumanoidRootPart:GetPropertyChangedSignal("CFrame"):Connect(function()
                    if os.time() == LastIdleCheck then return end 
                    LastIdleCheck = os.time()
                    if oldPos then 
                        if (LocalPlayer.Character.HumanoidRootPart.CFrame.p - oldPos).magnitude < 2 then 
                            return end 
                    end 
                    oldPos = (LocalPlayer.Character.HumanoidRootPart.CFrame.p) 
                    LastIdling = os.time()
                    
                end)
        
            local PointsInstance = LocalPlayer.Data:WaitForChild("Points")
            ScriptStorage.Connections.LocalPlayer.PointConnection = PointsInstance:GetPropertyChangedSignal("Value"):Connect(
                function()
        
                    local CurrentValue = LocalPlayer.Data:WaitForChild("Points")
                    if OldPointValue == CurrentValue then
                        return
                    end
        
                    OldPointValue = CurrentValue
        
                    AddPoint()
                end)
        end
        
        RegisterLocalPlayerEventsConnection(LocalPlayer)
        
        game.Players.LocalPlayer.CharacterAdded:Connect(function(Character)
        
            print('[ Debug ] re-registering events')
            RegisterLocalPlayerEventsConnection(LocalPlayer)
        
        end)
        
        task.spawn(function()
            task.wait(3)
            if LocalPlayer.Character:FindFirstChild("HasBuso") then
                return
            end
            Remotes.CommF_:InvokeServer("Buso")
        end)
        
    print(1)
    MeleesTable = {
        "Black Leg",
        "Electro",
        "Fishman Karate",
        "Dragon Claw",
        "Superhuman",
        "Death Step",
        "Electric Claw",
        "Sharkman Karate",
        "Dragon Talon",
        "Godhuman",
        "SanguineArt"
    }

    MeleesId =  {
        "BlackLeg",
        "Electro",
        "FishmanKarate",
        "DragonClaw",
        "Superhuman",
        "DeathStep",
        "ElectricClaw",
        "SharkmanKarate",
        "DragonTalon",
        "Godhuman",
        "SanguineArt"
    } 


    MeleePrices = {
        ["Black Leg"] = {
            Price =
            {
                Beli = 150000,
            }, 
            Id = 'BlackLeg', 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true 
            end,
            Buy = function(Check) 
                return BuyMelee("BlackLeg", Check)
            end 
        }, 
        ["Electro"] = {
            Price = 
            {
                Beli = 500000
            },
            Id = 'Electro', 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true 
            end, 
            Buy = function(Check) 
                return BuyMelee("Electro", Check)
            end 
        }, 
        ["Fishman Karate"] = {
            Price = { 
                Beli = 750000 
            }, 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true 
            end, 
            Buy = function(Check) 
                return BuyMelee("FishmanKarate", Check)
            end 
        }, 
        ["Dragon Claw"] = {
            Price = { 
                Fragments = 1500 
            }, 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true 
            end, 
            Buy = function(Check) 
                if Check then 
                    return game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1") == 1 
                end 
                return Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
            end 
        }, 
        ["Superhuman"] = 
        {
            Price = 
            {
                Beli = 3000000
            }, 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true 
            end,
            Buy = function(Check) 
                return BuyMelee("Superhuman", Check)
            end 
        },
        ["Death Step"] = 
        {
            Price = 
            {
                Beli = 2500000, 
                Fragments = 5000
            }, 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true
            end, 
            Buy = function(Check) 
                return BuyMelee("DeathStep", Check)
            end 
        },
        ["Electric Claw"] = 
        {
            Price = 
            {
                Beli = 2500000, 
                Fragments = 5000
            }, 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true
            end, 
            Buy = function(Check) 
                return BuyMelee("ElectricClaw", Check)
            end 
        },
        ["Sharkman Karate"] = 
        {
            Price = 
            {
                Beli = 2500000, 
                Fragments = 5000
            }, 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true
            end, 
            Buy = function(Check) 
                return BuyMelee("SharkmanKarate", Check)
            end 
        }, 
        ["Dragon Talon"] = 
        {
            Price = 
            {
                Beli = 2500000, 
                Fragments = 5000
            }, 
            NextLevelRequirement = 400, 
            Requirements = function() 
                return true
            end, 
            Buy = function(Check) 
                return BuyMelee("DragonTalon", Check)
            end 
        }, 

        ["Godhuman"] = 
        {
            Price = 
            {
                Beli = 5000000, 
                Fragments = 5000
            }, 
            NextLevelRequirement = 350, 
            Requirements = function() 
                return true
            end, 
            Buy = function(Check) 
                return BuyMelee("Godhuman", Check)
            end 
        }
    }



    DropItemData = {
        ["Buddy Sword"] = {
            Sea = 3, 
            Level = 1500, 
            Boss = "Cake Queen"
        }, 
        ["Canvander"] = {
            Sea = 3, 
            Level = 1500, 
            Boss = "Beautiful Pirate"
        }, 
        ["Twin Hooks"] = {
            Sea = 3, 
            Level = 1500, 
            Boss = "Captain Elephant"
        }, 
        ["Venom Bow"] = {
            Sea = 3, 
            Level = 1500, 
            Boss = "Hydra Leader"
        }
    }
            
    GodhumanMaterials = {
        ["Fish Tail"] = {
            20,
            3,
            {
                "Fishman Raider",
                "Fishman Captain"
            }, 
            {
                "DeepForestIsland3", 
                1, 
                1775, 
                "Turtle Adventure Quest Giver"
            }
        },
        ["Dragon Scale"] = {
            10,
            3,
            {
                "Dragon Crew Warrior",
                "Dragon Crew Archer"
            }, 
            {
                "DragonCrewQuest", 
                1, 
                1575,
                "Dragon Crew Quest Giver"
            }
        },
        ["Magma Ore"] = {
            20,
            2,
            {
                "Magma Ninja"
            }, 
            {
                "FireSideQuest", 
                1, 
                1100, 
                "Fire Quest Giver"
            }
        },
        ["Mystic Droplet"] = {
            10,
            2,
            {
                "Sea Soldier",
                "Water Fighter"
            }, 
            {
                "ForgottenQuest", 
                2, 
                1425, 
                "Forgotten Quest Giver"
            }
        }
    }

    SeaIndexes = {"Main", "Dressrosa", "Zou"}

    TasksOrder = 
    {
        "SpecialBossesTask",
        "RaidController",
        "Trevor",
        "UtillyItemsActivitation",
        "ColosseumPuzzle", 
        "Wenlocktoad",
        "ThirdSeaPuzzle",
        "PirateRaid", 
        "SecondSeaPuzzle",
        "ThirdSeaPuzzle",
        "CollectDrops",
        "BossesTask", 
        "ExpRedeem",
        "LevelFarm"
    }

    MaxLevel = 2800

    placeId = game.PlaceId
    if placeId == 2753915549 then
        Sea = "Main"
        SeaIndex = 1
    elseif placeId == 4442272183 then
        Sea = "Dressrosa"
        SeaIndex = 2    
    elseif placeId == 7449423635 then
        Sea = "Zou"
        SeaIndex = 3
    end


    Portals = ({
        {
            Vector3.new(-7894.6201171875, 5545.49169921875, -380.246346191406),
            Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        },
        {
            Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        },
        {
            
        }
    })[SeaIndex]

    BossesOrder = {
        "Awakened Ice Admiral",
        "Tide Keeper",
        "Deandre",
        "Urban",
        "Diablo",
        "Soul Reaper",
        "Cake Prince"
    }
    BossesOrderLevel = {
        ["Awakened Ice Admiral"] = 700, 
        ["Tide Keeper"] = 700, 
        ["Deandre"] = 1500,
        ["Urban"] = 1500,
        ["Diablo"] = 1500,
        ["Cake Prince"] = 1500, 
        ["Soul Reaper"] = 1500
    }

    BossesOrderWL = {
        ["Deandre"] = 1500,
        ["Urban"] = 1500,
        ["Diablo"] = 1500,
        ["Cake Prince"] = 1500, 
        ["Don Swan"] = 1100,
        ["Awakened Ice Admiral"] = 700, 
        ["Tide Keeper"] = 700, 
    }


    SpecialBossesOrder = {
        ["Core"] = 700, 
        ["Darkbeard"] = 700, 
        ["rip_indra True Form"] = 1500, 
        ["Dough King"] = 1500, 
    }

    BlankTablets = {
        "Segment6",
        "Segment2",
        "Segment8",
        "Segment9",
        "Segment5"
    }

    Trophy = {
        ["Segment1"] = "Trophy1",
        ["Segment3"] = "Trophy2",
        ["Segment4"] = "Trophy3",
        ["Segment7"] = "Trophy4",
        ["Segment10"] = "Trophy5"
    }

    Pipes = {
        ["Part1"] = "Really black",
        ["Part2"] = "Really black",
        ["Part3"] = "Dusty Rose",
        ["Part4"] = "Storm blue",
        ["Part5"] = "Really black",
        ["Part6"] = "Parsley green",
        ["Part7"] = "Really black",
        ["Part8"] = "Dusty Rose",
        ["Part9"] = "Really black",
        ["Part10"] = "Storm blue"
    }



    function GenerateUUID()
        local Template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
        return string.gsub(Template, '[xy]', function (Idc)
            local V = (Idx == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
            return string.format('%x', V)
        end)
    end

    function CheckIsPlayerAlive(Instance) 
        Instance = Instance or LocalPlayer 
        
        return Instance and Instance.Character and Instance.Character.Humanoid and Instance.Character.HumanoidRootPart and Instance.Character.Head and Instance.Character.Humanoid.Health > 0
    end 

    function ConvertTo(Type, Instance)
        return Type.new(Instance.X, Instance.Y, Instance.Z) 
    end 

    function CaculateDistance(Origin, Desnitation) 
        
        if not Origin then return 0 end 
        
        Desnitation = Desnitation or game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local Origin, Desnitation = ConvertTo(Vector3, Origin), ConvertTo(Vector3, Desnitation)
        
        return ( Origin - Desnitation ) .magnitude
    end  

    function DispTime(time, cc)
        time = tonumber(time)
        if not time then
            return "[err]"
        end
        local days = math.floor(time / 86400)
        local hours = math.floor(math.fmod(time, 86400) / 3600)
        local minutes = math.floor(math.fmod(time, 3600) / 60)
        local seconds = math.floor(math.fmod(time, 60))
        if cc then
            return (days .. "day, " .. hours .. "hrs, " .. minutes .. "min, " .. seconds .. "sec.")
        end
        return (days .. "day, " .. hours .. "hrs.")
    end

    function GetCurrentDateTime()
    local now = os.date("*t")

    local hour = now.hour
    local minute = now.min
    local day = now.day
    local month = now.month
    local year = now.year
    local weekday = now.wday

    local formattedTime = string.format("%02d:%02d ", hour, minute)

    local weekdays = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"}
    local formattedWeekday = weekdays[weekday]

    local months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
    local formattedMonth = months[month]

    local formattedDate = string.format("%s, %s %d %d", formattedWeekday, formattedMonth, day, year)

    return formattedTime.. formattedDate
    end

    function RandomArguments(...) 
        local Table = {...} 
        return Table[math.random(0, #Table)]
    end 

        
    function RoundVector3Down(vec)
        return Vector3.new(
            math.floor(vec.X / 10) * 10,
            math.floor(vec.Y / 10) * 10,
            math.floor(vec.Z / 10) * 10
        )
    end

    local Angle = 30
    lastChange = tick() 
    CaculateCircreDirection = function(Position)
        if Angle > 50000 then 
            Angle = 60
        end 
        
        Angle = Angle + ((tick() - lastChange) > .4 and 80 or 0) 

        
        if tick() - lastChange > .4 then 
            lastChange = tick()
        end
        
        local sum = Position + Vector3.new(math.cos(math.rad(Angle)) * 40, 0, math.sin(math.rad(Angle)) * 40)
        return CFrame.new(RoundVector3Down(sum.p))
    end

    function GetMonAsSortedRange() 
        local Result = {}
        
        table.foreach(Services.Workspace.Enemies:GetChildren(), function(_, Mon) 
            if Mon and Mon:FindFirstChild("Humanoid") and Mon:FindFirstChild("HumanoidRootPart") and Mon.Humanoid.Health > 0 then 
                table.insert(Result, Mon)
            end 
        end)
        
        table.foreach(game.ReplicatedStorage:GetChildren(), function(_, Mon) 
            if Mon and Mon:FindFirstChild("Humanoid") and Mon:FindFirstChild("HumanoidRootPart") and Mon.Humanoid.Health > 0 then 
                table.insert(Result, Mon)
            end
        end)
        
        table.sort(Result, function(C1, C2) return CaculateDistance(C1.HumanoidRootPart.CFrame) < CaculateDistance(C2.HumanoidRootPart.CFrame) end) 
        
        
        return Result
    end 
    print(1.5)
    function GetMeleeIdByName(MeleeName) 
        for Index, Melee in MeleesTable do 
            if Melee == MeleeName then 
                return MeleesId[Index] 
            end 
        end 
    end 

    function BuyMelee(M1, Check) 
        if Check then 
            
            local Response_ =  Remotes.CommF_:InvokeServer("Buy" .. M1, true) 
            print('Response_', Response_ == 1, typeof(Response_))
            
            return Response_ == 1 
        end 
        return Remotes.CommF_:InvokeServer("Buy" .. M1) 
    end 

    function SendKey(key, hold)
        (
            function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
                task.wait(hold)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game)
            end
        )()
    end

    function FruitIdToName(FruitId) 
        local ParserResult = string.match(FruitId, "(((%u)%-?)([^-.]+))$");
        
        return ParserResult .. " Fruit"
    end 

    function Split(inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t = {}
        for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end
        return t
    end

    function FruitNameToId(FruitName) 
        local Id = Split(FruitName)[1]
        return Id .. "-" .. Id
    end 

    local QuestManager = {
        CurrentLevel = 2, 
        DoubleQuest = true, 
        CurrentQuests = {},
        BlacklistedQuestIds = {
            BartiloQuest = 1, 
            CitizenQuest = 1, 
            Trainees = 1, 
            MarineQuest = 1, 
            ImpelQuest = 1
        }
    } 

    local NpcList = require(game.ReplicatedStorage.GuideModule).Data.NPCList

    repeat task.wait() until game.Players.LocalPlayer.DataLoaded and ScriptStorage 

    QuestManager.Quests = require(game.ReplicatedStorage.Quests) 

    function QuestManager.Set(Self, Index, Value) 
        Self[Index] = Value
    end 

    function QuestManager.RefreshQuest(Self) 
        
        while not ScriptStorage.PlayerData.Level  do 
            task.wait(1) 
            print("[ Debug ] Waiting for LocalPlayer datas.")
        end 
        
        local QuestLevelFlag = 0  
        local CurrentQuestData 
        
            
        for QuestID, QuestDatas in QuestManager.Quests do 
            if not QuestManager.BlacklistedQuestIds[QuestID] then
                
                
                if ( QuestDatas[1].LevelReq >= QuestLevelFlag and QuestDatas[1].LevelReq <= ScriptStorage.PlayerData.Level ) then
                    
                    
                    QuestLevelFlag = QuestDatas[1].LevelReq  
                    CurrentQuestData = QuestDatas
                    Self.CurrentQuestId = QuestID
                    if ScriptStorage.PlayerData.Level >= 1500 and SeaIndex == 2 and QuestID == "ForgottenQuest" then 
                        break 
                    end 
                end
            end
        end
        
        
        local LastQuest = CurrentQuestData[#CurrentQuestData] 
        
        for _, Count in LastQuest.Task do 
            if Count == 1 then 
                table.remove(CurrentQuestData, #CurrentQuestData)
            end 
        end 
        
        for i, v in require(game.ReplicatedStorage.GuideModule).Data.NPCList do
            
            for i1, v1 in v.Levels do
                
                if v1 == CurrentQuestData[#CurrentQuestData].LevelReq then
                    Self.CurrentNpc = i.CFrame
                end
            end
        end 
        
        
        Self.CurrentQuests = CurrentQuestData 
    end

    function QuestManager.GetCurrentQuest(Self) 
        
        local QuestIndex = Self.CurrentQuests[Self.CurrentLevel] and Self.CurrentQuests[Self.CurrentLevel].LevelReq <= ScriptStorage.PlayerData.Level and Self.CurrentLevel or 1 
        
    
        for Name in Self.CurrentQuests[QuestIndex].Task do 
            
            return Name, Self.CurrentNpc, Self.CurrentQuestId, QuestIndex, Self.CurrentQuests[QuestIndex].Name
        end 
    end 

    function QuestManager.MarkAsCompleted(Self)
        Self.CurrentLevel = Self.CurrentLevel == 2 and 1 or 2
    end  

    function QuestManager.AbandonQuest() 
        print("Abandon quest")
        Remotes.CommF_:InvokeServer("AbandonQuest")
    end 

    function QuestManager.GetCurrentClaimQuest(RawResponse) 

        
        local QuestTitle = game.Players.LocalPlayer.PlayerGui.Main.Quest .Visible and game.Players.LocalPlayer.PlayerGui.Main.Quest .Container.QuestTitle.Title.Text:gsub("%s*Defeat%s*(%d*)%s*(.-)%s*%b()", "%2")
        return ( type(QuestTitle) == "string" and string.gsub(QuestTitle, "Military ", "Mil. ") or QuestTitle ), game.Players.LocalPlayer.PlayerGui.Main.Quest .Container.QuestTitle.Title.Text
    end 

    function QuestManager.StartQuest(QuestId, QuestLevel) 
        
        return Remotes.CommF_:InvokeServer("StartQuest", QuestId, QuestLevel) 
        
    end

    local RawMobRegions = game:HttpGet("https://raw.githubusercontent.com/eltrul/shioru/refs/heads/main/hello.json") 

    ScriptStorage.MobRegions = {} 

    for Name, Positions in Services.HttpService:JSONDecode(RawMobRegions) do 
        ScriptStorage.MobRegions[Name] = {} 
        for _, Position in Positions do 
            table.insert( ScriptStorage.MobRegions[Name], Vector3.new(Position[1], Position[2], Position[3])) 
        end 
    end 

    TweenController = {} 


    local LastestTeleportToHomePoint = 0
    local Entries = {} 

    for _, NPC in game.ReplicatedStorage.NPCs:GetChildren() do 
        if NPC.Name == "Set Home Point" then 
            table.insert(Entries, NPC:GetModelCFrame())
        end 
    end 

    function TweenController.Update() 

        
        local Part = game.Players.LocalPlayer.Character.HumanoidRootPart
        
        
        HumanoidRootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") 
        
        if CaculateDistance(Part.CFrame) > 250 then
            pcall(function() 
                TweenInstance:Cancel()
            end) 
            TweenDebounce = true
            
            Part.CFrame = HumanoidRootPart.CFrame
            
            
            TweenDebounce = false
        end
        
        HumanoidRootPart.CFrame = Part.CFrame+Vector3.new(0,3,0)
    end



    function GetPortal(Position) 
        local Nearest, Current = 9e9, nil
        for _, Portal in Portals do
            local Dist1 = CaculateDistance(Portal, Position)
            if Dist1 < ( CaculateDistance(Position)-300 ) and Dist1 < Nearest then 
                Nearest = Dist1 
                Current = Portal
                
            end 
        end 
        
        if Current then 
            Remotes.CommF_:InvokeServer("requestEntrance", Current)
            return task.wait()
        end 
    end 

    function GetEntries(Position) 
        local Nearest, Current = 9e9, nil
        for _, Entry in Entries do
            local Dist1 = CaculateDistance(Entry, Position)
            if Dist1 < ( CaculateDistance(Position) - 700 ) and Dist1 < Nearest then 
                Nearest = Dist1 
                Current = Entry
                
            end 
        end 
        
        if Current then 
            if os.time() - LastestTeleportToHomePoint > 30 then 
                for i=1,10,1 do 
                    task.wait() 
                    
                end 
            end 
        end 
    end 

    function TweenController.Tween2(ePart, Position) 
        TweenInstance2 = Services.TweenService:Create(
                ePart,
                TweenInfo.new(CaculateDistance(ePart.CFrame, Position) / 50, Enum.EasingStyle.Linear),
                {CFrame = ConvertTo(CFrame, Position)-Vector3.new(0,0,0)}
            )
        TweenInstance2:Play()
    end

    function TweenController.Create(Position)
        
        
        if not Position or TweenDebounce then return end 
        local Position = typeof(Position) ~= "CFrame" and ConvertTo(CFrame, Position) or Position
        
        
        if TweenInstance then 
            pcall(function() 
                TweenInstance:Cancel() 
            end)
        end 
        
        for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        local head = game.Players.LocalPlayer.Character:WaitForChild("Head")
        if not head:FindFirstChild("eltrul") then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Name = "eltrul"
            bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = head
        end
    
    if CaculateDistance(Position) > 500 then 
            if SeaIndex == 3 and not ScriptStorage.Backpack["Valkyrie Helm"] then 
            elseif SeaIndex ~= 3 then 
                GetPortal(Position) 
            end 
        
    end 
        
        
        
        Position = CFrame.new(Position.Position)
        
        local Dist = CaculateDistance(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, Position)
        local playerpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(playerpos.x, Position.y, playerpos.z)
        TweenInstance = Services.TweenService:Create(
                game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(Dist / (Dist < 18 and 25 or 330) , Enum.EasingStyle.Linear),
                {CFrame = Position}
            ) 
        TweenInstance:Play()
    end

    local AttackController = {} 

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local Player = Players.LocalPlayer
    local Modules = ReplicatedStorage:WaitForChild("Modules")
    local Net = Modules:WaitForChild("Net")
    local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
    local RegisterHit = Net:WaitForChild("RE/RegisterHit")
    local ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")
    local GunValidator = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Validator2")
    local AttackConfig = {
        AttackDistance = 65,
        AttackMobs = true,
        AttackPlayers = true,
        AttackCooldown = 0.05,
        ComboResetTime = 0.05,
        MaxCombo = 2,
        HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"},
        AutoClickEnabled = true
    }
    local FastAttack = {}
    FastAttack.__index = FastAttack
    function FastAttack.new()
        local self = setmetatable({
            Debounce = 0,
            ComboDebounce = 0,
            ShootDebounce = 0,
            M1Combo = 0,
            EnemyRootPart = nil,
            Connections = {},
            Overheat = {Dragonstorm = {MaxOverheat = 3, Cooldown = 0, TotalOverheat = 0, Distance = 350, Shooting = false}},
            ShootsPerTarget = {["Dual Flintlock"] = 2},
            SpecialShoots = {["Skull Guitar"] = "TAP", ["Bazooka"] = "Position", ["Cannon"] = "Position", ["Dragonstorm"] = "Overheat"}
        }, FastAttack)    
        pcall(function()
            self.CombatFlags = require(Modules.Flags).COMBAT_REMOTE_THREAD
            self.ShootFunction = getupvalue(require(ReplicatedStorage.Controllers.CombatController).Attack, 9)
            local LocalScript = Player:WaitForChild("PlayerScripts"):FindFirstChildOfClass("LocalScript")
            if LocalScript and getsenv then
                self.HitFunction = getsenv(LocalScript)._G.SendHitsToServer
            end
        end)    
        return self
    end
    function FastAttack:IsEntityAlive(entity)
        local humanoid = entity and entity:FindFirstChild("Humanoid")
        return humanoid and humanoid.Health > 0
    end
    function FastAttack:CheckStun(Character, Humanoid, ToolTip)
        local Stun = Character:FindFirstChild("Stun")
        local Busy = Character:FindFirstChild("Busy")
        if Humanoid.Sit and (ToolTip == "Sword" or ToolTip == "Melee" or ToolTip == "Blox Fruit") then
            return false
        elseif Stun and Stun.Value > 0 or Busy and Busy.Value then
            return false
        end
        return true
    end
    function FastAttack:GetBladeHits(Character, Distance)
        local Position = Character:GetPivot().Position
        local BladeHits = {}
        Distance = Distance or AttackConfig.AttackDistance    
        local function ProcessTargets(Folder, CanAttack)
            for _, Enemy in ipairs(Folder:GetChildren()) do
                pcall(function()
                    if Enemy ~= Character and self:IsEntityAlive(Enemy) then
                        local BasePart = Enemy:FindFirstChild(AttackConfig.HitboxLimbs[math.random(#AttackConfig.HitboxLimbs)]) or Enemy:FindFirstChild("HumanoidRootPart")
                        if BasePart and (Position - BasePart.Position).Magnitude <= Distance then
                            if not self.EnemyRootPart then
                                self.EnemyRootPart = BasePart
                            else
                                table.insert(BladeHits, {Enemy, BasePart})
                                table.insert(BladeHits, {})
                            end
                        end
                    end
                end)
            end
        end    
        if AttackConfig.AttackMobs then pcall(ProcessTargets, Workspace.Enemies) end
        if AttackConfig.AttackPlayers then pcall(ProcessTargets, Workspace.Characters, true) end    
        return BladeHits
    end
    function FastAttack:GetClosestEnemy(Character, Distance)
        local BladeHits = self:GetBladeHits(Character, Distance)
        local Closest, MinDistance = nil, math.huge 
        for _, Hit in ipairs(BladeHits) do
            local Magnitude = (Character:GetPivot().Position - Hit[2].Position).Magnitude
            if Magnitude < MinDistance then
                MinDistance = Magnitude
                Closest = Hit[2]
            end
        end
        return Closest
    end
    function FastAttack:GetCombo()
        local Combo = (tick() - self.ComboDebounce) <= AttackConfig.ComboResetTime and self.M1Combo or 0
        Combo = Combo >= AttackConfig.MaxCombo and 1 or Combo + 1
        self.ComboDebounce = tick()
        self.M1Combo = Combo
        return Combo
    end
    function FastAttack:ShootInTarget(TargetPosition)
        local Character = Player.Character
        if not self:IsEntityAlive(Character) then return end
        
        local Equipped = Character:FindFirstChildOfClass("Tool")
        if not Equipped or Equipped.ToolTip ~= "Gun" then return end    
        local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or 0.3
        if (tick() - self.ShootDebounce) < Cooldown then return end    
        local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
        if ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
            Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
            GunValidator:FireServer(self:GetValidator2())        
            if ShootType == "TAP" then
                Equipped.RemoteEvent:FireServer("TAP", TargetPosition)
            else
                ShootGunEvent:FireServer(TargetPosition)
            end
            self.ShootDebounce = tick()
        else
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait(0.05)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            self.ShootDebounce = tick()
        end
    end
    function FastAttack:GetValidator2()
        local v1 = getupvalue(self.ShootFunction, 15)
        local v2 = getupvalue(self.ShootFunction, 13)
        local v3 = getupvalue(self.ShootFunction, 16)
        local v4 = getupvalue(self.ShootFunction, 17)
        local v5 = getupvalue(self.ShootFunction, 14)
        local v6 = getupvalue(self.ShootFunction, 12)
        local v7 = getupvalue(self.ShootFunction, 18)
        
        local v8 = v6 * v2
        local v9 = (v5 * v2 + v6 * v1) % v3
        v9 = (v9 * v3 + v8) % v4
        v5 = math.floor(v9 / v3)
        v6 = v9 - v5 * v3
        v7 = v7 + 1    
        setupvalue(self.ShootFunction, 15, v1)
        setupvalue(self.ShootFunction, 13, v2)
        setupvalue(self.ShootFunction, 16, v3)
        setupvalue(self.ShootFunction, 17, v4)
        setupvalue(self.ShootFunction, 14, v5)
        setupvalue(self.ShootFunction, 12, v6)
        setupvalue(self.ShootFunction, 18, v7)
        
        return math.floor(v9 / v4 * 16777215), v7
    end
    function FastAttack:UseNormalClick(Character, Humanoid, Cooldown)
        self.EnemyRootPart = nil
        local BladeHits = self:GetBladeHits(Character)
        
        if self.EnemyRootPart then
            RegisterAttack:FireServer(Cooldown)
            if self.CombatFlags and self.HitFunction then
                self.HitFunction(self.EnemyRootPart, BladeHits)
            else
                RegisterHit:FireServer(self.EnemyRootPart, BladeHits)
            end
        end
    end
    function FastAttack:UseFruitM1(Character, Equipped, Combo)
        local Targets = self:GetBladeHits(Character)
        if not Targets[1] then return end
        
        local Direction = (Targets[1][2].Position - Character:GetPivot().Position).Unit
        Equipped.LeftClickRemote:FireServer(Direction, Combo)
    end
    function FastAttack:Attack()
        if not AttackConfig.AutoClickEnabled or (tick() - self.Debounce) < AttackConfig.AttackCooldown then return end
        local Character = Player.Character
        if not Character or not self:IsEntityAlive(Character) then return end
        
        local Humanoid = Character.Humanoid
        local Equipped = Character:FindFirstChildOfClass("Tool")
        if not Equipped then return end
        
        local ToolTip = Equipped.ToolTip
        if not table.find({"Melee", "Blox Fruit", "Sword", "Gun"}, ToolTip) then return end
        
        local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or AttackConfig.AttackCooldown
        if not self:CheckStun(Character, Humanoid, ToolTip) then return end
        
        local Combo = self:GetCombo()
        Cooldown = Cooldown + (Combo >= AttackConfig.MaxCombo and 0.05 or 0)
        self.Debounce = Combo >= AttackConfig.MaxCombo and ToolTip ~= "Gun" and (tick() + 0.05) or tick()
        
        if ToolTip == "Blox Fruit" and Equipped:FindFirstChild("LeftClickRemote") then
            self:UseFruitM1(Character, Equipped, Combo)
        elseif ToolTip == "Gun" then
            local Target = self:GetClosestEnemy(Character, 120)
            if Target then
                self:ShootInTarget(Target.Position)
            end
        else
            self:UseNormalClick(Character, Humanoid, Cooldown)
        end
    end
    print(2000)
    local AttackInstance = FastAttack.new()
    table.insert(AttackInstance.Connections, RunService.Stepped:Connect(function()
    end))
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and iscclosure(v) then
            local name = debug.getinfo(v).name
            if name == "Attack" or name == "attack" or name == "RegisterHit" then
                hookfunction(v, function(...)
                    AttackInstance:Attack()
                    return v(...)
                end)
            end
        end
    end

    local Modules = game.ReplicatedStorage.Modules
    local Net = Modules.Net
    local Register_Hit, Register_Attack = Net:WaitForChild("RE/RegisterHit"), Net:WaitForChild("RE/RegisterAttack")
    local Funcs = {}
    function GetAllBladeHits()
        bladehits = {}
        for _, v in pairs(workspace.Enemies:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 
            and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 65 then
                table.insert(bladehits, v)
            end
        end
        return bladehits
    end
    function Getplayerhit()
        bladehits = {}
        for _, v in pairs(workspace.Characters:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 
            and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 65 then
                table.insert(bladehits, v)
            end
        end
        return bladehits
    end

    local Net = (Services.ReplicatedStorage.Modules.Net)

    local RegisterAttack = require(Net):RemoteEvent("RegisterAttack", true)
    local RegisterHit = require(Net):RemoteEvent("RegisterHit", true)

    function Funcs:Attack()
        
        
        local bladehits = {}
        for r,v in pairs(GetAllBladeHits()) do
            table.insert(bladehits, v)
    
        end
        for r,v in pairs(Getplayerhit()) do
            table.insert(bladehits, v)
        end
        
        if #bladehits == 0 then
            
            return
        end
        
        local args = {
            [1] = nil;
            [2] = {},
            [4] = "078da341"
        }
        for r, v in pairs(bladehits) do
            
            
            RegisterAttack:FireServer(0)
            if not args[1] then
                args[1] = v.Head
            end
            table.insert(args[2], {
                [1] = v,
                [2] = v.HumanoidRootPart
            })
            table.insert(args[2], v)
        end
        
        
        RegisterHit:FireServer(unpack(args))
    end

    task.spawn(function() 
        while task.wait(.06) do 
            if _G.FastAttack == os.time() then 
                pcall(function() 
                    
                    Funcs:Attack() 
                end)
            end 
        end
    end)

    function AttackController.Attack(MonResult) 
        pcall(function() 
            _G.FastAttack = os.time()
        end)
    end 

    CombatController = {
        GRAB = true, 
        GRAB_DISTANCE = SeaIndex == 1 and 250 or 350, 
        
        MAX_ATTACK_DURATION = 3, 
        MAX_ATTACK_DURATION_2 = 60, 
        LEVITATE_TIME = 1, 
        
        CurrentIndex = 1, 
    }

    LastFound = os.time()

    function CombatController.Grab(MobName) 
        
        pcall(sethiddenproperty, game.Players.LocalPlayer, "SimulationRadius", math.huge)
    if not CombatController.GRAB or GrabDebounce == os.time() 
        then  end 
        GrabDebounce = os.time()
        
        local MidPoint, Count = Vector3.zero, 0 
        ForcePosition = nil 
        local MobsTable = {} 
        
        for _, Mon in Services.Workspace.Enemies:GetChildren() do 
            
            if Mon.Name == MobName then 
                
                if --not Mon:GetAttribute("IsGrabbedreci") and 
                Mon:FindFirstChild("Humanoid") and Mon.Humanoid.Health > 0 then
                    
                    local MonPosition = Mon.HumanoidRootPart.Position 
                    if MonPosition and isnetworkowner(Mon.PrimaryPart) then 
                        if not ForcePosition or CaculateDistance(MonPosition, ForcePosition) < CombatController.GRAB_DISTANCE 
                        then
                            
                            
                            Count = Count + 1 
                            Mon:SetAttribute("OldPosition", Mon:GetAttribute("OldPosition") or MonPosition)
                            MidPoint = 
                            MidPoint + MonPosition
                            ForcePosition = ForcePosition or MonPosition
                            
                            table.insert(MobsTable, Mon) 
                        end
                    end
                end
            end
        end 
        MidPoint = CFrame.new( MidPoint / Count )
        
        table.foreach(MobsTable, function(_, ChildInstance) 
            (function() 
                if ChildInstance:GetAttribute("IgnoreGrab") then return end
                if (ChildInstance:GetAttribute("FailureCount") or 0) > 7 then return end
                local RootPart = ChildInstance:FindFirstChild("HumanoidRootPart")
                local BodyVelocity = RootPart:FindFirstChild("FarmingVelocity")
                if not BodyVelocity then
                    BodyVelocity = Instance.new("BodyVelocity")
                    BodyVelocity.Name = "FarmingVelocity"
                    BodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
                    BodyVelocity.Parent = RootPart
                end
                
                BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                
                local BodyPosition = RootPart:FindFirstChild("FarmingPosition")
                if not BodyPosition then
                    BodyPosition = Instance.new("BodyPosition")
                    BodyPosition.Name = "FarmingPosition"
                    BodyPosition.MaxForce = Vector3.new(4000, 4000, 4000)
                    BodyPosition.P = 4.12
                    BodyPosition.D = 1000
                    BodyPosition.Parent = RootPart
                end
                ChildInstance:SetAttribute("IsGrabbed", true)
                ChildInstance.HumanoidRootPart.CFrame = MidPoint
                
                ChildInstance:SetAttribute("MidPoint", MidPoint)
            end)()
        end)
    end 

    function Sort1(N) 
        return N and N:FindFirstChild("HumanoidRootPart") and math.floor(CaculateDistance(N.HumanoidRootPart.CFrame))
    end 

    function CombatController.Search(MobTable) 
        
        local Lists = {}
        local Found = false
        for _, ChildInstance in GetMonAsSortedRange() do
            if table.find(MobTable, ChildInstance.Name) and ChildInstance:FindFirstChild("Humanoid") and ChildInstance.Humanoid.Health > 0 then 
                if (ChildInstance:GetAttribute("FailureCount") or 0) < 3 then 
                    Found = true
                    table.insert(Lists, ChildInstance) 
                end 
            end
        end
        
        table.sort(Lists, function(a, b) 
            return Sort1(a) < Sort1(b)
        end)
        
        if Found then 
            local Mon1 = Lists[1] 
            return Mon1
        end
        
        for _, ChildName in MobTable do 
            local MonResult2 = game.ReplicatedStorage:FindFirstChild(ChildName) 
            if MonResult2 then 
                return MonResult2
            end 
        end 
    end 

    function CombatController.Attack(MobTable, NearbyHit, Range, Callback)
        
        if ScriptStorage.Tools["Sweet Chalice"] and getsenv(game.ReplicatedStorage.GuideModule)['_G']['InCombat'] then 
            TweenController.Create(Vector3.new(0,0,0)) 
            return
        end
        
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        MobTable = type(MobTable) == "string" and {MobTable} or ( MobTable or {} ) 
        
        for _, Child in (MobTable) do
            local ChildName = tostring(Child)
            if ChildName == "Deandre" or ChildName == "Urban" or ChildName == "Diablo" and (os.time() - (LastFire12 or 0)) > 180 then 
                LastFire12 = os.time()
                Remotes.CommF_:InvokeServer("EliteHunter")
            end 
            
            if NearbyHit then  
                local Mon = GetMonAsSortedRange()[1]
                
                local MonPosition = Mon and Mon:FindFirstChild("HumanoidRootPart") and Mon.HumanoidRootPart.Position 
                if MonPosition and
                CaculateDistance(MonPosition) < Range then 
                
                    MonResult = Mon
                    
                end 
            else 
                MonResult = CombatController.Search(MobTable)
                
            end 
            
            
            if MonResult then
                LastFound = os.time()
                local Count, Debounce = 0, os.time()
                local Count2, Debounce = 0, os.time()
                while task.wait() do
                    if _G.Stop then return end
                    
                    
                    if ScriptStorage.Tools["Sweet Chalice"] and getsenv(game.ReplicatedStorage.GuideModule)['_G']['InCombat'] then 
                        TweenController.Create(Vector3.new(0,0,0)) 
                        return
                    end 
                    
                    
                    local MobHumanoid = MonResult:FindFirstChild("Humanoid")
                    local MobHumanoidRootPart = MonResult:FindFirstChild("HumanoidRootPart")
                    
                    if not MobHumanoid or MobHumanoid.Health <= 0 then 
                        if MonResult.Name == "Don Swan" then 
                            Storage:Set("SwanDefeated", true)
                            Hop()
                        end 
                        break
                    end 
                    
                    

                
                
                    TweenController.Create(CaculateCircreDirection(MobHumanoidRootPart.CFrame) + Vector3.new(0,35,0))
                    
                        
                    
                    if CaculateDistance(MobHumanoidRootPart.Position + Vector3.new(0,35,0)) < 150 then
                        _ = Callback and Callback()
                        CombatController.Grab(Child or "")
                        if MonResult.Name ~= "Core" then 
                            if ScriptStorage.PlayerData.Level > 100 and Count2 >= CombatController.MAX_ATTACK_DURATION_2 and MobHumanoid.Health - MobHumanoid.MaxHealth == 0 then 
                                SetTask("SubTask", "Hop Server - Mob Health Unchanged ( " .. MobHumanoid.Health .. " / " .. MobHumanoid.MaxHealth .. ")")
                                _G.Stop = true
                                Hop("Mob Health Stuck")
                            end
                            
                            if ( MonResult:GetAttribute("FailureCount") or 0 ) > 5 then 
                                Hop("Failed to attack")
                            end 
                            if Count >= CombatController.MAX_ATTACK_DURATION and MobHumanoid.Health - MobHumanoid.MaxHealth == 0 then 
                                Count = 0 
                                
                                local OldPosition = MonResult:GetAttribute("OldPosition") 
                                
                                if OldPosition then
                                    MonResult:SetPrimaryPartCFrame(CFrame.new(OldPosition))
                                    MonResult:SetAttribute("IgnoreGrab", true)
                                    MonResult:SetAttribute("FailureCount", (MonResult:GetAttribute("FailureCount") or 0) + 1)
                                    while CaculateDistance(MonResult.HumanoidRootPart.CFrame,OldPosition) > 6 and task.wait() do 
                                        MonResult.HumanoidRootPart.CFrame = (CFrame.new(OldPosition)) 
                                    end 
                                    
                                    task.wait()
                                    
                                    return 
                                end 
                            end
                        end
                        FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call(ScriptStorage.ForceToUseSword and "Sword" or "Melee")
                        
                        
                        AttackController:Attack(MonResult)
                        if os.time() ~= Debounce then 
                            Debounce = os.time()
                            
                            Count = Count + 1
                            Count2 = Count2 + 1
                        end 
                        if Count > 30 and MonResult.Name ~= "Core" then
                            break
                        end
                        
                    else 
                        
                        return
                    end  
                end
            elseif not NearbyHit then 
                
                if (os.time() - LastFound) > 200 then 
                    Hop("Attack time is bigger than 180, hop")
                    return
                end 
                
                local Region = ScriptStorage.MobRegions[Child] 
                
                if not Region then 
                    local Inst = Services.Workspace.Enemies:FindFirstChild(Child) or game.ReplicatedStorage:FindFirstChild(Child) 
                    
                    Region = Inst and {Inst:GetPrimaryPartCFrame().p} 
                end 
                
                if not Region then 
                    Report("[ Game data error ] Mob with name ".. tostring(Child) .. " have no spawn region datas")
                    return 
                end
                
                local CurrentPosition
                
                if not Region[CombatController.CurrentIndex] then 
                    CombatController.CurrentIndex = 1
                    
                end 
                
                CurrentPosition = Region[CombatController.CurrentIndex] 
                
                local Count2 = os.time()
                
                
                    
            
            TweenController.Create(CurrentPosition+Vector3.new(0,35,35))
            task.wait()
            if CaculateDistance(CurrentPosition+ Vector3.new(0,35,35)) < 15 then
                
                    CombatController.CurrentIndex = CombatController.CurrentIndex + 1
                end
        
                task.wait()
            end
        end 
    end 


    LevelFarmTTL = 0 
    LastTravel = os.time() 

    FunctionsHandler = {
        Initalized = false 
    }; 

    print(3000)
    setmetatable(FunctionsHandler, {
        __index = function(Self, Index) 
            QueryResult = rawget(Self, Index) 
            
            if not QueryResult then 
                
                return {
                    Register = function(Coditional) 
                        if Coditional == false then return end 
                        
                        Result = {
                            CacheListener = {}, 
                            RealCache = {},
                            Methods = {}, 
                            Constants = {}, 
                            Events = {}, 
                            Initalized = true
                        } 
                        
                        function Result.RegisterMethod(Self, Name, Function) 
                            Self.Methods[Name] =
                            {
                                Name = Name, 
                                Callback = Function,
                                Call = function(Self, ...) 
                                    return Self.Callback(...) 
                                    
                                end, 
                                Events = {} 
                                
                            }
                            return true
                            
                        end 
                        
                        setmetatable(Result.Constants, {
                                __newindex = function() 
                                    assert(false, "cannot change constant value!") 
                                    
                            end
                        })
                    
                            if Self.Constants[Key] then  
                        function Result.SaveConstant(Self, Key, Value) 
                                return assert(false, "constant name was used before!") 
                            end 
                            
                            rawset(Self.Constants, Key, Value)
                            
                        end 
                        
                        function Result.Set(Self, Key, Value) 
                            Self.CacheListener[Key] = Value 
                            return Value
                            
                        end
                        
                        function Result.Get(Self, Index) 
                            return Self.Constants[Index] or Self.RealCache[Index]
                            
                        end 
                        
                        function Result.AddVariableChangeListener(Self, Index, Callback) 
                            Self.Events[Index] = Callback
                            
                        end
                        
                        Result.CacheListener.__parent = Result; 
                        
                        setmetatable(Result.CacheListener, {
                            __newindex = function(Self, Key, Value) 
                                _ = Self.__parent.Events[Key] and Self.__parent.Events[Key](Key, Value)
                                
                                Self.__parent.RealCache[Key] = Value
                                
                            end 
                        })
                        
                        
                        
                        FunctionsHandler[Index] = Result
                        
                    end, 
                    Initalized = false
                }
            end 
            
            return QueryResult
            
        end 
    })

    function FunctionsHandler.SynchorizeUntilModuleLoaded(Self, Timeout) 
        local StartTime = os.time() 
        
        while not Self.Initalized do 
            task.wait() 
            local Difference = os.time() - StartTime 
            
            assert(not ( Timeout and Difference > Timeout ), "timed out")
        end 
        
    end 





    function GetCurrentClaimQuest(RawResponse) 
        local QuestTitle = game.Players.LocalPlayer.PlayerGui.Main.Quest .Visible and game.Players.LocalPlayer.PlayerGui.Main.Quest .Container.QuestTitle.Title.Text:gsub("%s*Defeat%s*(%d*)%s*(.-)%s*%b()", "%2")
        return ( type(QuestTitle) == "string" and string.gsub(QuestTitle, "Military ", "Mil. ") or QuestTitle ), game.Players.LocalPlayer.PlayerGui.Main.Quest .Container.QuestTitle.Title.Text
    end 


    FunctionsHandler.LocalPlayerController.Register()

    FunctionsHandler.ExpRedeem:Register() 


    FunctionsHandler.LevelFarm:Register() 


    FunctionsHandler.Saber:Register()
    FunctionsHandler.Rengoku:Register()
    FunctionsHandler.Yama:Register()
    FunctionsHandler.Tushita:Register()
    FunctionsHandler.SpikeyTrident:Register()
    FunctionsHandler.SharkAchor:Register()
    FunctionsHandler.Pole:Register()
    FunctionsHandler.FoxLamp:Register()
    FunctionsHandler.DarkDagger:Register()
    FunctionsHandler.Canvander:Register()
    FunctionsHandler.BuddySword:Register()
    FunctionsHandler.HallowScythe:Register()
    FunctionsHandler.CursedDualKatana:Register()


    FunctionsHandler.AcidumRifle:Register()
    FunctionsHandler.Kabucha:Register()
    FunctionsHandler.VenomBow:Register()
    FunctionsHandler.SoulGuitar:Register()
    FunctionsHandler.DragonStorm:Register()


    FunctionsHandler.InsictV2:Register()
    FunctionsHandler.RainbowSaviour:Register()


    FunctionsHandler.DarkBladeV2:Register()
    FunctionsHandler.SecondSeaPuzzle:Register()


    FunctionsHandler.ColosseumPuzzle:Register()
    FunctionsHandler.Trevor:Register()
    FunctionsHandler.EvoRace:Register()
    FunctionsHandler.Wenlocktoad:Register()
    FunctionsHandler.DarkBladeV3:Register()
    FunctionsHandler.ThirdSeaPuzzle:Register()


    FunctionsHandler.DojoQuest:Register()
    FunctionsHandler.RaceAwakening:Register()
    FunctionsHandler.PirateRaid:Register()


    FunctionsHandler.RaidController:Register() 


    FunctionsHandler.MeleesController:Register() 

    FunctionsHandler.Superhuman:Register()
    FunctionsHandler.DeathStep:Register()
    FunctionsHandler.SharkmanKarate:Register()
    FunctionsHandler.ElectricClaw:Register()
    FunctionsHandler.DragonTalon:Register()
    FunctionsHandler.Godhuman:Register()


    FunctionsHandler.BossesTask:Register() 
    FunctionsHandler.SpecialBossesTask:Register() 
    FunctionsHandler.CollectDrops:Register() 


    FunctionsHandler.UtillyItemsActivitation:Register() 


    FunctionsHandler.ExpRedeem:RegisterMethod("Refresh", function() 
        
        
        return ScriptStorage.PlayerData.Level < MaxLevel and getsenv(game.ReplicatedStorage.GuideModule)._G.ServerData.ExpBoost == 0 and not Storage.Get(Storage, "IsCodesRanOut")
    end)

    FunctionsHandler.ExpRedeem:RegisterMethod("Start", function() 
        local Code = ({
                "BANEXPLOIT",
                "NOMOREHACK",
                "WildDares",
                "BossBuild",
                "GetPranked",
                "EARN_FRUITS",
                "Sub2UncleKizaru",
                "FIGHT4FRUIT",
                "kittgaming",
                "TRIPLEABUSE",
                "Sub2CaptainMaui",
                "Sub2Fer999",
                "Enyu_is_Pro",
                "Magicbus",
                "JCWK",
                "Starcodeheo",
                "Bluxxy",
                "SUB2GAMERROBOT_EXP1",
                "Sub2NoobMaster123",
                "Sub2Daigrock",
                "Axiore",
                "TantaiGaming",
                "StrawHatMaine",
                "Sub2OfficialNoobie",
                "TheGreatAce",
                "SEATROLLING",
                "24NOADMIN",
                "ADMIN_TROLL",
                "NEWTROLL",
                "SECRET_ADMIN",
                "staffbattle",
                "NOEXPLOIT",
                "NOOB2ADMIN",
                "CODESLIDE",
                "fruitconcepts"
            })
        
        for Index, Promo in Code do
            
            SetTask("MainTask", "Code Redemption | " .. Promo .. " | Redeeming...")
            local Response = (Remotes.Redeem:InvokeServer(Promo))
            task.wait() 
            SetTask("MainTask", "Code Redemption | " .. Promo .. " | " .. (Response or "Failed"))
            if getsenv(game.ReplicatedStorage.GuideModule)._G.ServerData.ExpBoost == 0 then 
                
                if Response and string.find(Response, "SUCC") then 
                    return SetTask("MainTask", "Code Redemption | X2 Exp Boost Activated!") and task.wait(1)
                end 
                else 
                    return  
            end
        end
        
        Storage:Set("IsCodesRanOut", 1)
        Storage:Save()
    end)




    FunctionsHandler.LevelFarm:RegisterMethod("Refresh", function() 
            local Level = ScriptStorage.PlayerData.Level 
            if Level < 50 then 
                return 1
            elseif Level < 80 then 
                return 2
            else 
                return 4
            end 
            return true 
    end)

    FunctionsHandler.LevelFarm:RegisterMethod("Start", function(Level) 
        if SeaIndex == 3 then 
            if ( ScriptStorage.Backpack.Bones or {Count = 0}).Count >= 50 and ( ScriptStorage.PlayerData.Level < MaxLevel or ForceToRollBone or ScriptStorage.PlayerData.Level >= MaxLevel ) then 
                
                if os.time() > (BonesCooldown or 0) then 
                    
                    local _, _, State, Message = Remotes.CommF_:InvokeServer("Bones", "Check") 
                    print("State", State, "Message", Message)
                    if tonumber(State or 1) == 0 then 
                        local SplitedNum = Split(Message, ":")
                        local SecondsLeft = ((tonumber(SplitedNum[1]) * 60) + tonumber(SplitedNum[2])) * 60 
                        BonesCooldown = os.time() + SecondsLeft
                        print("Next", BonesCooldown)
                    else 
                        print("Roll")
                        Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    end
                end 
            end 
        end 
        
        local PlayerLevel = ScriptStorage.PlayerData.Level 
        if GodHumanFlag then 
        
            local Material, MaterialData = (function() 
                getgenv()["     mphm >< <3"] = {}
                for Material, MaterialData in GodhumanMaterials do 
                    if ( ScriptStorage.Backpack[Material] or {Count = 0} ).Count < MaterialData[1] then 
                        getgenv()["     mphm >< <3"] = {Material, MaterialData}
                    end
                end
                
                return unpack(getgenv()["     mphm >< <3"])
            end)() 
            
            if Material then
                if SeaIndex ~= MaterialData[2] then 
                    SetTask("MainTask", "Sea Travel | Godhuman Materials | Travelling to Sea " .. MaterialData[2])
                    
                    Remotes.CommF_:InvokeServer("Travel" .. SeaIndexes[MaterialData[2]]) 
                    return 
                end 
                
                SetTask("MainTask", "Material Farming | Godhuman | " .. Material .. " | In Progress")
                
                if PlayerLevel >= MaterialData[4][3] then 
                    local QuestAvailable, CurrentClaimQuest = GetCurrentClaimQuest() 
                    if QuestAvailable then 
                        if not string.find(CurrentClaimQuest, MaterialData[3][1]) and not string.find(CurrentClaimQuest, MaterialData[3][2]) then
                            
                            QuestManager.AbandonQuest() 
                        else 
                            CombatController.Attack(MaterialData[3])
                            return
                        end
                    else
                                
                        local NpcPosition1 = ScriptStorage.NPCs[MaterialData[4][4]] 
                        NpcPosition1 = NpcPosition1 and NpcPosition1:GetModelCFrame() 
                        
                        if NpcPosition1 then
                            TweenController.Create(NpcPosition1 + Vector3.new(0,5,3)) 
                            if CaculateDistance(NpcPosition1) < 10 then 
                                task.wait(1) 
                            else 
                                return 
                            end
                        else 
                            Report("NPC HauntedQuest2 not found")
                        end 
                        QuestManager.StartQuest(MaterialData[4][1], MaterialData[4][2])
                        return
                    end
                end
                
                CombatController.Attack(MaterialData[3])

            end
            
            Remotes.CommF_:InvokeServer("BuyGodhuman", true)
            Remotes.CommF_:InvokeServer("BuyGodhuman")
            
            
            GodHumanFlag = false
            return true
        end
        
        if os.time() - LastTravel > 60 then 
            LastTravel = os.time()
            if PlayerLevel >= 1500 and SeaIndex == 2 then 
                if Config.Settings.StayInSea2UntilHaveDarkFragments and not ScriptStorage.Backpack["Dark Fragment"] then 
                elseif not Services.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then 
                    Remotes.CommF_:InvokeServer("TravelZou")
                    SetTask("MainTask", "Sea Travel | Teleporting to Third Sea")
                end 
            elseif PlayerLevel >= 700 and SeaIndex == 1 then 
                    SetTask("MainTask", "Sea Travel | Teleporting to Second Sea")
                    Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
        end 
        
        if ScriptStorage.Tools["God's Chalice"] and not ScriptStorage.Tools["Mirror Fractal"] then 
            if (ScriptStorage.Backpack["Conjured Cocoa"] or {Count = 0}).Count < 10 then 
                SetTask("MainTask", "Material Farming | Conjured Cocoa | Need 10x | Farming...")
                CombatController.Attack({"Cocoa Warrior", "Chocolate Bar Battler"}) 
                return 
            end
            Remotes.CommF_:InvokeServer("SweetChaliceNpc")
        end 
            
        if ScriptStorage.Tools["Sweet Chalice"] or ( PlayerLevel == MaxLevel and ( ScriptStorage.Backpack.Bones or {Count = 0}).Count >= 500 ) then 
            
            
            SetTask("MainTask", "Fragments Farming | Cake Prince | Dough King")
            
            
            if (ScriptStorage.Tools["Sweet Chalice"]) and ( not SpawnReflect or os.time() - SpawnReflect > 10 ) then 
                task.spawn(function() 
                    while not ScriptStorage.Enemies["Dough King"] and task.wait() and ScriptStorage.Tools["Sweet Chalice"] do 
                        SpawnReflect = os.time() 
                        Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                    end 
                end)
            end 
            
            
            CombatController.Attack({
                "Head Baker",
                "Baking Staff",
                "Cookie Crafter",
                "Cake Guard"
            }) 
        
            if PlayerLevel >= 2200 then
                local IsAvailabe, CurrentClaimQuest2 = GetCurrentClaimQuest() 
                
                
                if IsAvailabe then 
                    if not string.find(CurrentClaimQuest2, "Cookie") then
                        QuestManager.AbandonQuest() 
                    else 
                        
                        Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                        return
                    end 
                else 
                    
                    print("Start Quest")
                    
                    local NpcPosition1 = ScriptStorage.NPCs["Cake Quest Giver 1"] 
                    NpcPosition1 = NpcPosition1 and NpcPosition1:GetModelCFrame() 
                    
                    if NpcPosition1 then
                        TweenController.Create(NpcPosition1 + Vector3.new(0,5,3)) 
                        if CaculateDistance(NpcPosition1) < 10 then 
                            task.wait(1) 
                        else 
                            return 
                        end
                    else 
                        Report("NPC HauntedQuest2 not found")
                    end 
                    QuestManager.StartQuest("CakeQuest1", 1)
                    return
                end 
            end
            print("attack ohoo")
            
            
            return 
        end
        

        
        if PlayerLevel >= 2025 and (getsenv(game.ReplicatedStorage.GuideModule)._G.ServerData.ExpBoost == 0 or PlayerLevel == MaxLevel ) and ( ScriptStorage.Backpack.Bones or { Count = 0 } ).Count < 500 then 
            
            SetTask("MainTask", "Resource Farming | Bones | For X2 Mastery/Beli")

            CurrentClaimQuest3 = GetCurrentClaimQuest(true) 
            
            
            if CurrentClaimQuest3 then 
                if not string.find(CurrentClaimQuest3, "Demonic")  then
                    QuestManager.AbandonQuest() 
                    return
                else 
                    CombatController.Attack({
                        "Reborn Skeleton",
                        "Living Zombie",
                        "Demonic Soul",
                        "Posessed Mummy"
                    })
                return 
                end
            else
                print("StartQuest", CurrentClaimQuest3)
                local NpcPosition1 = ScriptStorage.NPCs["Haunted Castle Quest Giver 2"] 
                NpcPosition1 = NpcPosition1 and NpcPosition1:GetModelCFrame() 
                
                if NpcPosition1 then
                    TweenController.Create(NpcPosition1 + Vector3.new(0,5,3))
                    if CaculateDistance(NpcPosition1) < 20 then 
                        task.wait(1) 
                    else 
                        return 
                    end
                else 
                    Report("NPC HauntedQuest2 not found")
                end 
                
                QuestManager.StartQuest("HauntedQuest2", 1) 
                return
            end
        end 
        
        
        
        if Level == 1 then 
            SetTask("MainTask", "Level Farming | Skip Mode | Floor " .. Level)    
            CombatController.Attack("Sky Bandit")
        elseif Level == 2 then 
            SetTask("MainTask", "Level Farming | Skip Mode | Floor " .. Level)
            CombatController.Attack("God's Guard")
            
        elseif Level == 3 then 
            SetTask("MainTask", "Level Farming | Skip Mode | Floor " .. Level)
            CombatController.Attack({"God's Guard", "Shanda", "Royal Soldier", "Royal Squad"})
        elseif Level == 4 then
            local MonName, NpcPosition, QuestId, QuestIndex, QuestTitle = QuestManager:GetCurrentQuest() 
            
            CurrentClaimQuest1 = GetCurrentClaimQuest()
            
            
            if CurrentClaimQuest1 then 
            
                if CurrentClaimQuest1 ~= QuestTitle and  CurrentClaimQuest1 ~= ( QuestTitle .. "s" ) then
                    
                    
                    return QuestManager.AbandonQuest() 
                end 
            else 
                
                if not NpcPosition then 
                    return QuestManager:RefreshQuest() and Report("failed to get npc position quest 528")
                end 
                TweenController.Create(NpcPosition + Vector3.new(0,5,3)) 
                SetTask("MainTask", "Level Farming | " .. MonName .. " | Claiming Quest")
                if CaculateDistance(NpcPosition) > 10 then 
                    return 
                end 
                
                task.wait(2)
                LevelFarmTTL = 0 
                QuestManager.StartQuest(QuestId, QuestIndex)
                task.wait(1)
            end 

            SetTask("MainTask", "Level Farming | " .. MonName .. " | Defeating Enemies")
            local AttackTime1 = os.time()
            CombatController.Attack(MonName)
            LevelFarmTTL = LevelFarmTTL + os.time() - AttackTime1 
            if LevelFarmTTL > 160 then 
            end 
        end
    end)




    FunctionsHandler.LocalPlayerController:RegisterMethod("EquipTool", function(Tool) 
        
        if not Humanoid then return end 
        
        for _, Item in LocalPlayer.Backpack:GetChildren() do 
            if 
            Item:IsA("Tool") and Item.Name ~= "Tool"
            and (
                Item.Name == tostring(Tool)
                or Item.ToolTip == Tool
                )
            then 
                
                
                LocalPlayer.Character:WaitForChild"Humanoid":EquipTool(Item)
            end 
        end 
    end)

    FunctionsHandler.LocalPlayerController:RegisterMethod("ToggleAbilities", function(Ability, State) 
        
        if Ability == "Buso" then 
            if LocalPlayer:HasTag("Buso") and not State or State then 
                Remotes.CommF_:InvokeServer("Buso")
            end 
            
        elseif Ability == "Observation" then
            
        end 
    end)

    FunctionsHandler.LocalPlayerController:RegisterMethod("ConfigurationAbilitiesToggle", function() 
        FunctionsHandler.LocalPlayerController.Methods.ToggleAbilities:Call("Buso", SCRIPT_CONFIG.BUSO)
        FunctionsHandler.LocalPlayerController.Methods.ToggleAbilities:Call("Observation", SCRIPT_CONFIG.OBSERVATION)
    end)
    print(3)






    FunctionsHandler.Saber:RegisterMethod("Refresh", function() 
        
        if not Config.Items.Saber then return end 
        
        if not Config.Items.Saber then 
            return 
        end 
        
        local Result 
        if ScriptStorage.Backpack.Saber then 
            return 
        end 
        
        if ScriptStorage.PlayerData.Level < 200 then 
            return
        end 
        
        
        local Tasks = Remotes.CommF_:InvokeServer("ProQuestProgress") 
        for _, Value in Tasks.Plates do
            if Value == false then
                Result = 1
                
            end
        end
        
        if not Result then 
            if not Tasks.UsedTorch then
            Result = 2
                
            elseif not Tasks.UsedCup then
                Result = 3
                
            elseif not Tasks.TalkedSon then
                Result = 4
                
            elseif not Tasks.KilledMob then
                Result = 5
                
            elseif not Tasks.UsedRelic then
                Result = 6
                
            elseif
                not Tasks.KilledShanks
                and ScriptStorage.Enemies["Saber Expert"]
            then
                Result = 7
                
            end
        end 
        
        FunctionsHandler.Saber:Set("CurrentProgressLevel", Result)
        FunctionsHandler.Saber:Set("LastestRefreshSenque", os.time()) 
        
        return Result
        
    end) 

    FunctionsHandler.Saber:RegisterMethod("GetQuestplates", function() 
        
        local CachedData = FunctionsHandler.Saber:Get("QuestplatesCache") 
        
        if CachedData then
            return CachedData 
            
        end 
        
        
        
        local Jungle = Services.Workspace.Map.Jungle 
        local Result = {}
        
        table.foreach(Jungle.QuestPlates:GetChildren(), function(_, Inst) 
            _ = Inst:FindFirstChild("Button") and table.insert(Result, Inst) 
            
        end)
        
        FunctionsHandler.Saber:Get("QuestplatesCache", Result)
        
        return Result 
        
    end)

    FunctionsHandler.Saber:RegisterMethod("Start", function() 
        local 
        Progress,
            LastestRefreshSenque = 
            FunctionsHandler.Saber:Get("CurrentProgressLevel"),
        FunctionsHandler.Saber:Get("LastestRefreshSenque") 
        
        print("[ Debug ] Saber quest indexes", Progress)
        if not Progress then
            FunctionsHandler.Saber.Methods.Refresh:Call()
            return FunctionsHandler.Saber.Methods.Start:Call()
        
        elseif Progress == 0 then 
            
        elseif os.time() - LastestRefreshSenque > 60 then 
            FunctionsHandler.Saber.Methods.Refresh:Call()
            
            return FunctionsHandler.Saber.Methods.Start:Call()
        
        else
            if Progress == 1 then 
                local Questplates = FunctionsHandler.Saber.Methods.GetQuestplates:Call()
                
                for Index, Questplate in Questplates do  
                    SetTask("MainTask", "Saber Quest | Quest Plates | Touching " .. Index .. "/5")
                    while CaculateDistance(Questplate.Button.CFrame) > 20 do 
                        task.wait() 
                        TweenController.Create(Questplate.Button.CFrame)
                    end
                    task.wait(1)
                end
            
            elseif Progress == 2 then 
                SetTask("MainTask", "Saber Quest | Torch Puzzle | Using Torch")
                Remotes.CommF_:InvokeServer("ProQuestProgress", "GetTorch")
                task.wait(1) 
                Remotes.CommF_:InvokeServer("ProQuestProgress", "DestroyTorch")
                
            elseif Progress == 3 then  
                SetTask("MainTask", "Saber Quest | Sick Man | Helping with Cup")
                Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                
                if ScriptStorage.Tools.Cup then 
                    FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Cup") 
                    task.wait(1)
                    Remotes.CommF_:InvokeServer( "ProQuestProgress", "FillCup", LocalPlayer.Character.Cup)
                end
                
                Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                
            elseif Progress == 4 then 
                SetTask("MainTask", "Saber Quest | Rich Son | Getting Information")
                Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                
                
            elseif Progress == 5 then 
                SetTask("MainTask", "Saber Quest | Mob Leader | Defeating Boss")
                CombatController.Attack("Mob Leader")
                
            elseif Progress == 6 then 
                SetTask("MainTask", "Saber Quest | Relic | Placing at Location")
                Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
            
            elseif Progress == 7 then 
                SetTask("MainTask", "Saber Quest | Saber Expert | Final Battle")
                CombatController.Attack("Saber Expert")
                
            end
        end
    end)

    Remotes.RefreshQuestPro.OnClientEvent:Connect(FunctionsHandler.Saber.Methods.Refresh.Callback);



    MeleeLastCursor = 1
    FirstCall = true
    CanPurchase = {} 

    FunctionsHandler.MeleesController:RegisterMethod("Start", function()
        for Cursor, Melee in MeleesTable do
            if Melee ~= 'SanguineArt' then 
                
                
                if not Config.Items.AutoFullyMelees then
                    break 
                end 
                
                Data = MeleePrices[Melee]
                local CanMeleePurchaseable = CanPurchase[Melee] 
                if not CanMeleePurchaseable then 
                    CanPurchase[Melee] = Data.Buy(1)
                    print('CanBuy', Melee, Data.Buy(1))
                end 
                local CanMeleePurchaseable = CanPurchase[Melee] 
                
                
                if not Data then 
                    print("no m1 data")
                    break 
                end
                
                if Melee == "Dragon Talon" then 
                    IsFireEssenceGave = (function()
                        if IsFireEssenceGave ~= nil then
                            return IsFireEssenceGave
                        end 
                        
                        local PurchaseTestResult = Remotes.CommF_:InvokeServer("BuyDragonTalon", true);
                        return typeof(PurchaseTestResult) ~= "string" and true or false
                    end)()
                    
                    print("IsFireEssenceGave", IsFireEssenceGave)
                    
                    if not IsFireEssenceGave then
                        print("no fire essence provided")
                        break 
                    end 
                end 
                if Melee == "Godhuman" and not GodHumanFlag then 
                    
                    if (ScriptStorage.Melees["Dragon Talon"] or 0) > 399 then
                    
                        if not ScriptStorage.Melees.Godhuman then 
                            
                            Remotes.CommF_:InvokeServer("BuyGodhuman", true)
                            Remotes.CommF_:InvokeServer("BuyGodhuman")
                            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                            
                            if not ScriptStorage.Melees.Godhuman then 
                                
                                GodHumanFlag = true
                                return
                            end 
                        end 
                    end 
                end
                
                if not ScriptStorage.Melees[Melee] or ( ScriptStorage .Melees[Melee] or 0) < Data.NextLevelRequirement then 
                    
                    local MeleeId = GetMeleeIdByName(Melee)
                    local PlayerData = ScriptStorage.PlayerData 
                    local ValuementPassed = true 
                    
                    if not MeleeId then 
                        
                        return print("[ Debug ] Failed to get melee id of", Melee) 
                    end 
                    
                    MSet = false 
                    if not CanMeleePurchaseable then 
                        for Index, Value in Data.Price do 
                            if PlayerData[Index] < Value and not FirstCall then 
                                ValuementPassed = false 
                                            
                                    if not ScriptStorage.Melees[Melee] then 
                                        MSet = true
                                        SetTask("SubTask", "Farming Until Enough " .. Index .. " ( ".. Value .. " ) For " .. Melee)
                                    end
                                return
                            end
                        end 
                    end 
                    
                    
                    if not MSet and ScriptStorage.Melees[Melee] and ScriptStorage.Melees[Melee] < Data.NextLevelRequirement then 
                        SetTask("SubTask", "Farming Until Enough Mastery For " .. Melee .. " ( " .. ScriptStorage.Melees[Melee] .. " / " .. Data.NextLevelRequirement .. " ).") 
                        if not ScriptStorage.Tools[Melee] then 
                            print("no m1 found, buy")
                            Data.Buy() 
                        end 
                        return
                    end 
                    
                    
                    if not FirstCall then
                        if ValuementPassed and Data.Requirements() and not ScriptStorage.Tools[Melee] then
                            if Melee == "Dragon Talon" and not IsFireEssenceGave then 
                                return SetTask("SubTask", "Waiting until have fire essence for dragon talon.")
                            end 
                            
                            Data.Buy() 
                            
                            
                    
                            FunctionsHandler.LocalPlayerController.Methods.EquipTool:Call("Melee")
                            if not ScriptStorage.Tools[Melee] then
                                
                                
                                task.wait()
                                if not ScriptStorage.Tools[Melee] then 
                                    if ( Melee == "Death Step" or Melee == "Sharkman Karate" ) and SeaIndex ~= 2 then
                                        break
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
        MeleeLastCursor = 1
        FirstCall = false
    end)

    FunctionsHandler.CursedDualKatana:RegisterMethod("Refresh", function()
        local ScrollSides = {"Good", "Evil"}
        for Index = 1, 4 do
            Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", Index)
            SetTask("MainTask", "Cursed Dual Katana - " .. tostring(ScrollSides[Index]) ..
                        " " .. tostring(Index)
            )
            return false 
        end
        
        local CachedValue = ScriptStorage.CdkCache 
        
        
        if not CachedValue then return end 
        
        local Name, Level = CachedValue[1], CachedValue[2] 
        
        if Name == "Evil" and Level == 3 then 
            if not ScriptStorage.Enemies["Soul Reaper"] then 
                ForceToRollBone = true
                return
            end 
        elseif Name == "Good" then 
            if Level == 2 then 
                SetTask("SubTask", "CDK Quest / Waiting until pirate raid started")
                return 
            elseif Level == 3 and not ScriptStorage.Enemies["Cake Queen"] then 
                Hop("Cake Queen Find")
                SetTask("SubTask", "CDK Quest / Waiting until Cake Queen boss spawned") 
                return 
            end 
        end
        return CachedValue
    end)

    FunctionsHandler.CursedDualKatana:RegisterMethod("GetHazeMon", function() 
        
        local Positions = {} 
        for _, Inst in LocalPlayer.QuestHaze:GetChildren() do 
            if Inst.Value > 0 then 
                table.insert(Positions, Inst) 
            end 
        end 
        table.sort(Positions, function(C1, C2) return CaculateDistance(C1:GetAttribute("Position")) < CaculateDistance(C2:GetAttribute("Position")) end) 
        return tostring(Positions[1])
    end)

    FunctionsHandler.CursedDualKatana:RegisterMethod("DoDimension", function(DimensionName)  
        local DimensionId = string.gsub(DimensionName, " ", "") 
        
        local VaiCaNgu1234 = os.time()
        repeat task.wait()
            TweenController.Create(LocalPlayer.Character.HumanoidRootPart.CFrame)
            if os.time() - VaiCaNgu1234 > 60 then 
                return 
            end 
        until os.time() - TorchEnabledTime < 10 
        
        repeat task.wait() 
            local OriginalIsland = workspace.Map:WaitForChild(DimensionId, 10)
            if OriginalIsland then 
                
                for _, Torch in OriginalIsland:GetChildren() do 
                    if Torch and string.find(Torch.Name, "Torch") and Torch:FindFirstChild("ProximityPrompt") and Torch.ProximityPrompt.Enabled then 
                        LocalPlayer.Character.HumanoidRootPart.CFrame = Torch.CFrame 
                        
                        Torch.ProximityPrompt.HoldDuration = 0
                        task.wait(1)
                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", 0, game)
                        vim:SendKeyEvent(false, "E", 0, game)
                    
                        
                        fireproximityprompt(workspace.Map:WaitForChild(DimensionId, 10):FindFirstChild(tostring(Torch)).ProximityPrompt) 
                    
                    end 
                    for _, Mon in workspace.Enemies:GetChildren() do 
                        local MonHumanoidRootPart = Mon:FindFirstChild("HumanoidRootPart") 
                        local MonHumanoid = Mon:FindFirstChild("Humanoid") 
                        
                        if MonHumanoidRootPart and MonHumanoid and CaculateDistance(MonHumanoidRootPart.CFrame) < 1000 then 
                            
                            CombatController.Attack(Mon.Name)
                        end 
                    end
                end 
                ExitDoor = OriginalIsland:FindFirstChild("Exit") 
                print("exit door", ExitDoor)
                if ExitDoor then 
                    PortalBrick = tostring(ExitDoor.BrickColor)
                    print("Brick color", ExitDoor, ExitDoor.BrickColor, PortalBrick)
                end 
            else 
                print("no island idk wt-")
            end
            print("loop damn", PortalBrick)
        until PortalBrick == "Olivine" or PortalBrick == "Cloudy grey" 
        print("leave")
        while os.time() - DoneCdkTick > 15 do 
            TweenController.Create(ExitDoor.CFrame + Vector3.new(0, math.random(1,5), 0)) 
            task.wait() 
        end 
        
        Hop("Rejoin")
    end) 

    FunctionsHandler.CursedDualKatana:RegisterMethod("Start", function(CachedData) 
        local CursedTemple = workspace.Map.Turtle.Cursed
        if CachedData[1] == "break" then 
            TweenController.Create(workspace.Map.Turtle.Cursed.Breakable.CFrame)
            Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
            Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
            workspace.Map.Turtle.Cursed.Breakable:Destroy()
            CdkProgess = nil  
            return 
        end 
        if CachedData[1] == "burn 2" then
            if workspace.Map.Turtle.Cursed.Pedestal3.ProximityPrompt.Enabled then 
                fireproximityprompt(workspace.Map.Turtle.Cursed.Pedestal3.ProximityPrompt)
                task.wait(1) 
                pcall(function() 
                    LocalPlayer.Character.Humanoid.Health = 0
                end)
                task.wait(10)
            else
                CDKAttempts = ( CDKAttempts or 0 ) + 1
                TweenController.Create(CFrame.new(-12341.66796875, 603.3455810546875, -6550.6064453125)) 
                task.wait(5) 
                
                pcall(function() 
                    LocalPlayer.Character.Humanoid.Health = 0
                end)
                task.wait(5)
                if CDKAttempts > 5 then 
                    Hop("CDK Stuck")
                end
                
                CdkProgess = nil  
            end
        elseif CachedData[1] == "burn" then 
            for Index = 1, 3, 1 do
                local Pedestal = workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. Index) 
                
                if workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. Index) .ProximityPrompt.Enabled then 
                    repeat task.wait() 
                        TweenController.Create(workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. Index) .CFrame) 
                    until CaculateDistance(workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. Index) .CFrame) < 5
                    
                    fireproximityprompt(workspace.Map.Turtle.Cursed:FindFirstChild("Pedestal" .. Index) .ProximityPrompt)
                    task.wait(3) 
                    pcall(function() 
                        LocalPlayer.Character.Humanoid.Health = 0
                    end) 
                end 
                CdkProgess = nil  
            end 
            
        elseif CachedData[1] == "Evil" then 
            if CachedData[2] == 1 then 
                local Mob = ScriptStorage.Enemies["Forest Pirate"] 
                
                TweenController.Create((Mob and Mob.HumanoidRootPart.CFrame) or ScriptStorage.MobRegions["Forest Pirate"][0])
                CdkProgess = nil  
            elseif CachedData[2] == 2 then 
                CombatController.Attack(FunctionsHandler.CursedDualKatana.Methods.GetHazeMon:Call())
                CdkProgess = nil  
            elseif CachedData[2] == 3 then 
                Report("found cdk yama 3")
                while not ( os.time() - TorchEnabledTime < 100 or not ScriptStorage.Enemies["Soul Reaper"] )  do
                    print("tweening to soul reaper ")
                    task.wait()
                                
                    if FunctionsHandler.RaidController.Methods.GetCurrentRaidIsland:Call() then 
                        pcall(function() 
                            LocalPlayer.Character.Humanoid.Health = 0
                        end) 
                    end 
                    
                    TweenController.Create(ScriptStorage.Enemies["Soul Reaper"]:GetModelCFrame())
                end  
                if not ScriptStorage.Enemies["Soul Reaper"] then return end
                FunctionsHandler.CursedDualKatana.Methods.DoDimension.Callback("Hell Dimension")
                CdkProgess = nil  
            end 
        else
            if CachedData[2] == 1 then 
                for _, NPC in game.ReplicatedStorage.NPCs:GetChildren() do 
                    if NPC.Name == "Luxury Boat Dealer" then 
                        repeat task.wait() 
                            if os.time() - DoneCdkTick < 15 then return end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (NPC:GetModelCFrame()) 
                            RealNPC = nil
                            for _, npc in workspace.NPCs:GetChildren() do 
                                if CaculateDistance(npc:GetModelCFrame(), NPC:GetModelCFrame()) < 20 then 
                                    RealNPC = npc 
                                    break
                                end 
                            end 
                        until CaculateDistance(NPC:GetModelCFrame()) < 5 and RealNPC 
                        
                        Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", RealNPC) 
                    end
                end
                CdkProgess = nil  
            elseif CachedData[2] == 3 then 
                repeat task.wait() 
                    print("attacking cake queen")
                    CombatController.Attack("Cake Queen")
                until os.time() - TorchEnabledTime < 10 or not ScriptStorage.Enemies["Cake Queen"]
                
                TweenController.Create(LocalPlayer.Character.HumanoidRootPart.CFrame)
                Report("Cake Queen")
                FunctionsHandler.CursedDualKatana.Methods.DoDimension.Callback("Heavenly Dimension")
                CdkProgess = nil  
            end 
        end
    end)

    local Hooks = {
        Listeners = {}
    } 

    TorchEnabledTime = 0 
    DoneCdkTick = 0 

    getgenv().NotificationCallBack = (function(Content)
        for ListenerContent, Callback in Hooks.Listeners do
            if string.find(string.lower(Content), string.lower(ListenerContent)) then 
                Callback(Content)
            end 
        end 
    end) 

    function Hooks:RegisterNotifyListener(Senque, Callback)
        Hooks.Listeners[Senque] = Callback
    end 
        
    Hooks:RegisterNotifyListener("go!", function() 
        LastRaidAlert = os.time()
    end) 
    Hooks:RegisterNotifyListener("oadi", function() 
        LastRaidAlert2 = os.time()
    end) 

    Hooks:RegisterNotifyListener("been spotted approaching", function() 
        FunctionsHandler.PirateRaid:Set("Senque", os.time())
    end) 

    Hooks:RegisterNotifyListener("job", function() 
        FunctionsHandler.PirateRaid:Set("Senque", 0)
    end) 

    Hooks:RegisterNotifyListener("level", function() 
        AddPoint() 
    end) 

    Hooks:RegisterNotifyListener("torch", function() 
        TorchEnabledTime = os.time()
    end) 

    Hooks:RegisterNotifyListener("scroll reacts", function() 
        DoneCdkTick = os.time()
    end) 

    Hooks:RegisterNotifyListener("elite", function() 
        FunctionsHandler.Yama:Set("EliteCount", Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        
    end) 

    Hooks:RegisterNotifyListener("the raid with", function() 
        if ScriptStorage.PlayerData.Level < MaxLevel then return end 
        Remotes.CommF_:InvokeServer("Awakener", "Awaken")
    end) 


    Hooks:RegisterNotifyListener("quest completed", function() 
        QuestManager:RefreshQuest()
        task.wait()
        if not  QuestManager:GetCurrentClaimQuest() then 
            
            QuestManager:MarkAsCompleted()
        end 
    end) 

        
    local old;

    old = hookfunction(
        require(game.ReplicatedStorage.Notification).new,
        function(a, b)
            
            v21 = tostring(tostring(a or "") .. tostring(b or "")) or ""
            
            getgenv().NotificationCallBack(v21)
            
            return old(a, b)
        end
    ) 





    if SeaIndex ~= 1 then 
        
    end


    function IfTableHaveIndex(j) 
        for _ in j do 
            return true 
        end 
    end 
    print(1)
    function GetServers() 
        if LastServersDataPulled then 
            if os.time() - LastServersDataPulled < 60 then 
                return CachedServers 
            end 
        end 

        for i = 1, 100, 1 do 
            local data = game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer(i) 
            if IfTableHaveIndex(data) then 
                LastServersDataPulled = os.time()
                CachedServers = data 
                return data 
            end 
        end 
    end

    spawn(function()
        GetServers()
        while task.wait(180) do
            GetServers()
        end
    end)

    function Hop(MaxPlayers, ForcedRegion)
        local Servers = GetServers() 
        local ArrayServers = {}

        for i, v in Servers do 
            table.insert(ArrayServers, {
                JobId = i, 
                Players = v.Count,
                LastUpdate = v.__LastUpdate, 
                Region = v.Region
            })
        end 
        print(#ArrayServers, 'servers received')

        for i = 1, #ArrayServers do 
            while task.wait() do
                local Index = math.random(1, #ArrayServers) 
                ServerData = ArrayServers[Index] 
                if ServerData then 
                    if not MaxPlayers or ServerData.Players < MaxPlayers then
                        if not ForcedRegion or ServerData.Regoin == ForcedRegion then
                            print("Found Server:", ServerData.JobId, 'Player Count:', ServerData.Players, "Region:", ServerData.Region)
                            break
                        end
                    end
                end
            end

            print('Teleporting to', ServerData.JobId, '...')
            game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer('teleport', ServerData.JobId)
        end
    end

    LowHop = function(Reason, PlayerLimit) 
        local servers = {}
        local req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true")
        local body = game:GetService('HttpService'):JSONDecode(req)

        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < 5 and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end

        if #servers > 0 then
            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
        end    
    end 


    Storage = {
        WRITE_DELAY = 5, 
        Data = {}, 
    } 

    Services = {}

    setmetatable(Services, {
        __index = function(_, Index)
            return game:GetService(Index)
        end
    });

    LocalPlayer = game.Players.LocalPlayer

    local StoragePath = ".storage_u_" .. tostring(LocalPlayer) 

    function Decode(Content) 
        return Services.HttpService:JSONDecode(Content) 
    end 

    function Encode(Content) 
        return Services.HttpService:JSONEncode(Content)  
    end 

    print(5)
    function Storage.Set(Self, Key, Value) 
        Self.Data[Key] = Value
    end 

    function Storage.Get(Self, Key) 
        return Self.Data[Key] 
    end 

    function Storage.Save(Self) 
        writefile(StoragePath, Encode(Self.Data)) 
    end 

    if not isfile(StoragePath) then 
        writefile(StoragePath, "{}")
        task.wait(1)
    end 

    local _ok, _data = pcall(function()
        return Decode(readfile(StoragePath) or "{}")
    end)
    Storage.Data = _ok and _data or {}  

    spawn(function() 
        while task.wait(Storage.WRITE_DELAY) do 
            Storage:Save() 
        end 
    end)
        CreateTraceback("Initalize", "Initalizing script...")
        pcall(function()
            for _, Connection in getconnections(game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Main", 5)
                                                    :WaitForChild("Settings", 5):WaitForChild("Buttons", 5):WaitForChild("FastModeButton", 5)
                                                    .Activated) do
                Connection.Function()
            end
        end)
        
        local LogCache = {}
        SetTask("MainTask", "n/a")
        SetTask("SubTask", "n/a")
        ParsingTimes = 0
        function RefreshTasksData()
            if _G.Stop or _G.CollectingBerry then
                return
            end
            for _, TaskName in TasksOrder do
                local Task = FunctionsHandler[TaskName]
                if not Task.Initalized then
                    if not LogCache[TaskName] then
                        print("[ Debug ] Task", Name, "is not registered yet")
                        LogCache[TaskName] = true
                    end
                else
        
                    local Refresh = Task.Methods.Refresh
                    local Start = Task.Methods.Start
        
                    if Refresh then
        
                        local RefreshValue = Refresh:Call(ParsingTimes < 100)
        
                        ParsingTimes = ParsingTimes + 1
                        if RefreshValue and ParsingTimes > 100 then
        
                            CurrentTask = CurrentTask ~= TaskName
        
                            CurrentTask = TaskName
                            ScriptStorage.Interface.SetText("DebugLine", TaskName)
                            Start:Call(RefreshValue)
                            return
                        end
                    end
                end
            end
        end
        
        SetText("MainTextLabel", "Refreshing Player Items...")
        AddPoint()
        
        QuestManager:RefreshQuest()
        
        RefreshInventory()
        Remotes.CommE.OnClientEvent:Connect(function(...)
            local data = {...}
            if string.find(data[1], "Item") then
                RefreshInventory()
            end
        end)
        
        RefreshRace()
        
        Players.LocalPlayer.Idled:Connect(function()
            Services.VirtualUser:CaptureController()
            Services.VirtualUser:ClickButton2(Vector2.new())
        end)
        
        SetText("MainTextLabel", "Loaded In " .. tick() - StartTick .. "ms!")
        
        QueueList = {}
        
        function NearbyHopHandler()
            if true then
                return
            end
            if NearbyHopHandlerDebounce and os.time() - NearbyHopHandlerDebounce < 10 then
                return
            end
        
            NearbyHopHandlerDebounce = os.time()
        
            for _, Player in Players:GetPlayers() do
                local Position = Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and
                                    Player.Character.HumanoidRootPart.Position
                if Position then
                    local NearbyRange = QueueList[Player.Name]
                    if not NearbyRange then
                        QueueList[Player.Name] = os.time()
                    else
                        if os.time() - NearbyRange > 30 then
                            if CaculateDistance(Position) < 100 then
                                Hop("Nearby plr");
                                task.wait(5)
        
                            else
                                QueueList[Player.Name] = nil
                            end
                        end
                    end
                end
            end
        end
        
        
        task.spawn(function()
            while task.wait() do
                while _G.CollectingBerry do task.wait(0.5) end
                if not _G.Stop then
                     if SeaIndex == 1 and #game.Players:GetPlayers() > 9 then 
                        while task.wait() do 
                            print('low hop')
                            Hop(9)
                            break
                        end 
                    end
                    NearbyHopHandler()
                    if LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Sit then
                        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
        
                    if true or RefreshDebounce ~= os.time() then
                        pcall(RefreshPlayerData)
                        FunctionsHandler.MeleesController.Methods.Start:Call()
        
                        local Elapsed = os.time() - StartTime
                        local TotalElapsed = Elapsed + OldSessionTime
        
                        writefile(".tdif-" .. game.Players.LocalPlayer.Name, tostring(TotalElapsed))
        
                        if ScriptStorage.Interface then
                            SetText("LiveTime", "Total Elapsed Time: " .. DispTime(TotalElapsed, true) .. " Elapsed Time: " ..
                                DispTime(Elapsed, true))
                        end
                        RefreshDebounce = os.time()
                    end
                end
            end
        end)
        
        AddPoint()
        Remotes.CommF_:InvokeServer("Cousin", "Buy")
        
            
        getgenv().tngoccutii = "mm2check"
        getgenv().tngoc = true
        getgenv().pass = {}
        getgenv().save = {}
        local animation = Instance.new("Animation")
        getgenv().ready = 0
        getgenv().SendMessage = function(Message)
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                animation.AnimationId = "http://www.roblox.com/asset/?id=1honglam" .. tostring(Message)
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                local animationTrack = humanoid:LoadAnimation(animation)
                animationTrack:Play()
            else
                error("Player or Humanoid not found.")
            end
        end
        
        getgenv().PlayerAdded = function(plr)
            if plr.Character and not plr.Character:FindFirstChild("eochuadaodayvailuwuwuuwwuwuwuuwuwuwu") and plr.Character:FindFirstChild("Humanoid") then
                Instance.new("Part", plr.Character).Name = "eochuadaodayvailuwuwuuwwuwuwuuwuwuwu"
                plr.Character.Humanoid.AnimationPlayed:Connect(function(a)
                    local content = a.Animation.AnimationId
                    if string.match(content, "honglam") then
                        local canret = false
                        content = content:gsub(".", function(a)
                            if canret then
                                return a
                            end
                            if a == "=" then
                                canret = true
                            end
                            return ""
                        end)
                        content = content:gsub("honglam", "")
                        content = content:sub(2)
                        if content == getgenv().tngoccutii then
                            if not table.find(getgenv().save, plr) then
                                table.insert(getgenv().save, plr)
                                getgenv().ready = getgenv().ready + 1
                                task.wait(1)
                                print(plr.Name, content)
                                SendMessage(content)
                            end
                            if not table.find(getgenv().pass, plr) then
                                table.insert(getgenv().pass, plr)
                                task.wait(1)
                                print(#getgenv().save, #getgenv().pass)
                            end
        
                        elseif content == "Rejoin" .. getgenv().tngoccutii then
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId,
                                game.Players.LocalPlayer)
        
                        end
                    end
                end)
            end
        end
        
        for _, plr in pairs(game.Players:GetChildren()) do
            getgenv().PlayerAdded(plr)
        end
        
        game.Players.PlayerAdded:Connect(getgenv().PlayerAdded)
        
        local Message = getgenv().tngoccutii
        SendMessage(Message)
        
        for k, plr in game.Players:GetChildren() do
            PlayerAdded(plr)
        end
        game.Players.PlayerAdded:Connect(PlayerAdded)
        
        task.spawn(function()
            task.wait(Config.Configuration.AutoHopDelay)
            if not Config.Configuration.AutoHop then
                Hop("Autohop")
            end
        end)

        -- =============================================
        -- AUTO COLLECT BERRY SYSTEM v4
        -- Fix: reseta flags no inicio, espera 4s na berry antes
        --      de voltar pro farm, evitando vai-e-volta.
        -- =============================================
        _G.CollectingBerry = nil
        _G.Stop = nil

        task.spawn(function()
            local BerryArray = {
                "Blue Icicle Berry",
                "Green Toad Berry",
                "Orange Berry",
                "Pink Pig Berry",
                "Pink Ping Berry",
                "Purple Jelly Berry",
                "Red Cherry Berry",
                "White Cloud Berry",
                "Yellow Star Berry"
            }
            local CollectionService = game:GetService("CollectionService")

            local function isBerryAllowed(name)
                if type(name) ~= "string" then return false end
                for _, allowed in ipairs(BerryArray) do
                    if name == allowed then return true end
                end
                return false
            end

            while true do
                task.wait(3)

                if _G.CollectingBerry then continue end

                local character = game.Players.LocalPlayer.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end

                -- 1) Achar a bush com berry permitida mais próxima
                local BerryBushes = CollectionService:GetTagged("BerryBush")
                local closestBush = nil
                local closestPos  = nil
                local closestName = nil
                local closestDist = math.huge

                for _, Bush in ipairs(BerryBushes) do
                    if not Bush or not Bush.Parent then continue end

                    local ok, bushPos = pcall(function()
                        return Bush.Parent:GetPivot().Position
                    end)
                    if not ok or not bushPos then continue end

                    local dist = (bushPos - hrp.Position).Magnitude

                    local foundName = nil
                    for attrKey, attrVal in pairs(Bush:GetAttributes()) do
                        if isBerryAllowed(attrVal) then
                            foundName = attrVal
                            break
                        elseif isBerryAllowed(attrKey) then
                            foundName = attrKey
                            break
                        end
                    end

                    if foundName and dist < closestDist then
                        closestDist = dist
                        closestBush = Bush
                        closestPos  = bushPos
                        closestName = foundName
                    end
                end

                if not closestBush then continue end

                -- 2) Pausar farm e iniciar coleta
                _G.CollectingBerry = true
                _G.Stop = true
                task.wait(0.3)

                pcall(function()
                    SetStatus("Collecting Berry: " .. closestName)
                    SetTask("MainTask", "Berry Collector | " .. closestName)
                    SetTask("SubTask", "Voando ate a bush...")

                    -- Usa sistema de voo existente
                    TweenController.Create(CFrame.new(closestPos + Vector3.new(0, 4, 0)))

                    -- Aguarda chegar (timeout 60s)
                    local travelTimeout = os.time() + 60
                    while os.time() < travelTimeout do
                        task.wait(0.2)
                        local h = game.Players.LocalPlayer.Character
                            and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if not h then break end
                        if (closestPos - h.Position).Magnitude < 15 then break end
                    end

                    -- Cancela o tween para parar de voar
                    pcall(function()
                        if TweenInstance then TweenInstance:Cancel() end
                    end)

                    -- Teleporta direto ao pivot da bush para garantir range
                    local hrp2 = game.Players.LocalPlayer.Character
                        and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp2 then
                        hrp2.CFrame = CFrame.new(closestPos + Vector3.new(0, 3, 0))
                    end

                    task.wait(0.2)
                    SetTask("SubTask", "Coletando berries...")

                    -- 3) Dispara prompt em todos os filhos das bushes próximas
                    local freshBushes = CollectionService:GetTagged("BerryBush")
                    for _, Bush in ipairs(freshBushes) do
                        if not Bush or not Bush.Parent then continue end

                        local hasBerry = false
                        for attrKey, attrVal in pairs(Bush:GetAttributes()) do
                            if isBerryAllowed(attrVal) or isBerryAllowed(attrKey) then
                                hasBerry = true
                                break
                            end
                        end
                        if not hasBerry then continue end

                        -- Filhos da bush = objetos berry com ProximityPrompt
                        for _, BerryObj in ipairs(Bush:GetChildren()) do
                            pcall(function()
                                local prompt = BerryObj:FindFirstChildOfClass("ProximityPrompt")
                                    or BerryObj:FindFirstChild("ProximityPrompt")
                                if not prompt then return end

                                -- Teleporta ao objeto berry
                                local ok2, pivot = pcall(function() return BerryObj.WorldPivot end)
                                if ok2 and pivot then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pivot
                                end

                                task.wait(0.1)
                                fireproximityprompt(prompt, math.huge)
                                task.wait(0.2)
                            end)
                        end
                    end

                    -- 4) Aguarda 4 segundos na posição antes de voltar ao farm
                    --    Isso evita o vai-e-volta e garante que a berry sumiu
                    SetTask("SubTask", "Aguardando berry sumir...")
                    task.wait(4)
                end)

                -- 5) Cleanup garantido — farm retoma após isso
                _G.CollectingBerry = nil
                _G.Stop = nil
                SetStatus("Farming...")
                SetTask("MainTask", "n/a")
                SetTask("SubTask", "n/a")
            end
        end)

        while task.wait() do
        
            if _G.CollectingBerry then task.wait(0.5) continue end

            if Config.Configuration.HopWhenIdle and LastIdling and os.time() - LastIdling > 60 * 1.2 then
                SetTask("MainTask", "Rejoinjng due idle in 10 min!")
                task.wait(1)
                for i=1, 6, 1 do
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                    task.wait(5)
                end
                task.wait(1)
            end
        
            if not AnimationDelay or os.time() - AnimationDelay > 60 then
                AnimationDelay = os.time()
                LocalPlayer.Character:WaitForChild('Humanoid'):LoadAnimation(Animation):Play()
            end
            local success, response = xpcall(RefreshTasksData, debug.traceback)
            if not success then
                Report(response)
            end
        end
    end 

    local success2, response2 = xpcall(mmb, debug.traceback)
    if not success2 then
        Report(response2)
    end
end)()

ScriptStorage = ScriptStorage or {}
ScriptStorage.Task = ScriptStorage.Task or {}

function SetTask(Index, Value)
    if ScriptStorage.Task[Index] == Value then  
        return  
    end  

    ScriptStorage.Task[Index] = Value  
    ScriptStorage.Task[Index .. "-d"] = os.time()
end

function love.draw()
    love.graphics.clear(0.1, 0.1, 0.1)
    love.graphics.setColor(1, 1, 1)

    local y = 20
    for key, value in pairs(ScriptStorage.Task) do
        if not key:find("%-d$") then
            local timestamp = ScriptStorage.Task[key .. "-d"]
            local text = key .. ": " .. tostring(value) .. " (" .. os.date("%X", timestamp) .. ")"
            love.graphics.print(text, 20, y)
            y = y + 30
        end
    end
end

function love.update(dt)
    if not lastUpdate then lastUpdate = 0 end
    lastUpdate = lastUpdate + dt

    if lastUpdate > 3 then
        SetTask("MainTask", "Executando")
        SetTask("SubTask", os.date("%X"))
        lastUpdate = 0
    end
end
