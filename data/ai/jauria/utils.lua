function IsWorker(unit)
	for i,name in ipairs(workerList) do
		if name == unit:Internal():Name() then
			return true
		end
	end
	return false
end
