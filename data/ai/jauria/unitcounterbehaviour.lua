require "unitlist"

require "utils"

UnitCounterBehaviour = class(Behaviour)

local DebugEnabled = true

local function EchoDebug(inStr)
	if DebugEnabled then
		game:SendToConsole("UnitCounterBehaviour: " .. tostring(inStr))
	end
end

function UnitCounterBehaviour:Init()
	EchoDebug("UNIT COUNTER INIT")
	
	self.workers = 0
	self.reclaimers = 0
	self.assistans = 0
	
	self.light_army = 0
	self.mid_army = 0
	self.high_army = 0

end

function UnitCounterBehaviour:UnitCreated(unit)
	
	if IsWorker(unit) then
	
		EchoDebug("Got a worker")
		self.workers = self.workers + 1
		
		if self.workers < 4 then
			self.reclaimers = self.reclaimers + 1
		else
			self.assistants = self.assistants + 1
	end
end

function UnitCounterBehaviour:UnitIdle(unit)
end

function UnitCounterBehaviour:Update()
end

function UnitCounterBehaviour:Activate()
	self.unit:ElectBehaviour()
end

function UnitCounterBehaviour:Deactivate()
end

function UnitCounterBehaviour:Priority()
	return 50
end

function UnitCounterBehaviour:UnitDead(unit)
end
