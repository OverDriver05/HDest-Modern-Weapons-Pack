
class b_M240 : BHDWeapon {
	default {
		-hdweapon.fitsinbackpack
		weapon.selectionorder        20;
		weapon.slotnumber            4;
		weapon.slotpriority          2;
		inventory.pickupsound        "misc/w_pkup";
		inventory.pickupmessage      "You got the M240.";
		scale                        0.7;
		weapon.bobrangex             0.35;
		weapon.bobrangey             0.95;
		obituary                     "%o was assaulted by %k.";
		tag                          "M240";
		inventory.icon               "M42UA0";
		BHDWeapon.BFlashSprite       "FLSHA0";
		BHDWeapon.BHeatDrain         12;
		BHDWeapon.BBulletClass       "HDB_762x51";
		BHDWeapon.BAmmoClass         "B762x51Ammo";
		BHDWeapon.BMagazineClass     "BM240Mag";
		BHDWeapon.BGunMass           6.2;
		BHDWeapon.BCookOff           90;
		BHDWeapon.BHeatLimit         255;
		BHDWeapon.BSpriteWithMag     "M42UA0";
		BHDWeapon.BSpriteWithoutMag  "M42UB0";
		BHDWeapon.BSpriteWithFrame    0;
		BHDWeapon.BSpriteWithoutFrame 1;
		BHDWeapon.BMagazineSprite    "M42CA0";
		BHDWeapon.BWeaponBulk        c_m240_bulk;
		BHDWeapon.BMagazineBulk      c_m240_pouch_bulk;
		BHDWeapon.BBulletBulk        1;
		BHDWeapon.BMagazineCapacity  100;
		BHDWeapon.BarrelLength       25;
		BHDWeapon.BarrelWidth        1;
		BHDWeapon.BarrelDepth        3;
		
		BHDWeapon.BFireSound         "weapons/m14/fire";
		BHDWeapon.BSFireSound        "weapons/m14/silentfire";
		BHDWeapon.BChamberSound      "weapons/m4/chamber";
		BHDWeapon.BBoltForwardSound  "weapons/m4/boltback";
		BHDWeapon.BBoltBackwardSound "weapons/m4/boltforward";
		BHDWeapon.BClickSound        "weapons/m4/click";
		BHDWeapon.BLoadSound         "weapons/m249/loading";
		BHDWeapon.BUnloadSound       "weapons/m4/clipeject";

		BHDWeapon.BROF               1.6;
		BHDWeapon.BBackSightImage    "m24rsig";
		BHDWeapon.BBackOffsetX       4;
		BHDWeapon.BBackOffsetY       23;
		BHDWeapon.BFrontSightImage   "m24fr";
		BHDWeapon.BFrontOffsetX      0;
		BHDWeapon.BFrontOffsetY      23;
		BHDWeapon.BSilentOffsetX     0;
		BHDWeapon.BSilentOffsetY     0;
		BHDWeapon.bBarrelMount       "762_NATO_BARREL";
		BHDWeapon.bScopeMount        "NATO_RAILS";
		BHDWeapon.bMiscMount         "NATO_RAILS";
		BHDWeapon.EjectShellClass    "B762x51Spent";
		hdweapon.refid               B_MF240_REFID;

		BHDWeapon.BAltFrontSightImage "m24fr";
		BHDWeapon.BAltBackSightImage  "m24rsig";

		BHDWeapon.BLayerSight   106;
		BHDWeapon.bLayerRHand   130;
		BHDWeapon.bLayerEHand   105;
		BHDWeapon.BLayerGun     100;
		BHDWeapon.bLayerGunBack 107;

		BHDWeapon.BRecoilXLow -0.8;
		BHDWeapon.BRecoilXHigh 0.8;
		BHDWeapon.BRecoilYLow  0.9;
		BHDWeapon.BRecoilYHigh 1.1;		
	}

	override void InitializeWepStats (bool idfa) {
		super.InitializeWepStats(idfa);
		weaponStatus[I_AUTO] = 1;
		//weaponStatus[]
		//weaponStatus[I_MAG] = bMagazineCapacity - 1;
		//weaponStatus[I_FLAGS] |= F_CHAMBER;
		//setchamber();
	}

	states {
		Spawn:
			M42U A 0 GetMagState();
			Goto Super::Spawn;

		Firemode:
			goto nope;

		SpawnMag:
			M42U A -1;
			Goto HDWeapon::Spawn;

		SpawnNoMag:
			M42U B -1;
			Goto HDWeapon::Spawn;

		LayerGun:
			M24G B 1;
			Loop;

		LayerGunBack:
			M24G A 1 {
				//console.printf("Layer %i", invoker.weaponStatus[I_MAG]);
				//psp.frame = 5;
				if (invoker.scopeClass is "B_Scope_10x") {
					invoker.bLayerSight = 999;
				}
				else {
					invoker.bLayerSight = 104;
				}

				let psp = player.FindPSprite(invoker.bLayerGunBack);
				int ammo = invoker.weaponStatus[I_MAG];
				if (ammo > 8) {
					psp.frame = 0;
				}
				else if (ammo == 8) {
					psp.frame = 3;
				}
				else if (ammo == 7) {
					psp.frame = 4;
				}
				else if (ammo == 6) {
					psp.frame = 5;
				}
				else if (ammo == 5) {
					psp.frame = 6;
				}
				else if (ammo == 4) {
					psp.frame = 7;
				}
				else if (ammo == 3) {
					psp.frame = 8;
				}
				else if (ammo <= 2) {
					psp.frame = 9;
				}
			}
			//M24G A 1;
			Loop;

		LayerGunFire:
			TNT1 A 0 {
				A_Overlay(invoker.bLayerGunBack, "VroomVroom");
			}
			M24G B 1;
			Goto LayerGun;

		VroomVroom:
			M24G A 1 {
				//console.printf("Fire %i", invoker.weaponStatus[I_MAG]);
				let psp = player.FindPSprite(invoker.bLayerGunBack);
				int ammo = invoker.weaponStatus[I_MAG];
				if (ammo > 8) {
					psp.frame = 2;
				}
				else if (ammo == 8) {
					psp.frame = 3;
				}
				else if (ammo == 7) {
					psp.frame = 4;
				}
				else if (ammo == 6) {
					psp.frame = 5;
				}
				else if (ammo == 5) {
					psp.frame = 6;
				}
				else if (ammo == 4) {
					psp.frame = 7;
				}
				else if (ammo == 3) {
					psp.frame = 8;
				}
				else if (ammo <= 2) {
					psp.frame = 9;
				}
			}
			Goto LayerGunBack;

		LayerGunBolt:
			M24G M 2;
			Goto LayerGun;

		LayerReloadHands:
			TNT1 A 0;
			Goto Super::LayerReloadHands;

		LayerDefaultSight:
			TNT1 A 1;
			Loop;

		UnloadChamber:
			#### A 0 {
				A_Overlay(invoker.bLayerRHand, "PullBolt");
			}
			Goto Super::UnloadChamber;

		PullBolt:
			M24H I 2;
			M24H J 2;
			TNT1 A 0 {
				A_Overlay(invoker.bLayerGun, "GunPullBolt");
			}
			M24H K 2 A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
			M24H J 2 A_StartSound(invoker.bBoltForwardSound, CHAN_WEAPON);
			M24H I 2;
			Stop;

		GunPullBolt:
			M24G J 2;
			Goto LayerGun;

		HandOpenTop:
			M24H A 2;
			M24H B -1;
			Stop;

		HandFlickTop:
			M24H DE 2;
			Stop;

		HandCloseTop1:
			M24H IGF 2;
			M24H GI 2;
			Stop;

		MagOut:
			#### A 4 {
				A_Overlay(invoker.bLayerEHand, "HandOpenTop");
			}
			#### A 1 Offset(0, 60);
			#### A 0 {
				A_Overlay(invoker.bLayerEHand, "HandFlickTop");
				A_Overlay(invoker.bLayerGun, "MagOutFront");
			}
			#### A 1 Offset(0, 61);
			#### A 1 Offset(0, 62);
			#### A 1 Offset(0, 63);
			#### A 1 Offset(0, 62);
			#### A 1 Offset(0, 61);
			#### A 20 offset(0, 60);
			#### A 0 {
				A_StartSound(invoker.bUnloadSound, CHAN_WEAPON);
				if (invoker.weaponStatus[I_FLAGS] & F_UNLOAD_ONLY || !CountInv(invoker.bMagazineClass)) {
					return ResolveState("ReloadEnd");
				}
				return ResolveState("LoadMag");
			}

		MagOutFront:
			M24G KL 3;
			#### L -1;
			Stop;

		MagOutFrontClose:
			M24G K 2;
			Goto LayerGun;

		ReloadEnd:
			#### A 6 {
				A_Overlay(invoker.bLayerEHand, "HandCloseTop1");
			}
			#### A 6 {
				A_Overlay(invoker.bLayerGun, "MagOutFrontClose");
			}
			#### A 2 Offset(0, 60);
			#### A 1 Offset(0, 55); // A_MuzzleClimb(frandom(0.2, -2.4), frandom(-0.2, -1.4));
			#### A 0 A_CheckCookoff();
			#### A 1 Offset(0, 45);
			#### A 0 {
				return ResolveState("Chamber_Manual");
			}

		LoadMag:
			#### A 12 {
				//A_StartSound(invoker.bLoadSound, CHAN_WEAPON, CHANF_OVERLAP);
				let magRef = HDMagAmmo(FindInventory(invoker.bMagazineClass));
				if (!magRef) {
					return ResolveState("ReloadEnd");
				}

				A_StartSound("weapons/pocket", CHAN_WEAPON, CHANF_OVERLAP);
				A_SetTics(10);
				return ResolveState(NULL);
			}
			#### A 8 Offset(0, 62); // A_StartSound(invoker.bLoadSound, CHAN_WEAPON, CHANF_OVERLAP);
			#### A 1 Offset(0, 60) {
				//A_StartSound(invoker.bLoadSound, CHAN_WEAPON);
				let magRef = HDMagAmmo(FindInventory(invoker.bMagazineClass));
				if (magRef) {
					invoker.weaponStatus[I_MAG] = magRef.TakeMag(true);
					A_StartSound(invoker.bClickSound, CHAN_WEAPON, CHANF_OVERLAP);
				}
				return ResolveState("ReloadEnd");
			}

		UnloadMag:
			#### A 1 Offset(0, 33);
			#### A 1 Offset(0, 36);
			#### A 1 Offset(0, 39);
			#### A 2 Offset(0, 42) {
				if (invoker.magazineGetAmmo() < 0) {
					return ResolveState("MagOut");
				}
				if (invoker.brokenChamber()) {
					invoker.weaponStatus[I_FLAGS] |= F_UNLOAD_ONLY;
				}
				//A_SetPitch(pitch - 0.3, SPF_INTERPOLATE);
				//A_SetAngle(angle - 0.3, SPF_INTERPOLATE);
				A_StartSound(invoker.bClickSound, CHAN_WEAPON);
				return ResolveState(NULL);
			}
			#### A 4 Offset(0, 40) {
				//A_SetPitch(pitch - 0.3, SPF_INTERPOLATE);
				//A_SetAngle(angle - 0.3, SPF_INTERPOLATE);
			}
			#### A 1 Offset(0, 45);
			#### A 1 Offset(0, 48);
			#### A 1 Offset(0, 51);
			#### A 1 Offset(0, 52);
			#### A 1 Offset(0, 55);
			#### A 1 Offset(0, 58);
			#### A 20 offset(0, 60) {

				int inMag = invoker.magazineGetAmmo();
				if (inMag > (invoker.bMagazineCapacity + 1)) {
					inMag %= invoker.bMagazineCapacity;
				}

				invoker.weaponStatus[I_MAG] = -1;
				if (!PressingUnload() && !PressingReload() || A_JumpIfInventory(invoker.bMagazineClass, 0, "null")) {
					HDMagAmmo.SpawnMag(self, invoker.bMagazineClass, inMag);
					A_SetTics(1);
				}
				else {
					HDMagAmmo.GiveMag(self, invoker.bMagazineClass, inMag);
					A_StartSound("weapons/pocket", CHAN_WEAPON);
				}
				return ResolveState("MagOut");
			}

		HandOnBolt:
			M24H I 2;
			M24H J -1;
			Stop;

		HandPullBolt:
			M24H K 2;
			M24H J 2;
			M24H I 2;
			Stop;

		UnloadChamber:
			#### A 1 Offset(0, 34) {
				A_Overlay(invoker.bLayerEHand, "HandOpenTop");
			}
			#### A 1 Offset(0, 39);
			#### A 3 Offset(0, 44); // A_MuzzleClimb(frandom(-.4, .4), frandom(-.4, .4));
			#### A 2 Offset(0, 42) {
				//A_MuzzleClimb(frandom(-.4, .4), frandom(-.4, .4));
				if (invoker.chambered() && !invoker.brokenChamber()) {
					A_SpawnItemEx(invoker.BAmmoClass, 0, 0, 20, random(4, 7), random(-2, 2), random(-2, 1), 0, SXF_NOCHECKPOSITION);
					invoker.WeaponStatus[I_FLAGS] &= ~F_CHAMBER;
				}
				else {
					invoker.weaponStatus[I_FLAGS] &= ~F_CHAMBER_BROKE;
					invoker.weaponStatus[I_FLAGS] &= ~F_CHAMBER;
					A_StartSound(invoker.bClickSound, CHAN_WEAPON, CHANF_OVERLAP);
					A_SpawnItemEx(invoker.BAmmoClass, 0, 0, 20, random(4, 7), random(-2, 2), random(-2, 1), 0, SXF_NOCHECKPOSITION);
				}
				return ResolveState("UnchamberEnd");
			}

		UnchamberEnd:
			#### A 6 {
				A_Overlay(invoker.bLayerEHand, "HandCloseTop1");
			}
			#### A 6 {
				A_Overlay(invoker.bLayerGun, "MagOutFrontClose");
			}
			#### A 2 Offset(0, 44);
			#### A 1 Offset(0, 55); // A_MuzzleClimb(frandom(0.2, -2.4), frandom(-0.2, -1.4));
			#### A 0 A_CheckCookoff();
			#### A 1 Offset(0, 45);
			#### A 0 {
				return ResolveState("Nope");
			}

		Chamber_Manual:
			#### C 0 { 
				if (invoker.chambered() || invoker.magazineGetAmmo() <= -1) {
					return ResolveState("Nope");
				}
				return ResolveState(NULL);
			}
			#### C 0 {
				A_Overlay(invoker.bLayerRHand, "HandOnBolt");
			}
			#### C 3 Offset(-1, 36) A_WeaponBusy();
			#### D 3 Offset(-1, 40) {
				int ammo = invoker.magazineGetAmmo();
				if (!invoker.chambered() && ammo % 999 > 0) {
					if (ammo > invoker.bMagazineCapacity) {
						invoker.weaponStatus[I_MAG] = 29;
					}
					else {
						invoker.magazineAddAmmo(-1);
					}

					A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
					invoker.setChamber();
					//BrokenRound();
					return ResolveState(NULL);
				}
				return ResolveState("Nope");
			}
			#### E 3 offset(-1, 46) {
				//A_Overlay(invoker.bLayerGunBack, "LayerGunBolt");
				A_Overlay(invoker.bLayerRHand, "HandPullBolt");
			}
			#### D 3 offset(0, 36) {
				A_StartSound(invoker.bBoltForwardSound, CHAN_WEAPON);
			}
			#### A 0 offset(0, 34) {
				return ResolveState("Nope");
			}

		user4:
		Unload:
			#### A 0 {
				invoker.weaponStatus[I_FLAGS] |= F_UNLOAD_ONLY;
				if (invoker.magazineGetAmmo() >= 0) {
					return ResolveState("UnloadMag");
				}
				else if (invoker.chambered() || invoker.brokenChamber()) {
					return ResolveState("UnloadChamber");
				}
				else {
					return ResolveState("Nope");
				}
			}


	}





	override string, double GetPickupSprite() {
		if(magazineGetAmmo() > -1) {
				return "M42UA0", 1.;
		}
		else {
				return "M42UB0", 1.;
			}
		}


	}




















class M240AcogOffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_M240";
		Offset.WeaponOverlay "B_Acog_Red";
		Offset.OffY -10;
		Offset.OffX 0;
	}
}

class M240FullOffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_M240";
		Offset.WeaponOverlay "B_SIght_crdot";
		Offset.OffX 0;
		Offset.OffY -15;
	}
}

class M24010xScopeOffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_M240";
		Offset.WeaponOverlay "B_Scope_10x";
		Offset.OffY 0;
		Offset.OffX 0;
	}
}

class M240HoloOffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_M240";
		Offset.WeaponOverlay "B_Sight_Holo_Red";
		Offset.OffY -10;
		//Offset.OffX -1;
	}
}
