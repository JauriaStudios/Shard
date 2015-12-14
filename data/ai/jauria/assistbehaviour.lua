AssistBehaviour = class(Behaviour)

local DebugEnabled = true

local function EchoDebug(inStr)
	if DebugEnabled then
		game:SendToConsole("AssistBehaviour: " .. tostring(inStr))
	end
end

local CMD_GUARD = 25
local CMD_PATROL = 15

function AssistBehaviour:Init()
	EchoDebug("INIT ASSIST")
	self.active = false
	self.factory_exist = false
	self.factory = nil
end

function AssistBehaviour:UnitBuilt(unit)
end

function AssistBehaviour:UnitIdle(unit)
	if unit:Internal():ID() == self.unit:Internal():ID() then
		if self:IsActive() then
			self.unit:ElectBehaviour()
		end
	end
	
end

function AssistBehaviour:Update()
	
	local f = game:Frame()
	if (f % 180) == 0 then
		local ucount = game:GetFriendlies()
		
		for i, funit in pairs(ucount) do
			if funit:Name() == "fabricaporreton" then
				self.factory = funit
				EchoDebug("FACTORY")
				self.factory_exist = true
			end
		end
		
		if self.factory_exist == true then
			EchoDebug("Go for it")
			local position = self.factory:GetPosition()
			
			local floats = api.vectorFloat()
			floats:push_back(position.x)
			floats:push_back(position.y)
			floats:push_back(position.z)
			
			self.unit:Internal():ExecuteCustomCommand(CMD_PATROL, floats)
		end
	end
end

function AssistBehaviour:Activate()
	self.active = true
end

function AssistBehaviour:Deactivate()
	self.active = false
end

function AssistBehaviour:Priority()
	--if self.build == true  then
	--	return 100
	--end
	--return 0
	return 100
end

function AssistBehaviour:UnitDead(unit)
end
