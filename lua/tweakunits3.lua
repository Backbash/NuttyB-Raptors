--NuttyB v1.52 Cortex Com
-- Authors: ChrispyNut, BackBash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
return {
	corcom = {
		customparams = {
			evolution_announcement = 'Cor Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'corcomlvl2',
			evolution_condition = 'timer',
			evolution_timer = 420, -- Adjusted timer value
			combatradius = 0,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		autoheal = 40,
		speed = 40,
		energymake = 75,
		metalmake = 6,
		health = 5000,
		buildoptions = {
			[28] = 'corhllt',
			[29] = 'cornecro',
			[30] = 'corlevlr',
			[31] = 'corak',
			[32] = 'cormaw'
		},
		weapondefs = {
			corcomlaser = {
				range = 350,
				damage = {
					bombers = 180,
					default = 260,
					fighters = 110,
					subs = 5
				}
			},
			disintegrator = {
				energypershot = 1000,
				reloadtime = 8
			}
		}
	},
	corcomlvl2 = {
		speed = 62,
		health = 8500,
		energymake = 255,
		metalmake = 16,
		autoheal = 150,
		builddistance = 200,
		workertime = 600,
		buildoptions = {
			[1] = 'corsolar',
			[2] = 'coradvsol',
			[3] = 'corwin',
			[4] = 'corgeo',
			[5] = 'cormstor',
			[6] = 'corestor',
			[7] = 'cormex',
			[8] = 'corexp',
			[9] = 'cormakr',
			[10] = 'corcan',
			[11] = 'correap',
			[12] = 'corlab',
			[13] = 'corvp',
			[14] = 'corap',
			[15] = 'corhp',
			[16] = 'cornanotc',
			[17] = 'coreyes',
			[18] = 'corrad',
			[19] = 'cordrag',
			[20] = 'cormaw',
			[21] = 'corllt',
			[22] = 'corhllt',
			[23] = 'corhlt',
			[24] = 'corpun',
			[25] = 'corrl',
			[26] = 'cormadsam',
			[27] = 'corerad',
			[28] = 'cordl',
			[29] = 'corjamt',
			[30] = 'corjuno',
			[31] = 'corsy',
			[32] = 'coruwgeo',
			[33] = 'corfasp',
			[34] = 'cornerco',
			[35] = 'coruwes',
			[36] = 'corplat',
			[37] = 'corfhp',
			[38] = 'coruwms',
			[39] = 'corfhlt',
			[40] = 'cornanotcplat',
			[41] = 'corfmkr',
			[42] = 'cortide',
			[43] = 'corfrad',
			[44] = 'corfrt',
			[45] = 'corfdrag',
			[46] = 'cortl',
			[47] = 'cornecro'
		},
		customparams = {
			evolution_announcement = 'Combat Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'corcomlvl3',
			evolution_condition = 'timer',
			evolution_timer = 900,
			combatradius = 0,
			shield_power = 500,
			shield_radius = 100,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		weapondefs = {
			armcomlaser = {
				areaofeffect = 16,
				avoidfeature = false,
				beamtime = 0.1,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 7.7,
				name = 'Light close-quarters g2g/g2a laser',
				noselfdamage = true,
				range = 500,
				reloadtime = 0.4,
				rgbcolor = '0.6 0.3 0.8',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrfir1',
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 4,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 900,
				damage = {
					bombers = 180,
					default = 1500,
					fighters = 110,
					subs = 5
				}
			},
			disintegrator = {
				areaofeffect = 36,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				bouncerebound = 0,
				cegtag = 'dgunprojectile',
				commandfire = true,
				craterboost = 0,
				cratermult = 0.15,
				edgeeffectiveness = 0.15,
				energypershot = 500,
				explosiongenerator = 'custom:expldgun',
				firestarter = 100,
				firesubmersed = false,
				groundbounce = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = 'Disintegrator',
				noexplode = true,
				noselfdamage = true,
				range = 250,
				reloadtime = 6,
				paralyzer = {},
				soundhit = 'xplomas2s',
				soundhitwet = 'sizzlexs',
				soundstart = 'disigun1',
				soundhitvolume = 36,
				soundstartvolume = 96,
				soundtrigger = true,
				tolerance = 10000,
				turret = true,
				waterweapon = true,
				weapontimer = 4.2,
				weapontype = 'DGun',
				weaponvelocity = 300,
				damage = {
					commanders = 0,
					default = 20000,
					raptors = 10000
				}
			}
		},
		weapons = {
			[1] = {
				def = 'armcomlaser',
				onlytargetcategory = 'NOTSUB',
				fastautoretargeting = true
			},
			[3] = {
				def = 'DISINTEGRATOR',
				onlytargetcategory = 'NOTSUB'
			}
		}
	},
	corcomlvl3 = {
		speed = 75.5,
		health = 12500,
		energymake = 2180,
		metalmake = 49,
		autoheal = 180,
		workertime = 1200,
		builddistance = 250,
		buildoptions = {
			[1] = 'corfus',
			[2] = 'corafus',
			[3] = 'corageo',
			[4] = 'corbhmth',
			[5] = 'cormoho',
			[6] = 'cormexp',
			[7] = 'cormmkr',
			[8] = 'coruwadves',
			[9] = 'coruwadvms',
			[10] = 'corarad',
			[11] = 'corshroud',
			[12] = 'corfort',
			[13] = 'corlab',
			[14] = 'cortarg',
			[15] = 'corsd',
			[16] = 'corgate',
			[17] = 'cortoast',
			[18] = 'corvipe',
			[19] = 'cordoom',
			[20] = 'corflak',
			[21] = 'corscreamer',
			[22] = 'corvp',
			[23] = 'corfmd',
			[24] = 'corap',
			[25] = 'corint',
			[26] = 'corplat',
			[27] = 'corsy',
			[28] = 'coruwmme',
			[29] = 'coruwmmm',
			[30] = 'corenaa',
			[31] = 'corfdoom',
			[32] = 'coratl',
			[33] = 'coruwfus',
			[34] = 'corjugg',
			[35] = 'corshiva',
			[36] = 'corsumo',
			[37] = 'corgol',
			[38] = 'corkorg',
			[39] = 'cornanotc2plat',
			[40] = 'cornanotct2',
			[41] = 'cornecro',
			[42] = 'cordoomt3',
			[43] = 'corhllllt',
			[44] = 'cormaw',
			[45] = 'cormwall'
		},
		customparams = {
			shield_power = 500,
			shield_radius = 100,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		weapondefs = {
			corcomlaser = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.1,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 5.5,
				name = 'J7Laser',
				noselfdamage = true,
				range = 900,
				reloadtime = 0.4,
				rgbcolor = '0.7 0 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrfir1',
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 3,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 900,
				damage = {
					default = 2000,
					subs = 5
				}
			},
			disintegrator = {
				areaofeffect = 36,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				bouncerebound = 0,
				cegtag = 'dgunprojectile',
				commandfire = true,
				craterboost = 0,
				cratermult = 0.15,
				edgeeffectiveness = 0.15,
				energypershot = 500,
				explosiongenerator = 'custom:expldgun',
				firestarter = 100,
				firesubmersed = false,
				groundbounce = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = 'Disintegrator',
				noexplode = true,
				noselfdamage = true,
				range = 250,
				reloadtime = 3,
				paralyzer = {},
				soundhit = 'xplomas2s',
				soundhitwet = 'sizzlexs',
				soundstart = 'disigun1',
				soundhitvolume = 36,
				soundstartvolume = 96,
				soundtrigger = true,
				tolerance = 10000,
				turret = true,
				waterweapon = true,
				weapontimer = 4.2,
				weapontype = 'DGun',
				weaponvelocity = 300,
				damage = {
					commanders = 0,
					default = 20000,
					scavboss = 1000
				}
			}
		},
		weapons = {
			[1] = {
				def = 'CORCOMLASER',
				onlytargetcategory = 'NOTSUB',
				fastautoretargeting = true
			},
			[5] = {
				def = ''
			}
		}
	}
}
