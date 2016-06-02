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
_this forceAddUniform "STAF_U_I_CombatUniform_light_DPM_Desert_Sand_Shortsleeve";
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_morphine";};
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_personalAidKit";
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_tourniquet";};
_this addItemToUniform "SmokeShell";
_this addVest "V_TacVestIR_blk";
_this addItemToVest "hlc_muzzle_556NATO_KAC";
for "_i" from 1 to 8 do {_this addItemToVest "ACE_elasticBandage";};
_this addItemToVest "ACE_morphine";
for "_i" from 1 to 8 do {_this addItemToVest "ACE_packingBandage";};
_this addItemToVest "ACE_tourniquet";
_this addItemToVest "ACE_Kestrel4500";
_this addItemToVest "ACE_ATragMX";
for "_i" from 1 to 2 do {_this addItemToVest "16Rnd_9x21_Mag";};
_this addItemToVest "SmokeShellGreen";
for "_i" from 1 to 9 do {_this addItemToVest "hlc_30rnd_556x45_EPR";};
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
_this addHeadgear "H_Booniehat_khk_hs";
_this addGoggles "G_Bandanna_tan";

comment "Add weapons";
_this addWeapon "hlc_rifle_SAMR";
_this addPrimaryWeaponItem "ACE_muzzle_mzls_L";
_this addPrimaryWeaponItem "optic_AMS";
_this addWeapon "hgun_Rook40_F";
_this addHandgunItem "muzzle_snds_L";
_this addWeapon "Rangefinder";
_this addItemToVest "16Rnd_9x21_Mag";
_this addMagazine "hlc_30rnd_556x45_EPR";

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