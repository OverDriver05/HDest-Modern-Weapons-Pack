
class b_FNX : BasePistol {
	
	default {
		+hdweapon.fitsinbackpack
		weapon.selectionorder        20;
		weapon.slotnumber            2;
		weapon.slotpriority          1;
		inventory.pickupsound        "misc/w_pkup";
		inventory.pickupmessage      "You got the FNX45 Tactical.";
		scale                        0.7;
		weapon.bobrangex 0.1;
		weapon.bobrangey 0.6;
		obituary                     "%o was assaulted by %k.";
		tag                          "FNX45 Tactical";
		inventory.icon               "FNXPA0";
		BHDWeapon.BFlashSprite       "MPFLA0";
		BHDWeapon.BHeatDrain         12;
		BHDWeapon.BBulletClass       "HDB_45ACP";
		BHDWeapon.BAmmoClass         "HD45ACPAmmo";
		BHDWeapon.BMagazineClass     "FNXMagazine";
		BHDWeapon.BGunMass           6.2;
		BHDWeapon.BCookOff           30;
		BHDWeapon.BHeatLimit         255;
		BHDWeapon.BSpriteWithMag     "FNXPA0";
		BHDWeapon.BSpriteWithoutMag  "FNXPB0";
		BHDWeapon.BSpriteWithFrame    0;
		BHDWeapon.BSpriteWithoutFrame 1;
		BHDWeapon.BMagazineSprite    "FNXCA0";
		BHDWeapon.BWeaponBulk        c_glock_bulk;
		BHDWeapon.BMagazineBulk      c_FNX_mag_bulk;
		BHDWeapon.BBulletBulk        1;
		BHDWeapon.BMagazineCapacity  15;
		BHDWeapon.BarrelLength       10;
		BHDWeapon.BarrelWidth        1;
		BHDWeapon.BarrelDepth        3;

		BHDWeapon.BFireSound         "weapons/glock/fire";
		BHDWeapon.BSFireSound        "weapons/glock/silentfire";
		BHDWeapon.BChamberSound      "weapons/glock/chamber";
		BHDWeapon.BBoltBackwardSound  "weapons/glock/boltback";
		BHDWeapon.BBoltForwardSound "weapons/glock/boltforward";
		BHDWeapon.BClickSound        "weapons/glock/click";
		BHDWeapon.BLoadSound         "weapons/glock/clipinsert";
		BHDWeapon.BUnloadSound       "weapons/glock/clipeject";

		BHDWeapon.BROF               0;
		BHDWeapon.BBackSightImage    "alt_fnx";
		BHDWeapon.BBackOffsetX       0;
		BHDWeapon.BBackOffsetY       1;
		BHDWeapon.BFrontSightImage   "glckfr";
		BHDWeapon.BFrontOffsetX      0;
		BHDWeapon.BFrontOffsetY      1;
		BHDWeapon.BSilentOffsetX     0;
		BHDWeapon.BSilentOffsetY     0;
		BHDWeapon.bBarrelMount       "9MM_GLOCK";
		BHDWeapon.bMiscMount         "NOT_ANYMORE";
		BHDWeapon.bScopeMount        "PIS_RAILS";
		BHDWeapon.EjectShellClass    "HDSpent45ACP";
		hdweapon.refid               B_FNX_REFID;
		BHDWeapon.bIronThreshold 	5;

		BHDWeapon.BAltFrontSightImage "alt_glf";
		BHDWeapon.BAltBackSightImage "alt_fnx";

		BHDWeapon.BLayerSight  104;
		BHDWeapon.bLayerRHand  105;
		BHDWeapon.bLayerGunBack -99;

		BHDWeapon.BRecoilXLow -1.2;
	    BHDWeapon.BRecoilXHigh 1.2;
		BHDWeapon.BRecoilYLow  1.1;
		BHDWeapon.BRecoilYHigh 2.1;	
		BHDWeapon.boffsetamt 20;
	}

	states {

        Firemode:
            goto nope;

		Spawn:
			FNXP A 0 GetMagStatePistol();
			Goto Super::Spawn; 
		
        SpawnMag:
			FNXP A -1;
			Goto HDWeapon::Spawn;

		SpawnNoMag:
			FNXP B -1;
			Goto HDWeapon::Spawn;

		LayerGun:
			TNT1 A 0 {
				if (invoker.weaponStatus[I_FLAGS] & F_CHAMBER) {
					return ResolveState(NULL);
				}
				return ResolveState("NoMagOverlay");
			}
			FNXG F 1;
			Loop;

		NoMagOverlay:
			FNXG G 1;
			Loop;

		LayerGunBack:
			TNT1 A 1;
			Loop;

		NoHandsBack:
			Stop;

		LayerGunFire:
			FNXG G 2;
			Goto LayerGun;

		LayerGunBolt:
			FNXG I 3;
			Goto LayerGun;

		LayerReloadHands:
			TNT1 A 0;
			Goto Super::LayerReloadHands;
			
		LayerDefaultSight:
			TNT1 A 1;
			Loop;

		UnloadMag:
			TNT1 A 0 {
				//A_Overlay(invoker.bLayerGun, "HandMagAnim");
			}
			Goto Super::UnloadMag;

		HandMagAnim:
			FNXG GH 2;
			Goto HandMagWait;

		HandMagWait:
			FNXG I 1;
			Loop;

		GunDummy:
			GLKU A -1;
			GLKU B -1;
			GLKU C -1;
			GLKU D -1;
			GLKU E -1;
			GLKU F -1;
			GLKU G -1;
			GLKU H -1;
			Stop;

		FlashDummy:
			GLFL A -1;
			GLFL B -1;
			GLFL C -1;
			GLFL D -1;
			Stop;


	}

	override string, double GetPickupSprite() {
		if(magazineGetAmmo() > -1) {
			return "FNXPA0", 1.;
		}
		else {
			return "FNXPB0", 1.;
		}
	}
}
