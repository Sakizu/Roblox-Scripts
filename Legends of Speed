-- https://v3rmillion.net/showthread.php?tid=852639

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sakizu/Roblox-Scripts/main/UI-Library/main.lua", true))()
local a = library:CreateWindow("MENU")
getgenv().magnet = false

a:Toggle("Magnet", {flag = "magnet"}, function(v)
        getgenv().magnet = v
        if v then
            Magnet()
        end
    end
)

a:Toggle("Fly Jump", {flag = "infjump"}, function(value)
        _G.infjump = value
        game:GetService("UserInputService").JumpRequest:connect(
            function()
                if _G.infjump then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end
        )
    end
)

a:Section('Sakizu')

function Magnet()
    spawn(
        function()
            while getgenv().magnet == true do
                wait()
                for _, v in next, game.Workspace:GetDescendants() do
                    if v.Name == "outerOrb" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    elseif v.Name == "outerGem" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    elseif v.Name == "Hoop" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    )
end
