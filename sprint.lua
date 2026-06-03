local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")

local player     = Players.LocalPlayer
local character  = player.Character or player.CharacterAdded:Wait()
local humanoid   = character:WaitForChild("Humanoid")

local WALK_SPEED    = 16
local SPRINT_SPEED  = 30
local SPRINT_KEY    = Enum.KeyCode.LeftShift

-- maintain respawned character & humanoid
local function onCharacterAdded(newChar)
	character = newChar
	humanoid  = newChar:WaitForChild("Humanoid")
	humanoid.WalkSpeed = WALK_SPEED
end
player.CharacterAdded:Connect(onCharacterAdded)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == SPRINT_KEY then
		humanoid.WalkSpeed = SPRINT_SPEED
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == SPRINT_KEY then
		humanoid.WalkSpeed = WALK_SPEED
	end
end)
