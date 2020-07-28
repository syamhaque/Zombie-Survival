local keyPress = false
game:GetService("UserInputService").InputBegan:Connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.E then
		keyPress = true
	end
end)
game:GetService("UserInputService").InputEnded:Connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.E then
		keyPress = false
	end
end)

local skull = game.Workspace.Skull.Skull
local note = game.Workspace.note.paper
local knife = game.Workspace.Knife
local eyeball = game.Workspace.Eyeball
local skull_check = true
local skull_near = false
local note_check = true
local note_near = false
local knife_check = true
local knife_near = false
local eyeball_check = true
local eyeball_near = false

local rs = game:GetService("ReplicatedStorage")
local spawner = rs:WaitForChild("Spawn")

local function GetDistance(p1,p2)
    local Distance = (p1.Position - p2).magnitude
    return Distance
end

local artifactCount = 0
local spawned = true

while true do
	wait(0.1)
	local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()
	local character = player.Character or player.CharacterAdded:Wait()
	local position =  character:WaitForChild("HumanoidRootPart").Position
	local health = character:WaitForChild("Humanoid").Health
	
	local interact = require(player.PlayerGui.ScreenGui.Interact.ModuleScript)
	local artifact = require(player.PlayerGui.ScreenGui.Artifact.ModuleScript)
	local zombie = require(player.PlayerGui.ScreenGui.Zombies.ModuleScript)
	
	if (spawned and (skull_check == true or note_check == true or knife_check == true or eyeball_check == true)) then
		artifact.inc()
		spawned = false
	end
	
	if(health == 0 and (skull_check == true or note_check == true or knife_check == true or eyeball_check == true)) then
		wait(7)
		artifact = require(player.PlayerGui.ScreenGui.Artifact.ModuleScript)
		for i = 0, artifactCount do
			artifact.inc()
		end
	end
	if (health == 0 and (skull_check == false and note_check == false and knife_check == false and eyeball_check == false)) then
		wait(7)
		player.PlayerGui.ScreenGui.Artifact:Destroy()
	end

    if GetDistance(skull,position) < 10 and skull_check == true then
		interact.show()
		skull_near = true
		if keyPress then 
	        interact.hide()
			skull:Destroy()
			skull_check = false
			artifact.inc()
			artifactCount = artifactCount + 1
			zombie.show()
			spawner:FireServer(skull.Position)
			wait(5)
			zombie.hide()
			skull_near = false
		end
	end 
	if GetDistance(note,position) < 10 and note_check == true then
		interact.show()
		note_near = true
		if keyPress then 
	        interact.hide()
			note:Destroy()
			note_check = false
			artifact.inc()
			artifactCount = artifactCount + 1
			zombie.show()
			spawner:FireServer(note.Position + Vector3.new(20,1,0))
			wait(5)
			zombie.hide()
			note_near = false
	    end
	end
	if GetDistance(knife,position) < 10 and knife_check == true then
		interact.show()
		knife_near = true
		if keyPress then 
	        interact.hide()
			knife:Destroy()
			knife_check = false
			artifact.inc()
			artifactCount = artifactCount + 1
			zombie.show()
			spawner:FireServer(knife.Position)
			wait(5)
			zombie.hide()
			knife_near = false
	    end
	end
	if GetDistance(eyeball,position) < 10 and eyeball_check == true then
		interact.show()
		eyeball_near = true
		if keyPress then 
	        interact.hide()
			eyeball:Destroy()
			eyeball_check = false
			artifact.inc()
			artifactCount = artifactCount + 1
			zombie.show()
			spawner:FireServer(eyeball.Position)
			wait(5)
			zombie.hide()
			eyeball_near = false
		end
    end
	if GetDistance(skull,position) > 10 and skull_near then
		interact.hide()
	elseif GetDistance(note,position) > 10 and note_near then
		interact.hide()	
	elseif GetDistance(knife,position) > 10 and knife_near then
		interact.hide()
	elseif GetDistance(eyeball,position) > 10 and eyeball_near then
		interact.hide()
    end
	if (health ~= 0 and (skull_check == false and note_check == false and knife_check == false and eyeball_check == false)) then
		artifact.fin()
	end
end