
class AiAkmBubble : AiBubble {
	states {
		spawn:
			AKMP A -1;
			Stop;
		empty:
			AKMP B -1;
			Stop;
	}
}

class AiAk12Bubble : AiBubble {
	states {
		spawn:
			AK2P A -1;
			Stop;
		empty:
			AK2P B -1;
			Stop;
	}
}

class AiRPK16Bubble : AiBubble {
	states {
		spawn:
			RK6P A -1;
			Stop;
		empty:
			RK6P B -1;
			Stop;
	}
}

class AiAksBubble : AiBubble {
	states {
		spawn:
			AK7P A -1;
			Stop;
		empty:
			AK7P B -1;
			Stop;
	}
}

class AiSaiBubble : AiBubble {
	states {
		spawn:
			SAIP A -1;
			Stop;
		empty:
			SAIP B -1;
			Stop;
	}
}

class ru_vsr_base : ai_with_bubble_base {
	default {
		species "ru_vsr_base";
	}
	states {
		spawn:
			VSRA A 0 NoDelay {
				if (!gunInst) {
					gunInst = getGun();
				}
			}
			Goto Super::Spawn2;
	}
}

class ru_emr_base : ai_with_bubble_base {
	states {
		spawn:
			EMRA A 0 NoDelay {
				if (!gunInst) {
					gunInst = getGun();
				}
				translation = 0;
			}
			Goto Super::Spawn2;
	}
}

class ru_vsr_akm : ru_vsr_base {
	default {
		HumanoidBase.hWeaponClass     "B_AKM";
		HumanoidBase.hBulletClass     "HDB_762sov";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "BAKM_762Mag";
		HumanoidBase.hSpentClass      "B762SovSpent";
		HumanoidBase.hFireSound       "weapons/akm/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("AiAkmBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class ru_vsr_aks : ru_vsr_base {
	default {
		HumanoidBase.hWeaponClass     "B_AKS74U";
		HumanoidBase.hBulletClass     "HDB_545";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "BAK_545Mag";
		HumanoidBase.hSpentClass      "B545Spent";
		HumanoidBase.hFireSound       "weapons/akm/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("AiAksBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class ru_akm : randomspawner {
	default {
		dropitem "ru_vsr_akm";
		dropitem "ru_emr_akm";
	}
}

class ru_aks : randomspawner {
	default {
		dropitem "ru_vsr_aks";
		dropitem "ru_emr_aks";
	}
}

class ru_emr_akm : ru_emr_base {
	default {
		HumanoidBase.hWeaponClass     "B_AKM";
		HumanoidBase.hBulletClass     "HDB_762sov";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "BAKM_762Mag";
		HumanoidBase.hSpentClass      "B762SovSpent";
		HumanoidBase.hFireSound       "weapons/akm/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("AiAkmBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class ru_emr_aks : ru_emr_base {
	default {
		HumanoidBase.hWeaponClass     "B_AKS74U";
		HumanoidBase.hBulletClass     "HDB_545";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "BAK_545Mag";
		HumanoidBase.hSpentClass      "B545Spent";
		HumanoidBase.hFireSound       "weapons/akm/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("AiAksBubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class ru_ak12 : ru_vsr_base {
	default {
		HumanoidBase.hWeaponClass     "B_AK2";
		HumanoidBase.hBulletClass     "HDB_545";
		HumanoidBase.hMaxMag          30;
		HumanoidBase.hMagazineClass   "BAK_545Mag";
		HumanoidBase.hSpentClass      "B545Spent";
		HumanoidBase.hFireSound       "weapons/akm/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("AiAk12Bubble"));
		hoverGun.host = self;
		return hoverGun;
	}
}

class ru_rpk16 : ru_vsr_base {
	default {
		HumanoidBase.hWeaponClass     "B_RPK16";
		HumanoidBase.hBulletClass     "HDB_545";
		HumanoidBase.hMaxMag          90;
		HumanoidBase.hMagazineClass   "RPKMag";
		HumanoidBase.hSpentClass      "B545Spent";
		HumanoidBase.hFireSound       "weapons/akm/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("AiRPK16Bubble"));
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


class ru_saiga : ru_vsr_base {
	default {
		HumanoidBase.hWeaponClass     "B_SAIGA";
		HumanoidBase.hBulletClass     "HDB_00";
		HumanoidBase.hMaxMag          20;
		HumanoidBase.hMagazineClass   "BFauxDrum";
		HumanoidBase.hSpentClass      "HDSpentShell";
		HumanoidBase.hFireSound       "weapons/fauxtech/fire";
	}
	override AiBubble getGun() {
		AiBubble hoverGun = AiBubble(Actor.Spawn("AiSaiBubble"));
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