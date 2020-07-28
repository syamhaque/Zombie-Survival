local artifact = {}
local count = 0

function artifact.inc()
	script.Parent.Text = count .. "/4 artifacts"
	count = count + 1
end

function artifact.fin()
	for i = 0, 1, 0.1 do
		script.Parent.TextTransparency = i
		wait()
	end
	script.Parent.Text = "Found all artifacts!"
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

return artifact
