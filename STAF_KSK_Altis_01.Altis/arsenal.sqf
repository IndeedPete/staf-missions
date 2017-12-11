params [
	["_box", ObjNull, [ObjNull]],
	"_backpacks",
	"_uniforms",
	"_headgear",
	"_goggles",
	"_vests",
	"_items",
	"_weapons",
	"_magazines",
	"_attachments"
];

_backpacks = [
	"IP_B_AssaultPack_KSK_Arid",
	"IP_B_AssaultPack_KSK_Arid_Medic",
	"IP_B_Kitbag_KSK_Arid",
	"IP_B_Kitbag_KSK_Arid_Medic",
	"IP_B_TacticalPack_KSK_Arid",
	"IP_B_Carryall_KSK_Arid"
];

_uniforms = [
	"IP_U_B_ReconUniform_KSK_Arid",
	"IP_U_B_ReconUniform_T_KSK_Arid",
	"IP_U_B_ReconUniform_Rolled_KSK_Arid"
];

_headgear = [
	"IP_H_HelmetB_KSK_Fleck_Arid",
	"IP_H_HelmetB_light_KSK_Fleck_Arid",
	"IP_H_HelmetSpecB_KSK_Fleck_Arid",
	"IP_H_Booniehat_ksk_arid",
	"IP_H_MilCap_ksk_arid",
	"IP_H_Cap_ksk_arid",
	"IP_H_Cap_HS_ksk_arid",
	"IP_H_Cap_headphones_ksk_arid",
	"IP_H_Booniehat_HS_ksk_arid",
	"IP_H_Bandanna_ksk_arid",
	"IP_H_Bandanna_HS_ksk_arid",
	"H_Watchcap_camo"
];

_goggles = [];
{
	_goggles pushBackUnique (configName _x);
} forEach ("getNumber(_x >> 'scope') >= 2" configClasses (configFile >> "CfgGlasses"));

_vests = [
	"IP_V_PlateCarrier1_KSK_Fleck_Arid",
	"IP_V_PlateCarrier2_KSK_Fleck_Arid",
	"IP_V_Chestrig_KSK_Fleck_Arid",
	"IP_V_TacVest_KSK_Arid",
	"IP_V_HarnessO_KSK_Arid",
	"IP_V_HarnessOGL_KSK_Arid"
];

_items = [
	"NVGogglesB_blk_F",
	"NVGogglesB_grn_F",
	"SAN_Headlamp_v1",
	"SAN_Headlamp_v2",
	"NVGoggles_OPFOR",
	"NVGoggles",
	"NVGoggles_INDEP",
	"ACE_NVG_Gen4",
	"NVGoggles_tna_F",
	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"ItemGPS",
	"ItemAndroid",
	"ItemMicroDAGR",
	"ItemcTab",
	"B_UavTerminal",
	"TFAR_rf7800str",
	"TFAR_anprc152",
	"TFAR_microdagr",
	"ACE_Altimeter",
	"ACE_EarPlugs",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_tourniquet",
	"ACE_morphine",
	"ACE_personalAidKit",
	"ACE_wirecutter",
	"ACE_Clacker",
	"ACE_EntrenchingTool",
	"ACE_DefusalKit",
	"ACE_salineIV",
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_surgicalKit",
	"ACE_bodyBag",
	"ACE_adenosine",
	"ACE_epinephrine",
	"ACE_quikclot",
	"ACE_SpraypaintBlack",
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"ACE_SpraypaintBlue",
	"ACE_CableTie",
	"ACE_Flashlight_MX991",
	"ACE_SpraypaintGreen",
	"ACE_HuntIR_monitor",
	"ACE_Flashlight_XL50",
	"ACE_MapTools",
	"ACE_plasmaIV",
	"ACE_plasmaIV_250",
	"ACE_plasmaIV_500",
	"ACE_SpraypaintRed",
	"ACE_SpottingScope",
	"ACE_UAVBattery",
	"ACE_SpareBarrel",
	"ACE_RangeTable_82mm",
	"ACE_RangeCard"
];

_weapons = [
	"put",
	"throw",
	"IP_arifle_SPAR_01_KSK_Arid_F",
	"IP_arifle_SPAR_01_GL_KSK_Arid_F",
	"IP_arifle_SPAR_02_KSK_Arid_F",
	"IP_arifle_SPAR_03_KSK_Arid_F",
	"IP_hgun_P07_KSK_Arid_F",
	"IP_MMG_01_KSK_Arid_F",
	"IP_srifle_DMR_02_KSK_Arid_F",
	"SMG_05_F",
	"launch_NLAW_F",
	"ACE_VMH3",
	"hlc_rifle_G36MLIC",
	"hlc_rifle_G36CV",
	"hlc_rifle_G36CMLIC",
	"hlc_rifle_G36KMLIC",
	"hlc_rifle_G36KA1KSK",
	"HLC_Rifle_G36KSKAG36",
	"hlc_rifle_G36MLIAG36",
	"hlc_rifle_MG36",
	"rhs_weap_hk416d10",
	"rhs_weap_hk416d10_m320",
	"rhs_weap_hk416d10_LMT",
	"rhs_weap_hk416d10_LMT_d",
	"rhs_weap_hk416d145",
	"rhs_weap_hk416d145_m320",
	"rhsusf_weap_MP7A2",
	"rhsusf_weap_MP7A2_desert",
	"arifle_MX_Black_F",
	"launch_B_Titan_short_F",
	"arifle_MX_GL_Black_F",
	"arifle_MX_SW_Black_F",
	"arifle_MXC_Black_F",
	"arifle_MXM_Black_F",
	"IP_srifle_DMR_03_KSK_Arid_F",
	"IP_srifle_DMR_03_KSK_Arid_Camo_F",
	"hgun_Pistol_heavy_01_F",
	"KA_glock_17_Single",
	"KA_Glock_18_Single",
	"Binocular",
	"Laserdesignator",
	"Rangefinder"
];

_attachments = [
	"optic_Aco",
	"optic_Aco_smg",
	"optic_AMS",
	"optic_Arco_blk_F",
	"optic_DMS",
	"optic_ERCO_blk_F",
	"KA_557_Magnifier_DOWN",
	"optic_LRPS",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_eotech_552_d",
	"rhsusf_acc_eotech_552_wd",
	"optic_Holosight_blk_F",
	"optic_Holosight_smg_blk_F",
	"optic_SOS",
	"optic_MRCO",
	"optic_Nightstalker",
	"optic_Hamr",
	"optic_tws",
	"optic_tws_mg",
	"optic_MRD",
	"acc_pointer_IR",
	"acc_flashlight",
	"KA_ANPEQ15_Black_IR",
	"rhsusf_acc_wmx_bk",
	"acc_flashlight_pistol",
	"ACE_muzzle_mzls_L",
	"hlc_muzzle_556NATO_KAC",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"muzzle_snds_M",
	"ACE_muzzle_mzls_smg_01",
	"muzzle_snds_acp",
	"ACE_muzzle_mzls_B",
	"hlc_muzzle_300blk_KAC",
	"muzzle_snds_B",
	"ACE_muzzle_mzls_338",
	"muzzle_snds_338_black",
	"ACE_muzzle_mzls_H",
	"muzzle_snds_65_TI_blk_F",
	"muzzle_snds_H",
	"ACE_muzzle_mzls_93mmg",
	"muzzle_snds_93mmg",
	"KA_Original_Silencer",
	"KA_Silencer_2",
	"KA_Silencer_3",
	"ACE_muzzle_mzls_smg_02",
	"muzzle_snds_L",
	"rhsusf_acc_rotex_mp7",
	"rhsusf_acc_rotex_mp7_desert",
	"bipod_01_F_blk",
	"rhs_acc_harris_swivel",
	"rhsusf_acc_harris_bipod"
];

_magazines = [];
//_attachments = [];
{
	_wep = _x;
	_mags = getArray(configFile >> "CfgWeapons" >> _wep >> "magazines");
	_muzzles = getArray(configFile >> "CfgWeapons" >> _wep >> "muzzles");
	if (count _muzzles > 1) then {
		{
			_mags append (getArray(configFile >> "CfgWeapons" >> _wep >> _x >> "magazines"));
		} forEach (_muzzles - ["this"]);
	};
	
	{
		_magazines pushBackUnique _x;
	} forEach _mags;
	/*
	_opticArr = getArray(configFile >> "CfgWeapons" >> _wep >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
	_muzzleArr = getArray(configFile >> "CfgWeapons" >> _wep >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	_pointerArr = getArray(configFile >> "CfgWeapons" >> _wep >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
	{
		_attachments pushBackUnique _x;
	} forEach (_opticArr + _muzzleArr + _pointerArr);*/
} forEach _weapons;

[_box, _backpacks, true] call BIS_fnc_addVirtualBackpackCargo;
[_box,(_items + _uniforms + _headgear + _goggles + _vests + _attachments), true] call BIS_fnc_addVirtualItemCargo;
[_box, _magazines, true] call BIS_fnc_addVirtualMagazineCargo;
[_box, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;