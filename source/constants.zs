
// Constants
const I_FLAGS   = 0;
const I_MAG     = 1;
const I_AUTO    = 2;
const I_ZOOM    = 3;
const I_HEAT    = 4;
CONST I_BORE    = 6;
CONST I_GRIME   = 7;
CONST I_GRENADE = 8;

CONST I_3RD  = 31;

const F_CHAMBER        = 1;
const F_CHAMBER_BROKE  = 2;
const F_NO_FIRE_SELECT = 32;
const F_GL_MODE        = 64;
const F_UNLOAD_ONLY    = 128;
const F_EMPTY_CHAMBER  = 256;


const B_BARREL = 255;
const B_MISC   = 65280;
const B_SCOPE  = 16711680;

const LAYER_BARREL = -11;
const LAYER_MISC = 12;
const LAYER_SCOPE = 13;



const ENC_556MAG = 17;
const ENC_556MAG_EMPTY = ENC_556MAG * 0.4;
const ENC_556_LOADED = (ENC_556MAG * 0.6) / 50.;
const ENC_556 = ENC_556_LOADED * 1.4;
const ENC_556MAG_LOADED = ENC_556MAG_EMPTY * 0.4;

const ENC_762MAG = 19;
const ENC_762MAG_EMPTY = ENC_762MAG * 0.4;
const ENC_762_LOADED = (ENC_762MAG * 0.6) / 50.;
const ENC_762 = ENC_762_LOADED * 1.4;
const ENC_762MAG_LOADED = ENC_762MAG_EMPTY * 0.4;

const HDLD_556MAG = "556";
const HDLD_762MAG = "762";



// Constants for the Loadouts
const B_GLOCK_REFID   = "w01";
const B_MP5_REFID     = "w02";
const B_M4_REFID      = "w03";
const B_M14_REFID     = "w04";
const B_FAUX_REFID    = "w05";
const B_MF249_REFID   = "w06";
const B_M4M203_REFID  = "w07";
const B_MP5M203_REFID = "w08";
const B_RPGL_REFID    = "w09";
const B_M107_REFID    = "w10";
const B_AKS74U_REFID  = "w11";
const B_AKM_REFID     = "w12";
const B_UZI_REFID     = "w13";
const B_AK19_REFID     = "w14";
const B_AK108_REFID     = "w15";
const B_MF240_REFID   = "w16";
const B_AK12_REFID     = "w17";
const B_AK308_REFID     = "w18";
const B_RPK16_REFID     = "w19";
const B_SCR16_REFID     = "w20";
const B_SCR17_REFID     = "w21";
const B_UMP9_REFID     = "w22";
const B_UMP45_REFID     = "w23";
const B_FNX_REFID   = "w24";
const B_MCX_REFID = "w25";
const B_SAIGA_REFID = "w26";
const B_R0635_REFID = "w27";
const B_AK15_REFID     = "w28";
const B_QBZ191_REFID     = "w29";

const B_GLOCK_MAG_REFID  = "m01";
const B_MP5_MAG_REFID    = "m02";
const B_556_MAG_REFID    = "m03";
const B_M14_MAG_REFID    = "m04";
const B_FAUX_DRUM_REFID  = "m05";
const B_MF249_MAG_REFID  = "m06";
const B_RPG_ROCKET_REFID = "m09";
const B_M107_MAG_REFID   = "m10";
const B_AKS74U_MAG_REFID = "m11";
const B_AKM_MAG_REFID    = "m12";
const B_UZI_MAG_REFID    = "m13";
const B_MF240_MAG_REFID  = "m16";
const B_RPK_MAG_REFID = "m19";
const B_UMP45_MAG_REFID = "m23";
const B_FNX_MAG_REFID  = "m24";
const B_277_MAG_REFID  = "m25";
const B_584_MAG_REFID  = "m26";

// ID's and Ref's for Attachments
const B_M4_REARSIGHT_ID   = 1;
const B_M4_CARRYHANDLE_ID = 2;
const B_FAUX_SIGHT_ID     = 3;
const B_ACOG_RED_ID       = 4;
const B_SIGHT_CRDOT_ID    = 5;
const B_SIGHT_HOLO_ID     = 6;
const B_REFLEX_RED_ID     = 7;
const B_SCOPE_10X_ID      = 8;
const B_RMR_ID       = 9;
const B_ACOG_RMR_ID       = 10;
const B_SCOPE_VX_ID      = 11;
const B_EOT_HWS_ID  = 12;

const B_FLASHLIGHT_ID     = 1;

const B_556_SILENCER_ID   = 1;
const B_556_FLASH_ID      = 2;
const B_9MM_SILENCER_ID   = 3;
const B_762_SILENCER_ID   = 4;
const B_FOS_SILENCER_ID   = 5;

const B_FOS_IMPR_CHOKE    = 6;
const B_FOS_MOD_CHOKE     = 7;
const B_FOS_FULL_CHOKE    = 8;


const c_aks74u_bulk = 60;
const c_aks74u_mag_bulk = 8;
const c_rpk_mag_bulk = 20;

const c_akm_bulk = 100;
const c_akm_mag_bulk = 20;

const c_glock_bulk = 35;
const c_glock_mag_bulk = 4;
const c_FNX_mag_bulk = 5;

const c_uzi_bulk = 45;
const c_uzi_mag_bulk = 5;

const c_m4_bulk = 90;
const c_m4_m203_bulk = 120;
const c_m4_mag_bulk = 8;

const c_mp5_bulk = 60;
const c_mp5_m203_bulk = 90;
const c_mp5_mag_bulk = 6;
const c_UMP45_mag_bulk = 7;

const c_m14_bulk = 110;
const c_m14_mag_bulk = 8;
const c_277_mag_bulk = 8;

const c_qbz191_bulk = 90;
const c_584_mag_bulk = 8;

const c_faux_bulk = 130;
const c_faux_drum_bulk = 20;

const c_m249_bulk = 200;
const c_m249_pouch_bulk = 15;

const c_m240_bulk = 250;
const c_m240_pouch_bulk = 25;

const c_545_round_bulk = 0.30;
const c_545_spent_bulk = c_545_round_bulk * 0.7;
const c_545_load_bulk = c_545_round_bulk / 2;

const c_556_round_bulk = 0.35;
const c_556_spent_bulk = c_556_round_bulk * 0.7;
const c_556_load_bulk = c_556_round_bulk / 2;

const c_762_round_bulk = 1.2;
const c_762_spent_bulk = c_762_round_bulk * 0.6;
const c_762_load_bulk = c_762_round_bulk / 2;

const c_277_round_bulk = 0.8;
const c_277_spent_bulk = c_277_round_bulk * 0.6;
const c_277_load_bulk = c_277_round_bulk / 2;

const c_584_round_bulk = 0.4;
const c_584_spent_bulk = c_584_round_bulk * 0.6;
const c_584_load_bulk = c_584_round_bulk / 2;

const c_762_sov_round_bulk = 1;
const c_762_sov_spent_bulk = c_762_sov_round_bulk * 0.6;
const c_762_sov_load_bulk = c_762_sov_round_bulk / 2;

const c_rpg_bulk = 75;
const c_rpg_case_bulk = 2.8;
const c_rpg_charge_bulk = 17.2;

const c_raw_resource_bulk = 0.1;

const c_van_9mm_bulk = ENC_9;
const c_9mm_load_bulk = ENC_9_LOADED;

const c_van_45ACP_bulk = HD45ACPAmmo.EncRound;
const c_45ACP_load_bulk = HD45ACPAmmo.EncRoundLoaded;

const c_van_shell_bulk = ENC_SHELL;
const c_shell_load_bulk = ENC_SHELLLOADED;

const c_van_rocket_bulk = ENC_ROCKET;
const c_rocket_load_bulk = ENC_ROCKETLOADED;

const c_50bmg_bulk = 1.9;
const c_m107_bulk = 300;
const c_m107_mag_bulk = 25;
