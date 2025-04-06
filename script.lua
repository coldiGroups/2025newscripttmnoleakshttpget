
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local GuiService = game:GetService("GuiService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")
local VirtualInputManager = game:GetService("VirtualInputManager")
local StarterPack = game:GetService("StarterPack")
local ServerStorage = game:GetService("ServerStorage")
local Teams = game:GetService("Teams")
local PathfindingService = game:GetService("PathfindingService")
local TextService = game:GetService("TextService")
local AnalyticsService = game:GetService("AnalyticsService")
local BadgeService = game:GetService("BadgeService")
local Chat = game:GetService("Chat")
local FriendService = game:GetService("FriendService")
local GroupService = game:GetService("GroupService")
local HapticService = game:GetService("HapticService")
local LocalizationService = game:GetService("LocalizationService")
local MarketplaceService = game:GetService("MarketplaceService")
local StarterPlayer = game:GetService("StarterPlayer")
local DataStoreService = game:GetService("DataStoreService")
local MemoryStoreService = game:GetService("MemoryStoreService")
local NotificationService = game:GetService("NotificationService")
local MessagingService = game:GetService("MessagingService")
local PhysicsService = game:GetService("PhysicsService")
local TestService = game:GetService("TestService")
local Stats = game:GetService("Stats")
local GamepadService = game:GetService("GamepadService")
local VRService = game:GetService("VRService")
local PolicyService = game:GetService("PolicyService")
local AssetService = game:GetService("AssetService")
local InsertService = game:GetService("InsertService")
local SocialService = game:GetService("SocialService")
local Terrain = workspace.Terrain
local NetworkClient = game:GetService("NetworkClient")
local NetworkServer = game:GetService("NetworkServer")
local ContentProvider = game:GetService("ContentProvider")
local ScriptContext = game:GetService("ScriptContext")
local LogService = game:GetService("LogService")
local AppStorageService = game:GetService("AppStorageService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local BackpackService = game:GetService("BackpackService")
local ChatService = game:GetService("ChatService")
local CorePackages = game:GetService("CorePackages")
local DraftsService = game:GetService("DraftsService")
local EventIngestService = game:GetService("EventIngestService")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local InternalPolicyService = game:GetService("InternalPolicyService")
local InventoryService = game:GetService("InventoryService")
local LanguageService = game:GetService("LanguageService")
local LuaSettings = game:GetService("LuaSettings")
local NavigationService = game:GetService("NavigationService")
local OverlayService = game:GetService("OverlayService")
local PersonalServerService = game:GetService("PersonalServerService")
local PermissionsService = game:GetService("PermissionsService")
local PluginDebugService = game:GetService("PluginDebugService")
local PointsService = game:GetService("PointsService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local SharedTableService = game:GetService("SharedTableService")


-----------------------------------------------------------
-- CLIENT SIDE CODE: GUI and RemoteEvent firing
-----------------------------------------------------------
if RunService:IsClient() then
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    -- Create a main draggable GUI frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "CustomGUI"
    mainFrame.Parent = PlayerGui
    mainFrame.Size = UDim2.new(0, 250, 0, 400)
    mainFrame.Position = UDim2.new(0, 50, 0, 50)
    mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    mainFrame.Active = true
    mainFrame.Draggable = true

    local UICorner_main = Instance.new("UICorner", mainFrame)
    UICorner_main.CornerRadius = UDim.new(0, 8)
    
    -- Title Bar
    local titleBar = Instance.new("TextLabel")
    titleBar.Name = "TitleBar"
    titleBar.Parent = mainFrame
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    titleBar.Text = "Player Model Spawner"
    titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleBar.Font = Enum.Font.GothamBold
    titleBar.TextScaled = true
    titleBar.BorderSizePixel = 0

    -- Scrolling Frame for the player list
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "PlayerList"
    scrollFrame.Parent = mainFrame
    scrollFrame.Size = UDim2.new(1, -20, 0, 250)
    scrollFrame.Position = UDim2.new(0, 10, 0, 40)
    scrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 6

    local listLayout = Instance.new("UIListLayout", scrollFrame)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 5)

    -- Function to update the player list dynamically
    local function updatePlayerList()
        -- Remove previous buttons
        for _, child in ipairs(scrollFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end

        for _, player in ipairs(Players:GetPlayers()) do
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, -10, 0, 40)
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.GothamBold
            button.TextScaled = true
            button.Text = player.Name
            button.Parent = scrollFrame

            local UICorner_button = Instance.new("UICorner", button)
            UICorner_button.CornerRadius = UDim.new(0, 6)

            button.MouseButton1Click:Connect(function()
                -- Print ASCII art to the output (once per click)
                print("   
▀█████████▄ ▄██▀▀▀███▀▀▀██▄ 
   ▀███▀▀██ ███   ███   ███ 
    ███   ▀ ███   ███   ███ 
    ███     ███   ███   ███ 
    ███     ███   ███   ███ 
    ███     ███   ███   ███ 
   ▄████▀    ▀█   ███   █▀  
                            ")

                -- Fire the RemoteEvent to spawn the model for the selected player
                local spawnEvent = ReplicatedStorage:WaitForChild("SpawnModelRequest")
                spawnEvent:FireServer(player.UserId)
            end)
        end

        -- Update the scrolling canvas size for proper scrolling
        wait()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
    end

    updatePlayerList()
    Players.PlayerAdded:Connect(updatePlayerList)
    Players.PlayerRemoving:Connect(updatePlayerList)

    -- Bottom panel displaying local player's avatar and name
    local bottomFrame = Instance.new("Frame")
    bottomFrame.Name = "LocalPlayerInfo"
    bottomFrame.Parent = mainFrame
    bottomFrame.Size = UDim2.new(1, -20, 0, 60)
    bottomFrame.Position = UDim2.new(0, 10, 1, -70)
    bottomFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    bottomFrame.BorderSizePixel = 0

    local UICorner_bottom = Instance.new("UICorner", bottomFrame)
    UICorner_bottom.CornerRadius = UDim.new(0, 6)

    local avatar = Instance.new("ImageLabel")
    avatar.Name = "Avatar"
    avatar.Parent = bottomFrame
    avatar.Size = UDim2.new(0, 50, 0, 50)
    avatar.Position = UDim2.new(0, 5, 0, 5)
    avatar.BackgroundTransparency = 1

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "PlayerName"
    nameLabel.Parent = bottomFrame
    nameLabel.Size = UDim2.new(1, -60, 1, 0)
    nameLabel.Position = UDim2.new(0, 60, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    nameLabel.Text = LocalPlayer.Name

    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local thumbContent, isReady = Players:GetUserThumbnailAsync(LocalPlayer.UserId, thumbType, thumbSize)
    avatar.Image = thumbContent

    -- Additional "Remove Model" button for extra control
    local removeButton = Instance.new("TextButton")
    removeButton.Name = "RemoveModelButton"
    removeButton.Parent = mainFrame
    removeButton.Size = UDim2.new(1, -20, 0, 40)
    removeButton.Position = UDim2.new(0, 10, 0, 300)
    removeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    removeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    removeButton.Font = Enum.Font.GothamBold
    removeButton.TextScaled = true
    removeButton.Text = "Remove Spawned Model"

    local UICorner_remove = Instance.new("UICorner", removeButton)
    UICorner_remove.CornerRadius = UDim.new(0, 6)

    removeButton.MouseButton1Click:Connect(function()
        local removeEvent = ReplicatedStorage:WaitForChild("RemoveModelRequest")
        removeEvent:FireServer()
    end)
end

-----------------------------------------------------------
-- SERVER SIDE CODE: Spawning and Removing Models
-----------------------------------------------------------
if RunService:IsServer() then
    -- Create (or find) RemoteEvents
    local spawnEvent = ReplicatedStorage:FindFirstChild("SpawnModelRequest")
    if not spawnEvent then
        spawnEvent = Instance.new("RemoteEvent")
        spawnEvent.Name = "SpawnModelRequest"
        spawnEvent.Parent = ReplicatedStorage
    end

    local removeEvent = ReplicatedStorage:FindFirstChild("RemoveModelRequest")
    if not removeEvent then
        removeEvent = Instance.new("RemoteEvent")
        removeEvent.Name = "RemoveModelRequest"
        removeEvent.Parent = ReplicatedStorage
    end

    -- Table to store spawned models per client
    local spawnedModels = {}

    -- Helper function to generate a random model name
    local function generateRandomName()
        return "Model_" .. tostring(math.random(100000, 999999))
    end

    -- When a spawn request is received
    spawnEvent.OnServerEvent:Connect(function(player, targetUserId)
        local targetPlayer = Players:GetPlayerByUserId(targetUserId)
        if targetPlayer and targetPlayer.Character then
            local modelClone = targetPlayer.Character:Clone()
            local randomName = generateRandomName()
            modelClone.Name = randomName
            modelClone.Parent = workspace
            modelClone:MoveTo(Vector3.new(0, 10, 0))  -- Adjust position as needed

            -- Store the spawned model reference for later removal
            spawnedModels[player.UserId] = spawnedModels[player.UserId] or {}
            spawnedModels[player.UserId][randomName] = modelClone

            -- Remove the spawned model if the target player leaves the game
            local conn
            conn = Players.PlayerRemoving:Connect(function(leavingPlayer)
                if leavingPlayer == targetPlayer then
                    if spawnedModels[player.UserId] and spawnedModels[player.UserId][randomName] then
                        spawnedModels[player.UserId][randomName]:Destroy()
                        spawnedModels[player.UserId][randomName] = nil
                    end
                    if conn then conn:Disconnect() end
                end
            end)
        end
    end)

    -- When a remove request is received
    removeEvent.OnServerEvent:Connect(function(player)
        if spawnedModels[player.UserId] then
            for name, model in pairs(spawnedModels[player.UserId]) do
                if model and model.Parent then
                    model:Destroy()
                end
            end
            spawnedModels[player.UserId] = nil
        end
    end)
end
