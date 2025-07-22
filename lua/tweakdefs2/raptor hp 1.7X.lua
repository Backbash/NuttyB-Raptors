-- NuttyB v1.52 1.5X HP
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko

local oldUnitDef_Post = UnitDef_Post
function UnitDef_Post(unitID, unitDef)
    if oldUnitDef_Post and oldUnitDef_Post ~= UnitDef_Post then
        oldUnitDef_Post(unitID, unitDef)
    end

    if unitDef.customparams and unitDef.customparams.subfolder == 'other/raptors' then
        unitDef.metalcost = math.floor(unitDef.metalcost)
        unitDef.nochasecategory = "OBJECT"
    end
end

for unitName, unitDef in pairs(UnitDefs) do
	if string.sub(unitName, 1, 24) == 'raptor_land_swarmer_heal' then
		unitDef.reclaimspeed = 100
		unitDef.stealth = false
		unitDef.builder = false
		unitDef.workertime = (unitDef.workertime) * 0.5
		unitDef.canassist = false
		unitDef.maxthisunit = 0
	end

	if unitDef.customparams and unitDef.customparams.subfolder == 'other/raptors' and not unitName:match('^raptor_queen_.*') then
		if unitDef.health then
			unitDef.health = unitDef.health * 1.7
		end
		if unitDef.explodeas and unitDef.explodeas == "BUG_DEATH" then
			unitDef.explodeas = "ROOST_DEATH"
		end
		if unitDef.sfxtypes then
			unitDef.sfxtypes = nil
		end
	end
end
