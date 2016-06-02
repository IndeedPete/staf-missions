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
_this forceAddUniform "STAF_U_B_CombatUniform_MCAM_Arid_Black_vest";
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_personalAidKit";
_this addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_tourniquet";};
_this addVest "STAF_V_PlateCarrierL_Pete_Arid";
_this addItemToVest "hlc_muzzle_545SUP_AK";
for "_i" from 1 to 3 do {_this addItemToVest "11Rnd_45ACP_Mag";};
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellGreen";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 7 do {_this addItemToVest "hlc_30Rnd_545x39_EP_ak";};
_this addItemToVest "SmokeShellBlue";
_this addItemToVest "SmokeShellOrange";
_this addHeadgear "H_Cap_blk_ION";
_this addGoggles "G_Tactical_Clear";

comment "Add weapons";
_this addWeapon "hlc_rifle_ak12";
_this addPrimaryWeaponItem "optic_Hamr";
_this addWeapon "hgun_Pistol_heavy_01_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "optic_MRD";
_this addWeapon "Rangefinder";
_this addItemToVest "hlc_30Rnd_545x39_EP_ak";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "tf_anprc148jem";
_this linkItem "ItemcTab";
/*
comment "Set identity";
_this setFace "WhiteHead_03";
_this setSpeaker "ACE_NoVoice";*/