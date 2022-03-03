for i, v in pairs(game:GetService("Workspace").Scripts.Portals:GetDescendants()) do
    if v:IsA("BoolValue") then
        v.Value = true
    end
end
