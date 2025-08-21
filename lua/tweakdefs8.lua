--T3 Cons & Taxed Factories
-- Authors: Nervensaege, TetrisCo
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local unitDefs, factions, tableMerge, factionPrefix, _taxed, taxMultiplier, tableContains =
	UnitDefs or {},
	{'arm', 'cor', 'leg'},
	table.merge,
	{arm = 'Armada ', cor = 'Cortex ', leg = 'Legion '},
	'_taxed',
	1.5,
	table.contains

local function addNewMergedUnitDef(baseUnit, newUnit, mergeProps)
	if unitDefs[baseUnit] and not unitDefs[newUnit] then
		unitDefs[newUnit] = tableMerge(unitDefs[baseUnit], mergeProps)
	end
end

for _, faction in pairs(factions) do
	local isArm, isCor, isLeg = faction == 'arm', faction == 'cor', faction == 'leg'

	-- T3 Construction Turret
	addNewMergedUnitDef(
		faction .. 'nanotct2',
		faction .. 'nanotct3',
		{
			metalcost = 3700,
			energycost = 62000,
			builddistance = 550,
			buildtime = 108000,
			collisionvolumescales = '61 128 61',
			footprintx = 6,
			footprintz = 6,
			health = 8800,
			mass = 37200,
			sightdistance = 575,
			workertime = 1900,
			icontype = "armnanotct2",
			canrepeat = true,
			objectname = isLeg and 'Units/legnanotcbase.s3o' or isCor and 'Units/CORRESPAWN.s3o' or 'Units/ARMRESPAWN.s3o',
			customparams = {
				i18n_en_humanname = 'T3 Construction Turret',
				i18n_en_tooltip = 'More BUILDPOWER! For the connoisseur'
			}
		}
	)

	-- T3 Metal Storage
	addNewMergedUnitDef(
		isLeg and 'legamstor' or faction .. 'uwadvms',
		isLeg and 'legamstort3' or faction .. 'uwadvmst3',
		{
			metalstorage = 30000,
			metalcost = 4200,
			energycost = 231150,
			buildtime = 142800,
			health = 53560,
			maxthisunit = 3,
			icontype = "armuwadves",
			name = factionPrefix[faction] .. 'T3 Metal Storage',
			customparams = {
				i18n_en_humanname = 'T3 Hardened Metal Storage',
				i18n_en_tooltip = 'The big metal storage tank for your most precious resources. Chopped chicken!'
			}
		}
	)

	-- T3 Energy Storage
	addNewMergedUnitDef(
		isLeg and 'legadvestore' or faction .. 'uwadves',
		isLeg and 'legadvestoret3' or faction .. 'advestoret3',
		{
			energystorage = 272000,
			metalcost = 2100,
			energycost = 59000,
			buildtime = 93380,
			health = 49140,
			icontype = "armuwadves",
			maxthisunit = 3,
			name = factionPrefix[faction] .. 'T3 Energy Storage',
			customparams = {
				i18n_en_humanname = 'T3 Hardened Energy Storage',
				i18n_en_tooltip = 'Power! Power! We need power!1!'
			}
		}
	)

	-- T1/T2 Turret Overhaul
	for _, unit in pairs({faction .. 'nanotc', faction .. 'nanotct2'}) do
		if unitDefs[unit] then
			unitDefs[unit].canrepeat = true
		end
	end

	local baseFactory = isArm and 'armshltx' or isCor and 'corgant' or 'leggant'
	local baseDef = unitDefs[baseFactory]
	addNewMergedUnitDef(
		baseFactory,
		baseFactory .. _taxed,
		{
			energycost = baseDef.energycost * taxMultiplier,
			icontype = baseFactory,
			metalcost = baseDef.metalcost * taxMultiplier,
			name = factionPrefix[faction] .. 'Experimental Gantry Taxed',
			customparams = {
				i18n_en_humanname = factionPrefix[faction] .. 'Experimental Gantry Taxed',
				i18n_en_tooltip = 'Produces Experimental Units'
			}
		}
	)

	local t3AideBuildoptions, commonBuildoptions = {},
		{
			faction .. 'afust3',
			faction .. 'nanotct2',
			faction .. 'nanotct3',
			faction .. 'alab',
			faction .. 'avp',
			faction .. 'aap',
			faction .. 'gatet3',
			faction .. 'flak',
			-- Legion vs others conditional options
			isLeg and 'legadveconvt3' or faction .. 'mmkrt3',
			isLeg and 'legamstort3' or faction .. 'uwadvmst3',
			isLeg and 'legadvestoret3' or faction .. 'advestoret3',
			isLeg and 'legdeflector' or faction .. 'gate',
			isLeg and 'legforti' or faction .. 'fort',
			isArm and 'armshltx' or faction .. 'gant'
		}

	for _, option in ipairs(commonBuildoptions) do
		t3AideBuildoptions[#t3AideBuildoptions + 1] = option
	end

	-- Add taxed gantries (only for other factions)
	local taxedMap = {
		arm = {'corgant', 'leggant'},
		cor = {'armshltx', 'leggant'},
		leg = {'armshltx', 'corgant'}
	}

	for _, gantry in ipairs(taxedMap[faction] or {}) do
		t3AideBuildoptions[#t3AideBuildoptions + 1] = gantry .. _taxed
	end

	-- Add faction-exclusive options with lookup tables
	local exclusiveOptions = {
		arm = {'armamd', 'armmercury', 'armbrtha', 'armminivulc', 'armvulc', 'armanni', 'armannit3', 'armlwall', 'legendary_pulsar'},
		cor = {'corfmd', 'corscreamer', 'cordoomt3', 'corbuzz', 'corminibuzz', 'corint', 'cordoom', 'corhllllt', 'cormwall', 'legendary_bulwark'},
		leg = {'legabm', 'legstarfall', 'legministarfall', 'leglraa', 'legbastion', 'legrwall', 'leglrpc', 'legendary_bastion', 'legapopupdef', 'legdtf'}
	}

	for _, option in ipairs(exclusiveOptions[faction] or {}) do
		t3AideBuildoptions[#t3AideBuildoptions + 1] = option
	end

	-- Epic Ground Constructor Aide
	local newUnit = faction .. 't3aide'
	addNewMergedUnitDef(
		faction .. 'decom',
		newUnit,
		{
			blocking = true,
			builddistance = 350,
			buildtime = 140000,
			energycost = 200000,
			energyupkeep = 2000,
			health = 10000,
			idleautoheal = 5,
			idletime = 1800,
			maxthisunit = 1,
			metalcost = 12600,
			speed = 85,
			terraformspeed = 3000,
			turninplaceanglelimit = 1.890,
			turnrate = 1240,
			workertime = 6000,
			reclaimable = true,
			candgun = false,
			name = factionPrefix[faction] .. 'Epic Aide',
			customparams = {
				subfolder = 'ArmBots/T3',
				techlevel = 3,
				unitgroup = 'buildert3',
				i18n_en_humanname = 'Epic Ground Construction Aide',
				i18n_en_tooltip = 'Your Aide that helps you construct buildings'
			},
			buildoptions = t3AideBuildoptions
		}
	)
	unitDefs[newUnit].weapondefs = {}
	unitDefs[newUnit].weapons = {}

	-- Epic Air Constructor Aide
	newUnit = faction .. 't3airaide'
	addNewMergedUnitDef(
		'armfify',
		newUnit,
		{
			blocking = false,
			canassist = true,
			cruisealtitude = 3000,
			builddistance = 1750,
			buildtime = 140000,
			energycost = 200000,
			energyupkeep = 2000,
			health = 1100,
			idleautoheal = 5,
			idletime = 1800,
			icontype = "armnanotct2",
			maxthisunit = 1,
			metalcost = 13400,
			speed = 25,
			category = "OBJECT",
			terraformspeed = 3000,
			turninplaceanglelimit = 1.890,
			turnrate = 1240,
			workertime = 1600,
			buildpic = 'ARMFIFY.DDS',
			name = factionPrefix[faction] .. 'Epic Aide',
			customparams = {
				is_builder = true,
				subfolder = 'ArmBots/T3',
				techlevel = 3,
				unitgroup = 'buildert3',
				i18n_en_humanname = 'Epic Air Construction Aide',
				i18n_en_tooltip = 'Your Aide that helps you construct buildings'
			},
			buildoptions = t3AideBuildoptions
		}
	)
	unitDefs[newUnit].weapondefs = {}
	unitDefs[newUnit].weapons = {}

	-- Buildoptions for T3 Gantrys (Ground)
	local factoryName = isArm and 'armshltx' or isCor and 'corgant' or 'leggant'
	if unitDefs[factoryName] and unitDefs[factoryName].buildoptions then
		local groundAide = faction .. 't3aide'
		if not tableContains(unitDefs[factoryName].buildoptions, groundAide) then
			table.insert(unitDefs[factoryName].buildoptions, groundAide)
		end
	end

	-- Buildoptions for T3 Gantrys (air)
	factoryName = faction .. 'apt3'
	if unitDefs[factoryName] and unitDefs[factoryName].buildoptions then
		local airAide = faction .. 't3airaide'
		if not tableContains(unitDefs[factoryName].buildoptions, airAide) then
			table.insert(unitDefs[factoryName].buildoptions, airAide)
		end
	end
end
