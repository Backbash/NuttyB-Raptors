-- Mini-Bosses
-- Authors: RCore
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local unitDefs, tableMerge, tableCopy, raptor_matriarch_basic, customfusionexplo = UnitDefs or {}, table.merge, table.copy, 'raptor_matriarch_basic', 'customfusionexplo'

-- Player scaling setup
local playerCountScale = 1
if Spring.Utilities.Gametype.IsRaptors() then
	playerCountScale = (#Spring.GetTeamList() - 2)/12
end

local function scaledMax(base)
	return math.max(1, math.ceil(base * playerCountScale))
end

-- Queen time scaling (baseline = 1.3) define and scale mqAnger
local mqAnger = {70, 85, 90, 105, 110, 125}
local mqTimeMult = math.max(1, Spring.GetModOptions().raptor_queentimemult or 1.3)
local mqStart, mqLast = mqAnger[1], mqAnger[#mqAnger]
local mqTargetLast = mqTimeMult * 97
local mqFactor = (mqTargetLast - mqStart) / (mqLast - mqStart)

for i = 2, #mqAnger do
    mqAnger[i] = math.floor(mqStart + (mqAnger[i] - mqStart) * mqFactor)
end
mqAnger[1] = mqStart

local function newUnit(old, new, data)
	if unitDefs[old] and not unitDefs[new] then
		unitDefs[new] = tableMerge(unitDefs[old], data or {})
	end
end

local raptor_matriarch_basic_health = unitDefs[raptor_matriarch_basic].health

newUnit(
	'raptor_queen_veryeasy',
	'raptor_miniq_a',
	{
		name = 'Queenling Prima',
		icontype = 'raptor_queen_veryeasy',
		health = raptor_matriarch_basic_health * 5,
		customparams = {
			i18n_en_humanname = 'Queenling Prima',
			i18n_en_tooltip = 'Majestic and bold, ruler of the hunt.'
		}
	}
)

newUnit(
	'raptor_queen_easy',
	'raptor_miniq_b',
	{
		name = 'Queenling Secunda',
		icontype = 'raptor_queen_easy',
		health = raptor_matriarch_basic_health * 7,
		customparams = {
			i18n_en_humanname = 'Queenling Secunda',
			i18n_en_tooltip = 'Swift and sharp, a noble among raptors.'
		}
	}
)

newUnit(
	'raptor_queen_normal',
	'raptor_miniq_c',
	{
		name = 'Queenling Tertia',
		icontype = 'raptor_queen_normal',
		health = raptor_matriarch_basic_health * 9,
		customparams = {
			i18n_en_humanname = 'Queenling Tertia',
			i18n_en_tooltip = 'Refined tastes. Likes her prey rare.'
		}
	}
)

for _, l in ipairs {
	{ 'raptor_matriarch_basic',    'raptor_mama_ba', 'Matrona',            'Claws charged with vengeance.' },
	{ 'raptor_matriarch_fire',     'raptor_mama_fi', 'Pyro Matrona',       'A firestorm of maternal wrath.' },
	{ 'raptor_matriarch_electric', 'raptor_mama_el', 'Paralyzing Matrona', 'Crackling with rage, ready to strike.' },
	{ 'raptor_matriarch_acid',     'raptor_mama_ac', 'Acid Matrona',       'Acid-fueled, melting everything in sight.' }
} do
	newUnit(
		l[1],
		l[2],
		{
			name = l[3],
			icontype = l[1],
			health = raptor_matriarch_basic_health * 1.5,
			customparams = {
				i18n_en_humanname = l[3],
				i18n_en_tooltip = l[4]
			}
		}
	)
end

newUnit(
	'critter_penguinking',
	'raptor_consort',
	{
		name = 'Raptor Consort',
		icontype = 'corkorg',
		health = raptor_matriarch_basic_health * 4,
		mass = 100000,
		sonarstealth = false,
		stealth = false,
		speed = 67.5,
		customparams = {
			i18n_en_humanname = 'Raptor Consort',
			i18n_en_tooltip = 'Sneaky powerful little terror.'
		}
	}
)

unitDefs.raptor_consort.weapondefs.melee = tableCopy(unitDefs[raptor_matriarch_basic].weapondefs.melee)

local function raptorSquad(p, q, e, r, s, t)
	return {
		raptorcustomsquad = true,
		raptorsquadunitsamount = s or 1,
		raptorsquadminanger = p,
		raptorsquadmaxanger = q,
		raptorsquadweight = t or 1,
		raptorsquadrarity = r or 'basic',
		raptorsquadbehavior = e,
		raptorsquadbehaviordistance = 500,
		raptorsquadbehaviorchance = 0.75
	}
end

local miniQueenCommon = {
	selfdestructas = customfusionexplo,
	explodeas = customfusionexplo,
	maxthisunit = scaledMax(4),
	weapondefs = {
		yellow_missile = { damage = { default = 1, vtol = 1000 } }
	}
}

for f, u in pairs {
	raptor_miniq_a = tableMerge(miniQueenCommon, {
		maxthisunit = scaledMax(4),
		customparams = raptorSquad(mqAnger[1], mqAnger[2], 'berserk'),
		weapondefs = {
			goo = { damage = { default = 750 } },
			melee = { damage = { default = 4000 } },
		}
	}),
	raptor_miniq_b = tableMerge(miniQueenCommon, {
		maxthisunit = scaledMax(4),
		customparams = raptorSquad(mqAnger[3], mqAnger[4], 'berserk'),
		weapondefs = {
			goo = { damage = { default = 1500 } },
			melee = { damage = { default = 7000 } },
		}
	}),
	raptor_miniq_c = tableMerge(miniQueenCommon, {
		maxthisunit = scaledMax(4),
		customparams = raptorSquad(mqAnger[5], mqAnger[6], 'berserk'),
		weapondefs = {
			goo = { damage = { default = 3000 } },
			melee = { damage = { default = 10000 } },
		}
	}),
	raptor_consort = {
		explodeas = 'raptor_empdeath_big',
		maxthisunit = scaledMax(8),
		customparams = raptorSquad(mqAnger[2], 1000, 'berserk'),
		weapondefs = {
			eyelaser = {
				range = 800,
				reloadtime = 2,
				damage = {
					commanders = 6000,
					default = 6000
				}
			},
			melee = {
				name = 'Royal Beak Attack',
				range = 300,
				soundstart = 'pensquawk1',
				damage = { default = 1000 }
			}
		},
		weapons = {
			[2] = {
				def = 'melee',
				maindir = '0 0 1',
				maxangledif = 155
			}
		}
	},
	raptor_mama_ba = {
		maxthisunit = scaledMax(4),
		customparams = raptorSquad(55, mqAnger[3]-1, 'berserk'),
		weapondefs = {
			goo = { damage = { default = 750 } },
			melee = { damage = { default = 750 } }
		}
	},
	raptor_mama_fi = {
		explodeas = 'raptor_empdeath_big',
		maxthisunit = scaledMax(4),
		customparams = raptorSquad(55, mqAnger[3]-1, 'berserk'),
		weapondefs = {
			flamethrowerspike = { damage = { default = 120 } },
			flamethrowermain = { damage = { default = 240 } }
		}
	},
	raptor_mama_el = {
		maxthisunit = scaledMax(4),
		customparams = raptorSquad(65, 1000, 'berserk')
	},
	raptor_mama_ac = {
		maxthisunit = scaledMax(4),
		customparams = raptorSquad(60, 1000, 'berserk'),
		weapondefs = {
			melee = { damage = { default = 750 } }
		}
	},
	raptor_land_assault_basic_t4_v2 = {
		maxthisunit = scaledMax(8),
		customparams = raptorSquad(33, 50, 'raider')
	},
	raptor_land_assault_basic_t4_v1 = {
		maxthisunit = scaledMax(16),
		customparams = raptorSquad(51, 69, 'raider', 'basic', 2)
	}
} do
	unitDefs[f] = unitDefs[f] or {}
	table.mergeInPlace(unitDefs[f], u, true)
end
