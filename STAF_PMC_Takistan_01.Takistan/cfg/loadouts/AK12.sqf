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
_this forceAddUniform "STAF_U_B_CombatUniform_MCAM_Brown_vest";
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_morphine";};
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_personalAidKit";
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_CableTie";};
_this addVest "V_PlateCarrier1_rgr";
_this addItemToVest "hlc_muzzle_545SUP_AK";
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShell";
for "_i" from 1 to 2 do {_this addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 7 do {_this addItemToVest "hlc_30Rnd_545x39_EP_ak";};
_this addHeadgear "H_Beret_blk";
_this addGoggles "G_Balaclava_combat";

comment "Add weapons";
_this addWeapon "hlc_rifle_ak12";
_this addPrimaryWeaponItem "optic_Arco";
_this addWeapon "hgun_P07_F";
_this addHandgunItem "muzzle_snds_L";
_this addWeapon "Binocular";
_this addItemToVest "hlc_30Rnd_545x39_EP_ak";
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