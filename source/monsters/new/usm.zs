
class FlipXBubble : AiBubble {
	override void PostBeginPlay() {
		scale.x *= -1;
	}	
}

class ArmouredFlipXBubble : ArmouredAiBubble {
	override void PostBeginPlay() {
		scale.x *= -1;
	}	
}

class M4CarryBubble : FlipXBubble {
	states {
		spawn:
			M4PA I -1;
			Stop;
		empty:
			M4PA J -1;
			Stop;
	}
}

class ArmouredM4CarryBubble : ArmouredFlipXBubble {
	states {
		spawn:
			M4PA I -1;
			Stop;
		empty:
			M4PA J -1;
			Stop;
	}
}

class SCR16CarryBubble : AiBubble {
	states {
		spawn:
			SC6P A -1;
			Stop;
		empty:
			SC6P B -1;
			Stop;
	}
}

class ArmouredSCR16CarryBubble : ArmouredAiBubble {
	states {
		spawn:
			SC6P A -1;
			Stop;
		empty:
			SC6P B -1;
			Stop;
	}
}

class SCR17CarryBubble : AiBubble {
	states {
		spawn:
			SC7P A -1;
			Stop;
		empty:
			SC7P B -1;
			Stop;
	}
}

class ArmouredSCR17CarryBubble : ArmouredAiBubble {
	states {
		spawn:
			SC7P A -1;
			Stop;
		empty:
			SC7P B -1;
			Stop;
	}
}

class XM5CarryBubble : AiBubble {
	states {
		spawn:
			MCXP A -1;
			Stop;
		empty:
			MCXP B -1;
			Stop;
	}
}

class ArmouredXM5CarryBubble : ArmouredAiBubble {
	states {
		spawn:
			MCXP A -1;
			Stop;
		empty:
			MCXP B -1;
			Stop;
	}
}

class UMP9CarryBubble : FlipXBubble {
	states {
		spawn:
			UMPP A -1;
			Stop;
		empty:
			UMPP B -1;
			Stop;
	}
}

class ArmouredUMP9CarryBubble : ArmouredFlipXBubble {
	states {
		spawn:
			UMPP A -1;
			Stop;
		empty:
			UMPP B -1;
			Stop;
	}
}

class UMP45CarryBubble : FlipXBubble {
	states {
		spawn:
			UM4P A -1;
			Stop;
		empty:
			UM4P B -1;
			Stop;
	}
}

class ArmouredUMP45CarryBubble : ArmouredFlipXBubble {
	states {
		spawn:
			UM4P A -1;
			Stop;
		empty:
			UM4P B -1;
			Stop;
	}
}

class M4M203CarryBubble : FlipXBubble {
	states {
		spawn:
			M4PC I -1;
			Stop;
		empty:
			M4PC J -1;
			Stop;
	}
}

class Mp5Bubble : FlipXBubble {
	states {
		spawn:
			MP5U A -1;
			Stop;
		empty:
			MP5U B -1;
			Stop;
	}
}
class UziBubble : FlipXBubble {
	states {
		spawn:
			UZIP A -1;
			Stop;
		empty:
			UZIP B -1;
			Stop;
	}
}

class M107Bubble : FlipXBubble {
	default {
		AiBubble.fora 27;
		AiBubble.forc 28;
	}
	states {
		spawn:
			M17P E -1;
			Stop;
		empty:
			M17P F -1;
			Stop;
	}
}

class M14AcogBubble : FlipXBubble {
	default {
		AiBubble.fora 25;
		AiBubble.forb 15;
		AiBubble.forc 18;	
	}
	states {
		spawn:
			M14U Q -1;
			Stop;
		empty:
			M14U R -1;
			Stop;
	}
}

class FostechBubble : FlipXBubble {
	default {
		AiBubble.forc 22;
	}
	states {
		spawn:
			FOSU I -1;
			Stop;
		empty:
			FOSU J -1;
			Stop;
	}
}

class ArmouredFostechBubble : ArmouredFlipXBubble {
	default {
		ArmouredAiBubble.forc 22;
	}
	states {
		spawn:
			FOSU I -1;
			Stop;
		empty:
			FOSU J -1;
			Stop;
	}
}

class M249Bubble : FlipXBubble {
	states {
		spawn:
			M24P A -1;
			Stop;
		empty:
			M24P B -1;
			Stop;
	}
}

class ArmouredM249Bubble : ArmouredFlipXBubble {
	states {
		spawn:
			M24P A -1;
			Stop;
		empty:
			M24P B -1;
			Stop;
	}
}

// Usmc

class usmc_base : ai_with_bubble_base {
	default {
		species "usmc_base";
	}
	states {
		spawn:
			UMCA A 0 NoDelay {
				if (!gunInst) {
					gunInst = getGun();
				}
			}
			Goto Super::Spawn2;
	}
}

class arm_usmc_base : armoured_ai_with_bubble_base {
	default {
		species "usmc_base";
	}
	states {
		spawn:
			AMCA A 0 NoDelay {
				if (!gunInst) {
					gunInst = getGun();
				}
			}
			Goto Super::Spawn2;
	}
}

class usmc_mp5 : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "B_MP5";
		HumanoidBase.hBulletClass     "HDB_9";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "B9mm_MP5K_MAG";
		HumanoidBase.hSpentClass      "HDSpent9mm";
		HumanoidBase.hFireSound       "weapons/mp5/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("Mp5Bubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_ump9 : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "B_UMP9";
		HumanoidBase.hBulletClass     "HDB_9";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "B9mm_MP5K_MAG";
		HumanoidBase.hSpentClass      "HDSpent9mm";
		HumanoidBase.hFireSound       "weapons/mp5/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("UMP9CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_ump45 : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "B_UMP45";
		HumanoidBase.hBulletClass     "HDB_45ACP";
		HumanoidBase.hMaxMag          25;
		HumanoidBase.hMagazineClass   "BUMP45Mag";
		HumanoidBase.hSpentClass      "HDSpent45ACP";
		HumanoidBase.hFireSound       "weapons/mp5/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("UMP45CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_m4c : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "B_M4";
		HumanoidBase.hBulletClass     "HDB_556";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "B556Mag";
		HumanoidBase.hSpentClass      "B556Spent";
		HumanoidBase.hFireSound       "weapons/m4/fire";
	}
	override void initializeAttachments() {
		sightId = B_M4_CARRYHANDLE_ID;
		sightClass = mgr.getScopeClass(B_M4_CARRYHANDLE_ID);
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("M4CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_scar16c : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "B_SCAR16";
		HumanoidBase.hBulletClass     "HDB_556";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "B556Mag";
		HumanoidBase.hSpentClass      "B556Spent";
		HumanoidBase.hFireSound       "weapons/m4/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("SCR16CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_scar17c : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "B_SCAR17";
		HumanoidBase.hBulletClass     "HDB_762x51";
		HumanoidBase.hMaxMag          20;
		HumanoidBase.hMagazineClass   "b762_m14_mag";
		HumanoidBase.hSpentClass      "B762x51Spent";
		HumanoidBase.hFireSound       "weapons/m14/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("SCR17CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_xm5 : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "B_XM5";
		HumanoidBase.hBulletClass     "HDB_277";
		HumanoidBase.hMaxMag          20;
		HumanoidBase.hMagazineClass   "b277_mag";
		HumanoidBase.hSpentClass      "B277Spent";
		HumanoidBase.hFireSound       "weapons/m14/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("XM5CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_m4cm203 : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "B_M4_M203";
		HumanoidBase.hBulletClass     "HDB_556";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "B556Mag";
		HumanoidBase.hSpentClass      "B556Spent";
		HumanoidBase.hFireSound       "weapons/m4/fire";
	}
	override void initializeAttachments() {
		sightId = B_M4_CARRYHANDLE_ID;
		sightClass = mgr.getScopeClass(B_M4_CARRYHANDLE_ID);
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("M4M203CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_m14 : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "b_m14";
		HumanoidBase.hBulletClass     "HDB_762x51";
		HumanoidBase.hMaxMag          20;
		HumanoidBase.hMagazineClass   "b762_m14_mag";
		HumanoidBase.hSpentClass      "B762x51Spent";
		HumanoidBase.hFireSound       "weapons/m14/fire";
	}
	override void initializeAttachments() {
		sightId = B_ACOG_RED_ID;
		sightClass = mgr.getScopeClass(B_ACOG_RED_ID);
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("M14AcogBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class usmc_m249 : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "b_m249";
		HumanoidBase.hBulletClass     "HDB_556";
		HumanoidBase.hMaxMag          200;
		HumanoidBase.hMagazineClass   "BM249Mag";
		HumanoidBase.hSpentClass      "B556Spent";
		HumanoidBase.hFireSound       "weapons/m4/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("M249Bubble"));
		hoverGun.host = self;
		return hoverGun;
	}
	states {
		See:
			#### A 0 { 
				fireMode = 3;
			}
			#### A 0 A_Jump(256, "See2");

		Shoot:
			#### F 0 {
				shooting = true;
			}
			#### F 0 A_JumpIf(jammed, "jammed");
			#### F 1 Bright Light("SHOT") {
				if (mag < 1) {
					return ResolveState("OhForFucksSake");
				}
			
				pitch += (frandom(0, spread) - frandom(0, spread)) * (random(0, 1) ? 1 : -1);
				angle += frandom(0, spread) - frandom(0, spread);
				if (invoker.silenced && invoker.silClass) {
					A_StartSound(invoker.hSilentFireSound);
				}
				else {
					A_StartSound(invoker.hFireSound);
				}

				HDBulletActor.FireBullet(self, invoker.hBulletClass, speedfactor:1.0);
				A_SpawnItemEx(invoker.hSpentClass,
					cos(pitch) * 10,
					0,
					height - 8 - sin(pitch) * 10,
					vel.x,
					vel.y,
					vel.z,
					0,
					SXF_ABSOLUTEMOMENTUM | SXF_NOCHECKPOSITION | SXF_TRANSFERPITCH);
				mag--;
				return ResolveState(NULL);
			}
			#### E 2;
			#### E 0 {
				if (mag > 1) {
					if (fireMode > 30) {
						return ResolveState("PostShot");
					}
					fireMode++;
					spread++;
					return ResolveState("Shoot");
				}
				return ResolveState(NULL);
			}
			#### A 0 A_Jump(120, "Shoot");
			#### A 0 A_Jump(256, "PostShot");
	}
}

class usmc_fostech : usmc_base {
	default {
		HumanoidBase.hWeaponClass     "b_FauxtechOrigin";
		HumanoidBase.hBulletClass     "HDB_00";
		HumanoidBase.hMaxMag          20;
		HumanoidBase.hMagazineClass   "BFauxDrum";
		HumanoidBase.hSpentClass      "HDSpentShell";
		HumanoidBase.hFireSound       "weapons/fauxtech/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("FostechBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
	states {
		See:
			#### A 0 { 
				firemode = 0;
			}
			#### A 0 A_Jump(256, "See2");
		Shoot:
			#### F 0 A_JumpIf(jammed, "jammed");
			#### F 1 Bright Light("SHOT") {
				if (mag < 1) {
					return ResolveState("OhForFucksSake");
				}
			
				pitch += frandom(0, spread) - frandom(0, spread);
				angle += frandom(0, spread) - frandom(0, spread);
				A_StartSound(invoker.hFireSound);
				HDBulletActor.FireBullet(self, "HDB_wad");
				HDBulletActor.FireBullet(self, 
					invoker.hBulletClass, 
					spread: 6, 
					speedfactor: 1.0, 
					amount: 10);
				A_SpawnItemEx(invoker.hSpentClass,
					cos(pitch) * 10,
					0,
					height - 8 - sin(pitch) * 10,
					vel.x,
					vel.y,
					vel.z,
					0,
					SXF_ABSOLUTEMOMENTUM | SXF_NOCHECKPOSITION | SXF_TRANSFERPITCH);
				mag--;
				return ResolveState(NULL);
			}

			#### E 2 {
				spread++;
				return ResolveState("PostShot");
			}
			#### A 0 A_Jump(120, "Shoot");
			#### A 0 A_Jump(256, "PostShot");
	}
}

// op
class op_base : ai_with_bubble_base {
	default {
		translation "112:127=236:239";
	}
	states {
		spawn:
			MOSA A 0 NoDelay {
				if (!gunInst) {
					gunInst = getGun();
				}
				
			}
			Goto Super::Spawn2;
	}
}

class op_uzi : op_base {
	default {
		HumanoidBase.hWeaponClass     "B_Uzi";
		HumanoidBase.hBulletClass     "HDB_9";
		HumanoidBase.hMaxMag          32;
		HumanoidBase.hMagazineClass   "UziMagazine";
		HumanoidBase.hSpentClass      "HDSpent9mm";
		HumanoidBase.hFireSound       "weapons/uzi/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("UziBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
	states {
		See:
			#### A 0 { 
				fireMode = 3;
			}
			#### A 0 A_Jump(256, "See2");

		Shoot:
			#### F 0 {
				shooting = true;
			}
			#### F 0 A_JumpIf(jammed, "jammed");
			#### F 1 Bright Light("SHOT") {
				if (mag < 1) {
					return ResolveState("OhForFucksSake");
				}
			
				pitch += (frandom(0, spread) - frandom(0, spread)) * (random(0, 1) ? 1 : -1);
				angle += frandom(0, spread) - frandom(0, spread);
				if (invoker.silenced && invoker.silClass) {
					A_StartSound(invoker.hSilentFireSound);
				}
				else {
					A_StartSound(invoker.hFireSound);
				}

				HDBulletActor.FireBullet(self, invoker.hBulletClass, speedfactor:1.0);
				A_SpawnItemEx(invoker.hSpentClass,
					cos(pitch) * 10,
					0,
					height - 8 - sin(pitch) * 10,
					vel.x,
					vel.y,
					vel.z,
					0,
					SXF_ABSOLUTEMOMENTUM | SXF_NOCHECKPOSITION | SXF_TRANSFERPITCH);
				mag--;
				return ResolveState(NULL);
			}

			#### E 1 {
				if (mag > 1) {
					if (fireMode > 9) {
						return ResolveState("PostShot");
					}
					fireMode++;
					spread++;
					return ResolveState("Shoot");
				}
				return ResolveState(NULL);
			}
			#### A 0 A_Jump(120, "Shoot");
			#### A 0 A_Jump(256, "PostShot");
	}
}

class op_m107 : op_base {
	default {
		HumanoidBase.hWeaponClass     "b_m107";
		HumanoidBase.hBulletClass     "HDB_BMG";
		HumanoidBase.hMaxMag          10;
		HumanoidBase.hMagazineClass   "M107Magazine";
		HumanoidBase.hSpentClass      "B50BMGSpent";
		HumanoidBase.hFireSound       "weapons/m107/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("M107Bubble"));
		hoverGun.host = self;
		return hoverGun;
	}
	states {
		See:
			#### A 0 { 
				fireMode = 0;
			}
			#### A 0 A_Jump(256, "See2");

		Shoot:
			#### F 0 {
				shooting = true;
			}
			#### E 35;
			#### F 0 A_JumpIf(jammed, "jammed");
			#### F 1 Bright Light("SHOT") {
				if (mag < 1) {
					return ResolveState("OhForFucksSake");
				}
			
				pitch += frandom(0, spread) - frandom(0, spread);
				angle += frandom(0, spread) - frandom(0, spread);
				if (invoker.silenced && invoker.silClass) {
					A_StartSound(invoker.hSilentFireSound);
				}
				else {
					A_StartSound(invoker.hFireSound);
				}
				HDBulletActor.FireBullet(self, invoker.hBulletClass, speedfactor:1.0);
				A_SpawnItemEx(invoker.hSpentClass,
					cos(pitch) * 10,
					0,
					height - 8 - sin(pitch) * 10,
					vel.x,
					vel.y,
					vel.z,
					0,
					SXF_ABSOLUTEMOMENTUM | SXF_NOCHECKPOSITION | SXF_TRANSFERPITCH);
				mag--;
				return ResolveState(NULL);
			}

			#### E 2 {
				if (!fireMode || fireMode == -1 || fireMode > 3 || mag < 1) {
					if (fireMode > 2) {
						fireMode = 2;
						return ResolveState("PostShot");
					}
					else if (fireMode >= 2) {
						fireMode++;
						return ResolveState("Shoot");
					}
					spread++;
				}
				return ResolveState(NULL);
			}
			#### A 0 A_Jump(120, "Shoot");
			#### A 0 A_Jump(256, "PostShot");
	}
}



// Armoured Enemy Section

class arm_usmc_xm5 : arm_usmc_base {
	default {
		ArmouredHumanoidBase.hWeaponClass     "B_XM5";
		ArmouredHumanoidBase.hBulletClass     "HDB_277";
		ArmouredHumanoidBase.hMaxMag          20;
		ArmouredHumanoidBase.hMagazineClass   "b277_mag";
		ArmouredHumanoidBase.hSpentClass      "B277Spent";
		ArmouredHumanoidBase.hFireSound       "weapons/m14/fire";
	}
	override ArmouredAiBubble getGun() {
		ArmouredAiBubble hoverGun = ArmouredAiBubble(Actor.Spawn("ArmouredXM5CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class arm_usmc_scar16c : arm_usmc_base {
	default {
		ArmouredHumanoidBase.hWeaponClass     "B_SCAR16";
		ArmouredHumanoidBase.hBulletClass     "HDB_556";
		ArmouredHumanoidBase.hMaxMag          30;
		ArmouredHumanoidBase.hMagazineClass   "B556Mag";
		ArmouredHumanoidBase.hSpentClass      "B556Spent";
		ArmouredHumanoidBase.hFireSound       "weapons/m4/fire";
	}
	override ArmouredAiBubble getGun() {
		ArmouredAiBubble hoverGun = ArmouredAiBubble(Actor.Spawn("ArmouredSCR16CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class arm_usmc_scar17c : arm_usmc_base {
	default {
		ArmouredHumanoidBase.hWeaponClass     "B_SCAR17";
		ArmouredHumanoidBase.hBulletClass     "HDB_762x51";
		ArmouredHumanoidBase.hMaxMag          20;
		ArmouredHumanoidBase.hMagazineClass   "b762_m14_mag";
		ArmouredHumanoidBase.hSpentClass      "B762x51Spent";
		ArmouredHumanoidBase.hFireSound       "weapons/m14/fire";
	}
	override ArmouredAiBubble getGun() {
		ArmouredAiBubble hoverGun = ArmouredAiBubble(Actor.Spawn("ArmouredSCR17CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class arm_usmc_ump9 : arm_usmc_base {
	default {
		ArmouredHumanoidBase.hWeaponClass     "B_UMP9";
		ArmouredHumanoidBase.hBulletClass     "HDB_9";
		ArmouredHumanoidBase.hMaxMag          30;
		ArmouredHumanoidBase.hMagazineClass   "B9mm_MP5K_MAG";
		ArmouredHumanoidBase.hSpentClass      "HDSpent9mm";
		ArmouredHumanoidBase.hFireSound       "weapons/mp5/fire";
	}
	override ArmouredAiBubble getGun() {
		ArmouredAiBubble hoverGun = ArmouredAiBubble(Actor.Spawn("ArmouredUMP9CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class arm_usmc_ump45 : arm_usmc_base {
	default {
		ArmouredHumanoidBase.hWeaponClass     "B_UMP45";
		ArmouredHumanoidBase.hBulletClass     "HDB_45ACP";
		ArmouredHumanoidBase.hMaxMag          25;
		ArmouredHumanoidBase.hMagazineClass   "BUMP45Mag";
		ArmouredHumanoidBase.hSpentClass      "HDSpent45ACP";
		ArmouredHumanoidBase.hFireSound       "weapons/mp5/fire";
	}
	override ArmouredAiBubble getGun() {
		ArmouredAiBubble hoverGun = ArmouredAiBubble(Actor.Spawn("ArmouredUMP45CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class arm_usmc_m4c : arm_usmc_base {
	default {
		ArmouredHumanoidBase.hWeaponClass     "B_M4";
		ArmouredHumanoidBase.hBulletClass     "HDB_556";
		ArmouredHumanoidBase.hMaxMag          30;
		ArmouredHumanoidBase.hMagazineClass   "B556Mag";
		ArmouredHumanoidBase.hSpentClass      "B556Spent";
		ArmouredHumanoidBase.hFireSound       "weapons/m4/fire";
	}
	override void initializeAttachments() {
		sightId = B_M4_CARRYHANDLE_ID;
		sightClass = mgr.getScopeClass(B_M4_CARRYHANDLE_ID);
	}
	override ArmouredAiBubble getGun() {
		ArmouredAiBubble hoverGun = ArmouredAiBubble(Actor.Spawn("ArmouredM4CarryBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class arm_usmc_m249 : arm_usmc_base {
	default {
		ArmouredHumanoidBase.hWeaponClass     "b_m249";
		ArmouredHumanoidBase.hBulletClass     "HDB_556";
		ArmouredHumanoidBase.hMaxMag          200;
		ArmouredHumanoidBase.hMagazineClass   "BM249Mag";
		ArmouredHumanoidBase.hSpentClass      "B556Spent";
		ArmouredHumanoidBase.hFireSound       "weapons/m4/fire";
	}
	override ArmouredAiBubble getGun() {
		ArmouredAiBubble hoverGun = ArmouredAiBubble(Actor.Spawn("ArmouredM249Bubble"));
		hoverGun.host = self;
		return hoverGun;
	}
	states {
		See:
			#### A 0 { 
				fireMode = 3;
			}
			#### A 0 A_Jump(256, "See2");

		Shoot:
			#### F 0 {
				shooting = true;
			}
			#### F 0 A_JumpIf(jammed, "jammed");
			#### F 1 Bright Light("SHOT") {
				if (mag < 1) {
					return ResolveState("OhForFucksSake");
				}
			
				pitch += (frandom(0, spread) - frandom(0, spread)) * (random(0, 1) ? 1 : -1);
				angle += frandom(0, spread) - frandom(0, spread);
				if (invoker.silenced && invoker.silClass) {
					A_StartSound(invoker.hSilentFireSound);
				}
				else {
					A_StartSound(invoker.hFireSound);
				}

				HDBulletActor.FireBullet(self, invoker.hBulletClass, speedfactor:1.0);
				A_SpawnItemEx(invoker.hSpentClass,
					cos(pitch) * 10,
					0,
					height - 8 - sin(pitch) * 10,
					vel.x,
					vel.y,
					vel.z,
					0,
					SXF_ABSOLUTEMOMENTUM | SXF_NOCHECKPOSITION | SXF_TRANSFERPITCH);
				mag--;
				return ResolveState(NULL);
			}
			#### E 2;
			#### E 0 {
				if (mag > 1) {
					if (fireMode > 30) {
						return ResolveState("PostShot");
					}
					fireMode++;
					spread++;
					return ResolveState("Shoot");
				}
				return ResolveState(NULL);
			}
			#### A 0 A_Jump(120, "Shoot");
			#### A 0 A_Jump(256, "PostShot");
	}
}

class arm_usmc_fostech : arm_usmc_base {
	default {
		ArmouredHumanoidBase.hWeaponClass     "b_FauxtechOrigin";
		ArmouredHumanoidBase.hBulletClass     "HDB_00";
		ArmouredHumanoidBase.hMaxMag          20;
		ArmouredHumanoidBase.hMagazineClass   "BFauxDrum";
		ArmouredHumanoidBase.hSpentClass      "HDSpentShell";
		ArmouredHumanoidBase.hFireSound       "weapons/fauxtech/fire";
	}
	override ArmouredAiBubble getGun() {
		ArmouredAiBubble hoverGun = ArmouredAiBubble(Actor.Spawn("ArmouredFostechBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
	states {
		See:
			#### A 0 { 
				firemode = 0;
			}
			#### A 0 A_Jump(256, "See2");
		Shoot:
			#### F 0 A_JumpIf(jammed, "jammed");
			#### F 1 Bright Light("SHOT") {
				if (mag < 1) {
					return ResolveState("OhForFucksSake");
				}
			
				pitch += frandom(0, spread) - frandom(0, spread);
				angle += frandom(0, spread) - frandom(0, spread);
				A_StartSound(invoker.hFireSound);
				HDBulletActor.FireBullet(self, "HDB_wad");
				HDBulletActor.FireBullet(self, 
					invoker.hBulletClass, 
					spread: 6, 
					speedfactor: 1.0, 
					amount: 10);
				A_SpawnItemEx(invoker.hSpentClass,
					cos(pitch) * 10,
					0,
					height - 8 - sin(pitch) * 10,
					vel.x,
					vel.y,
					vel.z,
					0,
					SXF_ABSOLUTEMOMENTUM | SXF_NOCHECKPOSITION | SXF_TRANSFERPITCH);
				mag--;
				return ResolveState(NULL);
			}

			#### E 2 {
				spread++;
				return ResolveState("PostShot");
			}
			#### A 0 A_Jump(120, "Shoot");
			#### A 0 A_Jump(256, "PostShot");
	}
}