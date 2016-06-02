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
_this forceAddUniform "STAF_U_BG_Guerilla1_1_US_Desert_Choc_Chip";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_EarPlugs";
_this addItemToUniform "ACE_morphine";
_this addItemToUniform "ACE_personalAidKit";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_tourniquet";
_this addVest "V_Chestrig_khk";
for "_i" from 1 to 10 do {_this addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_this addItemToVest "ACE_morphine";};
for "_i" from 1 to 10 do {_this addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 2 do {_this addItemToVest "ACE_tourniquet";};
for "_i" from 1 to 2 do {_this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 7 do {_this addItemToVest "hlc_20Rnd_762x51_B_M14";};
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShellRed";
_this addItemToVest "SmokeShellYellow";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
_this addItemToVest "Laserbatteries";
_this addHeadgear "H_Cap_usblack";
_this addGoggles "G_Shades_Black";

comment "Add weapons";
_this addWeapon "hlc_rifle_m14sopmod";
_this addPrimaryWeaponItem "hlc_muzzle_snds_M14";
_this addPrimaryWeaponItem "optic_Nightstalker";
_this addPrimaryWeaponItem "bipod_01_F_blk";
_this addWeapon "hgun_P07_F";
_this addHandgunItem "muzzle_snds_L";
_this addWeapon "Laserdesignator_03";
_this addItemToVest "16Rnd_9x21_Mag";
_this addItemToVest "hlc_20Rnd_762x51_B_M14";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "tf_anprc148jem";
_this linkItem "ItemAndroid";
/*
comment "Set identity";
_this setFace "WhiteHead_03";
_this setSpeaker "ACE_NoVoice";*/