require "taskqueues"
require "taskqueuebehaviour"
require "attackerbehaviour"

require "unitlist"
require "utils"

require "unitcounterbehaviour"
require "autoreclaimbehaviour"
require "assistbehaviour"

behaviours = {
	fabricaporreton = {
		TaskQueueBehaviour,
		UnitCounterBehaviour,
	}
}


function defaultBehaviours(unit)
	b = {}
	u = unit:Internal()
	if IsAttacker(unit) then
		table.insert(b, AttackerBehaviour)
	end
	--elseif IsWorker(unit) then
	--	table.insert(b, AutoReclaimBehaviour)
	--end
	return b
end
