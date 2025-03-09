--NuttyB v1.52 Units Main
return {
	cortron = {
		energycost = 42000,
		metalcost = 3600,
		buildtime = 120000,
		health = 12000,
		weapondefs = {
			cortron_weapon = {
				energypershot = 51000,
				metalpershot = 600,
				range = 3650,
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
	corscavfort = {
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
	corsat = {
		sightdistance = 3100,
		radardistance = 4080,
		cruisealtitude = 3300,
		energyupkeep = 1250
	},
	armsat = {
		sightdistance = 3100,
		radardistance = 4080,
		cruisealtitude = 3300,
		energyupkeep = 1250
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
		energycost = 19000,
		metalcost = 1500,
		health = 4000,
		weapondefs = {
			armflak_gun = {
				collidefriendly = 0,
				collidefeature = 0,
				range = 1100,
				reloadtime = 0.475,
				intensity = 0.18
			}
		}
	},
	armfflak = {
		airsightdistance = 1350,
		energycost = 25000,
		metalcost = 1500,
		health = 4000,
		weapondefs = {
			armflak_gun = {
				collidefriendly = 0,
				collidefeature = 0,
				range = 1050,
				reloadtime = 0.475
			}
		}
	},
	corflak = {
		airsightdistance = 1350,
		energycost = 19000,
		metalcost = 1500,
		health = 4000,
		weapondefs = {
			armflak_gun = {
				collidefriendly = 0,
				collidefeature = 0,
				areaofeffect = 300,
				range = 1350,
				reloadtime = 0.55,
				intensity = 0.18
			}
		}
	},
	corenaa = {
		airsightdistance = 1350,
		energycost = 25000,
		metalcost = 1500,
		health = 4000,
		weapondefs = {
			armflak_gun = {
				collidefriendly = 0,
				collidefeature = 0,
				areaofeffect = 300,
				range = 1350,
				reloadtime = 0.55
			}
		}
	},
	legflak = {
		footprintx = 4,
		footprintz = 4,
		airsightdistance = 1350,
		energycost = 19000,
		metalcost = 1700,
		health = 4000,
		weapondefs = {
			legflak_gun = {
				collidefriendly = 0,
				collidefeature = 0,
				areaofeffect = 100,
				burst = 4,
				range = 1250,
				reloadtime = 0.166,
				intensity = 0.18
			}
		}
	},
	armmercury = {
		airsightdistance = 2200,
		customparams = {
			stockpilelimit = 30
		},
		weapondefs = {
			arm_advsam = {
				areaofeffect = 500,
				energypershot = 2000,
				explosiongenerator = 'custom:flak',
				flighttime = 1.5,
				metalpershot = 6,
				name = 'Mid-range, rapid-fire g2a guided missile launcher',
				range = 2000,
				reloadtime = 0.8,
				smoketrail = false,
				startvelocity = 1500,
				stockpile = true,
				stockpiletime = 5,
				weaponacceleration = 1000,
				weaponvelocity = 4000
			}
		}
	},
	corscreamer = {
		airsightdistance = 2800,
		customparams = {
			stockpilelimit = 20
		},
		weapondefs = {
			cor_advsam = {
				areaofeffect = 800,
				energypershot = 2000,
				explosiongenerator = 'custom:flak',
				flighttime = 1,
				metalpershot = 10,
				name = 'Long-range g2a guided heavy flak missile launcher',
				range = 2600,
				reloadtime = 1.4,
				smoketrail = false,
				startvelocity = 4000,
				stockpile = true,
				stockpiletime = 7,
				weaponacceleration = 1000,
				weaponvelocity = 8000
			}
		}
	},
	armassistdrone = {
		energycost = 2000,
		metalcost = 100,
		buildoptions = {
			[31] = 'armclaw'
		}
	},
	corassistdrone = {
		energycost = 2000,
		metalcost = 100,
		buildoptions = {
			[32] = 'cormaw'
		}
	},
	legassistdrone = {
		energycost = 2000,
		metalcost = 100,
		buildoptions = {
			[31] = 'legdtf',
			[32] = 'legdtl',
			[33] = 'legdtr'
		}
	},
	armassistdrone_land = {
		energycost = 1000,
		metalcost = 100,
		buildtime = 1000,
		buildoptions = {
			[31] = 'armclaw'
		}
	},
	corassistdrone_land = {
		energycost = 1000,
		metalcost = 100,
		buildtime = 1000,
		buildoptions = {
			[32] = 'cormaw'
		}
	},
	legassistdrone_land = {
		energycost = 1000,
		metalcost = 100,
		buildtime = 1000,
		buildoptions = {
			[31] = 'legdtl',
			[32] = 'legdtf',
			[33] = 'legdtr'
		}
	},
	raptor_hive = {
		weapondefs = {
			antiground = {
				burst = 5,
				burstrate = 0.01,
				cegtag = 'arty-heavy-purple',
				explosiongenerator = 'custom:dirt',
				model = 'Raptors/s_raptor_white.s3o',
				range = 1500,
				reloadtime = 4,
				rgbcolor = '0.5 0 1',
				soundhit = 'smallraptorattack',
				soundstart = 'bugarty',
				sprayangle = 512,
				turret = true,
				damage = {
					default = 1,
					shields = 200
				},
				customparams = {
					spawns_name = 'raptor_land_swarmer_basic_t1_v1',
					spawns_surface = 'LAND SEA' -- Available: "LAND SEA"
				}
			}
		}
	},
	armshltx = {
		buildoptions = {
			[55] = 'armassistdrone_land',
			[56] = 'corassistdrone_land',
			[57] = 'legassistdrone_land'
		}
	},
	corgant = {
		buildoptions = {
			[55] = 'armassistdrone_land',
			[56] = 'corassistdrone_land',
			[57] = 'legassistdrone_land'
		}
	},
	leggant = {
		buildoptions = {
			[55] = 'armassistdrone_land',
			[56] = 'corassistdrone_land',
			[57] = 'legassistdrone_land',
			[58] = 'legassistdrone_land'
		}
	},
	armapt3 = {
		buildoptions = {
			[55] = 'armassistdrone',
			[56] = 'corassistdrone',
			[57] = 'legassistdrone',
			[58] = 'armsat'
		}
	},
	corapt3 = {
		buildoptions = {
			[55] = 'armassistdrone',
			[56] = 'corassistdrone',
			[57] = 'legassistdrone',
			[58] = 'corsat'
		}
	},
	legapt3 = {
		buildoptions = {
			[55] = 'armassistdrone',
			[56] = 'corassistdrone',
			[57] = 'legassistdrone',
			[58] = 'corsat'
		}
	},
	armlwall = {
		energycost = 21000,
		metalcost = 1250,
		weapondefs = {
			lightning = {
				energypershot = 150,
				range = 425
			}
		}
	},
	armclaw = {
		collisionvolumeoffsets = '0 -2 0',
		collisionvolumescales = '30 51 30',
		collisionvolumetype = 'Ell',
		usepiececollisionvolumes = false,
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
		metalcost = 425,
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
				energypershot = 50,
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
		blocking = false
	},
	legnanotcbase = {
		blocking = false
	},
	correspawn = {
		blocking = false
	},
	legrwall = {
		energycost = 20000
	},
	cormwall = {
		energycost = 18000,
		metalcost = 1250,
		weapondefs = {
			exp_heavyrocket = {
				areaofeffect = 70,
				collidefriendly = 0,
				collidefeature = 0,
				cameraShake = 0,
				energypershot = 75,
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
				proximitypriority = {},
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
				sizegrowth = 1,
				range = 450,
				intensity = 0.38,
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
		metalcost = 350,
		energycost = 8000,
		health = 2070,
		weapondefs = {
			hllt_1 = {
				energypershot = 10,
				damage = {
					default = 70
				}
			},
			hllt_2 = {
				energypershot = 10,
				damage = {
					default = 70
				}
			},
			hllt_3 = {
				energypershot = 10,
				damage = {
					default = 70
				}
			},
			hllt_4 = {
				energypershot = 10,
				damage = {
					default = 70
				}
			}
		}
	},
	armbrtha = {
		explodeas = 'fusionExplosion',
		energycost = 500000,
		metalcost = 18500,
		buildtime = 170000,
		turnrate = 16000,
		health = 8000,
		weapondefs = {
			ARMBRTHA_MAIN = {
				areaofeffect = 60,
				avoidFriendly = false,
				avoidFeature = false,
				collideFriendly = false,
				collideFeature = true,
				beamtime = 2.5,
				corethickness = 0.1,
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.30,
				energypershot = 8500,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 90,
				impulseboost = 0,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 1,
				name = 'Experimental Duction Beam',
				noselfdamage = true,
				range = 1900,
				reloadtime = 7,
				rgbcolor = '0.4 0.2 0.6',
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
				turnrate = 16000,
				weapontype = 'LaserCannon',
				weaponvelocity = 3100,
				damage = {
					commanders = 480,
					default = 40000
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
		health = 13000,
		footprintx = 6,
		footprintz = 6,
		weapondefs = {
			CORINT_MAIN = {
				areaofeffect = 170,
				avoidFriendly = false,
				avoidFeature = false,
				collideFriendly = false,
				collideFeature = true,
				beamtime = 2.5,
				corethickness = 0.1,
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.60,
				energypershot = 15000,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 90,
				impulseboost = 0,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 1,
				name = 'Mini DeathStar',
				noselfdamage = true,
				range = 2600,
				reloadtime = 18,
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
					default = 60000
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
				areaofeffect = 120,
				avoidFriendly = false,
				avoidFeature = false,
				collideFriendly = false,
				collideFeature = true,
				beamtime = 0.5,
				burst = 3,
				burstrate = 0.4,
				corethickness = 0.1,
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 0,
				edgeeffectiveness = 0.30,
				energypershot = 2500,
				explosiongenerator = 'custom:laserhit-large-red',
				firestarter = 90,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 1,
				name = 'The Eagle Standard',
				noselfdamage = true,
				range = 2200,
				reloadtime = 6,
				rgbcolor = '0/1/0.4',
				scrollspeed = 13,
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'lasrcrw1',
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
					default = 13000
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
