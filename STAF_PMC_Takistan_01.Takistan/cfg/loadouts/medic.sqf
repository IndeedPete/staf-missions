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
_this forceAddUniform "STAF_U_BG_Guerrilla_4_1_tan_vegetato";
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_personalAidKit";
_this addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 10 do {_this addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_morphine";};
_this addItemToUniform "9Rnd_45ACP_Mag";
_this addVest "LOP_V_CarrierLite_TAN";
_this addItemToVest "9Rnd_45ACP_Mag";
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShellBlue";
_this addItemToVest "SmokeShellOrange";
for "_i" from 1 to 3 do {_this addItemToVest "hlc_10rnd_12g_buck_S12";};
for "_i" from 1 to 4 do {_this addItemToVest "hlc_10rnd_12g_slug_S12";};
_this addBackpack "STAF_B_Kitbag_medic_cbr";
for "_i" from 1 to 40 do {_this addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 60 do {_this addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 4 do {_this addItemToBackpack "ACE_personalAidKit";};
for "_i" from 1 to 4 do {_this addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 10 do {_this addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 10 do {_this addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 4 do {_this addItemToBackpack "ACE_salineIV";};
for "_i" from 1 to 6 do {_this addItemToBackpack "ACE_salineIV_500";};
for "_i" from 1 to 8 do {_this addItemToBackpack "ACE_salineIV_250";};
_this addItemToBackpack "ACE_surgicalKit";
_this addHeadgear "H_Bandanna_khk_hs";
_this addGoggles "G_Spectacles_Tinted";

comment "Add weapons";
_this addWeapon "hlc_rifle_saiga12k";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addWeapon "Binocular";
_this addItemToVest "hlc_10rnd_12g_buck_S12";
_this addMagazine "9Rnd_45ACP_Mag";

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