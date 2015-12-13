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
	self.active = false
	self.assisting = false
	
	
	local ucount = game:GetFriendlies()
	
	for i, funit in pairs(ucount) do
		if funit:Name() == "fabricaporreton" then
			EchoDebug("FACTORY")
			local factory_exist = true
		end
	end
	
	if factory_exist == true then
		if self.assisting == false then
			EchoDebug("Go for it")
			local position = funit:Internal():GetPosition()
			self.unit:Internal():ExecuteCustomCommand(CMD_GUARD, position)
			self.assisting = true
		end
	end
	
	
end

function AssistBehaviour:UnitCreated(unit)
	
end

function AssistBehaviour:UnitIdle(unit)
	if unit:Internal():ID() == self.unit:Internal():ID() then
		if self:IsActive() then
			self.unit:ElectBehaviour()
		end
	end
	
end

function AssistBehaviour:Update()
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
