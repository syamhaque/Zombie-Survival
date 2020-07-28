local rs = game:GetService("ReplicatedStorage")
local punch = Instance.new("RemoteEvent", rs)
punch.Name = "Punch"

local function OnPunchEvent(player)
	local character = game.Workspace:FindFirstChild(player.Name)
	local humanoid = character.Humanoid
	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://4912949342"
	local animationTrack = humanoid:LoadAnimation(animation)
	animationTrack:Play()
	local damage = script.Damage:Clone()
	local fire = Instance.new("Fire")
	fire.Parent = character.RightHand
	damage.Parent = character.RightHand or character.RightLowerArm or character.RightUpperArm
	damage.Disabled = false
	wait(0.9)
	fire:Destroy()
	damage:Destroy()
end

punch.OnServerEvent:Connect(OnPunchEvent)