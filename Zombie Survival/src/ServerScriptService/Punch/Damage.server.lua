script.Parent.Touched:Connect(function(hit)
	local character = hit.Parent
	local zombie = character:FindFirstChild("Zombie")
	local sound = game.Workspace.Location.Sound.hit
	if zombie and character.Name ~= script.Parent.Parent.Name then
		sound:Play()
		zombie.Health = zombie.Health - script.DamageValue.Value
		script.Disabled = true
		wait(0.9)
		script.Disabled = false
	end
end)
