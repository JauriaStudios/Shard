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
	
	self.workers = 0
	self.reclaimers = 0
	self.assistans = 0
	
	self.light_army = 0
	self.mid_army = 0
	self.high_army = 0

end


function UnitCounterBehaviour:UnitBuilt(unit)
	
	if unit ~= nil then
		if IsWorker(unit) then
			EchoDebug("Got a worker")
			self.workers = self.workers + 1
			
			if self.workers < 5 then
				EchoDebug("reclaimer")
				self.reclaimers = self.reclaimers + 1
				
				t = AutoReclaimBehaviour()
				t:SetUnit(unit)
				t:Init()
				unit:AddBehaviour(t)
				
			else
				EchoDebug("assistant")
				self.assistans = self.assistans + 1
				
				t = AssistBehaviour()
				t:SetUnit(unit)
				t:Init()
				unit:AddBehaviour(t)
				
			end
		end
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
