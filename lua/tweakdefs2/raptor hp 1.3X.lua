--NuttyB v1.52 1.3X HP
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
for f, g in pairs(UnitDefs) do
	if string.sub(f, 1, 24) == 'raptor_land_swarmer_heal' then
		g.reclaimspeed = 100
		g.stealth = 0
		g.builder = false
		g.workertime = g.workertime * 0.5
		g.canassist = 0
	end
	if
		g.customparams and g.customparams.subfolder and g.customparams.subfolder == 'other/raptors' and g.health and
			not f:match('^raptor_queen_.*')
	 then
		g.health = 1.3 * g.health
	end
end
