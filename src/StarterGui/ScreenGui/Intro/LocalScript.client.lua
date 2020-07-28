script.Parent.Position = UDim2.new(.5,0,.5,0)
wait(5)
for i = 0, 1, 0.1 do
	script.Parent.TextTransparency = i
	wait()
end