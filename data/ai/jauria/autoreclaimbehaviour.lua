AutoReclaimBehaviour = class(Behaviour)

local DebugEnabled = false

local function EchoDebug(inStr)
	if DebugEnabled then
		game:SendToConsole("AssistBehaviour: " .. tostring(inStr))
	end
end

local function FindDistance(feature, unit)
	
	local feature_position = feature:GetPosition()
	local unit_position = unit:Internal():GetPosition()
	
	feature_distance = math.sqrt((feature_position.x - unit_position.x) * (feature_position.x - unit_position.x) + (feature_position.z - unit_position.z) * (feature_position.z - unit_position.z))
	
	return feature_distance
	
end

function FindNearest(distance)
	
	local smallestSoFar, smallestIndex
	for i, y in ipairs(distance) do
		if not smallestSoFar or (math.abs(y) < smallestSoFar) then
			smallestSoFar = math.abs(y)
			smallestIndex = i
		end
	end
	return smallestIndex, distance[smallestIndex]
end

function AutoReclaimBehaviour:Init()
	self.active = false
	self.reclaiming = false
end

function AutoReclaimBehaviour:UnitCreated(unit)
end

function AutoReclaimBehaviour:UnitIdle(unit)
	if unit:Internal():ID() == self.unit:Internal():ID() then
		if self:IsActive() then
			self.reclaiming = false
			self.unit:ElectBehaviour()
		end
	end
	
end

function AutoReclaimBehaviour:Update()
	local f = game:Frame()
	if f % 120 == 0 then
		self.features = {}
		features_exist = false
		local fcount = game.map:GetMapFeatures()
		
		for i, feature in pairs(fcount) do
			if (feature:Name() == "mineral1") or (feature:Name() == "mineral2") or (feature:Name() == "cofre1") or (feature:Name() == "cofre2") then
				table.insert(self.features,(feature))
				features_exist = true
			end
		end
		
		if features_exist == true then
			if self.reclaiming == false then
				
				local feature_distance = {}
				
				for i, feature in pairs(self.features) do
					table.insert(feature_distance ,(FindDistance(feature, self.unit)))
				end
				
				index, nearest_feature = FindNearest(feature_distance)
				self.unit:Internal():AreaReclaim(self.features[index]:GetPosition(), 200)
				self.reclaiming = true
			end
		end
	end
end

function AutoReclaimBehaviour:Activate()
	self.active = true
end

function AutoReclaimBehaviour:Deactivate()
	self.active = false
end

function AutoReclaimBehaviour:Priority()
	--if self.build == true  then
	--	return 100
	--end
	--return 0
	return 100
end

function AutoReclaimBehaviour:UnitDead(unit)
	--
end
