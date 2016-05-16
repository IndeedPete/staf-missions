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
_this forceAddUniform "STAF_U_BG_Guerilla2_1_Steppentarn";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_morphine";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_personalAidKit";
_this addItemToUniform "ACE_tourniquet";
_this addItemToUniform "ACE_EarPlugs";
_this addVest "V_TacVest_oli";
for "_i" from 1 to 2 do {_this addItemToVest "16Rnd_9x21_Mag";};
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellGreen";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 7 do {_this addItemToVest "hlc_30rnd_556x45_EPR";};
_this addBackpack "B_Kitbag_cbr";
_this addItemToBackpack "hlc_muzzle_556NATO_KAC";
_this addItemToBackpack "ACE_Clacker";
_this addItemToBackpack "ToolKit";
_this addItemToBackpack "MineDetector";
_this addItemToBackpack "ACE_DefusalKit";
for "_i" from 1 to 2 do {_this addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 10 do {_this addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 2 do {_this addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 10 do {_this addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_this addItemToBackpack "DemoCharge_Remote_Mag";};
_this addItemToBackpack "SatchelCharge_Remote_Mag";
_this addHeadgear "rhsusf_bowman_cap";
_this addGoggles "G_Bandanna_beast";

comment "Add weapons";
_this addWeapon "hlc_rifle_RU5562";
_this addPrimaryWeaponItem "optic_MRCO";
_this addWeapon "hgun_Rook40_F";
_this addHandgunItem "muzzle_snds_L";
_this addWeapon "Binocular";
_this addItemToVest "16Rnd_9x21_Mag";
_this addItemToVest "hlc_30rnd_556x45_EPR";

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