game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Health").Disabled = true
		local Humanoid = character:WaitForChild("Humanoid")
		while true do
			while Humanoid.Health < Humanoid.MaxHealth do
				local s = wait(1)
				local health = Humanoid.Health
				if health > 0 and health < Humanoid.MaxHealth then
					local newHealthDelta = 0.05 * s * Humanoid.MaxHealth
					health = health + newHealthDelta
					Humanoid.Health = math.min(health,Humanoid.MaxHealth)
				end
			end
			
			if Humanoid.Health > Humanoid.MaxHealth then
				Humanoid.Health = Humanoid.MaxHealth
			end
			Humanoid.HealthChanged:Wait()
		end
	end)
end)