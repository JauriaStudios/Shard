require "common"

local DebugEnabled = false

local function EchoDebug(inStr)
	if DebugEnabled then
		game:SendToConsole("CountHandler: " .. inStr)
	end
end

CountHandler = class(Module)

function CountHandler:Name()
	return "CountHandler"
end

function CountHandler:internalName()
	return "counthandler"
end

function CountHandler:Init()
	ai.factories = 0
	ai.maxFactoryLevel = 0
	ai.factoriesAtLevel = {}
	ai.outmodedFactoryID = {}

	ai.nameCount = {}
	ai.nameCountFinished = {}
	ai.lastNameCreated = {}
	ai.lastNameFinished = {}
	ai.lastNameDead = {}
	ai.mexCount = 0
	ai.conCount = 0
	ai.combatCount = 0
	ai.battleCount = 0
	ai.breakthroughCount = 0
	ai.reclaimerCount = 0
	ai.assistCount = 0
	
	self:InitializeNameCounts()
end

function CountHandler:InitializeNameCounts()
	for name, t in pairs(unitTable) do
		ai.nameCount[name] = 0
	end
end