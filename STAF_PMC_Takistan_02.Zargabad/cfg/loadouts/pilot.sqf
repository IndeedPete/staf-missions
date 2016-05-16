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
_this forceAddUniform "STAF_U_BG_Guerilla2_1_Choc_Chip";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_EarPlugs";
_this addItemToUniform "ACE_morphine";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_tourniquet";
_this addItemToUniform "ACE_personalAidKit";
_this addVest "V_TacVest_khk";
for "_i" from 1 to 2 do {_this addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_this addItemToVest "ACE_packingBandage";};
_this addItemToVest "ACE_morphine";
_this addItemToVest "ACE_tourniquet";
for "_i" from 1 to 2 do {_this addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
for "_i" from 1 to 5 do {_this addItemToVest "hlc_30Rnd_9x19_B_MP5";};
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellBlue";
_this addItemToVest "SmokeShellOrange";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
_this addHeadgear "H_Cap_marshal";
_this addGoggles "G_Aviator";

comment "Add weapons";
_this addWeapon "hlc_smg_mp5k_PDW";
_this addWeapon "rhsusf_weap_glock17g4";
_this addWeapon "Binocular";
_this addItemToVest "hlc_30Rnd_9x19_B_MP5";
_this addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";

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