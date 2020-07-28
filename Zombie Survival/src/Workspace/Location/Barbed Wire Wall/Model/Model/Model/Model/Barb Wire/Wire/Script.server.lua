function onTouched(part)
	local h = part.Parent:findFirstChild("Humanoid")
	if h~=nil then
		h.Health = h.Health -10
		wait(1)
	end
end

script.Parent.Touched:connect(onTouched)
