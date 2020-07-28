z = script.Parent

while true do
	wait(5)
	if z.Zombie.Health == 0 then
		z:Remove()
		wait(4)
	end
end 