


class B556Mag : HDMagAmmo{
	default{
		hdmagammo.maxperunit 30;
		hdmagammo.roundtype "B556Ammo";
		hdmagammo.roundbulk c_556_load_bulk;
		hdmagammo.magbulk c_m4_mag_bulk;
		hdpickup.refid B_556_MAG_REFID;
		tag "30 round 5.56x45mm magazine";
		inventory.pickupmessage "Picked up a 5.56x45mm NATO STANAG magazine.";
		Inventory.Icon "M4RCA0";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		return (thismagamt > 0) ? "M4RCA0" : "M4RCB0", "BB56A7A3", "B556Ammo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_M4");
		itemsthatusethis.push("B_M4_M203");
        itemsthatusethis.push("B_AK19");
	}

	states{
		spawn:
			M4RC A -1;
			stop;
		spawnempty:
			M4RC B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}

class B556MagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"B556Mag",0);
		destroy();
	}
}

class B556MagEmpty2 : IdleDummy {
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"B556Mag",0);
		destroy();
	}
}

class BM249Mag : HDMagAmmo {
	default{
		hdmagammo.maxperunit 200;
		hdmagammo.roundtype "B556Ammo";
		hdmagammo.roundbulk c_556_load_bulk;
		hdmagammo.magbulk c_m249_pouch_bulk;
		hdpickup.refid B_MF249_MAG_REFID;
		tag "5.56x45mm 200 round pouch";
		inventory.icon "M24CA0";
		inventory.pickupmessage "Picked up a 5.56x45mm 200 Round NATO STANAG magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "M24CA0" : "M24CB0", "BB56A7A3", "B556Ammo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_M249");
	}

	states{
		spawn:
			M24C A -1;
			stop;
		spawnempty:
			M24C B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}

class BM249MagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"BM249Mag",0);
		destroy();
	}
}











class BM240Mag : HDMagAmmo {
	default{
		hdmagammo.maxperunit 100;
		hdmagammo.roundtype "B762x51Ammo";
		hdmagammo.roundbulk c_762_load_bulk;
		hdmagammo.magbulk c_m240_pouch_bulk;
		hdpickup.refid B_MF240_MAG_REFID;
		tag "7.62x51mm 100 round pouch";
		inventory.icon "M42CA0";
		inventory.pickupmessage "Picked up a 7.62x51mm 100 Round NATO STANAG magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "M42CA0" : "M42CB0", "BF76A3A7", "B762x51Ammo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_M240");
	}

	states{
		spawn:
			M42C A -1;
			stop;
		spawnempty:
			M42C B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}

class BM240MagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"BM240Mag",0);
		destroy();
	}
}


class B9mm_MP5K_MAG : HDMagAmmo {
	default{
		hdmagammo.maxperunit 30;
		hdmagammo.roundtype "HDPistolAmmo";
		hdmagammo.roundbulk c_9mm_load_bulk;
		hdmagammo.magbulk c_mp5_mag_bulk;
		hdpickup.refid B_MP5_MAG_REFID;
		tag "30 round 9mm Magazine";
		inventory.icon "MP5CA0";
		inventory.pickupmessage "Picked up a 9mm magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "MP5CA0" : "MP5CB0", "PBRSA0", "HDPistolAmmo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_MP5");
		itemsthatusethis.push("B_MP5_M203");
	}

	states{
		spawn:
			MP5C A -1;
			stop;
		spawnempty:
			MP5C B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}


class BMp5MagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"B9mm_MP5K_MAG",0);
		destroy();
	}
}

class BMp5MagEmpty2:IdleDummy {
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"B9mm_MP5K_MAG",0);
		destroy();
	}
}

class BFauxDrum : HDMagAmmo {
	default {
		hdmagammo.maxperunit 20;
		hdmagammo.roundtype "HDShellAmmo";
		hdmagammo.roundbulk c_shell_load_bulk;
		hdmagammo.magbulk c_faux_drum_bulk;
		hdpickup.refid B_FAUX_DRUM_REFID;
		tag "20 round 12 Gauge Drum";
		inventory.icon "FOSCA0";
		inventory.pickupmessage "Picked up a 20 round 12-gauge shell drum.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "FOSCA0" : "FOSCB0", "SHL1A0", "HDShellAmmo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("b_FauxtechOrigin");
	}

	states{
		spawn:
			FOSC A -1;
			stop;
		spawnempty:
			FOSC B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}

}

class BFauxDrumEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"BFauxDrum",0);
		destroy();
	}
}



class b762_m14_mag : HDMagAmmo {
	default {
		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "B762x51Ammo";
		HDMagAmmo.RoundBulk c_762_load_bulk;
		HDMagAmmo.MagBulk c_m14_mag_bulk;
		tag "20 round 7.62x51mm magazine";
		hdpickup.refid B_M14_MAG_REFID;
		Inventory.Icon "M14CA0";
		inventory.pickupmessage "Picked up a 7.62x51mm NATO magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "M14CA0" : "M14CB0", "BF76A3A7", "B762x51Ammo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("b_m14");
	}

	states{
		spawn:
			M14C A -1;
			stop;
		spawnempty:
			M14C B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}

class B762MagEmpty2 : IdleDummy {
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"b762_m14_mag",0);
		destroy();
	}
}


class B762MagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"b762_m14_mag",0);
		destroy();
	}
}


class GlockMagazine : HDMagAmmo {
	default{
		hdmagammo.maxperunit 17;
		hdmagammo.roundtype "HDPistolAmmo";
		hdmagammo.roundbulk c_van_9mm_bulk;
		hdmagammo.magbulk c_glock_mag_bulk;
		hdpickup.refid B_GLOCK_MAG_REFID;
		tag "17 round 9mm magazine";
		inventory.icon "GLKCA0";
		inventory.pickupmessage "Picked up a 9mm pistol magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "GLKCA0" : "GLKCB0", "PBRSA0", "HDPistolAmmo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("b_Glock");
	}

	states{
		spawn:
			GLKC A -1;
			stop;
		spawnempty:
			GLKC B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}

class BGlockMagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"GlockMagazine",0);
		destroy();
	}
}

class BGlockMagEmpty2 : IdleDummy {
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"GlockMagazine",0);
		destroy();
	}
}


class M107Magazine : HDMagAmmo {
	default{
		hdmagammo.maxperunit 10;
		hdmagammo.roundtype "HD50OMGAmmo";
		hdmagammo.roundbulk c_van_9mm_bulk;
		hdmagammo.magbulk c_m107_mag_bulk;
		hdpickup.refid B_M107_MAG_REFID;
		tag "10 round .50 BMG magazine";
		inventory.icon "M17MA0";
		inventory.pickupmessage "Picked up a .50 BMG magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "M17MA0" : "M17MB0", "BG50A7A3", "HD50OMGAmmo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("b_m107");
	}

	states{
		spawn:
			M17M A -1;
			stop;
		spawnempty:
			M17M B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}



class BRpgRocket : HDMagAmmo {
	default{
		+hdpickup.fitsinbackpack
		hdmagammo.maxperunit 1;
		hdmagammo.roundtype "HEATAmmo";
		hdmagammo.roundbulk c_rpg_charge_bulk;
		hdmagammo.magbulk c_rpg_case_bulk;
		hdpickup.refid B_RPG_ROCKET_REFID;
		tag "RPG Rocket";
		inventory.pickupmessage "Picked up a RPG rocket.";
		Inventory.Icon "RPGRA0";
		scale 0.3;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return "RPGRA6A4", "ROCKA0", "HEATAmmo", 0.8;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_RPGLauncher");
	}

	states{
		spawn:
			RPGR A -1;
			stop;
		spawnempty:
			RPGR B -1;
			stop;
	}
}











class BMagazineBox : HDUPK {

	default {
		+shootable
		+noblood
		+nopain
		+ghost
		+lookallaround
		+nofear
		scale 0.6;
		height 8;
		radius 12;
		health 100;
		mass 120;
		meleerange 42;
		radiusdamagefactor 0.5;
		obituary "%o has seen the true power of the level 1 warrior.";
		tag "Bryan's Resource Box";
	}

	
	static const string classNames[] = {
		"B556Mag",
		"BM249Mag",
		"B9mm_MP5K_MAG",
		"BFauxDrum",
		"b762_m14_mag",
		"GlockMagazine"
	};

	override bool OnGrab(actor grabber){
		setstatelabel("tap");
		return false;
	}

	states {
		spawn:
			BBOX C -1;
			stop;
		tap:
			---- A 0 {
				invoker.vel += (0, 0, 4);
			}
			---- A 10;
			---- A 0 {
				int rng_count = random(1, 5);
				for (int i = 0; i < rng_count; i++) {
					string clsname = classNames[random(0, 5)];
					let mag = HDMagAmmo(Actor.Spawn(clsname, invoker.pos));
					mag.vel += (random(-2, 2), random(-2, 2), random(4, 8));
					if (b_spawn_no_ammo || mag is "BM249Mag" || mag is "BFauxDrum") {
						mag.SyncAmount();
						mag.mags[0] = 0;
					}
				}

			}
			stop;
	}

}




class BAK_545Mag : HDMagAmmo {
	default{
		hdmagammo.maxperunit 30;
		hdmagammo.roundtype "B545Ammo";
		hdmagammo.roundbulk c_556_load_bulk;
		hdmagammo.magbulk c_aks74u_mag_bulk;
		hdpickup.refid B_AKS74U_MAG_REFID;
		tag "30 round 5.45x39mm magazine";
		inventory.pickupmessage "Picked up a 5.45x39mm magazine.";
		Inventory.Icon "AK7CA0";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		return (thismagamt > 0) ? "AK7CA0" : "AK7CB0", "B54BA7A3", "B545Ammo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_AKS74U");
		itemsthatusethis.push("B_RPK16");
	}

	states{
		spawn:
			AK7C A -1;
			stop;
		spawnempty:
			AK7C B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}


class RPKMag : HDMagAmmo {
	default{
		hdmagammo.maxperunit 95;
		hdmagammo.roundtype "B545Ammo";
		hdmagammo.roundbulk c_556_load_bulk;
		hdmagammo.magbulk c_rpk_mag_bulk;
		hdpickup.refid B_RPK_MAG_REFID;
		tag "95 round 5.45x39mm drum";
		inventory.pickupmessage "Picked up a 95 round 5.45x39mm drum.";
		Inventory.Icon "RK6CA0";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		return (thismagamt > 0) ? "RK6CA0" : "RK6CB0", "B54BA7A3", "B545Ammo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_RPK16");
	}

	states{
		spawn:
			RK6C A -1;
			stop;
		spawnempty:
			RK6C B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}



class BAKM_762Mag : HDMagAmmo {
	default{
		hdmagammo.maxperunit 30;
		hdmagammo.roundtype "B762SovAmmo";
		hdmagammo.roundbulk c_762_sov_load_bulk;
		hdmagammo.magbulk c_akm_mag_bulk;
		hdpickup.refid B_AKM_MAG_REFID;
		tag "30 round 7.62x39mm magazine";
		inventory.pickupmessage "Picked up a 7.62x39mm magazine.";
		Inventory.Icon "AKMCA0";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		return (thismagamt > 0) ? "AKMCA0" : "AKMCB0", "B7SBA7A3", "B762SovAmmo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_AKM");
	}

	states{
		spawn:
			AKMC A -1;
			stop;
		spawnempty:
			AKMC B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}


class UziMagazine : HDMagAmmo {
	default{
		hdmagammo.maxperunit 32;
		hdmagammo.roundtype "HDPistolAmmo";
		hdmagammo.roundbulk c_van_9mm_bulk;
		hdmagammo.magbulk c_uzi_mag_bulk;
		hdpickup.refid B_UZI_MAG_REFID;
		tag "32 round 9mm magazine";
		inventory.icon "UZICA0";
		inventory.pickupmessage "Picked up a Uzi magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "UZICA0" : "UZICB0", "PBRSA0", "HDPistolAmmo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("b_uzi");
	}

	states{
		spawn:
			UZIC A -1;
			stop;
		spawnempty:
			UZIC B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}


















class BUMP45Mag : HDMagAmmo {
	default{
		hdmagammo.maxperunit 25;
		hdmagammo.roundtype "HD45ACPAmmo";
		hdmagammo.roundbulk c_45ACP_load_bulk;
		hdmagammo.magbulk c_UMP45_mag_bulk;
		hdpickup.refid B_UMP45_MAG_REFID;
		tag "25 round .45 ACP Magazine";
		inventory.icon "UM4CA0";
		inventory.pickupmessage "Picked up a .45 ACP magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "UM4CA0" : "UM4CB0", "PBRSA0", "HD45ACPAmmo", 1.7;
	}

	override void GetItemsThatUseThis() {
	}

	states{
		spawn:
			UM4C A -1;
			stop;
		spawnempty:
			UM4C B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}


class BUMP45MagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"BUMP45Mag",0);
		destroy();
	}
}




class FNXMagazine : HDMagAmmo {
	default{
		hdmagammo.maxperunit 15;
		hdmagammo.roundtype "HD45ACPAmmo";
		hdmagammo.roundbulk c_45ACP_load_bulk;
		hdmagammo.magbulk c_FNX_mag_bulk;
		hdpickup.refid B_FNX_MAG_REFID;
		tag "15 round .45 ACP magazine";
		inventory.icon "FNXCA0";
		inventory.pickupmessage "Picked up a .45 ACP pistol magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "FNXCA0" : "FNXCB0", "PBRSA0", "HD45ACPAmmo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("b_FNX");
	}

	states{
		spawn:
			FNXC A -1;
			stop;
		spawnempty:
			FNXC B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}

class BFNXMagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"FNXMagazine",0);
		destroy();
	}
}







class b277_mag : HDMagAmmo {
	default {
		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "B277Ammo";
		HDMagAmmo.RoundBulk c_277_load_bulk;
		HDMagAmmo.MagBulk c_277_mag_bulk;
		tag "20 round 6.8x51mm magazine";
		hdpickup.refid B_277_MAG_REFID;
		Inventory.Icon "M14CA0";
		inventory.pickupmessage "Picked up a 6.8x51mm magazine.";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt){
		return (thismagamt > 0) ? "MCXCA0" : "MCXCB0", "BF27A3A7", "B277Ammo", 1.7;
	}

	override void GetItemsThatUseThis() {
	}

	states{
		spawn:
			MCXC A -1;
			stop;
		spawnempty:
			MCXC B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}

class B277MagEmpty2 : IdleDummy {
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"b277_mag",0);
		destroy();
	}
}


class B277MagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"b277_mag",0);
		destroy();
	}
}


class B584Mag : HDMagAmmo{
	default{
		hdmagammo.maxperunit 30;
		hdmagammo.roundtype "B584Ammo";
		hdmagammo.roundbulk c_584_load_bulk;
		hdmagammo.magbulk c_584_mag_bulk;
		hdpickup.refid B_584_MAG_REFID;
		tag "30 round 5.8x42mm magazine";
		inventory.pickupmessage "Picked up a 5.8x42mm magazine.";
		Inventory.Icon "Q91CA0";
		scale 0.8;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		return (thismagamt > 0) ? "Q91CA0" : "Q91CB0", "QF58A3A7", "B584Ammo", 1.7;
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_QBZ91");
	}

	states{
		spawn:
			Q91C A -1;
			stop;
		spawnempty:
			Q91C B -1{
				brollsprite = true;
				brollcenter = true;
				roll = randompick(0, 0, 0, 0, 2, 2, 2, 2, 1, 3) * 90;
			}
			stop;
	}
}

class B584MagEmpty:IdleDummy{
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"B584Mag",0);
		destroy();
	}
}

class B584MagEmpty2 : IdleDummy {
	override void postbeginplay(){
		super.postbeginplay();
		HDMagAmmo.SpawnMag(self,"B584Mag",0);
		destroy();
	}
}
