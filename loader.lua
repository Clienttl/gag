local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "kya",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Synergy",
   LoadingSubtitle = "by synergy",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "qaUmTDuYPM", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Main = Window:CreateTab("Main", "align-justify")
local Section = Main:CreateSection("Synergy")
local TP = Window:CreateTab("Teleports", "brain-circuit")
local Section = TP:CreateSection("Synergy")
Rayfield:Notify({
   Title = "Synergy V2",
   Content = "Loaded",
   Duration = 6.5,
   Image = 4483362458,
})

local Toggle
local AutoBuySeeds = false
local AutoBuyCoroutine

local seeds = {
    "Carrot",
    "Strawberry",
    "Blueberry",
    "Tomato",
    "Cauliflower",
    "Watermelon",
    "Green Apple",
    "Avocado",
    "Banana",
    "Pineapple",
    "Kiwi",
    "Bell Pepper",
    "Prickly Pear",
    "Loquat",
    "Feijoa",
    "Sugar Apple",
    "Watering"
}

local event = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuySeedStock")

Toggle = Main:CreateToggle({
    Name = "Auto Buy Seeds",
    CurrentValue = false,
    Flag = "AutoBuySeeds",
    Callback = function(Value)
        AutoBuySeeds = Value
        if AutoBuySeeds then
            AutoBuyCoroutine = task.spawn(function()
                while AutoBuySeeds do
                    for _, seed in ipairs(seeds) do
                        event:FireServer(seed)
                        task.wait(0.05)
                    end
                    task.wait(0.1)
                end
            end)
        else
            AutoBuySeeds = false
        end
    end,
})
local Toggle
local AutoBuyTools = false
local AutoBuyCoroutine

local tools = {
    "Trowel",
    "Watering Can",
    "Recall Wrench",
    "Basic Sprinkler",
    "Advanced Sprinkler",
    "Godly Sprinkler",
    "Tanning Mirror",
    "Master Sprinkler",
    "Cleaning Spray",
    "Favorite Tool",
    "Harvest Tool",
    "Friendship Pot"
}

local event = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyGearStock")

Toggle = Main:CreateToggle({
    Name = "Auto Buy Tools",
    CurrentValue = false,
    Flag = "AutoBuyTools",
    Callback = function(Value)
        AutoBuyTools = Value
        if AutoBuyTools then
            AutoBuyCoroutine = task.spawn(function()
                while AutoBuyTools do
                    for _, gear in ipairs(tools) do
                        event:FireServer(gear)
                        task.wait(0.05)
                    end
                    task.wait(0.1)
                end
            end)
        else
            AutoBuyTools = false
        end
    end,
})

local Button = TP:CreateButton({
    Name = "Gear Shop",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-285, 3, -14)
        end
    end,
})
local Button = TP:CreateButton({
    Name = "Middle",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-105, 4, -0)
        end
    end,
})
