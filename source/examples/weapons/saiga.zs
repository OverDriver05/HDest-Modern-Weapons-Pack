class B_SAIGA : BaseShotgun {

	default {
		+hdweapon.fitsinbackpack
		weapon.selectionorder        20;
		weapon.slotnumber            3;
		weapon.slotpriority          1;
		inventory.pickupsound        "misc/w_pkup";
		inventory.pickupmessage      "You got the Saiga 12k.";
		scale                        0.7;
		weapon.bobrangex             0.22;
		weapon.bobrangey             0.9;
		obituary                     "%o was assaulted by %k.";
		tag                          "Saiga12k";
		inventory.icon               "SAIPA0";
		BHDWeapon.BFlashSprite       "AKMFA0";
		BHDWeapon.BHeatDrain         12;
		BHDWeapon.BBulletClass       "HDB_00";
		BHDWeapon.BAmmoClass         "HDShellAmmo";
		BHDWeapon.BMagazineClass     "BFauxDrum";
		BHDWeapon.BGunMass           6.2;
		BHDWeapon.BCookOff           900;
		BHDWeapon.BHeatLimit         255;
		BHDWeapon.BSpriteWithMag     "SAIPA0";
		BHDWeapon.BSpriteWithoutMag  "SAIPB0";
		BHDWeapon.BSpriteWithFrame    0;
		BHDWeapon.BSpriteWithoutFrame 1;
		BHDWeapon.BMagazineSprite    "FOSCA0";
		BHDWeapon.BWeaponBulk        c_akm_bulk;
		BHDWeapon.BMagazineBulk      c_faux_drum_bulk;
		BHDWeapon.BBulletBulk        c_van_shell_bulk;
		BHDWeapon.BMagazineCapacity  20;
		BHDWeapon.BarrelLength       25;
		BHDWeapon.BarrelWidth        1;
		BHDWeapon.BarrelDepth        3;
		
		BHDWeapon.BFireSound         "weapons/fauxtech/fire";
		BHDWeapon.BSFireSound        "weapons/fauxtech/silentfire";
		BHDWeapon.BChamberSound      "weapons/fauxtech/chamber";
		BHDWeapon.BBoltForwardSound  "weapons/akm/boltforward";
		BHDWeapon.BBoltBackwardSound "weapons/akm/boltback";
		BHDWeapon.BClickSound        "weapons/akm/click";
		BHDWeapon.BLoadSound         "weapons/akm/clipinsert";
		BHDWeapon.BUnloadSound       "weapons/akm/clipeject";

		BHDWeapon.BROF               2;
		BHDWeapon.BBackOffsetX       0;
		BHDWeapon.BBackOffsetY       30;
		BHDWeapon.BFrontSightImage   "akmfr";
		BHDWeapon.BBackSightImage    "akmbr";
		BHDWeapon.BFrontOffsetX      0;
		BHDWeapon.BFrontOffsetY      17;
		BHDWeapon.BSilentOffsetX     0;
		BHDWeapon.BSilentOffsetY     0;
		BHDWeapon.bBarrelMount       "FOSTECH";
		BHDWeapon.bScopeMount        "NATO_RAILS";
		BHDWeapon.bMiscMount         "";
		BHDWeapon.EjectShellClass    "HDSpentShell";
		hdweapon.refid               B_SAIGA_REFID;

		BHDWeapon.BAltFrontSightImage "a_akmfr";
		BHDWeapon.BAltBackSightImage "a_akmbr";

		BHDWeapon.BLayerSight  104;
		BHDWeapon.bLayerRHand  105;
		BHDWeapon.bLayerGunBack -99;

		BHDWeapon.BRecoilXLow -3.5;
		BHDWeapon.BRecoilXHigh 4.5;
		BHDWeapon.BRecoilYLow  3.5;
		BHDWeapon.BRecoilYHigh 4.5;	
		BHDWeapon.bShowFireMode false;
		BHDWeapon.boffsetamt 48;
	}

	states {
		Spawn:
			SAIP A 0 GetMagState();
			Goto Super::Spawn;

		Firemode:
			goto nope;

		SpawnMag:
			SAIP A -1;
			Goto HDWeapon::Spawn;

		SpawnNoMag:
			SAIP B -1;
			Goto HDWeapon::Spawn;

		LayerGunBack:
			TNT1 A 1;
			Loop;

		LayerGun:
			SAIG A 1;
			Loop;

		LayerGunFire:
			SAIG B 1;
			Goto LayerGun;

		LayerGunBolt:
			SAIG E 3 A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
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
			TNT1 A 2;
			TNT1 B 2;
			TNT1 A 0 {
				A_Overlay(invoker.bLayerGun, "GunPullBolt");
			}
			TNT1 C 3; //A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
			TNT1 B 3; //A_StartSound(invoker.bBoltForwardSound, CHAN_WEAPON);
			TNT1 A 3;
			Stop;

		Reload:
			#### D 0 {
				invoker.weaponStatus[I_FLAGS] &= ~F_UNLOAD_ONLY;
				bool nomags=HDMagAmmo.NothingLoaded(self, invoker.bMagazineClass);
				//console.printf("break the chamber r %i", invoker.weaponStatus[I_FLAGS] & F_CHAMBER_BROKE);

				if (invoker.weaponstatus[I_FLAGS] & F_CHAMBER_BROKE) {
					invoker.weaponStatus[I_FLAGS] |= F_UNLOAD_ONLY;
					//console.printf("break the chamber r2 %i", invoker.weaponStatus[I_FLAGS] & F_CHAMBER_BROKE);
					return ResolveState("UnloadChamber");
				}
				else if (!invoker.chambered() && invoker.weaponStatus[I_MAG] < 1 && (pressingUse() || nomags)) {
					return ResolveState("LoadChamber");
				}
				else if (invoker.magazineGetAmmo() < 0 && invoker.brokenChamber()) {
					invoker.weaponStatus[I_FLAGS] |= F_UNLOAD_ONLY;
					return ResolveState("UnloadChamber");
				}
				else if (!HDMagAmmo.NothingLoaded(self, invoker.bMagazineClass) && invoker.magazineGetAmmo() < invoker.bMagazineCapacity) {
					return ResolveState("UnloadMag");
				}
				else if (!invoker.brokenChamber() && invoker.magazineGetAmmo() % 999 >= invoker.bMagazineCapacity && !(invoker.weaponstatus[I_FLAGS] & F_UNLOAD_ONLY)) {
					return ResolveState("Nope");
				}
				return ResolveState("Nope");
			}

		LayerGunHandReturn:
			SAIG C 3;
			SAIG A -1;
			Stop;

		ReloadEnd:
			#### A 0 {
				A_Overlay(invoker.bLayerGun, "LayerGunHandReturn");
			}
			#### A 2 Offset(-11, 39);
			#### A 1 Offset(-8, 37); //A_MuzzleClimb(frandom(0.2, -2.4), frandom(-0.2, -1.4));
			#### A 0 A_CheckCookoff();
			#### A 1 Offset(-3, 34);
			#### A 0 {
				if (invoker.brokenChamber()) {
					return ResolveState("Nope");
				}
				return ResolveState("Chamber_Manual");
			}

		Empty:
			TNT1 A 1;
			Stop;

		LayerGunReloading:
			SAIG C 3;
			SAIG D -1;
			Stop;

		UnloadMag:
			#### A 0 {
				A_Overlay(invoker.bLayerGun, "LayerGunReloading");
			}
			#### A 3 Offset(0, 33);
			#### A 3 Offset(-3, 34);
			#### A 1 Offset(-8, 37);
			#### A 2 Offset(-11, 39) {
				//console.printf("unload mag %i", invoker.magazineGetAmmo());
				if (invoker.magazineGetAmmo() < 0) {
					//console.printf("mag out %i", invoker.magazineGetAmmo());
					return ResolveState("MagOut");
				}
				if (invoker.brokenChamber()) {
					invoker.weaponStatus[I_FLAGS] |= F_UNLOAD_ONLY;
				}
				//A_SetPitch(pitch - 0.3, SPF_INTERPOLATE);
				//A_SetAngle(angle - 0.3, SPF_INTERPOLATE);
				//A_StartSound(invoker.bClickSound, CHAN_WEAPON, CHANF_OVERLAP);
				A_StartSound(invoker.bUnloadSound, CHAN_WEAPON, CHANF_OVERLAP);
				return ResolveState(NULL);
			}
			#### D 4 Offset(-12, 40) {
				//A_SetPitch(pitch - 0.3, SPF_INTERPOLATE);
				//A_SetAngle(angle - 0.3, SPF_INTERPOLATE);
			}
			#### D 120 offset(-14, 44) {

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
					A_StartSound("weapons/pocket", CHAN_WEAPON, CHANF_OVERLAP);
				}
				return ResolveState("MagOut");
			}

		MagOut:
			#### D 4;
			#### D 8 {
				if (invoker.weaponStatus[I_FLAGS] & F_UNLOAD_ONLY || !CountInv(invoker.bMagazineClass)) {
					return ResolveState("ReloadEnd");
				}
				return ResolveState("LoadMag");
			}

		GunPullBolt:
			TNT1 E 3 A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
			Goto LayerGun;

		Chamber_Anim:
			SAIG E 3;
			SAIG F 3 {
				A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
			}
			SAIG G 3;
			SAIG E 3;
			SAIG A -1 {
				A_StartSound(invoker.bBoltForwardSound, CHAN_WEAPON);
			}
			Stop;

		Chamber_Manual:
			#### A 0 { 
				if (invoker.chambered() || invoker.magazineGetAmmo() <= -1) {
					return ResolveState("Nope");
				}
				return ResolveState(NULL);
			}
			#### A 3 Offset(-1, 36) {
				A_WeaponBusy();
				A_Overlay(invoker.bLayerGun, "Chamber_Anim");
			}
			#### A 3;
			#### A 3 Offset(-1, 40) {
				int ammo = invoker.magazineGetAmmo();
				if (!invoker.chambered() && ammo % 999 > 0) {
					if (ammo > invoker.bMagazineCapacity) {
						invoker.weaponStatus[I_MAG] = invoker.bMagazineCapacity - 1;
					}
					else {
						invoker.magazineAddAmmo(-1);
					}

					//A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
					invoker.setChamber();
					//BrokenRound();
					//return ResolveState(NULL);
				}
				//console.printf("noping");
				//return ResolveState("Nope");
			}
			#### A 3 offset(-1, 46) {
				//A_Overlay(invoker.bLayerGun, "LayerGunBolt");
			}
			#### A 3 offset(0, 36) {
				//A_StartSound(invoker.bBoltForwardSound, CHAN_WEAPON);
			}
			#### A 3;
			#### A 0 offset(0, 34) {
				return ResolveState("Nope");
			}

		DUMMY:
			AKMF ABCD -1;
			Stop;


	}

	override string, double GetPickupSprite() {
		if(magazineGetAmmo() > -1) {
			return "SAIPA0", 1.;
		}
		else {
			return "SAIPB0", 1.;
		}
	}
	
}
