local library =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Sakizu/Roblox-Scripts/main/UI-Library/main.lua", true))()
local w = library:CreateWindow("Sakizu")
local Workout_Mul = 1
-- GUI SECTION
w:Section("Strongman Simulator")

-- GUI Toggles
local AutoFarm = w:Toggle("Auto Farm", {flag = "AutoFarm"})
local AutoStrength = w:Toggle("Auto Strength", {flag = "AutoStrength"})

w:Box(
    "Multiplier",
    {type = "number"},
    function(v)
        Workout_Mul = v
    end
)
-- [[ GUI FUNCTIONS ]] --

local Best_WorkOut, Best_Num = nil, 0
for i, v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
    if v.Name == "WorkoutNumber" and v.Value > Best_Num then
        Best_WorkOut, Best_Num = v.Parent.Parent, v.Value
    end
end

function AutoFarm()
    --clear

    -- Local Player
    local Plr = game:GetService("Players").LocalPlayer
    local Char = Plr.Character
    local RootPart = Char.HumanoidRootPart
    local LowerTorso = Char.LowerTorso

    -- Game Stuff
    --   local Loader = game:GetService("Workspace").BadgeColliders.FarmBadge
    local Hydra_Item =
        game:GetService("Workspace").Areas["Area18_Apartment"].DraggableItems:FindFirstChildOfClass("MeshPart")

    if Hydra_Item == nil then
        -- We need to load part of the map in.
        RootPart.CFrame =
            CFrame.new(
            457.978516,
            12.9274769,
            12423.8984,
            0.703099549,
            -5.90138605e-09,
            0.711091459,
            6.54176873e-08,
            1,
            -5.63834099e-08,
            -0.711091459,
            8.61611085e-08,
            0.703099549
        )
        return true
    end

    local Hydra = Hydra_Item:WaitForChild("InteractionPoint")
    local Proximity = Hydra:FindFirstChild("ProximityPrompt")

    -- Teleport and grab Hydra
    RootPart.CFrame = Hydra.CFrame
    wait(0.1)
    Proximity:InputHoldBegin()
    Proximity:InputHoldEnd()

    -- Teleport us to the finish (I have some nasty hard coded stuff in here.)
    repeat
        for i, v in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
            v.Anchored = true
            v.CFrame = game:GetService("Workspace").Areas["Area18_Apartment"].Goal.CFrame
            wait()
            v.Anchored = false
        end
        wait()
    until #game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren() < 1
end

function AutoStrength()
    -- Local Player
    local Plr = game:GetService("Players").LocalPlayer
    local Char = Plr.Character
    local RootPart = Char.HumanoidRootPart

    -- Game Stuff
    local Gym = Best_WorkOut
    local Proximity = Gym.ProximityPrompt

    -- Teleport to Weights
    RootPart.CFrame = Gym.CFrame
    wait(0.1)

    -- Start Workout
    Proximity:InputHoldBegin()
    wait(0.3)
    Proximity:InputHoldEnd()

    while w.flags.AutoStrength do
        wait(0.1)
        game:GetService("ReplicatedStorage")["StrongMan_UpgradeStrength"]:InvokeServer(Workout_Mul)
    end

    -- Jump to end Workout
    Char.Humanoid.Jump = true
end

-- [[ GUI LISTENERS ]] --

-- Farm Hydra
spawn(
    function()
        while wait() do
            if w.flags.AutoFarm then
                AutoFarm()
            end
        end
    end
)

-- Farm Strength
spawn(
    function()
        while wait() do
            if w.flags.AutoStrength then
                AutoStrength()
            end
        end
    end
)
