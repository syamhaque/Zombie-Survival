local zombie = {}

function zombie.show()
	script.Parent.Visible = true
	for i = 1, 0, -0.1 do
		script.Parent.TextTransparency = i
		wait()
	end
end

function zombie.hide()
	for i = 0, 1, 0.1 do
		script.Parent.TextTransparency = i
		wait()
	end
	script.Parent.Visible = false
end

function zombie.fin()
	script.Parent.Text = "Survive"
	script.Parent.Visible = true
	for i = 1, 0, -0.1 do
		script.Parent.TextTransparency = i
		wait()
	end
	wait(5)
	for i = 0, 1, 0.1 do
		script.Parent.TextTransparency = i
		wait()
	end
	script.Parent.Visible = false
end

return zombie
