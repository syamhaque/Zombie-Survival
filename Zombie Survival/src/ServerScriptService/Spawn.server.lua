local rs = game:GetService("ReplicatedStorage")
local spawner = Instance.new("RemoteEvent", rs)
spawner.Name = "Spawn"
local count = 0

local function onInteract(player, artifactPosition)
	count = count + 1
	if(count < 4) then
		local pos = artifactPosition
		for i = 0, 10 do
			local noobl = game.ReplicatedStorage.Zombie:Clone()
			noobl.Parent = game.Workspace
			noobl:MoveTo(pos+Vector3.new(math.random(-20,20),1,math.random(-20,20)))
			wait(1)
		end
	else
		local pos = artifactPosition
--		local count = 0
		for i = 0, 10, 1 do
			local noobl = game.ReplicatedStorage.Zombie:Clone()
			noobl.Parent = game.Workspace
			noobl:MoveTo(pos+Vector3.new(math.random(-20,20),1,math.random(-20,20)))
			wait(1)
		end
		local Players = game:GetService("Players")
		local dead = false
		local allspawned = false
		while true do
			if(game.Workspace:FindFirstChild("Zombie") == nil and allspawned == false) then
				local zombie = require(player.PlayerGui.ScreenGui.Zombies.ModuleScript)
				zombie.fin()
				game.Players.CharacterAutoLoads = false
				for i = 0, 100, 1 do
					local noobl = game.ReplicatedStorage.Zombie:Clone()
					noobl.Parent = game.Workspace
					noobl:MoveTo(Vector3.new(math.random(-200,200),1,math.random(-200,200)))
					wait(1)
					if i%10 == 0 then
						wait(20)
					end
					for i, player in pairs (Players:GetPlayers()) do
						if(player.Character:FindFirstChild("Humanoid").Health == 0)
						then
							dead = true
							break
						end
					end
					if dead then
						break
					end
				end
				allspawned = true
				if dead then
					for i, player in pairs (Players:GetPlayers()) do
						if(player.Character:FindFirstChild("Humanoid").Health == 0)
						then
							player:Kick("You lose!")
						end
					end
					break
				end
			end
			if(game.Workspace:FindFirstChild("Zombie") == nil and allspawned == true) then
				for i, player in pairs (Players:GetPlayers()) do
					if(player.Character:FindFirstChild("Humanoid"))
					then
						player:Kick("You win!")
					end
				end
				break
			end
			wait(1)
		end
	end
end

spawner.OnServerEvent:Connect(onInteract)