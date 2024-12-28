local RS = game:GetService("ReplicatedStorage")


local Values = {
	{"Common", 2},
	{"Rare", 4},
	{"Gold", 10},
	{"Epic", 100}
}

local weights = {}

for i, v in ipairs(Values) do
	if type(v[2]) == "number" then 
		weights[i] = 1 / v[2]
	else
		error("Invalid value in 'Values'. Expected a number for weight, got a " .. type(v[2]))
	end
end


local totalWeight = 0
for _, weight in ipairs(weights) do
	totalWeight = totalWeight + weight
end

local function selectRandomValue()
	local randomWeight = math.random() * totalWeight 
	local cumulativeWeight = 0

	for i, weight in ipairs(weights) do
		cumulativeWeight = cumulativeWeight + weight
		if randomWeight <= cumulativeWeight then
			return Values[i][1] 
		end
	end
end

for i = 1, 1000 do
	local chosenvalue = selectRandomValue()
	local part = RS:WaitForChild(chosenvalue):Clone()
	part.Parent = workspace
	part.Position = Vector3.new(i+5, i/2, 0)
	part.Size = Vector3.new(1, i, 1)
	part.Anchored = true
	wait(0.01)
	print(i)
end
