--Building Nanos
function deepcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[deepcopy(orig_key)] = deepcopy(orig_value)
		end
		setmetatable(copy, deepcopy(getmetatable(orig)))
	else
		copy = orig
	end
	return copy
end
local UnitDefs = UnitDefs or {}
local Factions = { 'arm', 'cor', 'leg' }

--T1 Buildoptions
for _, faction in ipairs(Factions) do
	local units = { faction .. 'nanotc', faction .. 'respawn', 'legnanotcbase' }
	for _, unit in ipairs(units) do
		if UnitDefs[unit] then
			local baseBuildOptions = deepcopy(UnitDefs[faction .. 'ck'].buildoptions)
			UnitDefs[unit].buildoptions = {}
			for i, option in ipairs(baseBuildOptions) do
				UnitDefs[unit].buildoptions[i] = option
			end
		end
	end
end

--T2 Buildoptions
for _, faction in ipairs(Factions) do
	local short = { faction .. 'apt3', faction .. 'afust3', faction .. 'gatet3', faction .. 'nanotct2', faction .. 'wint2', faction .. 'aap', faction .. 'avp' }
	local additionalBuildOptions = {}
	if faction == 'arm' then
		additionalBuildOptions = { 'armminivulc', 'armbotrail', 'armannit3', 'armmmkrt3', 'armshockwave', 'armlwall' }
	elseif faction == 'cor' then
		additionalBuildOptions = { 'corminibuzz', 'corhllllt', 'cordoomt3', 'cormmkrt3', 'cormwall' }
	elseif faction == 'leg' then
		additionalBuildOptions = { 'legministarfall', 'legadveconvt3', 'legmohocon', 'legrwall' }
	end

	-- Combine the two tables
	local addBuildoptions = {}
	for _, option in ipairs(short) do
		table.insert(addBuildoptions, option)
	end
	for _, option in ipairs(additionalBuildOptions) do
		table.insert(addBuildoptions, option)
	end

	if UnitDefs[faction .. 'nanotct2'] then
		UnitDefs[faction .. 'nanotct2'].buildoptions = deepcopy(UnitDefs[faction .. 'ack'].buildoptions)
		for _, option in ipairs(addBuildoptions) do
			table.insert(UnitDefs[faction .. 'nanotct2'].buildoptions, option)
		end
	end
end
