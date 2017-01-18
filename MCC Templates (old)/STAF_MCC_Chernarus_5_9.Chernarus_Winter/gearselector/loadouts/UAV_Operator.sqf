removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "IP_U_B_CombatUniform_Crystal_Snow_Wolf";
for "_i" from 1 to 3 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
player addItemToUniform "11Rnd_45ACP_Mag";
player addVest "IP_V_PlateCarrier1_snwEF";
player addItemToVest "muzzle_snds_H";
player addItemToVest "muzzle_snds_acp";
player addItemToVest "ACE_personalAidKit";
for "_i" from 1 to 2 do {player addItemToVest "ACE_packingBandage";};
player addItemToVest "ACE_tourniquet";
player addItemToVest "ACE_morphine";
for "_i" from 1 to 2 do {player addItemToVest "ACE_elasticBandage";};
player addItemToVest "ACE_EarPlugs";
player addItemToVest "ACE_IR_Strobe_Item";
player addItemToVest "ItemAndroid";
for "_i" from 1 to 8 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addItemToVest "HandGrenade";
player addBackpack "B_UAV_01_backpack_F";
player addHeadgear "IP_H_HelmetSpecB_White";

player addWeapon "IP_arifle_MX_White_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Hamr";
player addWeapon "hgun_Pistol_heavy_01_F";

player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_anprc152_2";
player linkItem "B_UavTerminal";
player linkItem "IP_NVGoggles_SNW";
