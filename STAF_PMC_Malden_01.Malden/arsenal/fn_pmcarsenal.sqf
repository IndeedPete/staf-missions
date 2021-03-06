//Init of the box and arsenal
_box = _this select 0;

//Picture on arsenal
if (isServer) then {
  if ((typeOf _box) isEqualTo "Portable_GCS_Base_CTRG_F") then {
    [_box,[2,"\staf_framework\img\terminaldown.paa"]] remoteExec ["setObjectTexture",0,true];
    [_box,[3,"\staf_framework\img\terminalup.paa"]] remoteExec ["setObjectTexture",0,true];
  };
  if ((typeOf _box) isEqualTo "Portable_GCS_Base_F") then {
    [_box,[2,"\staf_framework\img\terminaldown.paa"]] remoteExec ["setObjectTexture",0,true];
    [_box,[3,"\staf_framework\img\terminalup.paa"]] remoteExec ["setObjectTexture",0,true];
  };
  if ((typeOf _box) isEqualTo "Land_Laptop_unfolded_F") then {
    [_box,[0,"\staf_framework\img\terminalup.paa"]] remoteExec ["setObjectTexture",0,true];
  };
  if ((typeOf _box) isEqualTo "Land_Laptop_device_F") then {
    [_box,[0,"\staf_framework\img\terminalup.paa"]] remoteExec ["setObjectTexture",0,true];
  };
};



//Itemlists

_weapons = [
            "Binocular",
            "KA_Glock_17",
            "rhs_weap_6p53",
			"hgun_Pistol_heavy_02_F",
            "hgun_ACPC2_F",
            "Desert_Eagle",
			"rhsusf_weap_m1911a1",
            "rhsusf_weap_m9",
            "hgun_Pistol_01_F",
			"hgun_Rook40_F",
            "rhs_weap_tt33",
			"hgun_Rook40_F"
];

_backpacks = [
            //Vanilla
            "B_LegStrapBag_black_F",
            "B_LegStrapBag_coyote_F",
            "B_LegStrapBag_olive_F",
            "B_Messenger_Black_F",
            "B_Messenger_Coyote_F",
            "B_Messenger_Gray_F",
            "B_Messenger_Olive_F"
];

_items = [
            "ACE_EarPlugs",
            "ACE_elasticBandage",
            "ACE_packingBandage",
            "ACE_tourniquet",
            "ACE_morphine",
            "ACE_personalAidKit",
            "ACE_wirecutter",
            "ACE_Clacker",
            "ACE_Flashlight_XL50",
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
            "ACE_fieldDressing",
            "ACE_SpraypaintBlack",
            "ACE_bloodIV",
            "ACE_bloodIV_250",
            "ACE_bloodIV_500",
            "ACE_SpraypaintBlue",
            "ACE_CableTie",
            "ACE_DefusalKit",
            "ACE_EntrenchingTool",
            "ACE_Flashlight_MX991",
            "ACE_SpraypaintGreen",
            "ACE_HuntIR_monitor",
            "ACE_Clacker",
            "ACE_Flashlight_XL50",
            "ACE_MapTools",
            "ACE_plasmaIV",
            "ACE_plasmaIV_250",
            "ACE_plasmaIV_500",
            "ACE_SpraypaintRed",
            "ACE_SpottingScope",
            "ACE_UAVBattery",
            "ACE_DAGR",
            "ACE_Kestrel4500",
            "adv_aceSplint_splint",
            "adv_aceCPR_AED",
            "rhs_scarf",
            "rhs_balaclava1_olive",
            "rhs_googles_black",
            "rhs_googles_clear",
            "rhs_googles_orange",
            "rhs_googles_yellow",
            "H_Shemag_olive",
            "H_Shemag_olive_hs",
            "H_ShemagOpen_tan",
            "H_ShemagOpen_khk",
            "rhsusf_shemagh_grn",
            "rhsusf_shemagh2_grn",
            "rhsusf_shemagh_od",
            "rhsusf_shemagh2_od",
            "rhsusf_shemagh_tan",
            "rhsusf_shemagh2_tan",
            "rhsusf_shemagh_white",
            "rhsusf_shemagh2_white",
            "rhsusf_shemagh_gogg_grn",
            "rhsusf_shemagh2_gogg_grn",
            "rhsusf_shemagh_gogg_od",
            "rhsusf_shemagh2_gogg_od",
            "rhsusf_shemagh_gogg_tan",
            "rhsusf_shemagh2_gogg_tan",
            "rhsusf_shemagh_gogg_white",
            "rhsusf_shemagh2_gogg_white",
            "rhsusf_oakley_goggles_blk",
            "rhsusf_oakley_goggles_clr",
            "rhsusf_oakley_goggles_ylw",
            "ItemAndroid",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemGPS",
            "ToolKit",
            "TFAR_anprc152",
            "ItemCompass",
            "ItemAndroid",
            "ItemMap",
            "ItemcTab",
            "VSM_balaclava_Black_Skull",
            "VSM_balaclava_Black",
            "VSM_balaclava_olive_Skull",
            "VSM_balaclava_olive",
            "VSM_balaclava_TAN_Skull",
            "VSM_balaclava_tan",
            "VSM_Balaclava_black_glasses",
            "VSM_Balaclava_OD_glasses",
            "VSM_Balaclava_tan_glasses",
            "VSM_Balaclava_black_Goggles",
            "VSM_Balaclava_OD_Goggles",
            "VSM_Balaclava_tan_Goggles",
            "VSM_balaclava2_Black",
            "VSM_Balaclava2_black_glasses",
            "VSM_Balaclava2_OD_glasses",
            "VSM_Balaclava2_tan_glasses",
            "VSM_Balaclava2_black_Goggles",
            "VSM_Balaclava2_OD_Goggles",
            "VSM_Balaclava2_tan_Goggles",
            "VSM_FaceMask_black",
            "VSM_FaceMask_Ghost",
            "VSM_FaceMask_Ghost_olive",
            "VSM_FaceMask_Ghost_tan",
            "VSM_FaceMask_olive",
            "VSM_FaceMask_tan",
            "VSM_Facemask_black_glasses",
            "VSM_Facemask_OD_glasses",
            "VSM_Facemask_tan_glasses",
            "VSM_Facemask_black_Goggles",
            "VSM_Facemask_OD_Goggles",
            "VSM_Facemask_tan_Goggles",
            "VSM_Goggles",
            "rhs_balaclava",
            "G_Balaclava_blk",
            "G_Balaclava_combat",
            "G_Balaclava_lowprofile",
            "G_Balaclava_oli",
            "G_Bandanna_aviator",
            "G_Bandanna_beast",
            "G_Bandanna_blk",
            "G_Bandanna_khk",
            "G_Bandanna_oli",
            "G_Bandanna_shades",
            "G_Bandanna_sport",
            "G_Bandanna_tan",
            "G_Lady_Blue",
            "G_Lowprofile",
            "G_Respirator_blue_F",
            "G_Respirator_white_F",
            "G_Respirator_yellow_F",
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Shades_Green",
            "G_Shades_Red",
            "H_Shemag_olive",
            "H_Shemag_olive_hs",
            "H_ShemagOpen_tan",
            "H_ShemagOpen_khk",
            "G_Spectacles",
            "G_Sport_Red",
            "G_Sport_Blackyellow",
            "G_Sport_BlackWhite",
            "G_Sport_Checkered",
            "G_Sport_Blackred",
            "G_Sport_Greenblack",
            "G_Squares_Tinted",
            "G_Squares",
            "STAF_G_Bandanna_Punisher",
            "G_Tactical_Clear",
            "tacs_Goggles_Black",
            "tacs_Goggles_Green",
            "tacs_Goggles_Tan",
            "G_Tactical_Black",
            "G_Spectacles_Tinted",
            "G_WirelessEarpiece_F",
            "H_WirelessEarpiece_F",
			"SAN_Headlamp_v1",
			"SAN_Headlamp_v2"
];

_uniforms = [
    "U_BG_Guerrilla_6_1",
	"LOP_U_US_Fatigue_14",
	"LOP_U_IRA_Fatigue_GRK_BLK",
	"LOP_U_IRA_Fatigue_GRK_BLUE",
	"rhs_uniform_gorka_r_g",
	"LOP_U_IRA_Fatigue_GRK_OLV",
	"rhs_uniform_gorka_r_y",
	"FEMALE_jeans_shortsleeve_01",
	"FEMALE_jeans_shortsleeve_02",
	"FEMALE_jeans_shortsleeve_03",
	"FEMALE_jeans_01",
	"FEMALE_jeans_02",
	"FEMALE_jeans_03",
	"FEMALE_jeanshoodie_01",
	"FEMALE_jeanshoodie_02",
	"U_I_C_Soldier_Bandit_3_F",
	/*"rds_uniform_citizen1",
	"rds_uniform_citizen2",
	"rds_uniform_citizen3",
	"rds_uniform_citizen4",
	"LOP_U_CHR_Woodlander_01",
	"LOP_U_CHR_Woodlander_02",
	"LOP_U_CHR_Worker_03",
	"LOP_U_CHR_Worker_04",
	"LOP_U_CHR_Worker_01",
	"LOP_U_CHR_Worker_02",*/
	"milgp_u_fleece_grey_g3_field_pants_rgr",
	"milgp_u_fleece_khk_g3_field_pants_khk",
	"milgp_u_fleece_rgr_g3_field_pants_rgr",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_C_HunterBody_grn",
	//"U_Marshal",
	"milgp_u_pcu_g3_field_pants_khk",
	"milgp_u_pcu_g3_field_pants_rgr",
	"milgp_u_tshirt_g3_field_pants_rgr",
	"U_I_C_Soldier_Bandit_2_F"
];

_headgear = [
            //Vanilla
            "H_Bandanna_gry",
            "H_Bandanna_blu",
            "H_Bandanna_cbr",
            //"H_Bandanna_khk_hs",
            "H_Bandanna_khk",
            "H_Bandanna_sgg",
            "H_Bandanna_sand",
            "H_Bandanna_camo",
            "H_Watchcap_blk",
            "H_Watchcap_cbr",
            "H_Watchcap_camo",
            "H_Watchcap_khk",
            "H_Cap_grn_BI",
            "H_Cap_grn",
            "H_Cap_blk",
            "H_Cap_blu",
            "H_Cap_blk_CMMG",
            "H_Cap_oli",
            //"H_Cap_oli_hs",
            "H_Cap_tan",
            //"H_Cap_headphones",
            "H_Bandanna_mcamo",
            "H_Cap_blk_raven",
            "H_Cap_brn_SPECOPS",
            //VSM
            "VSM_BackwardsHat_Peltor_black",
            "VSM_BackwardsHat_Peltor_CMMG",
            "VSM_BackwardsHat_Peltor_OG",
            "VSM_BackwardsHat_Peltor_Sero",
            "VSM_BackwardsHat_Peltor_tan",
            "VSM_Beanie_Black",
            "VSM_Beanie_OD",
            "VSM_Beanie_tan",
            "VSM_Bowman_cap_balaclava_Black",
            "VSM_Bowman_cap_balaclava_Olive",
            "VSM_Bowman_cap_balaclava_tan",
            "VSM_Bowman_cap_Black",
            "VSM_Bowman_cap_Olive",
            "VSM_Bowman_cap_tan",
            //Cigs
            "immersion_cigs_cigar0",
            //RHS
            "rhsusf_hgu56p_black",
            "rhsusf_hgu56p_mask_black",
            "rhsusf_hgu56p_mask_black_skull",
            "rhsusf_hgu56p_visor_black",
            "rhsusf_hgu56p_visor_mask_black",
            "rhsusf_hgu56p_visor_mask_black_skull",
            "rhsusf_hgu56p_green",
            "rhsusf_hgu56p_mask_green",
            "rhsusf_hgu56p_mask_green_mo",
            "rhsusf_hgu56p_visor_green",
            "rhsusf_hgu56p_visor_mask_green",
            "rhsusf_hgu56p_visor_mask_Empire_green",
            "rhsusf_hgu56p_visor_mask_green_mo",
            "rhsusf_hgu56p",
            "rhsusf_hgu56p_mask",
            "rhsusf_hgu56p_mask_mo",
            "rhsusf_hgu56p_mask_skull",
            "rhsusf_hgu56p_visor",
            "rhsusf_hgu56p_visor_mask",
            "rhsusf_hgu56p_visor_mask_mo",
            "rhsusf_hgu56p_visor_mask_skull",
            //Military Gear
            "milgp_h_cap_01_goggles_khk",
            "milgp_h_cap_02_khk",
            "milgp_h_cap_02_goggles_khk",
            "milgp_h_cap_01_goggles_RGR",
            "milgp_h_cap_02_RGR",
            "milgp_h_cap_02_goggles_RGR",
            "milgp_h_cap_01_goggles_CB",
            "milgp_h_cap_02_CB",
            "milgp_h_cap_02_goggles_CB",
            "milgp_h_cap_01_goggles_MC",
            "milgp_h_cap_02_MC",
            "milgp_h_cap_02_goggles_MC",
            "milgp_h_cap_backwards_01_goggles_khk",
            "milgp_h_cap_backwards_02_khk",
            "milgp_h_cap_backwards_02_goggles_khk",
            "milgp_h_cap_backwards_01_goggles_RGR",
            "milgp_h_cap_backwards_02_RGR",
            "milgp_h_cap_backwards_02_goggles_RGR",
            "milgp_h_cap_backwards_01_goggles_CB",
            "milgp_h_cap_backwards_02_CB",
            "milgp_h_cap_backwards_02_goggles_CB",
            "milgp_h_cap_backwards_01_goggles_MC",
            "milgp_h_cap_backwards_02_MC",
            "milgp_h_cap_backwards_02_goggles_MC"
];

_vests = [
    "STAF_V_TacVest_hidden"
];

_magazines = [
            //Grenades
            "ACE_M14",
            "Chemlight_blue",
            "Chemlight_green",
            "ACE_Chemlight_HiOrange",
            "ACE_Chemlight_HiRed",
            "ACE_Chemlight_HiWhite",
            "ACE_Chemlight_HiYellow",
            "ACE_Chemlight_IR",
            "ACE_Chemlight_Orange",
            "Chemlight_red",
            "ACE_Chemlight_White",
            "Chemlight_yellow",
            //"B_IR_Grenade",
            "ACE_HandFlare_Green",
            "ACE_HandFlare_Red",
            "ACE_HandFlare_White",
            "ACE_HandFlare_Yellow",
            "SmokeShellBlue",
            "SmokeShellGreen",
            "SmokeShellOrange",
            "SmokeShellPurple",
            "SmokeShellRed",
            "SmokeShellYellow",
            //"HandGrenade",
            "rhs_mag_m7a3_cs",
            "SmokeShell",
            "ACE_M84",
            //"MiniGrenade",

            /*/Explosives
            "APERSMineDispenser_Mag",
            "DemoCharge_Remote_Mag",
            "rhsusf_m112x4_mag",
            "ATMine_Range_Mag",
            "SatchelCharge_Remote_Mag",
            "ClaymoreDirectionalMine_Remote_Mag",
            "APERSBoundingMine_Range_Mag",
            "SLAMDirectionalMine_Wire_Mag",
            "APERSTripMine_Wire_Mag",
            "ACE_FlareTripMine_Mag",
            "APERSMine_Range_Mag",*/

            // Cigs and Pops
            "murshun_cigs_matches",
            "murshun_cigs_lighter",
            "murshun_cigs_cigpack",
            "murshun_cigs_cig0",
            "immersion_pops_poppack",
            "immersion_pops_pop0"

            //Camera Tapes
            //"Tape_F",

            //Other
            //"ACE_SpareBarrel"
];

{
    {
		_magazines pushBackUnique _x;
	} forEach (getArray(configFile >> "CfgWeapons" >> _x >> "magazines"));
} forEach _weapons;

_attachments =[
          /*/Optics
          "rhs_acc_1p29",
          "rhs_acc_1p63",
          "rhs_acc_rakursPM",
          "rhs_acc_1p78",
          "rhs_acc_1p87",
          "rhs_acc_1pn93_1",
          "rhs_acc_1pn93_2",
          "rhsusf_acc_T1_high",
          "rhsusf_acc_T1_low",
          "rhsusf_acc_T1_low_fwd",
          "optic_AMS",
          "optic_AMS_khk",
          "optic_AMS_snd",
          "rhsusf_acc_anpas13gv1",
          "rhsusf_acc_ACOG2_USMC",
          "rhsusf_acc_ACOG3_USMC",
          "rhsusf_acc_ACOG_USMC",
          "rhsusf_acc_anpvs27",
          "hlc_optic_PVS4base",
          "ACE_optic_Arco_2D",
          "ACE_optic_Arco_PIP",
          "optic_Yorris",
          "optic_DMS",
          "optic_DMS_ghex_F",
          "optic_ACO_grn",
          "optic_Aco",
          "optic_ACO_grn_smg",
          "optic_Aco_smg",
          "rhs_acc_dh520x56",
          "HLC_optic_DocterV",
          "rhs_acc_ekp1",
          "rhs_acc_ekp8_02",
          "rhs_acc_ekp8_18",
          "optic_Arco_blk_F",
          "optic_Arco_ghex_F",
          "optic_Arco",
          "optic_Holosight_blk_F",
          "optic_Holosight_khk_F",
          "optic_Holosight",
          "optic_Holosight_smg_blk_F",
          "optic_Holosight_smg_khk_F",
          "optic_Holosight_smg",
          "KA_Eotech553",
          "rhsusf_acc_EOTECH",
          "hlc_optic_ZF4xBase",
          "rhsusf_acc_g33_T1",
          "rhsusf_acc_g33_xps3",
          "rhsusf_acc_g33_xps3_tan",
          "HLC_Optic_G36Dualoptic15x",
          "HLC_Optic_G36Dualoptic15x2d",
          "HLC_Optic_G36dualoptic35x",
          "HLC_Optic_G36dualoptic35x2d",
          "HLC_Optic_G36Export15x",
          "HLC_Optic_G36Export15x2d",
          "HLC_Optic_G36Export35x",
          "HLC_Optic_G36Export35x2d",
          "optic_MRCO",
          "KA_557_Magnifier_DOWN",
          "KA_Elcan_black",
          "KA_Elcan_black_Folding_Sight_45_Degree",
          "KA_Elcan_sand",
          "KA_Elcan_sand_Folding_Sight_45_Degree",
          "KA_Original_Sight_Carry_Handle",
          "KA_Original_Sight_Flip_Up_Sight",
          "KA_Rakurs",
          "hlc_optic_ZF95Base",
          "optic_KHS_blk",
          "optic_KHS_hex",
          "optic_KHS_old",
          "optic_KHS_tan",
          "hlc_optic_KernBase",
          "hlc_optic_LeupoldM3A",
          "optic_Hamr",
          "optic_Hamr_khk_F",
          "ACE_optic_LRPS_2D",
          "ACE_optic_LRPS_PIP",
          "rhsusf_acc_ELCAN",
          "rhsusf_acc_ELCAN_ard",
          "rhsusf_acc_ACOG",
          "rhsusf_acc_ACOG2",
          "rhsusf_acc_ACOG3",
          "rhsusf_acc_ACOG_anpvs27",
          "rhsusf_acc_M2A1",
          "rhs_optic_maaws",
          "rhsusf_acc_eotech_552",
          "rhsusf_acc_eotech_552_d",
          "rhsusf_acc_eotech_552_wd",
          "rhsusf_acc_compm4",
          "rhsusf_acc_M8541",
          "rhsusf_acc_M8541_low",
          "rhsusf_acc_M8541_low_d",
          "rhsusf_acc_M8541_low_wd",
          "rhsusf_acc_premier_low",
          "rhsusf_acc_premier_anpvs27",
          "rhsusf_acc_premier",
          "rhsgref_mg42_acc_AAsight",
          "rhsusf_acc_LEUPOLDMK4",
          "rhsusf_acc_LEUPOLDMK4_2",
          "rhsusf_acc_LEUPOLDMK4_d",
          "rhsusf_acc_LEUPOLDMK4_wd",
          "rhsusf_acc_LEUPOLDMK4_2_d",
          "optic_SOS",
          "ACE_optic_SOS_2D",
          "optic_SOS_khk_F",
          "ACE_optic_SOS_PIP",
          "ACE_optic_MRCO_2D",
          "optic_MRD",
          "rhsusf_acc_mrds",
          "rhsusf_acc_mrds_fwd",
          "rhsusf_acc_mrds_c",
          "rhsusf_acc_mrds_fwd_c",
          "optic_LRPS",
          "optic_LRPS_ghex_F",
          "optic_LRPS_tna_F",
          "optic_Nightstalker",
          "rhs_acc_nita",
          "optic_NVS",
          "rhs_acc_pgo7v",
          "rhs_acc_pgo7v2",
          "rhs_acc_pgo7v3",
          "rhs_acc_pkas",
          "rhs_acc_pso1m2",
          "rhs_acc_pso1m21",
          "ACE_optic_Hamr_2D",
          "ACE_optic_Hamr_PIP",
          "rhsusf_acc_RM05",
          "rhsusf_acc_RM05_fwd",
          "HLC_optic_RomeoV",
          "rhsusf_acc_RX01_NoFilter",
          "rhsgref_acc_RX01_NoFilter_camo",
          "rhsgref_acc_RX01_camo",
          "rhsusf_acc_RX01",
          "rhsusf_acc_RX01_NoFilter_tan",
          "rhsusf_acc_RX01_tan",
          "optic_ERCO_blk_F",
          "optic_ERCO_khk_F",
          "optic_ERCO_snd_F",
          "rhs_weap_optic_smaw",
          "rhsusf_acc_su230",
          "rhsusf_acc_su230_c",
          "rhsusf_acc_su230_mrds",
          "rhsusf_acc_su230_mrds_c",
          "rhsusf_acc_su230a",
          "rhsusf_acc_su230a_c",
          "rhsusf_acc_su230a_mrds",
          "rhsusf_acc_su230a_mrds_c",
          "rhsusf_acc_ACOG_MDO",
          "rhsusf_acc_ACOG_d",
          "rhsusf_acc_ACOG_wd",
          "rhsusf_acc_ACOG_RMR",
          "optic_tws",
          "optic_tws_mg",
          "hlc_optic_VOMZ3d",
          "hlc_optic_VOMZ",
          "rhsusf_acc_eotech_xps3",*/

           //Rail
          "HLC_Charm_base",
          "rhs_acc_2dpZenit",
          "rhs_acc_2dpZenit_ris",
          "rhsusf_acc_anpeq15side",
          "rhsusf_acc_anpeq15_top",
          "rhsusf_acc_anpeq15_wmx",
          "rhsusf_acc_anpeq15_wmx_light",
          "rhsusf_acc_anpeq15side_bk",
          "rhsusf_acc_anpeq15_bk_top",
          "rhsusf_acc_anpeq15",
          "rhsusf_acc_anpeq15_light",
          "rhsusf_acc_anpeq15_bk",
          "rhsusf_acc_anpeq15_bk_light",
          "rhsusf_acc_anpeq15A",
          "rhsusf_acc_anpeq16a",
          "rhsusf_acc_anpeq16a_light",
          "rhsusf_acc_anpeq16a_top",
          "rhsusf_acc_anpeq16a_light_top",
          "KA_ANPEQ15_Black_IR",
          "KA_ANPEQ15_Tan_IR",
          "rhs_acc_at4_handler",
          "rhs_bipod",
          "HLC_Charm_Eurojank",
          "HLC_Charm_Herstal",
          "HLC_Charm_Izhmash",
          "HLC_Charm_NIArmsbacker",
          "HLC_Charm_NIArmsbacker_dirty",
          "rhs_item_flightrecorder",
          "Hand_Guard_Rail",
          "Hand_Guard_Rail_Covers",
          "Hand_Guard_Rail_Flashlight_Black",
          "Hand_Guard_Rail_Flashlight_Sand",
          "Hand_Guard_Rail_Laser_Black",
          "Hand_Guard_Rail_Laser_Flashlight_Use_Black",
          "Hand_Guard_Rail_Laser_Flashlight_Use_Sand",
          "Hand_Guard_Rail_Laser_Sand",
          "Hand_Guard_Rail_Laser_Use_Flashlight_Black",
          "Hand_Guard_Rail_Laser_Use_Flashlight_Sand",
          "rhsgref_K98k_acc_sighthood_add",
          "ACE_acc_pointer_green",
          "acc_pointer_IR",
          "rhsusf_acc_M952V",
          "rhs_acc_perst1ik",
          "rhs_acc_perst1ik_ris",
          "rhs_acc_perst3",
          "rhs_acc_perst3_top",
          "rhs_acc_perst3_2dp_h",
          "rhs_acc_perst3_2dp_light_h",
          "KA_Flashlight",
          "acc_flashlight_pistol",
          "KA_Laser",
          "KA_Pistol_Rail_Public",
          "KA_Rail_Covers_Black",
          "KA_Rail_Covers_Black_Single",
          "KA_Rail_Covers_Tan",
          "KA_Rail_Covers_Tan_Single",
          "Rail_Public_Flashlight",
          "Rail_Public_Laser",
          "Round_Hand_Guard",
          "KA_SCAR_H_Flashlight_Black",
          "KA_SCAR_H_Flashlight_Laser_Black",
          "KA_SCAR_H_Flashlight_Laser_Black_UP",
          "KA_SCAR_H_Flashlight_Laser_Sand",
          "KA_SCAR_H_Flashlight_Laser_Sand_UP",
          "KA_SCAR_H_Flashlight_Sand",
          "KA_SCAR_H_Laser_Black_IR",
          "KA_SCAR_H_Laser_Flashlight_Black_IR",
          "KA_SCAR_H_Laser_Flashlight_Black_UP_IR",
          "KA_SCAR_H_Laser_Flashlight_Sand_IR",
          "KA_SCAR_H_Laser_Flashlight_Sand_UP_IR",
          "KA_SCAR_H_Laser_Sand_IR",
          "hlc_acc_DBALPL",
          "hlc_acc_DBALPL_FL",
          "hlc_acc_TLR1",
          "hlc_acc_Surefiregrip",
          "rds_acc_switch",
          "acc_flashlight_smg_01",
          "acc_flashlight",
          "rhsusf_acc_wmx",
          "rhsusf_acc_wmx_bk"

           /*/Muzzle
          "103_Inches_Barrel",
          "103_Inches_Barrel_Flash_Hider",
          "103_Inches_Barrel_Silencer",
          "103_Inches_Barrel_Silencer2",
          "145_Inches_Barrel",
          "145_Inches_Barrel_Bayonet",
          "145_Inches_Barrel_Flash_Hider",
          "145_Inches_Barrel_Silencer",
          "145_Inches_Barrel_Silencer2",
          "rhs_acc_6p9_suppressor",
          "rhsgref_sdn6_suppressor",
          "hlc_muzzle_Evo40",
          "hlc_muzzle_Evo9",
          "hlc_muzzle_TiRant9",
          "hlc_muzzle_TiRant9S",
          "rhs_acc_uuk",
          "rhsusf_acc_ARDEC_M240",
          "hlc_muzzle_Agendasix10mm",
          "hlc_muzzle_Agendasix",
          "rhs_acc_dtk1l",
          "rhs_acc_ak5",
          "rhs_acc_dtkakm",
          "rhs_acc_dtk",
          "rhs_acc_dtk1983",
          "rhs_acc_dtk1",
          "rhs_acc_dtk1p",
          "rhs_acc_dtk2",
          "rhs_acc_dtk3",
          "rhs_acc_dtk4short",
          "rhs_acc_dtk4screws",
          "rhs_acc_dtk4long",
          "ACE_muzzle_mzls_338",
          "ACE_muzzle_mzls_smg_01",
          "ACE_muzzle_mzls_L",
          "ACE_muzzle_mzls_H",
          "ACE_muzzle_mzls_B",
          "ACE_muzzle_mzls_smg_02",
          "ACE_muzzle_mzls_93mmg",
          "hlc_muzzle_556NATO_KAC",
          "hlc_muzzle_Tundra",
          "rhsusf_acc_m24_muzzlehider_black",
          "rhsusf_acc_m24_muzzlehider_d",
          "rhsusf_acc_m24_muzzlehider_wd",
          "rhsusf_acc_m24_silencer_black",
          "rhsusf_acc_m24_silencer_d",
          "rhsusf_acc_m24_silencer_wd",
          "hlc_muzzle_MAG58_Brake",
          "rhsusf_acc_nt4_black",
          "rhsusf_acc_nt4_tan",
          "KA_Original_Silencer",
          "rhs_acc_pbs1",
          "rhs_acc_pbs4",
          "rhs_acc_pgs64",
          "rhs_acc_pgs64_74u",
          "rhs_acc_pgs64_74un",
          "hlc_muzzle_300blk_KAC",
          "rhsusf_acc_rotex5_grey",
          "rhsusf_acc_rotex5_tan",
          "rhsusf_acc_rotex_mp7_aor1",
          "rhsusf_acc_rotex_mp7",
          "rhsusf_acc_rotex_mp7_desert",
          "rhsusf_acc_rotex_mp7_winter",
          "SCAR_10_Inches_Barrel",
          "SCAR_10_Inches_Barrel_Flash_Hider",
          "SCAR_10_Inches_Barrel_Silencer",
          "SCAR_13_Inches_Barrel",
          "SCAR_13_Inches_Barrel_Flash_Hider",
          "SCAR_13_Inches_Barrel_Silencer",
          "SCAR_14_Inches_Barrel",
          "SCAR_14_Inches_Barrel_Flash_Hider",
          "SCAR_14_Inches_Barrel_Silencer",
          "SCAR_16_Inches_Barrel",
          "SCAR_16_Inches_Barrel_Flash_Hider",
          "SCAR_16_Inches_Barrel_Silencer",
          "SCAR_18_Inches_Barrel",
          "SCAR_18_Inches_Barrel_Flash_Hider",
          "SCAR_18_Inches_Barrel_Silencer",
          "SCAR_20_Inches_Barrel",
          "SCAR_20_Inches_Barrel_Flash_Hider",
          "SCAR_20_Inches_Barrel_Silencer",
          "rhsusf_acc_SF3P556",
          "rhsusf_acc_SFMB556",
          "KA_Silencer_2",
          "KA_Silencer_3",
          "hlc_muzzle_Octane45",
          "hlc_muzzle_Octane9",
          "rhsusf_acc_omega9k",
          "muzzle_snds_338_black",
          "muzzle_snds_338_green",
          "muzzle_snds_338_sand",
          "muzzle_snds_acp",
          "muzzle_snds_M",
          "muzzle_snds_m_khk_F",
          "muzzle_snds_m_snd_F",
          "muzzle_snds_H",
          "muzzle_snds_H_khk_F",
          "muzzle_snds_H_snd_F",
          "muzzle_snds_B",
          "muzzle_snds_B_khk_F",
          "muzzle_snds_B_snd_F",
          "muzzle_snds_L",
          "muzzle_snds_93mmg",
          "muzzle_snds_93mmg_tan",
          "muzzle_snds_H_MG_blk_F",
          "muzzle_snds_H_MG_khk_F",
          "muzzle_snds_H_MG",
          "rhsusf_acc_SR25S",
          "rhsusf_acc_SR25S_d",
          "rhsusf_acc_SR25S_wd",
          "muzzle_snds_58_blk_F",
          "muzzle_snds_58_ghex_F",
          "muzzle_snds_58_hex_F",
          "muzzle_snds_65_TI_blk_F",
          "muzzle_snds_65_TI_ghex_F",
          "muzzle_snds_65_TI_hex_F",
          "rhs_acc_tgpa",
          "rhs_acc_tgpv",
          "rhs_acc_tgpv2",
          "rhsusf_acc_M2010S",
          "rhsusf_acc_M2010S_d",
          "rhsusf_acc_M2010S_sa",
          "rhsusf_acc_M2010S_wd",
          "rhsgref_acc_zendl",

           //Underbarrel
          "rhsusf_acc_grip2",
          "rhsusf_acc_grip2_tan",
          "rhsusf_acc_grip2_wd",
          "ATG_Grip_MOE_Grip_MOE_Stock_Black",
          "ATG_Grip_Original_Grip_Lightweight_Stock",
          "ATG_Grip_Original_Grip_Original_Stock",
          "bipod_03_F_blk",
          "bipod_02_F_blk",
          "bipod_01_F_blk",
          "bipod_02_F_hex",
          "bipod_01_F_khk",
          "bipod_01_F_mtp",
          "bipod_03_F_oli",
          "bipod_01_F_snd",
          "bipod_02_F_tan",
          "Bipod_MOE_Grip_MOE_Stock_Black",
          "Bipod_Original_Grip_Original_Stock",
          "rhs_acc_grip_ffg2",
          "HLC_Bipod_G36",
          "rhsusf_acc_grip1",
          "rhs_acc_harris_swivel",
          "rhsusf_acc_harris_swivel",
          "rhsusf_acc_harris_bipod",
          "MOE_Grip_MOE_Stock_Black",
          "MOE_Grip_MOE_Stock_Green",
          "MOE_Grip_MOE_Stock_Sand",
          "MOE_Stock_Lightweight_Stock_Black",
          "MVG_Grip_MOE_Grip_MOE_Stock_Black",
          "MVG_Grip_MOE_Grip_MOE_Stock_Green",
          "MVG_Grip_MOE_Grip_MOE_Stock_Sand",
          "Original_Grip_M16_Stock",
          "Original_Grip_Original_Stock",
          "rhs_acc_grip_rk2",
          "rhs_acc_grip_rk6",
          "rhsusf_acc_rvg_blk",
          "rhsusf_acc_rvg_de",
          "rhsusf_acc_grip4",
          "rhsusf_acc_tacsac_blk",
          "rhsusf_acc_tacsac_blue",
          "rhsusf_acc_tacsac_tan",
          "rhsusf_acc_tdstubby_blk",
          "rhsusf_acc_tdstubby_tan",
          "rhsusf_acc_grip3",
          "rhsusf_acc_grip3_tan",
          "HLC_bipod_UTGShooters",
          "Vertical_Grip_MOE_Grip_MOE_Stock_Black",
          "Vertical_Grip_Original_Grip_Original_Stock"*/
];

//Adding Itemlists to the Arsenal
[_box,(_weapons + _backpacks + _items + _uniforms + _headgear + _vests + _magazines + _attachments), true] call ace_arsenal_fnc_initBox;
[_box,["<img image='\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\box_ca.paa' /> Open Arsenal",{[(_this select 0), player,false] call ace_arsenal_fnc_openBox;}]] remoteExec ["addAction",0,true];