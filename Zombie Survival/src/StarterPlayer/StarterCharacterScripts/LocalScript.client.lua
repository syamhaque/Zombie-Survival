local uis = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")
local punch = rs:WaitForChild("Punch")

local debounce = true

uis.InputBegan:Connect(function(inputObject, gameProcessed)
	if inputObject.KeyCode == Enum.KeyCode.F and debounce then
		punch:FireServer()
		debounce = false
		wait(0.3)
		debounce = true
	end
end)
