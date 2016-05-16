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
_this forceAddUniform "STAF_U_BG_Guerilla1_1_Mcam_Skull";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_EarPlugs";
_this addItemToUniform "ACE_morphine";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_personalAidKit";
_this addItemToUniform "ACE_tourniquet";
_this addVest "V_HarnessO_brn";
_this addItemToVest "hlc_muzzle_556NATO_KAC";
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShell";
_this addItemToVest "MiniGrenade";
for "_i" from 1 to 2 do {_this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_this addItemToVest "hlc_200rnd_556x45_M_SAW";};
_this addHeadgear "H_Cap_headphones";

comment "Add weapons";
_this addWeapon "hlc_m249_pip3";
_this addPrimaryWeaponItem "optic_MRCO";
_this addPrimaryWeaponItem "ACE_muzzle_mzls_L";
_this addWeapon "hgun_P07_F";
_this addHandgunItem "muzzle_snds_L";
_this addWeapon "Binocular";
_this addItemToVest "hlc_200rnd_556x45_M_SAW";
_this addItemToVest "16Rnd_9x21_Mag";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "tf_anprc148jem";
_this linkItem "ItemAndroid";
/*
comment "Set identity";
_this setFace "WhiteHead_03";
_this setSpeaker "ACE_NoVoice";
*/