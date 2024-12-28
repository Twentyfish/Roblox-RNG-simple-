local RS = game:GetService("ReplicatedStorage")
local SA = game.Workspace.SpawnArea
local SpawnAreaSize = SA.Size
local SpawnAreaCenter = SA.Position

local Parts = {
	{Name = "Iron"},
	{Name = "Copper"},
	{Name = "Gold"}
}

local Chances = {
	{Part = Parts[1], Weight = 50},
	{Part = Parts[2], Weight = 35}	,
	{Part = Parts[3], Weight = 15}
}

local function GetSumOfWeight(Chances)
	local sum = 0
	for _, entry in ipairs(Chances) do
		sum = sum + entry.Weight
	end
	return sum
end

local function GetRandomPart(Chances)
	local randomNumber = math.random(GetSumOfWeight(Chances))
	
	for _, entry in ipairs(Chances) do
		if randomNumber <= entry.Weight then
			return entry.Part
		else
			randomNumber = randomNumber - entry.Weight
		end
	end
end




for i = 1, 100, 1 do
	local part = GetRandomPart(Chances)
	print(part.Name)
	local partname = part.Name
	Newpart = RS:FindFirstChild(part.Name):Clone()
	Newpart.Parent = SA
	Newpart.Size = Vector3.new(1, 1, 1)
	Newpart.Anchored = true	
	
	local randomX = math.random(-SpawnAreaSize.X / 2, SpawnAreaSize.X / 2)
	local randomY = math.random(-SpawnAreaSize.Y / 2, SpawnAreaSize.Y / 2)
	local randomZ = math.random(-SpawnAreaSize.Z / 2, SpawnAreaSize.Z / 2)
	
	Newpart.Position = SpawnAreaCenter + Vector3.new(randomX, randomY + 0.5, randomZ)
end
