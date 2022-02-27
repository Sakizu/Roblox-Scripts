_G.Enabled = true
_G.World = "Spawn" --Spawn, Beach, Samurai, Winter, Desert, Wizard, Volcano, Mine, Mushroom, Ocean

local player = game.Players.LocalPlayer
while _G.Enabled and task.wait() do
    local nearest = nil
    for i,v in pairs(game:GetService("Workspace").Map.Worlds.Spawn[_G.World].Boxes:GetChildren()) do
        if v:IsA("MeshPart") then
            if v.Health.Value > 0 then
                if nearest == nil or (player.Character:WaitForChild("HumanoidRootPart").Position - v.Position).Magnitude < (player.Character:WaitForChild("HumanoidRootPart").Position - nearest.Position).Magnitude then
                    nearest = v
                end
            end
        end
    end
    fireclickdetector(nearest.ClickDetector)
    repeat task.wait() until not v or not _G.Enabled
    wait(0.5)
end
