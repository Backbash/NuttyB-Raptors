--Mini Bosses v2b
-- Authors: RCore
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local unitDefs, tableMerge, tableCopy, raptor_matriarch_basic, customfusionexplo, spring = UnitDefs or {}, table.merge, table.copy, 'raptor_matriarch_basic', 'customfusionexplo', Spring

local nbQhpMult, nbHpMult = 1.3, 1.3

nbHpMult = unitDefs[raptor_matriarch_basic].health / 60000
nbQhpMult = unitDefs['raptor_queen_epic'].health / 1250000

local playerCountScale = 1
if spring.Utilities.Gametype.IsRaptors() then
	playerCountScale = (#spring.GetTeamList() - 2)/12
end

local spawnCountMult = spring.GetModOptions().raptor_spawncountmult or 3
local totalSpawnScale = playerCountScale * (spawnCountMult / 3)

local function scaledMax(base)
	return math.max(1, math.ceil(base * totalSpawnScale))
end

local mqAnger = {70, 85, 90, 105, 110, 125}
local mqTimeMult = math.max(1, spring.GetModOptions().raptor_queentimemult or 1.3)
local mqStart, mqLast = mqAnger[1], mqAnger[#mqAnger]
local mqTargetLast = mqTimeMult * mqAnger[#mqAnger]/1.3
local mqFactor = (mqTargetLast - mqStart) / (mqLast - mqStart)

for i = 2, #mqAnger do
    mqAnger[i] = math.floor(mqStart + (mqAnger[i] - mqStart) * mqFactor)
end

local mqNumQueens = spring.GetModOptions().raptor_queen_count or 1
local mqDoomAngerScale = 1
if nbQhpMult > 1.3 then mqDoomAngerScale = math.min(10, nbQhpMult / 1.3 * 0.9) end
local mqDoomAnger = math.ceil(mqDoomAngerScale * (8 * (1.06 ^ math.max(0, mqNumQueens - 8))))
local mqAngerBoss = mqTimeMult * 100 + mqDoomAnger
local maxDoombringers = math.max(3, scaledMax(math.floor((21 * mqNumQueens + 36) / 19)))

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
		nochasecategory = "MOBILE VTOL OBJECT",
		sonarstealth = false,
		stealth = false,
		speed = 67.5,
		customparams = {
			i18n_en_humanname = 'Raptor Consort',
			i18n_en_tooltip = 'Sneaky powerful little terror.'
		}
	}
)

unitDefs.raptor_consort.weapondefs.goo = tableCopy(unitDefs['raptor_queen_epic'].weapondefs.goo)

newUnit(
	'raptor_consort',
	'raptor_doombringer',
	{
		name = 'Doombringer',
		icontype = 'armafust3',
		health = raptor_matriarch_basic_health * 12,
		speed = 50,
		customparams = {
			i18n_en_humanname = 'Doombringer',
			i18n_en_tooltip = 'Your time is up. The Queens called for backup.'
		}		
	}
)

local function raptorSquad(p, q, e, r, s, t)
	return {
		raptorcustomsquad = true,
		raptorsquadunitsamount = s or 1,
		raptorsquadminanger = p,
		raptorsquadmaxanger = q,
		raptorsquadweight = t or 5,
		raptorsquadrarity = r or 'basic',
		raptorsquadbehavior = e,
		raptorsquadbehaviordistance = 500,
		raptorsquadbehaviorchance = 0.75
	}
end

local miniQueenCommon = {
	selfdestructas = customfusionexplo,
	explodeas = customfusionexplo,
	maxthisunit = scaledMax(3),
	weapondefs = {
		yellow_missile = { damage = { default = 1, vtol = 1000 } }
	}
}

for f, u in pairs {
	raptor_miniq_a = tableMerge(miniQueenCommon, {
		customparams = raptorSquad(mqAnger[1], mqAnger[2], 'berserk'),
		weapondefs = {
			goo = { damage = { default = 750 } },
			melee = { damage = { default = 4000 } },
		}
	}),
	raptor_miniq_b = tableMerge(miniQueenCommon, {
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
				name = 'Angry Eyes',
				reloadtime = 3,
				rgbcolor = '1 0 0.3',
				range = 500,
				damage = { default = 6000, commanders = 6000 }
			},		
			goo = {
				name = 'Snowball Barrage',
				soundstart = 'pensquawk1',
				cegtag = "blob_trail_blue",
				burst = 8,
				sprayangle = 2048,
				weaponvelocity = 600,
				reloadtime = 4,
				range = 1000,
				rgbcolor = "0.7 0.85 1.0",
				damage = { default = 1000 }
			}
		},
		weapons = {
			[1] = {
				def = "eyelaser",
				badtargetcategory = "VTOL OBJECT"
			},
			[2] = {
				def = 'goo',
				maindir = '0 0 1',
				maxangledif = 180,
				badtargetcategory = "VTOL OBJECT"
			}
		},
	},
	
	raptor_doombringer = {
		explodeas = "ScavComBossExplo",
		maxthisunit = maxDoombringers,
		customparams = raptorSquad(mqAngerBoss, 1000, 'berserk', nil, 1, 99),
		weapondefs = {
			eyelaser = {
				name = 'Eyes of Doom',
				reloadtime = 3,
				rgbcolor = '0.3 1 0',
				range = 500,			
				damage = { default = 48000, commanders = 24000  }
			},
			goo = {
				name = 'Amber Hailstorm',
				soundstart = 'penbray2',
				cegtag = "blob_trail_red",
				burst = 15,
				sprayangle = 3072,
				weaponvelocity = 600,
				reloadtime = 5,
				rgbcolor = "0.7 0.85 1.0",
				damage = { default = 5000 }
			}
		},
		weapons = {
			[1] = {
				def = "eyelaser",
				badtargetcategory = "VTOL OBJECT"
				},
			[2] = {
				def = 'goo',
				maindir = '0 0 1',
				maxangledif = 180,
				badtargetcategory = "VTOL OBJECT"
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
		maxthisunit = scaledMax(12),
		customparams = raptorSquad(51, 64, 'raider', 'basic', 2)
	}
} do
	unitDefs[f] = unitDefs[f] or {}
	table.mergeInPlace(unitDefs[f], u, true)
end

local newCosts = {
	raptor_mama_ba = 36000,
	raptor_mama_fi = 36000,
	raptor_mama_el = 36000,
	raptor_mama_ac = 36000,
	raptor_consort = 45000,
	raptor_doombringer = 90000,
}

local H = UnitDef_Post

function UnitDef_Post(p, I)
  if H then
    H(p, I)
  end

  local nbHpScale = 1

  if nbHpMult > 1.3 then
    nbHpScale = nbHpMult / 1.3
  end

  for unitName, baseCost in pairs(newCosts) do
    if UnitDefs[unitName] then
      local finalCost = math.floor(baseCost * nbHpScale)
      UnitDefs[unitName].metalcost = finalCost
    end
  end
end
