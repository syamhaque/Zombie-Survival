function Spread(part)
	check = part:findFirstChild("Fire")
		if check == nil then 
	script.Parent:Clone().Parent = part
	
		elseif check ~= nil then
	check.Size = check.Size + 1000000
	check.Heat = check.Heat  +1000000
	end
end


script.Parent.Parent.Touched:connect(Spread)
