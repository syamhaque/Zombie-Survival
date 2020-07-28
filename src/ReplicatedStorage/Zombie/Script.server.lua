local larm = script.Parent:FindFirstChild("HumanoidRootPart")
local rarm = script.Parent:FindFirstChild("HumanoidRootPart")

function findNearestTorso(pos)
	local list = game.Workspace:children()
	local torso = nil
	local dist = 10000
	local temp = nil
	local human = nil
	local temp2 = nil
	for x = 1, #list do
		temp2 = list[x]
		if (temp2.className == "Model") and (temp2 ~= script.Parent) then
			temp = temp2:findFirstChild("HumanoidRootPart")
			human = temp2:findFirstChild("Humanoid")
			if (temp ~= nil) and (human ~= nil) and (human.Health > 0) then
				if (temp.Position - pos).magnitude < dist then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso
end




while true do
	wait(1)
	local target = findNearestTorso(script.Parent.HumanoidRootPart.Position)
	if target ~= nil then
		script.Parent.Zombie:MoveTo(target.Position, target)
	end

end
