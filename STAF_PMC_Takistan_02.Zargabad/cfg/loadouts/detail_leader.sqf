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
_this forceAddUniform "U_I_G_Story_Protagonist_F";
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_personalAidKit";
_this addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_CableTie";};
//_this addItemToUniform "ACE_Flashlight_XL50";
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_morphine";};
_this addVest "V_PlateCarrier2_blk";
_this addItemToVest "hlc_muzzle_556NATO_KAC";
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellGreen";
for "_i" from 1 to 2 do {_this addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {_this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
for "_i" from 1 to 7 do {_this addItemToVest "hlc_30rnd_556x45_EPR";};
for "_i" from 1 to 3 do {_this addItemToVest "1Rnd_HE_Grenade_shell";};
_this addItemToVest "1Rnd_SmokeYellow_Grenade_shell";
_this addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
_this addItemToVest "1Rnd_SmokeOrange_Grenade_shell";
_this addItemToVest "1Rnd_SmokeGreen_Grenade_shell";
_this addItemToVest "1Rnd_SmokeRed_Grenade_shell";
_this addItemToVest "1Rnd_Smoke_Grenade_shell";
_this addHeadgear "H_MilCap_gry";
_this addGoggles "STAF_G_Bandanna_Punisher";

comment "Add weapons";
_this addWeapon "hlc_rifle_m4m203";
_this addPrimaryWeaponItem "ACE_muzzle_mzls_L";
_this addPrimaryWeaponItem "optic_Hamr";
_this addWeapon "rhsusf_weap_m9";
_this addWeapon "Rangefinder";
_this addItemToVest "hlc_30rnd_556x45_EPR";
_this addItemToVest "1Rnd_HE_Grenade_shell";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
//_this linkItem "tf_anprc148jem_1";
_this linkItem "ItemcTab";
/*
comment "Set identity";
_this setFace "WhiteHead_03";
_this setSpeaker "ACE_NoVoice";
*/