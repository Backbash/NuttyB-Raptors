--T4 Defences NuttyB Balance
-- Authors: Hedgehogzs
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko

local unitDefs, tableMerge, legendary_pulsar, legendary_bulwark, legendary_bastion =
	UnitDefs or {},
	table.merge,
	'legendary_pulsar',
	'legendary_bulwark',
	'legendary_bastion'

unitDefs.legendary_pulsar = tableMerge(
	unitDefs['armannit3'],
	{
		name = 'Legendary Pulsar',
		description = 'A pinnacle of Armada engineering that fires devastating, rapid-fire tachyon bolts.',
		buildtime = 280000,
		health = 60000,
		metalcost = 43840,
		energycost = 1096000,
		damagemodifier = 0.15,
		energystorage = 6000,
		idleautoheal = 10,
		radardistance = 1800,
		sightdistance = 1200,
		customparams = {
			i18n_en_humanname = 'Legendary Pulsar',
			i18n_en_tooltip = 'Fires devastating, rapid-fire tachyon bolts at extreme range.',
			techlevel = 4
		},
		featuredefs = {
			dead = {
				damage = 3600,
				metal = 11640
			},
			heap = {
				damage = 1800,
				metal = 4656
			}
		},
		weapondefs = {
			tachyon_burst_cannon = {
				name = 'Tachyon Burst Cannon',
				weapontype = 'LaserCannon',
				rgbcolor = '0.2 0.7 1.0',
				burst = 3,
				burstrate = 0.15,
				reloadtime = 1.8,
				accuracy = 400,
				areaofeffect = 128,
				range = 1800,
				energypershot = 500,
				turret = true,
				soundstart = 'annigun1',
				soundhit = 'xplolrg3',
				impulsefactor = 0,
				weaponvelocity = 1500,
				thickness = 10,
				explosiongenerator = 'custom:tachyonshot',
				damage = {
					default = 3195
				},
				allowNonBlockingAim = true,
				avoidfeature = false,
				avoidfriendly = true,
				collidefriendly = false
			}
		},
		weapons = {
			[1] = {
				def = 'tachyon_burst_cannon',
				onlytargetcategory = 'SURFACE'
			}
		}
	}
)
unitDefs.legendary_bastion = tableMerge(
	unitDefs['legbastion'],
	{
		name = 'Legendary Bastion',
		description = 'The ultimate defensive emplacement. Projects a devastating, pulsating heatray.',
		health = 60000,
		metalcost = 65760,
		energycost = 1986500,
		buildtime = 180000,
		objectname = 'scavs/scavbeacon_t4.s3o',
		script = 'scavs/scavbeacon.cob',
		buildpic = 'scavengers/SCAVBEACON.DDS',
		damagemodifier = 0.20,
		customparams = {
			i18n_en_humanname = 'Legendary Bastion',
			i18n_en_tooltip = 'Projects a devastating, pulsating purple heatray.',
			maxrange = 1400,
			techlevel = 4
		},
		weapondefs = {
			legendary_bastion_ray = {
				name = 'Legendary Heat Ray',
				thickness = 15,
				rgbcolor = '1.0 0.2 1.0',
				range = 1400,
				damage = {
					default = 2696,
					vtol = 15
				},
				weapontype = 'BeamLaser',
				reloadtime = 0.3,
				soundstart = 'banthie2',
				soundtrigger = true,
				areaofeffect = 120,
				avoidfeature = false,
				avoidfriendly = true,
				beamtime = 0.3,
				camerashake = 0.1,
				corethickness = 0.3,
				craterareaofeffect = 120,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.45,
				energypershot = 500,
				explosiongenerator = 'custom:laserhit-medium-purple',
				firestarter = 90,
				firetolerance = 300,
				impulsefactor = 0,
				laserflaresize = 6,
				noselfdamage = true,
				predictboost = 0.3,
				proximitypriority = 1,
				rgbcolor2 = '0.9 1.0 0.5',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				turret = true,
				weaponvelocity = 1500,
				allowNonBlockingAim = true,
				collidefriendly = false
			}
		},
		weapons = {
			[1] = {
				badtargetcategory = 'VTOL GROUNDSCOUT',
				def = 'legendary_bastion_ray',
				onlytargetcategory = 'SURFACE'
			}
		}
	}
)
unitDefs[legendary_bulwark] =
	tableMerge(
	unitDefs['cordoomt3'],
	{
		name = 'Legendary Bulwark',
		description = 'A pinnacle of defensive technology, the Legendary Bulwark annihilates all who approach.',
		buildtime = 250000,
		health = 76000,
		metalcost = 61650,
		energycost = 1712500,
		damagemodifier = 0.15,
		energystorage = 5000,
		idleautoheal = 15,
		radardistance = 1400,
		sightdistance = 1100,
		customparams = {
			i18n_en_humanname = 'Legendary Bulwark',
			i18n_en_tooltip = 'The ultimate defensive structure.',
			paralyzemultiplier = 0.2,
			techlevel = 4
		},
		featuredefs = {
			dead = {
				damage = 10800,
				metal = 9666
			},
			heap = {
				damage = 5400,
				metal = 3864
			}
		},
		weapondefs = {
			legendary_overload_scatter = {
				name = 'Overload Scatter Beamer',
				weapontype = 'BeamLaser',
				range = 1500,
				reloadtime = 0.1,
				sprayangle = 3000,
				projectiles = 12,
				rgbcolor = '0.8 0.1 1.0',
				accuracy = 50,
				allowNonBlockingAim = true,
				areaofeffect = 10,
				beamdecay = 0.05,
				beamtime = 0.1,
				beamttl = 1,
				corethickness = 0.25,
				burnblow = true,
				cylindertargeting = 1,
				edgeeffectiveness = 0.15,
				explosiongenerator = 'custom:laserhit-medium-purple',
				firestarter = 100,
				impulsefactor = 0.123,
				intensity = 0.7,
				laserflaresize = 9.35,
				noselfdamage = true,
				soundhitwet = 'sizzle',
				soundstart = 'beamershot2',
				tolerance = 5000,
				thickness = 6,
				turret = true,
				weaponvelocity = 1000,
				damage = {
					default = 450
				},
				avoidfeature = false,
				avoidfriendly = true,
				collidefriendly = false
			},
			legendary_heat_ray = {
				name = 'Armageddon Heat Ray',
				weapontype = 'BeamLaser',
				range = 1300,
				reloadtime = 4.0,
				areaofeffect = 72,
				avoidfeature = false,
				beamtime = 0.6,
				cameraShake = 350,
				corethickness = 0.40,
				craterareaofeffect = 72,
				energypershot = 1200,
				explosiongenerator = 'custom:genericshellexplosion-medium-beam',
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 8.8,
				noselfdamage = true,
				rgbcolor = '1 0.8 0',
				rgbcolor2 = '0.8 0 0',
				scrollspeed = 5,
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'heatray2xl',
				soundtrigger = 1,
				thickness = 7,
				tolerance = 10000,
				turret = true,
				weaponvelocity = 1800,
				damage = {
					default = 9000,
					commanders = 1350
				},
				allowNonBlockingAim = true,
				avoidfriendly = true,
				collidefriendly = false
			},
			legendary_point_defense = {
				name = 'Point Defense Laser',
				weapontype = 'BeamLaser',
				range = 750,
				reloadtime = 0.5,
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.3,
				corethickness = 0.32,
				energypershot = 500,
				explosiongenerator = 'custom:laserhit-large-blue',
				firestarter = 90,
				impactonly = 1,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 8.8,
				noselfdamage = true,
				proximitypriority = 0,
				rgbcolor = '0 0 1',
				soundhitdry = '',
				soundhitwet = 'sizzle',
				soundstart = 'annigun1',
				soundtrigger = 1,
				texture3 = 'largebeam',
				thickness = 5.5,
				tilelength = 150,
				tolerance = 10000,
				turret = true,
				weaponvelocity = 1500,
				damage = {
					default = 450,
					commanders = 999
				},
				allowNonBlockingAim = true,
				avoidfriendly = true,
				collidefriendly = false
			}
		},
		weapons = {
			[1] = {
				def = 'legendary_overload_scatter'
			},
			[2] = {
				def = 'legendary_heat_ray'
			},
			[3] = {
				def = 'legendary_point_defense'
			}
		}
	}
)

local builders = {
	'armaca',
	'armack',
	'armacsub',
	'armacv',
	'coraca',
	'corack',
	'coracsub',
	'coracv',
	'legaca',
	'legack',
	'legacv',
	'legcomt2com',
}
for _, faction in pairs {'arm', 'cor', 'leg'} do
	for i = 3, 10 do
		table.insert(builders, faction .. 'comlvl' .. i)
	end
	table.insert(builders, faction .. 't3airaide')
end

for _, builder in pairs(builders) do
	if unitDefs[builder] then
		local faction = string.sub(builder, 1, 3)
		table.insert(
			unitDefs[builder].buildoptions,
			(faction == 'arm' and legendary_pulsar) or (faction == 'cor' and legendary_bulwark) or legendary_bastion
		)
	end
end
