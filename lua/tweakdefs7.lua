--T3 Eco builtin v6
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local unitDefs, cons =
	UnitDefs or {},
	{
		'armack',
		'armaca',
		'armacv',
		'corack',
		'coraca',
		'coracv',
		'legack',
		'legaca',
		'legacv'
	}

for _, factionMM in pairs({'armmmkrt3', 'cormmkrt3', 'legadveconvt3'}) do
	table.mergeInPlace(unitDefs[factionMM], {footprintx = 6, footprintz = 6})
end

for _, builderName in pairs(cons) do
	local faction, nBuildOptions = builderName:sub(1, 3), #unitDefs[builderName].buildoptions
	unitDefs[builderName].buildoptions[nBuildOptions + 1] = faction .. 'afust3'
	unitDefs[builderName].buildoptions[nBuildOptions + 2] = faction == 'leg' and 'legadveconvt3' or faction .. 'mmkrt3'
end

do
	local builderName = 'legck'
	local nBuildOptions = #unitDefs[builderName].buildoptions
	unitDefs[builderName].buildoptions[nBuildOptions + 1] = 'legdtf'
end

for _, unitName in pairs({ 'coruwadves', 'legadvestore' }) do
	table.mergeInPlace(unitDefs[unitName], { footprintx = 4, footprintz = 4 })
end
