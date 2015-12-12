--[[
 Task Queues!
]]--
math.randomseed( os.time() )
math.random(); math.random(); math.random()

local pack_of_arc = {
	"arc",
	"arc",
	"arc",
	"arc",
}


local pack_of_bit0 = {
	"bit0",
}

local pack_of_cnm1 = {
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
}

local pack_of_drk2 = {
	"drk2",
	"drk2",
	"drk2",
	"drk2",
	"drk2",
	"drk2",
	"drk2",
	"drk2",
	"drk2",
	"drk2",
}

local pack_of_enk3 = {
	"enk3",
	"enk3",
	"enk3",
	"enk3",
	"enk3",
	"enk3",
}

taskqueues = {
	fabricaporreton = (
		function()
			local r = math.random(4,4)
			if r == 0 then
				return pack_of_bit0
			elseif r == 1 then
				return pack_of_cnm1
			elseif r == 2 then
				return pack_of_drk2
			elseif r == 3 then
				return pack_of_enk3
			else
				return pack_of_arc
			end
		end
	),
}
