--V2 Meatballlunch Reloaded
local UnitDefs, baseUnits = UnitDefs or {}, 'armbotrail'
local NewUnits = {
	armmeatball = {
		customparams = { i18n_en_humanname = 'Meatball Launcher', i18n_en_tooltip = 'Moege das Mett mit dir sein!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 5300, energypershot = 96000, customparams = { stockpilelimit = 50, spawns_name = 'armmeatball' } } },
	},
	armassimilator = {
		customparams = { i18n_en_humanname = 'Assimilator Launcher', i18n_en_tooltip = 'Resistance is futile, embrace the bot swarm!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 4500, energypershot = 80000, customparams = { stockpilelimit = 50, spawns_name = 'armassimilator' } } },
	},
	armpwt4 = {
		customparams = { i18n_en_humanname = 'Epic Pawn Launcher', i18n_en_tooltip = 'Unleashes pawns so epic, they might start a revolution!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 14200, energypershot = 480000, customparams = { stockpilelimit = 50, spawns_name = 'armpwt4' } } },
	},
	legeshotgunmech = {
		customparams = { i18n_en_humanname = 'Pretorian Launcher', i18n_en_tooltip = 'Summons guardians so tough, they scoff at explosions!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 12500, energypershot = 384000, customparams = { stockpilelimit = 50, spawns_name = 'legeshotgunmech' } } },
	},
	legjav = {
		customparams = { i18n_en_humanname = 'Javelin Launcher', i18n_en_tooltip = 'Hurls javelins with pinpoint precision, skewering foes like kebabs!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 2150, energypershot = 102400, customparams = { stockpilelimit = 50, spawns_name = 'legjav' } } },
	},
	armraz = {
		customparams = { i18n_en_humanname = 'Razorback Launcher', i18n_en_tooltip = 'Fires razorbacks that charge into battle like grumpy space boars!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 6750, energypershot = 283520, customparams = { stockpilelimit = 50, spawns_name = 'armraz' } } },
	},
	corakt4 = {
		customparams = { i18n_en_humanname = 'Epic Grund Launcher', i18n_en_tooltip = 'Launches grunts so epic, they grunt their way to victory!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 10700, energypershot = 384000, customparams = { stockpilelimit = 50, spawns_name = 'corakt4' } } },
	},
	armvader = {
		customparams = { i18n_en_humanname = 'Tumbleweed Launcher', i18n_en_tooltip = 'Fires tumbleweeds that drift into battle, confusing everyone!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 115, energypershot = 12500, customparams = { stockpilelimit = 50, spawns_name = 'armvader' } } },
	},
	armvadert4 = {
		customparams = { i18n_en_humanname = 'Epic Tumbleweed Launcher', i18n_en_tooltip = 'Rolls out tumbleweeds so epic, they bowl over entire armies!' },
		weapondefs = { arm_botrail = { range = 32000, metalpershot = 26600, energypershot = 480000, customparams = { stockpilelimit = 50, spawns_name = 'armvadert4' } } },
	},
	armt1 = {
		customparams = { i18n_en_humanname = 'Armada T1 Launcher', i18n_en_tooltip = 'Quantity over quality' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 0.5,
				range = 32000,
				metalpershot = 190,
				energypershot = 2500,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'armham armjeth armpw armrock armwar armah armanac armmh armsh armart armfav armflash armjanus armpincer armsam armstump armzapper',
					spawns_mode = 'random',
				},
			},
		},
	},
	armt2 = {
		customparams = { i18n_en_humanname = 'Armada T2 Launcher', i18n_en_tooltip = 'More quality less quantity' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 1,
				range = 32000,
				metalpershot = 900,
				energypershot = 13000,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'armaak armamph armfast armfboy armfido armmav armsnipe armsptk armzeus armbull armcroc armgremlin armlatnk armmanni armmart armmerl armyork',
					spawns_mode = 'random',
				},
			},
		},
	},
	armt3 = {
		customparams = { i18n_en_humanname = 'Armada T3 Launcher', i18n_en_tooltip = 'Quality over quantity' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 2,
				range = 32000,
				metalpershot = 9500,
				energypershot = 150000,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'armbanth armlun armmar armprowl armraz armthor armvang armassimilator armlunchbox armsptkt4 armdronecarryland armrattet4 armpwt4 armmeatball',
					spawns_mode = 'random',
				},
			},
		},
	},
	cort1 = {
		customparams = { i18n_en_humanname = 'Cortex T1 Launcher', i18n_en_tooltip = 'Quantity over quality' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 0.5,
				range = 32000,
				metalpershot = 230,
				energypershot = 3500,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'corak corcrash corstorm corthud corah corhal cormh corsh corsnap corfav corgarp corgator corlevlr cormist corraid corwolv cortorch',
					spawns_mode = 'random',
				},
			},
		},
	},
	cort2 = {
		customparams = { i18n_en_humanname = 'Cortex T2 Launcher', i18n_en_tooltip = 'More quality less quantity' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 1,
				range = 32000,
				metalpershot = 1200,
				energypershot = 19500,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'coraak coramph corcan corhrk cormort corpyro corsumo corkark cortermite corban corgol cormart corparrow correap corsala corseal corsent corsiegebreaker cortrem corvrad corvroc corftiger corgatreap',
					spawns_mode = 'random',
				},
			},
		},
	},
	cort3 = {
		customparams = { i18n_en_humanname = 'Cortex T3 Launcher', i18n_en_tooltip = 'Quality over quantity' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 2,
				range = 32000,
				metalpershot = 14000,
				energypershot = 280000,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'corcat corjugg corkarg corkorg corshiva corakt4 cordeadeye corkarganetht4 corthermite corgolt4',
					spawns_mode = 'random',
				},
			},
		},
	},
	legt1 = {
		customparams = { i18n_en_humanname = 'Legion T1 Launcher', i18n_en_tooltip = 'Quantity over quality' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 0.5,
				range = 32000,
				metalpershot = 240,
				energypershot = 3400,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'legbal legcen leggob legkark leglob legah legcar legmh legner legsh legamphtank legbar leggat leghades leghelios legrail',
					spawns_mode = 'random',
				},
			},
		},
	},
	legt2 = {
		customparams = { i18n_en_humanname = 'Legion T2 Launcher', i18n_en_tooltip = 'More quality less quantity' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 1,
				range = 32000,
				metalpershot = 1000,
				energypershot = 18000,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'legamph legbart leginc legshot legsrail legstr legaheattank legamcluster legaskirmtank legavroc legfloat leginf legmed legmrv legvcarry legvflak',
					spawns_mode = 'random',
				},
			},
		},
	},
	legt3 = {
		customparams = { i18n_en_humanname = 'Legion T3 Launcher', i18n_en_tooltip = 'Quality over quantity' },
		weapondefs = {
			arm_botrail = {
				stockpiletime = 2,
				range = 32000,
				metalpershot = 12500,
				energypershot = 230000,
				customparams = {
					stockpilelimit = 50,
					spawns_name = 'leegmech legbunk legeheatraymech legelrpcmech legerailtank legeshotgunmech legjav legkeres leggobt3 legpede legsrailt4',
					spawns_mode = 'random',
				},
			},
		},
	},
}

local function createNewUnit(baseUnit, NewUnit)
	local buildOptions = {}
	for k, s in pairs(NewUnit) do
		local nU = baseUnit .. '_' .. k
		if UnitDefs[baseUnit] and not UnitDefs[nU] then
			UnitDefs[nU] = table.merge(UnitDefs[baseUnit], s)
			table.insert(buildOptions, nU)
		end
	end
	if UnitDefs.cormandot4 then
		UnitDefs.cormandot4.buildoptions = buildOptions
	end
end
createNewUnit(baseUnits, NewUnits)

-- This code adds new build options to the “Epic Commando” unit from the Cortex Faction (T3 Gantry with required experimental units + experimental SCAV units).
--The build options currently include 18 new unit launchers.
--Many T3 units and 9 launchers for T1-3 random units for each faction.

--,cordemon = {customparams = {i18n_en_humanname = "Demon Launcher", i18n_en_tooltip = "Unleashes demons that make enemies wish they stayed home!"}, weapondefs = {arm_botrail = {range = 32000,metalpershot = 10700,energypershot = 384000,customparams = {stockpilelimit = 50,spawns_name = "cordemon"}}}}
