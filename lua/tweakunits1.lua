--NuttyB v1.52 Legion Com
local tableMerge = table.merge
local allCustomParams = {
	combatradius = 0,
	paratrooper = true,
	fall_damage_multiplier = 0
}
return {
	legcom = {
		energymake = 50,
		metalmake = 5,
		health = 6000,
		autoheal = 40,
		buildoptions = {
			[32] = 'cornecro',
			[33] = 'legdtl',
			[34] = 'legdtf',
			[35] = 'legdtr'
		},
		customparams = tableMerge(
			allCustomParams,
			{
				stockpilelimit = 10,
				evolution_announcement = 'Legion commanders have upgraded to level 2',
				evolution_announcement_size = 18.5,
				evolution_target = 'legcomlvl2',
				evolution_condition = 'timer',
				evolution_timer = 420
			}
		),
		weapondefs = {
			legcomlaser = {
				corethickness = 0.45,
				duration = 0.09,
				name = 'Light close-quarters g2g/g2a laser',
				range = 360,
				reloadtime = 0.20,
				rgbcolor = '0 2 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw1',
				soundtrigger = true,
				sprayangle = 700,
				thickness = 7.5,
				texture1 = 'shot',
				texture2 = 'empty',
				weapontype = 'LaserCannon',
				weaponvelocity = 2100,
				damage = {
					default = 250
				}
			},
			shotgun = {
				areaofeffect = 60,
				energypershot = 0,
				avoidfeature = false,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.65,
				explosiongenerator = 'custom:genericshellexplosion-small',
				impulseboost = 0.2,
				impulsefactor = 0.2,
				intensity = 3,
				name = '6 Gauge Shotgun',
				noselfdamage = true,
				predictboost = 1,
				projectiles = 6,
				range = 320,
				reloadtime = 2,
				rgbcolor = '1 0.75 0.25',
				size = 2,
				soundhit = 'xplomed2xs',
				soundhitwet = 'splsmed',
				soundstart = 'kroggie2xs',
				soundstartvolume = 12,
				sprayangle = 3000,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 5,
				damage = {
					default = 1800,
					commanders = 0
				}
			}
		},
		weapons = {
			[3] = {
				def = 'shotgun',
				onlytargetcategory = 'SURFACE'
			}
		}
	},
	legcomlvl2 = {
		energymake = 150,
		metalmake = 15,
		speed = 57.5,
		autoheal = 100,
		customparams = tableMerge(
			allCustomParams,
			{
				stockpilelimit = 15,
				evolution_timer = 600
			}
		),
		buildoptions = {
			[1] = 'cornecro',
			[2] = 'legadvsol',
			[13] = 'corhllt',
			[26] = 'leggeo',
			[27] = 'legnanotc',
			[28] = 'legjam',
			[29] = 'legdtf',
			[30] = 'legmg',
			[31] = 'legrad',
			[32] = 'legdtl',
			[33] = 'legdtr',
			[34] = 'legrhapsis',
			[35] = 'legwin'
		},
		weapondefs = {
			legcomlaser = {
				accuracy = 50,
				areaofeffect = 60,
				avoidfriendly = false,
				avoidfeature = false,
				collidefriendly = false,
				collidefeature = true,
				beamtime = 0.09,
				corethickness = 0.6,
				duration = 0.09,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				name = 'Light close-quarters g2g/g2a laser',
				noselfdamage = true,
				range = 500,
				reloadtime = 0.2,
				rgbcolor = '0 0.95 0.05',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw1',
				soundtrigger = true,
				sprayangle = 500,
				targetmoveerror = 0.05,
				thickness = 7.5,
				tolerance = 1000,
				texture1 = 'shot',
				texture2 = 'empty',
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 2200,
				damage = {
					bombers = 180,
					default = 450,
					fighters = 110,
					subs = 5
				}
			},
			shotgun = {
				areaofeffect = 65,
				energypershot = 0,
				avoidfeature = false,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.65,
				explosiongenerator = 'custom:genericshellexplosion-small',
				impulseboost = 0.2,
				impulsefactor = 0.2,
				intensity = 3,
				name = '12 Gauge Shotgun',
				noselfdamage = true,
				predictboost = 1,
				projectiles = 7,
				range = 440,
				reloadtime = 2,
				rgbcolor = '1 0.75 0.25',
				size = 2.5,
				soundhit = 'xplomed2xs',
				soundhitwet = 'splsmed',
				soundstart = 'kroggie2xs',
				soundstartvolume = 12,
				sprayangle = 3250,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 5,
				damage = {
					default = 2200,
					commanders = 0
				}
			}
		},
		weapons = {
			[1] = {
				def = 'legcomlaser',
				onlytargetcategory = 'NOTSUB',
				fastautoretargeting = true
			},
			[3] = {
				def = 'shotgun',
				onlytargetcategory = 'SURFACE'
			}
		}
	},
	legcomlvl3 = {
		energymake = 1280,
		metalmake = 40,
		speed = 70.5,
		workertime = 700,
		autoheal = 150,
		customparams = tableMerge(
			allCustomParams,
			{
				stockpilelimit = 20,
				evolution_timer = 600
			}
		),
		buildoptions = {
			[1] = 'corgate',
			[2] = 'corfus',
			[3] = 'legbombard',
			[4] = 'coruwadves',
			[5] = 'cormoho',
			[6] = 'cormmkr',
			[10] = 'corarad',
			[11] = 'corshroud',
			[12] = 'legforti',
			[13] = 'legacluster',
			[14] = 'legamstor',
			[15] = 'legflak',
			[16] = 'legabm',
			[17] = 'legbastion',
			[29] = 'legdtr',
			[32] = 'cornecro',
			[33] = 'legdtl',
			[37] = '',
			[18] = '',
			[19] = '',
			[20] = ''
		},
		weapondefs = {
			armcomlaser = {
				accuracy = 50,
				areaofeffect = 80,
				avoidfriendly = true,
				avoidfeature = true,
				collidefriendly = false,
				collidefeature = true,
				beamtime = 0.09,
				corethickness = 0.75,
				duration = 0.09,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 0,
				impulseboost = 0,
				impulsefactor = 0,
				name = 'Light close-quarters g2g/g2a laser',
				noselfdamage = true,
				range = 640,
				reloadtime = 0.2,
				rgbcolor = '0 0.2 0.8',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw1',
				soundtrigger = true,
				sprayangle = 500,
				targetmoveerror = 0.05,
				thickness = 7.5,
				tolerance = 1000,
				texture1 = 'shot',
				texture2 = 'empty',
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 2500,
				damage = {
					bombers = 180,
					default = 650,
					fighters = 110,
					subs = 5
				}
			},
			shotgun = {
				areaofeffect = 90,
				energypershot = 0,
				avoidfeature = false,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.65,
				explosiongenerator = 'custom:genericshellexplosion-small',
				impulseboost = 0.2,
				impulsefactor = 0.2,
				intensity = 3,
				name = '12 Gauge Shotgun',
				noselfdamage = true,
				predictboost = 1,
				projectiles = 7,
				range = 540,
				reloadtime = 2,
				rgbcolor = '1 0.75 0.25',
				size = 2.5,
				soundhit = 'xplomed2xs',
				soundhitwet = 'splsmed',
				soundstart = 'kroggie2xs',
				soundstartvolume = 12,
				sprayangle = 3250,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 5,
				damage = {
					default = 3200,
					commanders = 0
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
				def = 'shotgun',
				onlytargetcategory = 'SURFACE'
			},
			[5] = {
				def = ''
			}
		}
	},
	legcomlvl4 = {
		energymake = 1980,
		metalmake = 46,
		speed = 88.5,
		workertime = 1000,
		autoheal = 180,
		customparams = tableMerge(allCustomParams, {stockpilelimit = 20}),
		buildoptions = {
			[1] = 'corgate',
			[2] = 'corfus',
			[3] = 'legbombard',
			[4] = 'coruwadves',
			[5] = 'cormoho',
			[6] = 'cormmkr',
			[9] = '',
			[10] = 'corarad',
			[11] = 'corshroud',
			[12] = '',
			[13] = 'legacluster',
			[14] = 'legamstor',
			[15] = 'legflak',
			[16] = 'legabm',
			[17] = 'legbastion',
			[18] = 'legdtr',
			[19] = 'legnanotct2',
			[20] = 'legnanotct2plat',
			[21] = 'legrwall',
			[24] = '',
			[28] = '',
			[29] = '',
			[30] = 'legpede',
			[31] = 'corkorg',
			[32] = 'corjugg',
			[33] = 'cornecro',
			[34] = 'corafus',
			[35] = 'cormexp',
			[36] = 'legdtl',
			[37] = 'legdtf',
			[39] = '',
			[48] = '',
			[49] = '',
			[50] = '',
			[51] = ''
		},
		weapondefs = {
			armcomlaser = {
				accuracy = 50,
				areaofeffect = 126,
				avoidfriendly = true,
				avoidfeature = true,
				collidefriendly = false,
				collidefeature = true,
				beamtime = 0.1,
				corethickness = 1,
				duration = 0.09,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 0,
				impulseboost = 0,
				impulsefactor = 0,
				name = 'Light close-quarters g2g/g2a laser',
				noselfdamage = true,
				range = 900,
				reloadtime = 0.1,
				rgbcolor = '0.45 0 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw1',
				soundtrigger = 1,
				sprayangle = 400,
				targetmoveerror = 0.05,
				thickness = 10,
				tolerance = 1000,
				texture1 = 'shot',
				texture2 = 'empty',
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					bombers = 180,
					default = 1750,
					fighters = 110,
					subs = 5
				}
			},
			shotgun = {
				areaofeffect = 75,
				energypershot = 0,
				avoidfeature = false,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.65,
				explosiongenerator = 'custom:genericshellexplosion-small',
				impulseboost = 0.2,
				impulsefactor = 0.2,
				intensity = 3,
				name = '60 Gauge Raptor Popper',
				noselfdamage = true,
				predictboost = 1,
				projectiles = 9,
				range = 550,
				reloadtime = 1,
				rgbcolor = '1 0.75 0.25',
				size = 5,
				soundhit = 'xplomed2xs',
				soundhitwet = 'splsmed',
				soundstart = 'kroggie2xs',
				soundstartvolume = 12,
				sprayangle = 4000,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 4,
				damage = {
					default = 4400,
					commanders = 0
				}
			}
		},
		weapons = {
			[1] = {
				def = 'armcomlaser',
				onlytargetcategory = 'NOTSUB'
			},
			[3] = {
				def = 'shotgun',
				onlytargetcategory = 'SURFACE'
			},
			[5] = {
				def = ''
			}
		}
	}
}
