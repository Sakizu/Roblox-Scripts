--[[
Reference:
https://developer.roblox.com/en-us/api-reference/datatype/PhysicalProperties

PhysicalProperties.new 
( 
number density, 
number friction, 
number elasticity, 
number frictionWeight, 
number elasticityWeight
 )

]]

for _, child in pairs(game:GetDescendants()) do
    if child.ClassName == "Part" then
        child.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
    end
end
