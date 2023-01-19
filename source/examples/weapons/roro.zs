
class B_R0635 : BaseStandardRifle {

	default {
		+hdweapon.fitsinbackpack
		weapon.selectionorder        20;
		weapon.slotnumber            2;
		weapon.slotpriority          1;
		inventory.pickupsound        "misc/w_pkup";
		inventory.pickupmessage      "You got the Colt R0635.";
		scale                        0.7;
		weapon.bobrangex             0.22;
		weapon.bobrangey             0.9;
		obituary                     "%o was assaulted by %k.";
		tag                          "R0635";
		inventory.icon               "M4RPA0";
		BHDWeapon.BFlashSprite       "MPFLA0";
		BHDWeapon.BHeatDrain         12;
		BHDWeapon.BBulletClass       "HDB_9";
		BHDWeapon.BAmmoClass         "HDPistolAmmo";
		BHDWeapon.BMagazineClass     "HD9mMag30";
		BHDWeapon.BGunMass           6.2;
		BHDWeapon.BCookOff           30;
		BHDWeapon.BHeatLimit         255;
		BHDWeapon.BSpriteWithMag     "M4RPC0";
		BHDWeapon.BSpriteWithoutMag  "M4RPD0";
		BHDWeapon.BSpriteWithFrame    0;
		BHDWeapon.BSpriteWithoutFrame 1;
		BHDWeapon.BMagazineSprite    "CLP3A0";
		BHDWeapon.BWeaponBulk        c_mp5_bulk;
		BHDWeapon.BMagazineBulk      c_mp5_mag_bulk;
		BHDWeapon.BBulletBulk        c_van_9mm_bulk;
		BHDWeapon.BMagazineCapacity  30;
		BHDWeapon.BarrelLength       18.75;
		BHDWeapon.BarrelWidth        1;
		BHDWeapon.BarrelDepth        3;
		
		BHDWeapon.BFireSound         "weapons/mp5/fire";
		BHDWeapon.BSFireSound        "weapons/mp5/silentfire";
		BHDWeapon.BChamberSound      "weapons/m4/chamber";
		BHDWeapon.BBoltForwardSound  "weapons/m4/boltback";
		BHDWeapon.BBoltBackwardSound "weapons/m4/boltforward";
		BHDWeapon.BClickSound        "weapons/m4/click";
		BHDWeapon.BLoadSound         "weapons/m4/clipinsert";
		BHDWeapon.BUnloadSound       "weapons/m4/clipeject";

		BHDWeapon.BROF               0.5;
		BHDWeapon.BBackOffsetX       -7;
		BHDWeapon.BBackOffsetY       40;
		BHDWeapon.BFrontSightImage   "m16iron";
		BHDWeapon.BBackSightImage    "mrsig1";
		BHDWeapon.BFrontOffsetX      0;
		BHDWeapon.BFrontOffsetY      22;
		BHDWeapon.BSilentOffsetX     0;
		BHDWeapon.BSilentOffsetY     0;
		BHDWeapon.bBarrelMount       "9MM_GLOCK";
		BHDWeapon.bScopeMount        "NATO_RAILS";
		BHDWeapon.bMiscMount         "NATO_RAILS";
		BHDWeapon.EjectShellClass    "HDSpent9mm";
		hdweapon.refid               B_R0635_REFID;

		BHDWeapon.BAltFrontSightImage "am4";
		BHDWeapon.BAltBackSightImage "alt_m4i";

		BHDWeapon.BLayerSight  104;
		BHDWeapon.bLayerRHand  105;
		BHDWeapon.bLayerGunBack -99;

		BHDWeapon.BRecoilXLow -0.8;
		BHDWeapon.BRecoilXHigh 0.8;
		BHDWeapon.BRecoilYLow  0.9;
		BHDWeapon.BRecoilYHigh 1.4;		
		BHDWeapon.bShowFireMode true;
		BHDWeapon.boffsetamt 38;
	}

	states {
		Spawn:
			RO6P A 0 GetMagState();
			Goto Super::Spawn;

		Firemode:
			#### A 1 {
				invoker.weaponStatus[I_AUTO] = (invoker.weaponStatus[I_AUTO] == 1 ? 0 : 1);
				A_WeaponReady(WRF_NONE);
				return ResolveState("Nope");
			}

		SpawnMag:
			RO6P A -1;
			Goto HDWeapon::Spawn;

		SpawnNoMag:
			RO6P B -1;
			Goto HDWeapon::Spawn;

		LayerGun:
			M4RG A 1;
			Loop;

		LayerGunFire:
			M4RG B 1;
			Goto LayerGun;

		LayerGunBolt:
			M4RG E 3 A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
			Goto LayerGun;

		LayerReloadHands:
			M4RH A 0;
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
			M4RH A 2;
			M4RH B 2;
			TNT1 A 0 {
				A_Overlay(invoker.bLayerGun, "GunPullBolt");
			}
			M4RH C 3; //A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
			M4RH B 3; //A_StartSound(invoker.bBoltForwardSound, CHAN_WEAPON);
			M4RH A 3;
			Stop;

		ReloadEnd:
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

		GunPullBolt:
			M4RG E 3 A_StartSound(invoker.bBoltBackwardSound, CHAN_WEAPON);
			Goto LayerGun;
	}

	override string, double GetPickupSprite() {
		if(magazineGetAmmo() > -1) {
			return "M4PAA0", 1.;
		}
		else {
			return "M4PAB0", 1.;
		}
	}
	
}

