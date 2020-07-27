
class b_FauxtechOrigin : BaseShotgun {

	default {
		+hdweapon.fitsinbackpack
		weapon.selectionorder        20;
		weapon.slotnumber            3;
		weapon.slotpriority          1;
		inventory.pickupsound        "misc/w_pkup";
		inventory.pickupmessage      "You got the Fauxtech Origin 12.";
		scale                        0.7;
		weapon.bobrangex             0.22;
		weapon.bobrangey             0.9;
		obituary                     "%o was assaulted by %k.";
		tag                          "Fauxtech Origin 12";
		inventory.icon               "M4RPA0";
		BHDWeapon.BHeatDrain         12;
		BHDWeapon.BBulletClass       "HDB_00";
		BHDWeapon.BAmmoClass         "HDShellAmmo";
		BHDWeapon.BMagazineClass     "BFauxDrum";
		BHDWeapon.BGunMass           6.2;
		BHDWeapon.BCookOff           900;
		BHDWeapon.BHeatLimit         255;
		BHDWeapon.BSpriteWithMag     "FOSPA0";
		BHDWeapon.BSpriteWithoutMag  "FOSPB0";
		BHDWeapon.BSpriteWithFrame    0;
		BHDWeapon.BSpriteWithoutFrame 1;
		BHDWeapon.BMagazineSprite    "FOSCA0";
		BHDWeapon.BWeaponBulk        100;
		BHDWeapon.BMagazineBulk      30;
		BHDWeapon.BBulletBulk        1;
		BHDWeapon.BMagazineCapacity  20;
		BHDWeapon.BarrelLength       25;
		BHDWeapon.BarrelWidth        1;
		BHDWeapon.BarrelDepth        3;

		BHDWeapon.BFireSound         "weapons/fauxtech/fire";
		BHDWeapon.BSFireSound        "weapons/fauxtech/silentfire";
		BHDWeapon.BChamberSound      "weapons/fauxtech/chamber";
		BHDWeapon.BBoltForwardSound  "weapons/fauxtech/boltback";
		BHDWeapon.BBoltBackwardSound "weapons/fauxtech/boltforward";
		BHDWeapon.BClickSound        "weapons/fauxtech/click";
		BHDWeapon.BLoadSound         "weapons/fauxtech/clipinsert";
		BHDWeapon.BUnloadSound       "weapons/fauxtech/clipeject";

		BHDWeapon.BROF               2;
		//BHDWeapon.BBackSightImage    "fauxbk";
		BHDWeapon.BBackOffsetX       -0.75;
		BHDWeapon.BBackOffsetY       47;
		BHDWeapon.BFrontSightImage   "fauxft";
		BHDWeapon.BFrontOffsetX      -0.75;
		BHDWeapon.BFrontOffsetY      46;
		BHDWeapon.BSilentOffsetX     0;
		BHDWeapon.BSilentOffsetY     0;
		//BHDWeapon.bBarrelMount       "556_NATO_BARREL";
		BHDWeapon.bScopeMount        "NATO_RAILS";
		BHDWeapon.bMiscMount         "NATO_RAILS";
		BHDWeapon.EjectShellClass    "HDSpentShell";
		hdweapon.refid               B_FAUX_REFID;

		BHDWeapon.BAltFrontSightImage "altfaf";
		BHDWeapon.BAltBackSightImage "";

		BHDWeapon.BLayerSight  106;
		BHDWeapon.bLayerRHand  105;
		BHDWeapon.bLayerGunBack -99;
	}

	states {
		Spawn:
			FOSU A 0 GetMagState();
			Goto Super::Spawn;

		FireMode:
			Goto Nope;

		SpawnMag:
			TNT1 A 0 {
				if (invoker.scopeClass) {
					if (invoker.scopeClass is "BaseAcog" || invoker.scopeClass is "BaseFullDotSight") {
						if (invoker.barrelClass && invoker.miscClass) {
							return ResolveState("HighMiscBarrel");
						}
						else if (invoker.barrelClass) {
							return ResolveState("HighBarrel");
						}
						else if (invoker.miscClass) {
							return ResolveState("HighMisc");
						}
						return ResolveState("High");
					}
					else {
						if (invoker.barrelClass && invoker.miscClass) {
							return ResolveState("LowMiscBarrel");
						}
						else if (invoker.barrelClass) {
							return ResolveState("LowBarrel");
						}
						else if (invoker.miscClass) {
							return ResolveState("LowMisc");
						}
						return ResolveState("Low");
					}
				}
				else {
					if (invoker.barrelClass && invoker.miscClass) {
						return ResolveState("NoneMiscBarrel");
					}
					else if (invoker.barrelClass) {
						return ResolveState("NoneBarrel");
					}
					else if (invoker.miscClass) {
						return ResolveState("NoneMisc");
					}
					return ResolveState(NULL);
				}
			}
			FOSU A -1;
			Goto HDWeapon::Spawn;


		HighMiscBarrel:
			FOSU W -1;
			Goto HDWeapon::Spawn;

		HighBarrel:
			FOSU U -1;
			Goto HDWeapon::Spawn;

		HighMisc:
			FOSU S -1;
			Goto HDWeapon::Spawn;

		High:
			FOSU Q -1;
			Goto HDWeapon::Spawn;

		LowMiscBarrel:
			FOSU O -1;
			Goto HDWeapon::Spawn;

		LowBarrel:
			FOSU M -1;
			Goto HDWeapon::Spawn;

		LowMisc:
			FOSU K -1;
			Goto HDWeapon::Spawn;

		Low:
			FOSU I -1;
			Goto HDWeapon::Spawn;

		NoneMiscBarrel:
			FOSU G -1;
			Goto HDWeapon::Spawn;

		NoneBarrel:
			FOSU E -1;
			Goto HDWeapon::Spawn;

		NoneMisc:
			FOSU C -1;
			Goto HDWeapon::Spawn;




		SpawnNoMag:
			TNT1 A 0 {
				if (invoker.scopeClass) {
					if (invoker.scopeClass is "BaseAcog" || invoker.scopeClass is "BaseFullDotSight") {
						if (invoker.barrelClass && invoker.miscClass) {
							return ResolveState("HighMiscBarrelEmpty");
						}
						else if (invoker.barrelClass) {
							return ResolveState("HighBarrelEmpty");
						}
						else if (invoker.miscClass) {
							return ResolveState("HighMiscEmpty");
						}
						return ResolveState("HighEmpty");
					}
					else {
						if (invoker.barrelClass && invoker.miscClass) {
							return ResolveState("LowMiscBarrelEmpty");
						}
						else if (invoker.barrelClass) {
							return ResolveState("LowBarrelEmpty");
						}
						else if (invoker.miscClass) {
							return ResolveState("LowMiscEmpty");
						}
						return ResolveState("LowEmpty");
					}
				}
				else {
					if (invoker.barrelClass && invoker.miscClass) {
						return ResolveState("NoneMiscBarrelEmpty");
					}
					else if (invoker.barrelClass) {
						return ResolveState("NoneBarrelEmpty");
					}
					else if (invoker.miscClass) {
						return ResolveState("NoneMiscEmpty");
					}
					return ResolveState(NULL);
				}
			}
			FOSU B -1;
			Goto HDWeapon::Spawn;


		HighMiscBarrelEmpty:
			FOSU X -1;
			Goto HDWeapon::Spawn;

		HighBarrelEmpty:
			FOSU V -1;
			Goto HDWeapon::Spawn;

		HighMiscEmpty:
			FOSU T -1;
			Goto HDWeapon::Spawn;

		HighEmpty:
			FOSU R -1;
			Goto HDWeapon::Spawn;

		LowMiscBarrelEmpty:
			FOSU P -1;
			Goto HDWeapon::Spawn;

		LowBarrelEmpty:
			FOSU N -1;
			Goto HDWeapon::Spawn;

		LowMiscEmpty:
			FOSU L -1;
			Goto HDWeapon::Spawn;

		LowEmpty:
			FOSU J -1;
			Goto HDWeapon::Spawn;

		NoneMiscBarrelEmpty:
			FOSU H -1;
			Goto HDWeapon::Spawn;

		NoneBarrelEmpty:
			FOSU F -1;
			Goto HDWeapon::Spawn;

		NoneMiscEmpty:
			FOSU D -1;
			Goto HDWeapon::Spawn;






			
		LayerGun:
			TNT1 A 0 {
				if (invoker.weaponStatus[I_MAG] == -1) {
					return ResolveState("NoMagOverlay");
				}
				return ResolveState(NULL);
			}
			FOSG A 1;
			Loop;

		LayerGunBack:
			TNT1 A 1;
			Loop;

		NoHandsBack:
			Stop;

		LayerGunFire:
			TNT1 A 0 {
				if (invoker.weaponStatus[I_MAG] == -1) {
					return ResolveState("NoMagFire");
				}
				return ResolveState(NULL);
			}
			FOSG B 1;
			Goto LayerGun;

		LayerGunBolt:
			FOSG E 3;
			Goto LayerGun;

		LayerReloadHands:
			FOSH A 0;
			Goto Super::LayerReloadHands;
			
		LayerDefaultSight:
			TNT1 A 1;
			Loop;

		UnloadMag:
			TNT1 A 0 {
				A_Overlay(invoker.BLayerGun, "UnloadMagOverlay");
			}
			Goto Super::UnloadMag;

		UnloadMagOverlay:
			TNT1 A 0 {
				if (invoker.weaponStatus[I_MAG] == -1) {
					return ResolveState("NoMagOverlay");
				}
				return ResolveState(NULL);
			}
			FOSG C 3;
			FOSG D 3;
			FOSG E 3;
			Goto NoMagOverlay;

		NoMagFire:
			FOSG H 1;
			Goto LayerGun;

		NoMagOverlay:
			FOSG F 1;
			Loop;

	}


	override string, double GetPickupSprite() {
		if(magazineHasAmmo()) {
			if (scopeClass) {
				if (scopeClass is "BaseAcog" || scopeClass is "BaseFullDotSight") {
					if (barrelClass && miscClass) {
						return "FOSUW0", 1.;
					}
					else if (barrelClass) {
						return "FOSUU0", 1.;
					}
					else if (miscClass) {
						return "FOSUS0", 1.;
					}
					return "FOSUQ0", 1.;
				}
				else {
					if (barrelClass && miscClass) {
						return "FOSUO0", 1.;
					}
					else if (barrelClass) {
						return "FOSUM0", 1.;
					}
					else if (miscClass) {
						return "FOSUK0", 1.;
					}
					return "FOSUI0", 1.;
				}
			}
			else {
				if (barrelClass && miscClass) {
					return "FOSUG0", 1.;
				}
				else if (barrelClass) {
					return "FOSUE0", 1.;
				}
				else if (miscClass) {
					return "FOSUC0", 1.;
				}
				return "FOSUA0", 1.;
			}
		}
		else {
			if (scopeClass) {
				if (scopeClass is "BaseAcog" || scopeClass is "BaseFullDotSight") {
					if (barrelClass && miscClass) {
						return "FOSUX0", 1.;
					}
					else if (barrelClass) {
						return "FOSUV0", 1.;
					}
					else if (miscClass) {
						return "FOSUT0", 1.;
					}
					return "FOSUR0", 1.;
				}
				else {
					if (barrelClass && miscClass) {
						return "FOSUP0", 1.;
					}
					else if (barrelClass) {
						return "FOSUN0", 1.;
					}
					else if (miscClass) {
						return "FOSUL0", 1.;
					}
					return "FOSUJ0", 1.;
				}
			}
			else {
				if (barrelClass && miscClass) {
					return "FOSUH0", 1.;
				}
				else if (barrelClass) {
					return "FOSUF0", 1.;
				}
				else if (miscClass) {
					return "FOSUD0", 1.;
				}
				return "FOSUB0", 1.;
			}
		}


	}


}

class FauxTechAcogOffset : ScopeOffset {
	default {
		Offset.WeaponClass "b_FauxtechOrigin";
		Offset.WeaponOverlay "B_Acog_red";
		Offset.OffX 0;
		offset.OffY 15;
	}
}

class FauxTechLightOffset : MiscOffset {
	default {
		Offset.WeaponClass "b_FauxtechOrigin";
		Offset.WeaponOverlay "B_M16_Flashlight";
		Offset.OffX -2;
	}
}