--NuttyB v1.52 Units Main
-- Authors: ChrispyNut, BackBash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
return {
	cortron = {
		energycost = 42000,
		metalcost = 3600,
		buildtime = 110000,
		health = 12000,
		weapondefs = {
			cortron_weapon = {
				energypershot = 51000,
				metalpershot = 600,
				range = 4050,
				damage = {
					default = 9000
				}
			}
		}
	},
	corfort = {
		repairable = true
	},
	armfort = {
		repairable = true
	},
	legforti = {
		repairable = true
	},
	armgate = {
		explodeas = 'empblast',
		selfdestructas = 'empblast'
	},
	corgate = {
		explodeas = 'empblast',
		selfdestructas = 'empblast'
	},
	legdeflector = {
		explodeas = 'empblast',
		selfdestructas = 'empblast'
	},
	corsat = {
		sightdistance = 3100,
		radardistance = 4080,
		cruisealtitude = 3300,
		energyupkeep = 1250,
		category = "OBJECT"
	},
	armsat = {
		sightdistance = 3100,
		radardistance = 4080,
		cruisealtitude = 3300,
		energyupkeep = 1250,
		category = "OBJECT"
	},
	legstarfall = {
		weapondefs = {
			starfire = {
				energypershot = 270000
			}
		}
	},
	armflak = {
		airsightdistance = 1350,
		energycost = 30000,
		metalcost = 1500,
		health = 4000,
		weapondefs = {
			armflak_gun = {
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				areaofeffect = 150,
				range = 1150,
				reloadtime = 0.475,
				weaponvelocity = 2400,
				intensity = 0.18,
			}
		}
	},
	corflak = {
		airsightdistance = 1350,
		energycost = 30000,
		metalcost = 1500,
		health = 4000,
		weapondefs = {
			armflak_gun = {
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				areaofeffect = 200,
				range = 1350,
				reloadtime = 0.56,
				weaponvelocity = 2100,
				intensity = 0.18,
			}
		}
	},
	legflak = {
		footprintx = 4,
		footprintz = 4,
		airsightdistance = 1350,
		energycost = 35000,
		metalcost = 2100,
		health = 6000,
		weapondefs = {
			legflak_gun = {
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				areaofeffect = 100,
				burst = 3,
				range = 1050,
				intensity = 0.18,
			}
		}
	},
	armmercury = {
		airsightdistance = 2200,
		weapondefs = {
			arm_advsam = {
				areaofeffect = 500,
				energypershot = 2000,
				explosiongenerator = 'custom:flak',
				flighttime = 1.5,
				metalpershot = 6,
				name = 'Mid-range, rapid-fire g2a guided missile launcher',
				range = 2500,
				reloadtime = 1.2,
				smoketrail = false,
				startvelocity = 1500,
				weaponacceleration = 1000,
				weaponvelocity = 4000,
			}
		}
	},
	corscreamer = {
		airsightdistance = 2800,
		weapondefs = {
			cor_advsam = {
				areaofeffect = 800,
				energypershot = 2000,
				explosiongenerator = 'custom:flak',
				flighttime = 1,
				metalpershot = 10,
				name = 'Long-range g2a guided heavy flak missile launcher',
				range = 2800,
				reloadtime = 1.8,
				smoketrail = false,
				startvelocity = 4000,
				weaponacceleration = 1000,
				weaponvelocity = 8000,
			}
		}
	},
	armassistdrone = {
		buildoptions = {
			[31] = 'armclaw'
		}
	},
	corassistdrone = {
		buildoptions = {
			[32] = 'cormaw'
		}
	},
	legassistdrone = {
		buildoptions = {
			[31] = 'legdtf',
			[32] = 'legdtl',
			[33] = 'legdtr'
		}
	},
    legfortt4 = {
		explodeas = "fusionExplosionSelfd",
		selfdestructas = "fusionExplosionSelfd",
	},
    legfort = {
		explodeas = "empblast",
		selfdestructas = "empblast",
	},
	raptor_hive = {
		weapondefs = {
			antiground = {
				burst = 5,
				burstrate = 0.01,
				cegtag = 'arty-heavy-purple',
				explosiongenerator = 'custom:dirt',
				model = 'Raptors/s_raptor_white.s3o',
				range = 1600,
				reloadtime = 5,
				rgbcolor = '0.5 0 1',
				soundhit = 'smallraptorattack',
				soundstart = 'bugarty',
				sprayangle = 256,
				turret = true,
				stockpiletime = 12,
				proximitypriority = nil,
				damage = {
					default = 1,
					shields = 100
				},
				customparams = {
					spawns_count = 15,
					spawns_expire = 11,
					spawns_mode = 'random',
					spawns_name = 'raptor_acidspawnling raptor_hive_swarmer_basic raptor_land_swarmer_basic_t1_v1 ',
					spawns_surface = 'LAND SEA',
					stockpilelimit = 10,
				}
			}
		}
	},
	armapt3 = {
		buildoptions = {
			[58] = 'armsat'
		}
	},
	corapt3 = {
		buildoptions = {
			[58] = 'corsat'
		}
	},
	legapt3 = {
		buildoptions = {
			[58] = 'corsat'
		}
	},
	armlwall = {
		energycost = 25000,
		metalcost = 1300,
		weapondefs = {
			lightning = {
				energypershot = 200,
				range = 430
			}
		}
	},
	armclaw = {
		collisionvolumeoffsets = '0 -2 0',
		collisionvolumescales = '30 51 30',
		collisionvolumetype = 'Ell',
		usepiececollisionvolumes = 0,
		weapondefs = {
			dclaw = {
				energypershot = 60
			}
		}
	},
	legdtl = {
		weapondefs = {
			dclaw = {
				energypershot = 60
			}
		}
	},
	armamd = {
		metalcost = 1800,
		energycost = 41000,
		weapondefs = {
			amd_rocket = {
				coverage = 2125,
				stockpiletime = 70
			}
		}
	},
	corfmd = {
		metalcost = 1800,
		energycost = 41000,
		weapondefs = {
			fmd_rocket = {
				coverage = 2125,
				stockpiletime = 70
			}
		}
	},
	legabm = {
		metalcost = 1800,
		energycost = 41000,
		weapondefs = {
			fmd_rocket = {
				coverage = 2125,
				stockpiletime = 70
			}
		}
	},
	corwint2 = {
		metalcost = 400
	},
	legwint2 = {
		metalcost = 400
	},
	legdtr = {
		buildtime = 5250,
		energycost = 5500,
		metalcost = 400,
		collisionvolumeoffsets = '0 -10 0',
		collisionvolumescales = '39 88 39',
		collisionvolumetype = 'Ell',
		usepiececollisionvolumes = 0,
		weapondefs = {
			corlevlr_weapon = {
				areaofeffect = 30,
				avoidfriendly = true,
				collidefriendly = false,
				cegtag = 'railgun',
				range = 650,
				energypershot = 75,
				explosiongenerator = 'custom:plasmahit-sparkonly',
				rgbcolor = '0.34 0.64 0.94',
				soundhit = 'mavgun3',
				soundhitwet = 'splshbig',
				soundstart = 'lancefire',
				weaponvelocity = 1300,
				damage = {
					default = 550
				}
			}
		}
	},
	armrespawn = {
		blocking = false,
		canresurrect = true
	},
	legnanotcbase = {
		blocking = false,
		canresurrect = true
	},
	correspawn = {
		blocking = false,
		canresurrect = true
	},
	legrwall = {
		collisionvolumeoffsets = "0 -3 0",
		collisionvolumescales = "32 50 32",
		collisionvolumetype = "CylY",
		energycost = 21000,
		metalcost = 1400,
		weapondefs = {
			railgunt2 = {
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				range = 725,
				reloadtime = 3,
				energypershot = 200,
				damage = {
					default = 1500,
				}
			}
		},
		weapons = {
			[1] = {
				def = "railgunt2",
				onlytargetcategory = "SURFACE",
			}
		}
	},
	cormwall = {
		energycost = 18000,
		metalcost = 1350,
		weapondefs = {
			exp_heavyrocket = {
				areaofeffect = 70,
				collidefriendly = 0,
				collidefeature = 0,
				cameraShake = 0,
				energypershot = 125,
				avoidfeature = 0,
				avoidfriendly = 0,
				burst = 1,
				burstrate = 0,
				colormap = '0.75 0.73 0.67 0.024   0.37 0.4 0.30 0.021   0.22 0.21 0.14 0.018  0.024 0.014 0.009 0.03   0.0 0.0 0.0 0.008',
				craterareaofeffect = 0,
				explosiongenerator = 'custom:burnblack',
				flamegfxtime = 1,
				flighttime = 1.05,
				name = 'Raptor Boomer',
				reloadtime = 1.5,
				rgbcolor = '1 0.25 0.1',
				range = 700,
				size = 2,
				proximitypriority = nil,
				impactonly = 1,
				trajectoryheight = 1,
				targetmoveerror = 0.2,
				tracks = true,
				weaponacceleration = 660,
				weaponvelocity = 950,
				damage = {
					default = 1050
				}
			}
		}
	},
	cormaw = {
		collisionvolumeoffsets = '0 -2 0',
		collisionvolumescales = '30 51 30',
		collisionvolumetype = 'Ell',
		usepiececollisionvolumes = false,
		metalcost = 350,
		energycost = 2500,
		weapondefs = {
			dmaw = {
				collidefriendly = 0,
				collidefeature = 0,
				areaofeffect = 80,
				edgeeffectiveness = 0.45,
				energypershot = 50,
				burst = 24,
				rgbcolor = '0.051 0.129 0.871',
				rgbcolor2 = '0.57 0.624 1',
				sizegrowth = 0.80,
				range = 450,
				intensity = 0.68,
				damage = {
					default = 28
				}
			}
		}
	},
	legdtf = {
		collisionvolumeoffsets = '0 -24 0',
		collisionvolumescales = '30 51 30',
		collisionvolumetype = 'Ell',
		metalcost = 350,
		energycost = 2750,
		weapondefs = {
			dmaw = {
				collidefriendly = 0,
				collidefeature = 0,
				areaofeffect = 80,
				edgeeffectiveness = 0.45,
				energypershot = 50,
				burst = 24,
				sizegrowth = 2,
				range = 450,
				intensity = 0.38,
				sprayangle = 500,
				damage = {
					default = 30
				}
			}
		}
	},
	corhllllt = {
		collisionvolumeoffsets = '0 -24 0',
		collisionvolumescales = '30 51 30',
		metalcost = 415,
		energycost = 9500,
		buildtime = 10000,
		health = 2115,
	},
	corhlt = {
		energycost = 5500,
		metalcost = 520,
		weapondefs = {
			cor_laserh1 = {
				range = 750,
				reloadtime = 0.95,
				damage = {
					default = 395,
					vtol = 35,
				}
			}
		}
	},
	armhlt = {
		energycost = 5700,
		metalcost = 510,
		weapondefs = {
			arm_laserh1 = {
				range = 750,
				reloadtime = 1,
				damage = {
					default = 405,
					vtol = 35,
				}
			}
		}
	},
	armbrtha = {
		explodeas = 'fusionExplosion',
		energycost = 500000,
		metalcost = 18500,
		buildtime = 175000,
		turnrate = 16000,
		health = 10450,
		weapondefs = {
			ARMBRTHA_MAIN = {
				areaofeffect = 50,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				beamtime = 2.5,
				corethickness = 0.1,
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.30,
				energypershot = 14000,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 90,
				impulseboost = 0,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 1,
				impactonly = 1,
				name = 'Experimental Duction Beam',
				noselfdamage = true,
				range = 2400,
				reloadtime = 13,
				rgbcolor = '0.4 0.2 0.6',
				scrollspeed = 13,
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "hackshotxl3",
				soundtrigger = 1,
				targetmoveerror = 0.3,
				texture3 = 'largebeam',
				thickness = 14,
				tilelength = 150,
				tolerance = 10000,
				turret = true,
				turnrate = 16000,
				weapontype = 'LaserCannon',
				weaponvelocity = 3100,
				damage = {
					commanders = 480,
					default = 34000
				}
			}
		},
		weapons = {
			[1] = {
				badtargetcategory = 'VTOL GROUNDSCOUT',
				def = 'ARMBRTHA_MAIN',
				onlytargetcategory = 'SURFACE'
			}
		}
	},
	corint = {
		explodeas = 'fusionExplosion',
		energycost = 505000,
		metalcost = 19500,
		buildtime = 170000,
		health = 12450,
		footprintx = 6,
		footprintz = 6,
		weapondefs = {
			CORINT_MAIN = {
				areaofeffect = 70,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				beamtime = 2.5,
				corethickness = 0.1,
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.30,
				energypershot = 17000,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 90,
				impulseboost = 0,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 1,
				impactonly = 1,
				name = 'Mini DeathStar',
				noselfdamage = true,
				range = 2800,
				reloadtime = 15,
				rgbcolor = '0 1 0',
				scrollspeed = 13,
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'annigun1',
				soundtrigger = 1,
				targetmoveerror = 0.3,
				texture3 = 'largebeam',
				thickness = 14,
				tilelength = 150,
				tolerance = 10000,
				turret = true,
				turnrate = 1600,
				weapontype = 'LaserCannon',
				weaponvelocity = 3100,
				damage = {
					commanders = 480,
					default = 50000
				}
			}
		},
		weapons = {
			[1] = {
				badtargetcategory = 'VTOL GROUNDSCOUT',
				def = 'CORINT_MAIN',
				onlytargetcategory = 'SURFACE'
			}
		}
	},
	leglrpc = {
		explodeas = 'fusionExplosion',
		energycost = 555000,
		metalcost = 21000,
		buildtime = 150000,
		health = 11000,
		footprintx = 6,
		footprintz = 6,
		weapondefs = {
			LEGLRPC_MAIN = {
				areaofeffect = 70,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				beamtime = 0.5,
				burst = 3,
				burstrate = 0.4,
				corethickness = 0.1,
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.30,
				energypershot = 10000,
				explosiongenerator = 'custom:laserhit-large-red',
				firestarter = 90,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 1,
				name = 'The Eagle Standard',
				noselfdamage = true,
				range = 2150,
				reloadtime = 3,
				rgbcolor = '0/1/0.4',
				scrollspeed = 13,
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw1',
				soundtrigger = 1,
				targetmoveerror = 0.3,
				texture3 = 'largebeam',
				thickness = 12,
				tilelength = 150,
				tolerance = 10000,
				turret = true,
				turnrate = 16000,
				weapontype = 'LaserCannon',
				weaponvelocity = 3100,
				damage = {
					commanders = 480,
					default = 6000
				}
			}
		},
		weapons = {
			[1] = {
				badtargetcategory = 'VTOL GROUNDSCOUT',
				def = 'LEGLRPC_MAIN',
				onlytargetcategory = 'SURFACE'
			}
		}
	}
}
