
class PlayerEvents : EventHandler {

	Array<Loadout> backpackLoadouts;

	override void PlayerEntered(PlayerEvent e) {
		PlayerPawn pawn = players[e.PlayerNumber].mo;
		if (pawn) {
			pawn.GiveInventoryType("MiscAttachmentInput");
			pawn.GiveInventoryType("BSilencerRemover");
			pawn.GiveInventoryType("BScopeRemover");
			pawn.GiveInventoryType("BMiscRemover");
		}
	}

	bool alreadyReplaced;

	bool rollCheck() {
		int rnggo = random(0, 100);
		return rnggo >= 50;
	}

	void replaceAll(ReplaceEvent e) {
		if (e.Replacee is "ZM66Random") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "B_M4_Empty";
			else
				e.Replacement = "M4_Random_Giver";
		}
		else if (e.Replacee is "ZM66AssaultRifle" || e.Replacee is "ZM66Regular" || e.Replacee is "ZM66Semi" || e.Replacee is "ZM66Irregular") {
			if (b_spawn_empty_mags == 1) 
				e.Replacement = "B_M4_Empty";
			else
				e.Replacement = "m4_replacer";
		}
		else if (e.Replacee is "HD4mMag" || e.Replacee is "HDDirtyMagazine") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "B556MagEmpty2";	
			else
				e.Replacement = "B556Mag";
		}
		else if (e.Replacee is "HD4mmMagEmpty") {
			e.Replacement = "B556MagEmpty";	
		}
		else if (e.Replacee is "HDRL") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "B_RPG_Empty";
			else
				e.Replacement = "B_RPGLauncher";
		}
		else if (e.Replacee is "HEATAmmo") {
			e.Replacement = "BRpgRocket";
		}
		// Backpack
		else if (e.Replacee is "WildBackpack") {
			if (B_Alt_Backpack) {
				e.Replacement = "BryanWildBackpack";
			}
		}
		// Pistol
		else if (e.Replacee is "HDPistol" || e.Replacee is "HDAutoPistol") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "B_GLock_Empty";
			else
				e.Replacement = "glock_replacer";
		}
		else if (e.Replacee is "HD9mMag30") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "BMp5MagEmpty2";
			else
				e.Replacement = "B9mm_MP5K_MAG";
		}
		else if (e.Replacee is "HD9mMag15") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "BGlockMagEmpty2";
			else
				e.Replacement = "GlockMagazine";
		}
		// Mp5
		else if (e.Replacee is "HDSMG") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "b_mp5_empty";
			else
				e.Replacement = "mp5_replacer";
		}
		// Liberator
		else if (e.Replacee is "LiberatorRifle" || e.Replacee is "LiberatorNoBullpupNoGL" || e.Replacee is "LiberatorNoBullpup" || e.Replacee is "LiberatorNoGL") {
			if (b_spawn_empty_mags == 1) 
				e.Replacement = "B_M14_Empty";
			else
				e.Replacement = "M14_random_noammo_giver";
		}
		else if (e.Replacee is "LiberatorRandom") {
			if (b_spawn_empty_mags == 1) 
				e.Replacement = "B_M14_Empty";
			else
				e.Replacement = "M14_random_giver";
		}
		else if (e.Replacee is "HD7mMag") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "B762MagEmpty2";
			else
				e.Replacement = "b762_m14_mag";
		}
		// Chaingun
		else if (e.Replacee is "ChaingunReplaces") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "B_M249_Empty";
			else
				e.Replacement = "M249_Random_Giver";
		}
		else if (e.Replacee is "Vulcanette") {
			e.Replacement = "b_fake_m249";
		}
		// Shotgun
		else if (e.Replacee is "ShotgunReplaces" || e.Replacee is "SSGReplaces") {
			if (b_spawn_empty_mags == 1) 
				e.Replacement = "B_Fauxtech_Empty";
			else
				e.Replacement = "fauxtech_random_noammo_giver";
		}
		else if (e.Replacee is "ShellBoxPickup") {
			if (b_spawn_empty_mags == 1)
				e.Replacement = "BFauxDrumEmpty";
			else
				e.Replacement = "BFauxDrum";
		}
		else if (e.Replacee is "HDAmBox") {
			if (random(0, 100) > 40) {
				if (b_spawn_raw_resources == 1) {
					int rngInner = random(0, 100);
					if (rngInner > 75) {
						e.Replacement = "BAmBox";
					}
					else if (rngInner > 50) {
						e.Replacement = "BMagazineBox";
					}
					else if (rngInner > 25) {
						e.Replacement = "BAttachmentBox";
					}
					else {
						e.Replacement = "BResourceBox";
					}
				}
				else {
					int rngOuter = random(0, 100);
					if (rngOuter > 66) {
						e.Replacement = "BAmBox";
					}
					else if (rngOuter > 33) {
						e.Replacement = "BMagazineBox";
					}
					else {
						e.Replacement = "BAttachmentBox";
					}
				}
			}
		}

	}

	void replaceAllAI(ReplaceEvent e) {
		if (e.Replacee is "ZombieHideousTrooper") {
			string possible[35] = {
				"usmc_m4c",
				"usmc_m4c",
				"usmc_m4cm203",
				"arm_usmc_m4c"
				"usmc_mp5",
				"usmc_mp5",
				"usmc_mp5",
				"usmc_mp5",
				"usmc_xm5",
				"arm_usmc_xm5",
				"usmc_scar16c",
				"arm_usmc_scar16c",
				"usmc_ump9",
				"arm_usmc_ump9",
				"usmc_ump45",
				"arm_usmc_ump45",
				"op_m107",
				"op_uzi",
				"op_uzi",
				"ru_ak15",
				"ru_ak15",
				"arm_ru_ak15",
				"ru_akm",
				"ru_akm",
				"ru_akm",
				"ru_aks",
				"ru_aks",
				"ru_aks",
				"ru_ak12",
				"ru_ak12",
				"arm_ru_ak12",
				"arm_ru_qbz191",
				"arm_ru_qbz191",
				"usmc_fostech",
				"ru_saiga"
			};
			e.Replacement = possible[random(0, 34)];
		}
		//else if (e.Replacee is "ZombieShotgunner") {
		//	if (random(0, 100) < b_ai_shotgunner_chance) {
		//		e.Replacement = "usmc_fostech";
		//	}
		
		else if (e.Replacee is "ZombieShotgunner") {
			string possible[11] = {
				"usmc_fostech",
				"arm_usmc_fostech",
				"arm_usmc_fostech",
				"arm_usmc_scar16c",
				"arm_usmc_scar17c",
				"ru_saiga",
				"arm_ru_saiga",
				"arm_ru_saiga",
				"arm_ru_qbz191",
				"arm_ru_ak12",
				"arm_ru_ak15"
			};
			e.Replacement = possible[random(0, 10)];
		}
		
		else if (e.Replacee is "VulcanetteZombie") {
			string possible[25] = {
				"usmc_m14",
				"usmc_m14",
				"arm_usmc_ump9",
				"arm_usmc_ump9",
				"arm_usmc_ump45",
				"arm_usmc_ump45",
				"arm_usmc_scar16c",
				"arm_usmc_scar16c",
				"arm_usmc_scar16c",
				"arm_usmc_scar17c",
				"arm_usmc_scar17c",
				"arm_usmc_scar17c",
				"usmc_m249",
				"usmc_m249",
				"arm_usmc_m249",
				"arm_usmc_m249",
				"arm_usmc_m249",
				"ru_rpk16",				
				"ru_rpk16",
				"arm_ru_rpk16",
				"arm_ru_rpk16",
				"arm_ru_rpk16",
				"arm_ru_qbz191",
				"arm_ru_qbz191",								
				"op_m107"
			};
			e.Replacement = possible[random(0,24)];
		}
		
	}

	int ticks;

	ItemData defineItem(string clsName, int quan, int ch) {
		ItemData newItem = new("ItemData");
		newItem.clsName = clsName;
		newItem.quantity = quan;
		newItem.chance = ch;
		return newItem;
	}

	override void WorldLoaded(WorldEvent e) {
		alreadyReplaced = true;

		// UM. Initialize the loadouts for backpacks here?

		let medkits = defineItem("PortableMedikit", 5, 35);
		let stimpacks = defineItem("PortableStimpack", 10, 35);
		let secondBlood = defineItem("SecondBlood", 2, 25);
		let zerk = defineItem("PortableBerserkPack", 1, 5);

		let awg = defineItem("GarrisonArmour", 2, 50);
		let awb = defineItem("BattleArmour", 1, 20);

		let doorbuster = defineItem("doorbuster", 1, 5);
		let envsuit = defineItem("PortableRadsuit", 1, 45);
		let lightamp = defineItem("PortableLiteAmp", 1, 45);
		let ladder = defineItem("PortableLadder", 1, 35);

		let tderp = defineItem("TDERPUsable", 1, 10);
		let therp = defineItem("THERPUsable", 1, 10);

		let battery = defineItem("HDBattery", 2, 35);
		let bossClip = defineItem("HD7mClip", 5, 20);
		let grenade = defineItem("HDFragGrenadeAmmo", 3, 45);
		let mag556 = defineItem("B556Mag", 5, 55);
		let mag762 = defineItem("b762_m14_mag", 3, 35);
		let pouch556 = defineItem("BM249Mag", 1, 10);
		let pouchreloader = defineItem("B_M249_Reloader", 1, 25);
		let drumshell = defineItem("BFauxDrum", 2, 25);
		let magmp5 = defineItem("B9mm_MP5K_MAG", 5, 45);
		let magglock = defineItem("GlockMagazine", 7, 45);
		let rktgrenade = defineItem("HDRocketAmmo", 3, 35);

		let gunglock = defineItem("B_Glock", 2, 65);
		let gunmp5 = defineItem("B_MP5", 1, 45);
		let gunm4 = defineItem("B_M4", 1, 65);

		Loadout medical = new("Loadout");
		medical.items.push(medkits);
		medical.items.push(stimpacks);
		medical.items.push(secondBlood);
		medical.items.push(zerk);

		Loadout armorer = new("Loadout");
		armorer.items.push(stimpacks);
		armorer.items.push(awg);
		armorer.items.push(awb);

		Loadout grunt = new("Loadout");
		grunt.items.push(awg);
		grunt.items.push(stimpacks);
		grunt.items.push(zerk);
		grunt.items.push(mag556);
		grunt.items.push(magglock);
		grunt.items.push(magmp5);
		grunt.items.push(gunglock);
		grunt.items.push(gunmp5);
		grunt.items.push(gunm4);

		Loadout ammoer = new("Loadout");
		ammoer.items.push(battery);
		ammoer.items.push(bossClip);
		ammoer.items.push(grenade);
		ammoer.items.push(mag556);
		ammoer.items.push(mag762);
		ammoer.items.push(pouch556);
		ammoer.items.push(pouchreloader);
		ammoer.items.push(drumshell);
		ammoer.items.push(magmp5);
		ammoer.items.push(magglock);
		ammoer.items.push(rktgrenade);

		Loadout miscer = new("Loadout");
		miscer.items.push(doorbuster);
		miscer.items.push(envsuit);
		miscer.items.push(lightamp);
		miscer.items.push(ladder);
		miscer.items.push(grenade);
		miscer.items.push(battery);
		miscer.items.push(therp);
		miscer.items.push(tderp);

		backpackLoadouts.push(medical);
		backpackLoadouts.push(armorer);
		backpackLoadouts.push(grunt);
		backpackLoadouts.push(ammoer);
		backpackLoadouts.push(miscer);

		if (b_spawn_raw_resources != 1) {
			return;
		}

		ThinkerIterator allActors = ThinkerIterator.create("Actor");
		Array<Actor> decorations;
		Actor next;

		while (next = Actor(allActors.next())) {
			if (next is "HDTorchTree" || 
				next is "HDTechPillar" || 
				next is "HDTallRedColumn" || 
				next is "HDTallGreenColumn" || 
				next is "HDStalagtite" || 
				next is "HDStalagmite" || 
				next is "HDSkullColumn" || 
				next is "HDShortRedColumn" || 
				next is "HDShortGreenColumn" || 
				next is "HDHeartColumn" || 
				next is "HDFloatingSkull" || 
				next is "HDEvilEye" || 
				next is "HDBigTree" || 
				next is "HDDeadStick" || 
				next is "HDHeadCandles" || 
				next is "HDHeadsStick" || 
				next is "HDHTLkUp" || 
				next is "HDHTNoGuts" || 
				next is "HDHTSkull" || 
				next is "HDMt3NS" || 
				next is "HDMt4NS" || 
				next is "HDMt5" || 
				next is "HDMt5NS" || 
				next is "HDTwitchHang" || 
				next is "SmallBloodPool" || 
				next is "Gibs" || 
				next is "ColonGibs" || 
				next is "BrainStem" || 
				next is "ReallyDeadRifleman" || 
				next is "ReallyDeadRiflemanCrouched" ||
				next is "DeadTrilobite" ||
				next is "DeadRifleman" ||
				next is "DeadImpSpawner" ||
				next is "DeadZombieShotgunner" ||
				next is "DeadDemonSpawner" ||
				next is "DeadZombieStormtrooper" ||
				next is "Candlestick" ||
				next is "HDBlueTorch" ||
				next is "HDCandelabra" ||
				next is "HDColumn" ||
				next is "HDGreenTorch" ||
				next is "HDRedTorch" ||
				next is "HDShortBlueTorch" ||
				next is "HDShortGreenTorch" ||
				next is "HDShortRedTorch" ||
				next is "HDTechLamp" ||
				next is "HDTechLamp2" ||
				next is "HDBarrel") {
				decorations.push(next);
			}
		} 

		// No decorations, no spawns 
		if (decorations.size() < 2) {
			return;
		}

		Actor rngLoc1 = decorations[random(0, decorations.size() - 1)];
		Actor rngLoc2 = decorations[random(0, decorations.size() - 1)];
		while (rngLoc1 == rngLoc2) {
			rngLoc2 = decorations[random(0, decorations.size() - 1)];
		}

		let bench1 = Actor.Spawn("RandomCraftingBench", rngLoc1.pos);
		let bench2 = Actor.Spawn("RandomCraftingBench", rngLoc2.pos);
		bench1.vel += (random(-8, 8), random(-8, 8), random(8, 16));
		bench2.vel += (random(-8, 8), random(-8, 8), random(8, 16));

		// Now the resources
		int pings = random(0, decorations.size());
		for (int i = 0; i < pings; i++) {
			Actor nextDeco = decorations[random(0, decorations.size() - 1)];

			bool bigOrSmall = random(0, 100) >= 50;
			Actor thingy;
			if (bigOrSmall) {
				thingy = Actor.Spawn("RandomResourcePickup", nextDeco.pos);
			}
			else {
				thingy = Actor.SPawn("RandomSmallResourcePickup", nextDeco.pos);
			}
			if (thingy) {
				thingy.vel += (random(-8, 8), random(-8, 8), random(8, 16));
			}

		}
	}

	override void WorldThingSpawned(WorldEvent e) {
		if (e.thing is "HDRocketAmmo") {
			HDRocketAmmo rkt = HDRocketAmmo(e.thing);
			rkt.itemsthatusethis.push("B_M4_M203");
			rkt.itemsthatusethis.push("B_MP5_M203");
		}
		else if (e.thing is "HDBattery") {
			HDBattery bat = HDBattery(e.thing);
			bat.itemsthatusethis.push("THERPUsable");
			bat.itemsthatusethis.push("TDERPUsable");
		}
		else if (e.thing is "HDPistolAmmo") {
			HDPistolAmmo b9m = HDPistolAmmo(e.thing);
			b9m.itemsthatusethis.push("B_GLock");
			b9m.itemsthatusethis.push("B_MP5");
		}
		else if (e.thing is "HDShellAmmo") {
			HDShellAmmo shl = HDShellAmmo(e.thing);
			shl.itemsthatusethis.push("b_FauxtechOrigin");
		}
		else if (e.thing is "HEATAmmo") {
			HEATAmmo het = HEATAmmo(e.thing);
			het.itemsthatusethis.push("B_RPGLauncher");
		}
	}

	override void CheckReplacement(ReplaceEvent e) {
		// weapons & gear
		if (B_Replace_Type == 5) {
			replaceAll(e);
		}
		else if (B_Replace_Type == 6 && alreadyReplaced == false) {
			replaceAll(e);
		}

		// AI options
		if (B_AI_Replace_Type == 5) {
			replaceAllAI(e);
		}
		else if (B_AI_Replace_Type == 6 && alreadyReplaced == false) {
			replaceAllAI(e);
		}
		CVar ReplaceAmmoboxes = CVar.GetCVar("UaS_ReplaceAmmoboxes");
		if (!ReplaceAmmoboxes) return;
		if (e.Replacee is "B_556_Box") { e.Replacement = "UaS_556Box"; return; }
		if (e.Replacee is "B_762_Box") { e.Replacement = "UaS_762Box"; return; }
		if (e.Replacee is "B_545_Box") { e.Replacement = "UaS_545Box"; return; }
		if (e.Replacee is "B_762sov_Box") { e.Replacement = "UaS_762SovBox"; return; }
		if (e.Replacee is "B_50BMG_Box") { e.Replacement = "UaS_50BMGBox"; return; }
//		if (e.Replacee is "BRocketPickup") { e.Replacement = "UaS_RPGBox"; return; }

	}

	void createLight(PlayerPawn pl) {
		let lightnPos = pl.pos + (0, 0, 48);
		lightNear = PointLight(Actor.Spawn("PointLight", lightnPos));
		lightNear.args[0] = 100;
		lightNear.args[1] = 100;
		lightNear.args[2] = 100;
		lightNear.args[3] = 48;

		let lightcPos = pl.pos + (0, 0, 0);
		lightCone = SpotLight(Actor.Spawn("SpotLight", lightcPos));
		lightCone.args[0] = 255;
		lightCone.args[1] = 255;
		lightCone.args[2] = 255;
		lightCone.args[3] = 512;
		lightCone.SpotInnerAngle = 1;
		lightCone.SpotOuterAngle = 35;
	}

	void adjustPosition(int index) {
		PlayerInfo info = players[index];
		PlayerPawn pawn = info.mo;
		if (pawn) {
			lightNear.setXYZ(pawn.pos + (0, 0, 16));
			lightCone.setXYZ(pawn.pos + (0, 0, 48));
			lightCone.angle = pawn.angle;
			lightCone.pitch = pawn.pitch;
		}
	}

	void checkPlayer(int index) {
		PlayerInfo info = players[index];
		PlayerPawn pawn = info.mo;
		if (!pawn) {
			return;
		}

		if (info.ReadyWeapon is "BHDWeapon") {
			BHDWeapon wep = BHDWeapon(info.ReadyWeapon);
			if (wep.flashlight && wep.flashlightOn) {
				if (!lightNear) {
					createLight(pawn);
				}
				adjustPosition(index);
			}
			else {
				if (lightNear) {
					lightNear.destroy();
					lightCone.destroy();
				}
			}
		}
	}

	override void WorldTick() {
		super.WorldTick();

		checkPlayer(0);
	}

	PointLight lightNear;
	SpotLight lightCone;



}
