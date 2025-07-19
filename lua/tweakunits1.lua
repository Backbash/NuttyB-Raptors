--NuttyB v1.52b Legion Com
-- Authors: ChrispyNut, BackBash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
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
			[35] = 'legdtr',
			[36] = 'legjam'
		},
		customparams = {
			evolution_target = 'legcomlvl2',
			evolution_condition = 'timer',
			evolution_timer = 420
		},
		weapondefs = {
			legcomlaser = {
				corethickness = 0.25,
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
				thickness = 6,
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
				sprayangle = 2000,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 5,
				customparams = {
					stockpilelimit = 10
				},
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
		health = 6700,
		customparams = {
			evolution_timer = 600
		},
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
				corethickness = 0.3,
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
				thickness = 7,
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
				sprayangle = 2250,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 5,
				customparams = {
					stockpilelimit = 15
				},
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
		health = 7500,
		customparams = {
			evolution_timer = 420
		},
		buildoptions = (function()
			local buildoptions = {
				[1] = 'legdeflector',
				[2] = 'legfus',
				[3] = 'legbombard',
				[4] = 'legadvestore',
				[5] = 'legmoho',
				[6] = 'legadveconv',
				[10] = 'legarad',
				[11] = 'legajam',
				[12] = 'legforti',
				[13] = 'legacluster',
				[14] = 'legamstor',
				[15] = 'legflak',
				[16] = 'legabm',
				[17] = 'legbastion',
				[29] = 'legdtr',
				[32] = 'cornecro',
				[33] = 'legdtl',
				[37] = 'leglab',
				[18] = '',
				[19] = '',
				[20] = ''
			}
			if UnitDefs.legendary_bastion and not table.contains(UnitDefs.legcomlvl3.buildoptions, 'legendary_bastion') then
				buildoptions[18] = 'legendary_bastion'
			end
			return buildoptions
		end)(),
		weapondefs = {
			armcomlaser = {
				accuracy = 50,
				areaofeffect = 80,
				avoidfriendly = true,
				avoidfeature = true,
				collidefriendly = false,
				collidefeature = true,
				beamtime = 0.09,
				corethickness = 0.55,
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
				thickness = 7,
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
				sprayangle = 2500,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 5,
				customparams = {
					stockpilelimit = 20
				},
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
		health = 24500,
		customparams = {
			evolution_timer = 300
		},
		buildoptions = (function()
			local buildoptions = {
				[1] = 'legdeflector',
				[2] = 'legfus',
				[3] = 'legbombard',
				[4] = 'legadvestore',
				[5] = 'legmoho',
				[6] = 'legadveconv',
				[9] = 'legeshotgunmech',
				[10] = 'legarad',
				[11] = 'legajam',
				[12] = 'legkeres',
				[13] = 'legacluster',
				[14] = 'legamstor',
				[15] = 'legflak',
				[16] = 'legabm',
				[17] = 'legbastion',
				[18] = 'legendary_bastion',
				[19] = 'legnanotct2',
				[20] = 'legnanotct2plat',
				[21] = 'legrwall',
				[22] = 'legdtr',
				[24] = 'leglab',
				[28] = 'legtarg',
				[29] = 'legsd',
				[30] = 'legpede',
				[31] = 'legerailtank',
				[32] = 'legeheatraymech',
				[33] = 'cornecro',
				[34] = 'legafus',
				[35] = 'leglraa',
				[36] = 'legdtl',
				[37] = 'legdtf',
				[39] = 'legministarfall',
				[48] = 'legstarfall',
				[49] = 'leggatet3',
				[50] = 'legperdition',
				[51] = 'legsilo',
				[52] = 'legsrailt4',
				[53] = 'legelrpcmech'
			}
			if UnitDefs.legnanotct3 then
				table.insert(buildoptions, 'legnanotct3')
			end
			return buildoptions
		end)(),
		weapondefs = {
			armcomlaser = {
				accuracy = 50,
				areaofeffect = 126,
				avoidfriendly = true,
				avoidfeature = true,
				collidefriendly = false,
				collidefeature = true,
				beamtime = 0.1,
				corethickness = .5,
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
				thickness = 6,
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
				sprayangle = 3000,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 4,
				customparams = {
					stockpilelimit = 20
				},
				damage = {
					default = 4400,
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
	legcomlvl5 = {
		energymake = 2280,
		metalmake = 64,
		speed = 92,
		workertime = 1500,
		autoheal = 3500,
		health = 41900,
		buildoptions = (function()
			local buildoptions = {
				[1] = 'legdeflector',
				[2] = 'legfus',
				[3] = 'legbombard',
				[4] = 'legadvestore',
				[5] = 'legmoho',
				[6] = 'legadveconv',
				[9] = 'legeshotgunmech',
				[10] = 'legarad',
				[11] = 'legajam',
				[12] = 'legkeres',
				[13] = 'legacluster',
				[14] = 'legamstor',
				[15] = 'legflak',
				[16] = 'legabm',
				[17] = 'legbastion',
				[18] = 'legendary_bastion',
				[19] = 'legnanotct2',
				[20] = 'legnanotct2plat',
				[21] = 'legrwall',
				[22] = 'legdtr',
				[24] = 'leglab',
				[28] = 'legtarg',
				[29] = 'legsd',
				[30] = 'legpede',
				[31] = 'legerailtank',
				[32] = 'legeheatraymech',
				[33] = 'cornecro',
				[34] = 'legafus',
				[35] = 'leglraa',
				[36] = 'legdtl',
				[37] = 'legdtf',
				[39] = 'legministarfall',
				[48] = 'legstarfall',
				[49] = 'leggatet3',
				[50] = 'legperdition',
				[51] = 'legsilo',
				[52] = 'legsrailt4',
				[53] = 'legelrpcmech'
			}
			if UnitDefs.legnanotct3 then
				table.insert(buildoptions, 'legnanotct3')
			end
			return buildoptions
		end)(),
		weapondefs = {
			armcomlaser = {
				accuracy = 50,
				areaofeffect = 12,
				avoidfriendly = true,
				avoidfeature = true,
				collidefriendly = false,
				collidefeature = true,
				beamtime = 0.1,
				burst = 7,
				burstrate = 0.005,
				corethickness = .5,
				duration = 0.03,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 70,
				impactonly = 0,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 2.7,
				name = 'Light close-quarters g2g/g2a laser',
				noselfdamage = true,
				range = 1500,
				reloadtime = 0.1,
				rgbcolor = '0 1 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw1',
				soundtrigger = 1,
				sprayangle = 400,
				targetmoveerror = 0.05,
				thickness = 5,
				tolerance = 1000,
				texture1 = 'shot',
				texture2 = 'empty',
				turret = true,
				weapontype = 'LaserCannon',
				weaponvelocity = 3000,
				damage = {
					bombers = 180,
					default = 800,
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
				sprayangle = 3000,
				turret = true,
				commandfire = true,
				weapontimer = 1,
				weapontype = 'Cannon',
				weaponvelocity = 600,
				stockpile = true,
				stockpiletime = 4,
				customparams = {
					stockpilelimit = 20
				},
				damage = {
					default = 4400,
					commanders = 0
				}
			},
			corcomeyelaser = {
				areaofeffect = 16,
				avoidfeature = false,
				beamtime = 0.20,
				corethickness = 0.475,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				energypershot = 0,
				explosiongenerator = 'custom:laserhit-small-red',
				firestarter = 100,
				impactonly = 1,
				impulsefactor = 0,
				laserflaresize = 2,
				name = 'Eye laser',
				noselfdamage = true,
				proximitypriority = 1,
				range = 1000,
				reloadtime = 0.19,
				rgbcolor = '1 0.5 0',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'beamershot2',
				soundtrigger = 1,
				thickness = 8,
				tolerance = 10000,
				turret = true,
				weapontype = 'BeamLaser',
				weaponvelocity = 2250,
				damage = {
					default = 800,
					subs = 30
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
				onlytargetcategory = 'WEAPON'
			},
			[5] = {
				def = 'corcomeyelaser',
				onlytargetcategory = 'SURFACE'
			}
		}
	}
}
