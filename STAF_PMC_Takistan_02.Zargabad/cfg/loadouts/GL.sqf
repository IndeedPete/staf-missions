comment "Exported from Arsenal by IndeedPete";

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add containers";
_this forceAddUniform "STAF_U_BG_Guerrilla_6_1_ERDL_Black";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_EarPlugs";
_this addItemToUniform "ACE_morphine";
_this addItemToUniform "ACE_personalAidKit";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_tourniquet";
_this addVest "V_Chestrig_blk";
_this addItemToVest "hlc_muzzle_556NATO_KAC";
for "_i" from 1 to 2 do {_this addItemToVest "16Rnd_9x21_Mag";};
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShell";
for "_i" from 1 to 2 do {_this addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {_this addItemToVest "hlc_30rnd_556x45_EPR";};
for "_i" from 1 to 5 do {_this addItemToVest "1Rnd_HE_Grenade_shell";};
_this addItemToVest "1Rnd_Smoke_Grenade_shell";
_this addItemToVest "1Rnd_SmokeRed_Grenade_shell";
_this addItemToVest "1Rnd_SmokeGreen_Grenade_shell";
_this addItemToVest "1Rnd_SmokeYellow_Grenade_shell";
_this addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
_this addHeadgear "H_Watchcap_cbr";
_this addGoggles "G_Bandanna_shades";

comment "Add weapons";
_this addWeapon "hlc_rifle_Colt727_GL";
_this addPrimaryWeaponItem "ACE_muzzle_mzls_L";
_this addPrimaryWeaponItem "optic_ACO_grn";
_this addWeapon "hgun_P07_F";
_this addHandgunItem "muzzle_snds_L";
_this addWeapon "Binocular";
_this addItemToVest "1Rnd_HE_Grenade_shell";
_this addItemToVest "hlc_30rnd_556x45_EPR";
_this addItemToVest "16Rnd_9x21_Mag";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
//_this linkItem "tf_anprc148jem_1";
_this linkItem "ItemAndroid";
/*
comment "Set identity";
_this setFace "WhiteHead_03";
_this setSpeaker "ACE_NoVoice";
*/