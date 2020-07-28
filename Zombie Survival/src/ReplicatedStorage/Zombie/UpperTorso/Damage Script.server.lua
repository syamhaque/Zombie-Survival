function onTouched(hit)
        local human = hit.Parent:findFirstChild("Humanoid")
        if (human ~= nil) then
                human.Health = human.Health - 1 -- Change the amount to change the damage.
        end
		wait(2)
end
script.Parent.Touched:connect(onTouched)