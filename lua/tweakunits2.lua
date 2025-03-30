--NuttyB v1.52 Armada Com
-- Authors: ChrispyNut, BackBash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
return {
	armcom = {
		customparams = {
			evolution_announcement = 'Arm Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'armcomlvl2',
			evolution_condition = 'timer',
			evolution_timer = 420,
			combatradius = 0,
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		energymake = 100,
		metalmake = 10,
		autoheal = 55,
		health = 4500,
		speed = 40,
		canresurrect = true,
		buildoptions = {
			'armsolar',
			'armwin',
			'armmstor',
			'armestor',
			'armmex',
			'armmakr',
			'armlab',
			'armvp',
			'armap',
			'armeyes',
			'armrad',
			'armdrag',
			'armllt',
			'armrl',
			'armdl',
			'armtide',
			'armuwms',
			'armuwes',
			'armuwmex',
			'armfmkr',
			'armsy',
			'armfdrag',
			'armtl',
			'armfrt',
			'armfrad',
			'armhp',
			'armfhp',
			'armgeo',
			'armamex',
			'armhp',
			'armbeamer',
			'armjamt',
			'armsy',
			'armrectr',
			'armclaw'
		},
		weapondefs = {
			armcomlaser = {
				range = 320,
				rgbcolor = '0.7 1 1',
				soundstart = 'lasrfir1',
				damage = {
					default = 165
				}
			},
			old_armsnipe_weapon = {
				areaofeffect = 32,
				avoidfeature = true,
				avoidfriendly = true,
				collidefeature = true,
				collidefriendly = false,
				corethickness = 0.75,
				craterareaofeffect = 0,
				craterboost = 0,
				commandfire = true,
				cratermult = 0,
				cegtag = 'railgun',
				duration = 0.12,
				edgeeffectiveness = 0.85,
				energypershot = 400,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 100,
				impulseboost = 0.4,
				impulsefactor = 1,
				intensity = 0.8,
				name = 'Long-range g2g armor-piercing rifle',
				range = 550,
				reloadtime = 1,
				rgbcolor = '0 1 1',
				rgbcolor2 = '0 1 1',
				soundhit = 'sniperhit',
				soundhitwet = 'sizzle',
				soundstart = 'sniper3',
				soundtrigger = true,
				stockpile = true,
				stockpiletime = 7,
				customparams = {
					stockpilelimit = 5
				},
				texture1 = 'shot',
				texture2 = 'empty',
				thickness = 4,
				tolerance = 1000,
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					commanders = 100,
					default = 4900
				}
			}
		},
		weapons = {
			[3] = {
				def = 'old_armsnipe_weapon',
				onlytargetcategory = 'NOTSUB'
			}
		}
	},
	armcomlvl2 = {
		autoheal = 90,
		builddistance = 175,
		canresurrect = true,
		energymake = 315,
		health = 7000,
		speed = 57.5,
		metalmake = 20,
		workertime = 900,
		buildoptions = {
			'armsolar',
			'armwin',
			'armmstor',
			'armestor',
			'armmex',
			'armmakr',
			'armlab',
			'armvp',
			'armap',
			'armeyes',
			'armrad',
			'armdrag',
			'armllt',
			'armrl',
			'armdl',
			'armtide',
			'armuwms',
			'armuwes',
			'armuwmex',
			'armfmkr',
			'armsy',
			'armfdrag',
			'armtl',
			'armfrt',
			'armfrad',
			'armhp',
			'armfhp',
			'armadvsol',
			'armgeo',
			'armamex',
			'armnanotcplat',
			'armhp',
			'armnanotc',
			'armclaw',
			'armbeamer',
			'armhlt',
			'armguard',
			'armferret',
			'armcir',
			'armjamt',
			'armjuno',
			'armsy',
			'armrectr'
		},
		customparams = {
			evolution_announcement = 'Arm Commanders upgraded',
			evolution_announcement_size = 18.5,
			evolution_target = 'armcomlvl3',
			evolution_condition = 'timer',
			evolution_timer = 900,
			combatradius = 0,
			wtboostunittype = '',
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
				range = 400,
				reloadtime = 0.4,
				rgbcolor = '0 1 1',
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
					default = 1050,
					fighters = 110
				}
			},
			old_armsnipe_weapon = {
				areaofeffect = 42,
				avoidfeature = true,
				avoidfriendly = true,
				collidefeature = true,
				collidefriendly = false,
				corethickness = 0.75,
				craterareaofeffect = 0,
				craterboost = 0,
				commandfire = true,
				cratermult = 0,
				cegtag = 'railgun',
				duration = 0.12,
				edgeeffectiveness = 0.85,
				energypershot = 700,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 100,
				impulseboost = 0.4,
				impulsefactor = 1,
				intensity = 1,
				name = 'Long-range g2g armor-piercing rifle',
				range = 700,
				reloadtime = 1,
				rgbcolor = '0.2 0.1 1',
				rgbcolor2 = '0.2 0.1 1',
				soundhit = 'sniperhit',
				soundhitwet = 'sizzle',
				soundstart = 'sniper3',
				soundtrigger = true,
				stockpile = true,
				stockpiletime = 6,
				customparams = {
					stockpilelimit = 10
				},
				texture1 = 'shot',
				texture2 = 'empty',
				thickness = 4,
				tolerance = 1000,
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					commanders = 10,
					default = 11000
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
				def = 'old_armsnipe_weapon',
				onlytargetcategory = 'NOTSUB'
			}
		}
	},
	armcomlvl3 = {
		autoheal = 50,
		builddistance = 250,
		canresurrect = true,
		energymake = 2712,
		health = 10000,
		speed = 71.5,
		metalmake = 62,
		workertime = 1500,
		buildoptions = {
			'armanni',
			'armpb',
			'armamb',
			'armmoho',
			'armuwmme',
			'armflak',
			'armgate',
			'armsd',
			'armfort',
			'armtarg',
			'armarad',
			'armamd',
			'armveil',
			'armuwadvms',
			'armuwadves',
			'armmmkr',
			'armclaw',
			'armjuno',
			'armuwmex',
			'armhp',
			'armsy',
			'armfdrag',
			'armtl',
			'armfrt',
			'armfrad',
			'armhp',
			'armlab',
			'armvp',
			'armap',
			'armsy',
			'armuwmmm',
			'armuwfus',
			'armplat',
			'armfdrag',
			'armfhlt',
			'armfflak',
			'armatl',
			'armkraken',
			'armnanotcplat',
			'armbrtha',
			'armannit3',
			'armlwall',
			'armnanotct2',
			'armafus',
			'armfus',
			'armckfus',
			'armraz',
			'armzeus',
			'armsnipe',
			'armvang',
			'armrectr',
			'armgatet3'
		},
		customparams = {
			wtboostunittype = '',
			paratrooper = true,
			fall_damage_multiplier = 0
		},
		weapondefs = {
			old_armsnipe_weapon = {
				areaofeffect = 64,
				avoidfeature = true,
				avoidfriendly = true,
				collidefeature = true,
				collidefriendly = false,
				corethickness = 0.75,
				craterareaofeffect = 0,
				craterboost = 0,
				commandfire = true,
				cratermult = 0,
				cegtag = 'railgun',
				duration = 0.12,
				edgeeffectiveness = 1,
				energypershot = 2000,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 100,
				impulseboost = 0.4,
				impulsefactor = 1,
				intensity = 1.4,
				name = 'Long-range g2g armor-piercing rifle',
				range = 1250,
				reloadtime = .5,
				rgbcolor = '0.4 0.1 0.7',
				rgbcolor2 = '0.4 0.1 0.7',
				soundhit = 'sniperhit',
				soundhitwet = 'sizzle',
				soundstart = 'sniper3',
				soundtrigger = true,
				stockpile = true,
				stockpiletime = 3,
				customparams = {
					stockpilelimit = 10
				},
				texture1 = 'shot',
				texture2 = 'empty',
				thickness = 6,
				tolerance = 1000,
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					commanders = 10,
					default = 41000
				}
			},
			armcomlaser = {
				areaofeffect = 20,
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
				rgbcolor = '0.1 0 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw2',
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 6,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 900,
				damage = {
					bombers = 180,
					default = 1550,
					fighters = 110
				}
			}
		},
		weapons = {
			[5] = {
				badtargetcategory = 'MOBILE',
				def = 'armcomlaser',
				onlytargetcategory = 'NOTSUB'
			},
			[3] = {
				def = 'old_armsnipe_weapon',
				onlytargetcategory = 'NOTSUB'
			},
			[4] = {
				def = ''
			},
			[1] = {
				def = ''
			},
			[6] = {
				def = ''
			}
		}
	}
}
