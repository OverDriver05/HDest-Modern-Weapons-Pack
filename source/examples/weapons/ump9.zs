class B_UMP9 : BHDWeapon {
	default {
		+hdweapon.fitsinbackpack
		weapon.selectionorder        20;
		weapon.slotnumber            2;
		weapon.slotpriority          2;
		inventory.pickupsound        "misc/w_pkup";
		inventory.pickupmessage      "You got the UMP-9.";
		scale                        0.7;
		weapon.bobrangex             0.22;
		weapon.bobrangey             0.9;
		obituary                     "%o was assaulted by %k.";
		tag                          "UMP-9";
		inventory.icon               "UMPPA0";
		BHDWeapon.BFlashSprite       "MPFLA0";
		BHDWeapon.BHeatDrain         12;
		BHDWeapon.BBulletClass       "HDB_9";
		BHDWeapon.BAmmoClass         "HDPistolAmmo";
		BHDWeapon.BMagazineClass     "B9mm_MP5K_MAG";
		BHDWeapon.BGunMass           6.2;
		BHDWeapon.BCookOff           30;
		BHDWeapon.BHeatLimit         255;
		BHDWeapon.BSpriteWithMag     "UMPPA0";
		BHDWeapon.BSpriteWithoutMag  "UMPPB0";
		BHDWeapon.BSpriteWithFrame    0;
		BHDWeapon.BSpriteWithoutFrame 1;
		BHDWeapon.BMagazineSprite    "UMPCA0";
		BHDWeapon.BWeaponBulk        c_mp5_bulk;
		BHDWeapon.BMagazineBulk      c_mp5_mag_bulk;
		BHDWeapon.BBulletBulk        c_van_9mm_bulk;
		BHDWeapon.BMagazineCapacity  30;
		BHDWeapon.BarrelLength       18.75;
		BHDWeapon.BarrelWidth        1;
		BHDWeapon.BarrelDepth        3;

		BHDWeapon.BFireSound         "weapons/mp5/fire";
		BHDWeapon.BSFireSound        "weapons/mp5/silentfire";
		BHDWeapon.BChamberSound      "weapons/mp5/chamber";
		BHDWeapon.BBoltForwardSound  "weapons/mp5/boltback";
		BHDWeapon.BBoltBackwardSound "weapons/mp5/boltforward";
		BHDWeapon.BClickSound        "weapons/m4/click";
		BHDWeapon.BLoadSound         "weapons/mp5/clipinsert";
		BHDWeapon.BUnloadSound       "weapons/mp5/clipeject";

		BHDWeapon.BROF               1.0;
		BHDWeapon.BBackOffsetX       0;
		BHDWeapon.BBackOffsetY       22;
		BHDWeapon.BFrontSightImage   "umpfr";
		BHDWeapon.BBackSightImage    "umpbr";
		BHDWeapon.BFrontOffsetX      0;
		BHDWeapon.BFrontOffsetY      23;
		BHDWeapon.BSilentOffsetX     0;
		BHDWeapon.BSilentOffsetY     0;
		BHDWeapon.bBarrelMount       "9MM_GLOCK";
		BHDWeapon.bScopeMount        "NATO_RAILS";
		BHDWeapon.bMiscMount         "";
		BHDWeapon.EjectShellClass    "HDSpent9mm";
		hdweapon.refid               B_UMP9_REFID;

		BHDWeapon.BAltFrontSightImage "umpfr";
		BHDWeapon.BAltBackSightImage "a_umpbr";

		BHDWeapon.BIronThreshold 10;

		BHDWeapon.BLayerGun    100;
		BHDWeapon.BLayerSight  105;
		BHDWeapon.BLayerMisc   102;
		BHDWeapon.bLayerBarrel 99;
		BHDWeapon.bLayerRHand  104;
		BHDWeapon.bLayerGunBack 106;

		BHDWeapon.BRecoilXLow -0.1;
		BHDWeapon.BRecoilXHigh 0.1;
		BHDWeapon.BRecoilYLow  0.2;
		BHDWeapon.BRecoilYHigh 0.5;		
		BHDWeapon.bShowFireMode true;
		BHDWeapon.boffsetamt 20;
	}

	states {
		Spawn:
			UMPP A 0;
			Goto Super::Spawn; 

		SpawnMag:
			UMPP A -1;
			Goto HDWeapon::Spawn;

		SpawnNoMag:
			UMPP B -1;
			Goto HDWeapon::Spawn;

		LayerGun:
			UMPG H 1;
			Loop;

		LayerGunBack:
			UMPG I 1;
			Loop;

		NoHandsFront:
			UMPG L 12;
			Goto LayerGun; 

		NoHandsBack:
			UMPG M 12;
			Goto LayerGunBack; 

		LayerGunFire:
			UMPG H 1;
			Goto LayerGun;

		LayerGunBolt:
			UMPG B 3;
			Goto LayerGun;

		LayerReloadHands:
			TNT1 A 6;
			UMPH C 9;
			UMPH A 3;
			Stop;
			
		LayerDefaultSight:
			TNT1 A 1;
			Loop;

		UnloadMag:
			TNT1 A 0 {
				A_Overlay(invoker.BLayerRHand, "HandDisengageBolt");
				A_Overlay(invoker.BLayerGun, "UnloadFront");
				A_Overlay(invoker.BLayerGunBack, "UnloadBack");
				A_StartSound(invoker.bloadSound, CHAN_WEAPON, CHANF_OVERLAP);
			}
			#### A 1 Offset(0, 33);
			#### A 1 Offset(-3, 34);
			#### A 1 Offset(-8, 37);
			#### A 2 Offset(-11, 39) {

				if (invoker.magazineGetAmmo() < 0) {
					return ResolveState("MagOut");
				}
				if (invoker.brokenChamber()) {
					invoker.weaponStatus[I_FLAGS] |= F_UNLOAD_ONLY;
				}
				//A_SetPitch(pitch - 0.3, SPF_INTERPOLATE);
				//A_SetAngle(angle - 0.3, SPF_INTERPOLATE);
				//A_StartSound(invoker.bClickSound, CHAN_WEAPON);
				return ResolveState(NULL);
			}
			#### A 4 Offset(-12, 40) {
				//A_SetPitch(pitch - 0.3, SPF_INTERPOLATE);
				//A_SetAngle(angle - 0.3, SPF_INTERPOLATE);
			}
			#### A 20 offset(-14, 44) {

				int inMag = invoker.magazineGetAmmo();
				if (inMag > (invoker.bMagazineCapacity + 1)) {
					inMag %= invoker.bMagazineCapacity;
				}

				invoker.weaponStatus[I_MAG] = -1;
				if (invoker.chambered()) {
					A_SpawnItemEx(invoker.BAmmoClass, 0, 0, 20, random(4, 7), random(-2, 2), random(-2, 1), 0, SXF_NOCHECKPOSITION);
				}
				invoker.unchamber();
				

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

		UnloadFront:
			UMPG K 4;

		UnloadFrontWait:
			UMPG L 1;
			Loop;

		UnloadBack:
			UMPG M 1;
			Loop;

		HandDisengageBolt:
			UMPH AB 2;
			UMPH C 2 {
				A_StartSound("mp5/boltb", CHAN_WEAPON, CHANF_OVERLAP);
			}
			Stop;

		HandSlapBolt:
			TNT1 A 9;
			UMPH C 2 {
				A_StartSound("mp5/boltf", CHAN_WEAPON, CHANF_OVERLAP);
			}
			UMPH A 2;
			Stop;

		Front:
			UMPH H 4;
			UMPH J 2;

		BoltBackHands:
			UMPH A 2;
			UMPH B 2;
			UMPH C 4;
			Stop;

		Chamber_Manual:
			#### C 0 { 
				if (invoker.chambered() || invoker.magazineGetAmmo() <= -1) {
					return ResolveState("Nope");
				}
				return ResolveState(NULL);
			}
			#### C 0 {
				A_Overlay(invoker.bLayerRHand, "HandSlapBolt");
			}
			#### C 3 Offset(-1, 36) A_WeaponBusy();
			#### D 3 Offset(-1, 40) {
				int ammo = invoker.magazineGetAmmo();
				if (!invoker.chambered() && ammo % 100 > 0) {
					if (ammo > invoker.bMagazineCapacity) {
						invoker.weaponStatus[I_MAG] = 29;
					}
					else {
						invoker.magazineAddAmmo(-1);
					}

					A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
					invoker.setChamber();
					BrokenRound();
					return ResolveState(NULL);
				}
				return ResolveState("Nope");
			}
			#### E 3 offset(-1, 46) {
				//A_Overlay(invoker.bLayerRHand, "HandSlapBolt");
				//A_Overlay(invoker.bLayerGunBack, "UnloadBack");
			}
			#### D 3 offset(0, 36) {
				A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
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
				else {
					return ResolveState("Nope");
				}
			}

		Reload:
			#### A 0 {
				invoker.weaponStatus[I_FLAGS] &= ~F_UNLOAD_ONLY;
				bool nomags=HDMagAmmo.NothingLoaded(self, invoker.bMagazineClass);

				if (invoker.weaponstatus[I_FLAGS] & F_CHAMBER_BROKE) {
					return ResolveState("UnloadChamber");
				}
				else if (!invoker.chambered() && invoker.weaponStatus[I_MAG] < 1 && (pressingUse() || nomags)) {
					return ResolveState("LoadChamber");
				}
				if (!invoker.brokenChamber() && invoker.magazineGetAmmo() % 30 >= invoker.bMagazineCapacity && !(invoker.weaponstatus[I_FLAGS] & F_UNLOAD_ONLY)) {
					return ResolveState("Nope");
				}
				else if (invoker.magazineGetAmmo() == invoker.bMagazineCapacity - 1) {
					return ResolveState("Nope");
				}
				else if (invoker.magazineGetAmmo() < 0 && invoker.brokenChamber()) {
					invoker.weaponStatus[I_FLAGS] |= F_UNLOAD_ONLY;
					return ResolveState("UnloadChamber");
				}
				else if (!HDMagAmmo.NothingLoaded(self, invoker.bMagazineClass)) {
					return ResolveState("UnloadMag");
				}
				return ResolveState("Nope");
			}

		ReloadEnd:
			#### A 2 Offset(-11, 39);
			#### A 1 Offset(-8, 37); //A_MuzzleClimb(frandom(0.2, -2.4), frandom(-0.2, -1.4));
			#### A 0 A_CheckCookoff();
			#### A 1 Offset(-3, 34);
			#### A 0 {
				//console.printf("I'm here");
				if (invoker.brokenChamber()) {
					//console.printf("nahing out");
					return ResolveState("Nope");
				}
				return ResolveState("Chamber_Manual");
			}

		Dummy:
			MPFL A -1;
			MPFL B -1;
			MPFL C -1;
			MPFL D -1;
			Stop;

	}	

	override string, double GetPickupSprite() {
		if(magazineGetAmmo() > -1) {
			return "UMPPA0", 1.;
		}
		else {
			return "UMPPB0", 1.;
		}
	}

}

class UMP9SilencerOffset : BarrelOffset {
	default {
		Offset.WeaponClass "B_UMP9";
		Offset.WeaponOverlay "GlockSilencer";
		Offset.OffX -0.7;
		Offset.OffY 18;
	}
}

class UMP9EOTOffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_UMP9";
		Offset.WeaponOverlay "B_EOT_HWS";
		Offset.OffY 5;
	}
}

class UMP9HoloRedOffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_UMP9";
		Offset.WeaponOverlay "B_Sight_Holo_Red";
		Offset.OffY 5;
	}
}

class UMP9ReflexRedOffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_UMP9";
		Offset.WeaponOverlay "B_Reflex_Red";
		Offset.OffY 5;
	}
}

class UMP9AcogRedOffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_UMP9";
		Offset.WeaponOverlay "B_ACOG_Red";
		Offset.OffY 5;
	}
}

class UMP9AcogRMROffset : ScopeOffset {
	default {
		Offset.WeaponClass "B_UMP9";
		Offset.WeaponOverlay "B_ACOG_RMR";
		Offset.OffY 5;
	}
}