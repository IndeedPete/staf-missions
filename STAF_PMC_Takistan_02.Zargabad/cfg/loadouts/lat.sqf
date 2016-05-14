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
_this forceAddUniform "STAF_U_BG_Guerilla2_1_Flora_Coyote";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_EarPlugs";
_this addItemToUniform "ACE_morphine";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_personalAidKit";
_this addItemToUniform "ACE_tourniquet";
_this addVest "V_TacVest_oli";
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShell";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 5 do {_this addItemToVest "hlc_30Rnd_545x39_EP_ak";};
_this addBackpack "B_FieldPack_khk";
for "_i" from 1 to 10 do {_this addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_this addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 10 do {_this addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 2 do {_this addItemToBackpack "ACE_tourniquet";};
_this addItemToBackpack "hlc_muzzle_545SUP_AK";
for "_i" from 1 to 5 do {_this addItemToBackpack "rhs_rpg7_PG7VL_mag";};
for "_i" from 1 to 2 do {_this addItemToBackpack "hlc_30Rnd_545x39_EP_ak";};
_this addGoggles "rhs_balaclava1_olive";

comment "Add weapons";
_this addWeapon "hlc_rifle_ak12";
_this addPrimaryWeaponItem "optic_Aco";
_this addWeapon "rhs_weap_rpg7";
_this addSecondaryWeaponItem "rhs_acc_1pn93_1";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addWeapon "Rangefinder";
_this addItemToBackpack "rhs_rpg7_PG7VL_mag";
_this addItemToBackpack "hlc_30Rnd_545x39_EP_ak";
_this addItemToVest "9Rnd_45ACP_Mag";

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