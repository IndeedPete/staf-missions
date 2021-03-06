removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_B_Wetsuit";
for "_i" from 1 to 9 do {player addItemToUniform "20Rnd_556x45_UW_mag";};
for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
player addVest "V_RebreatherB";
player addBackpack "B_Kitbag_rgr";
player addItemToBackpack "NVGoggles_OPFOR";
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "ACE_DefusalKit";
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_EarPlugs";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_epinephrine";};
player addItemToBackpack "ACE_IR_Strobe_Item";
player addItemToBackpack "ACE_Flashlight_XL50";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 25 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_personalAidKit";};
player addItemToBackpack "ACE_tourniquet";
for "_i" from 1 to 7 do {player addItemToBackpack "ACE_adenosine";};
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_salineIV";};
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_salineIV_500";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_250";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_M14";};
for "_i" from 1 to 2 do {player addItemToBackpack "B_IR_Grenade";};
for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellGreen";};
player addItemToBackpack "SmokeShellPurple";
player addItemToBackpack "SmokeShellRed";
player addHeadgear "IP_H_HelmetB_Black";
player addGoggles "G_B_Diving";

player addWeapon "arifle_SDAR_F";
player addWeapon "hgun_Pistol_heavy_01_F";
player addHandgunItem "muzzle_snds_acp";
player addWeapon "Binocular";

player linkItem "ItemMap";
player linkItem "ItemWatch";
player linkItem "tf_rf7800str_6";
player linkItem "ItemAndroid";
