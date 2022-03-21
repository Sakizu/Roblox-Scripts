getgenv().click = true
local script = getsenv(game:GetService("Players").LocalPlayer.PlayerGui.mainUI.LocalScript)
while click and wait(.001) do
    script.activateClick()
end
