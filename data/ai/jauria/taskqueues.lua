--[[
 Task Queues!
]]--
math.randomseed( os.time() )
math.random(); math.random(); math.random()

local first_units = true

local pack_of_first_units = {
	"arc",
	"arc",
	"arc",
	"arc",
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
	"cnm1",
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
			if first_units == true then
				first_units = false
				return pack_of_first_units
			else
			
				local r = math.random(0,2)
				
				if r == 0 then
					return pack_of_cnm1
				elseif r == 1 then
					return pack_of_drk2
				elseif r == 2 then
					return pack_of_enk3
				end
			end
		end
	),
}
