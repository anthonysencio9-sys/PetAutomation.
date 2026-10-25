
-- Pet Automation Loader
-- Intended for a Roblox experience you own.

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if not player then
    warn("Run this from a client-side LocalScript.")
    return
end

-- In Roblox Studio, place the GUI code from
-- PetAutomation.lua in a LocalScript under
-- StarterPlayer > StarterPlayerScripts.
warn("Place PetAutomation.lua in StarterPlayerScripts.")
