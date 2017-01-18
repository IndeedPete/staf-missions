removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;


player forceAddUniform "IP_U_B_CombatUniform_Crystal_Snow_Wolf";
player addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 3 do {player addItemToUniform "ACE_elasticBandage";};
player addItemToUniform "ACE_morphine";
for "_i" from 1 to 3 do {player addItemToUniform "ACE_packingBandage";};
player addItemToUniform "ACE_personalAidKit";
player addItemToUniform "ACE_tourniquet";
player addVest "IP_V_PlateCarrier1_snwEF";
player addItemToVest "muzzle_snds_H_MG";
player addItemToVest "200Rnd_65x39_cased_Box";
for "_i" from 1 to 2 do {player addItemToVest "B_IR_Grenade";};
player addItemToVest "HandGrenade";
for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
player addBackpack "IP_B_Kitbag_Splinter_Snow";
for "_i" from 1 to 3 do {player addItemToBackpack "200Rnd_65x39_cased_Box";};
for "_i" from 1 to 2 do {player addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";};
player addHeadgear "IP_H_HelmetSpecB_White";

player addWeapon "LMG_Mk200_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Arco";
player addPrimaryWeaponItem "bipod_01_F_snd";
player addWeapon "Binocular";

player linkItem "tf_rf7800str_2";
player linkItem "ItemAndroid";
player linkItem "IP_NVGoggles_SNW";
