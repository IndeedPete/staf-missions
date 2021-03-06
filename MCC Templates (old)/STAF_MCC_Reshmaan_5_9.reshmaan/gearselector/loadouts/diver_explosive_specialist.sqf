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
player addBackpack "IP_B_Carryall_blk";
player addItemToBackpack "NVGoggles_OPFOR";
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "ACE_DefusalKit";
player addItemToBackpack "ACE_EarPlugs";
player addItemToBackpack "ACE_epinephrine";
player addItemToBackpack "ACE_IR_Strobe_Item";
player addItemToBackpack "ACE_Flashlight_XL50";
player addItemToBackpack "ACE_morphine";
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_packingBandage";};
player addItemToBackpack "ACE_personalAidKit";
player addItemToBackpack "ACE_tourniquet";
player addItemToBackpack "ACE_Clacker";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_M14";};
for "_i" from 1 to 2 do {player addItemToBackpack "B_IR_Grenade";};
for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellGreen";};
player addItemToBackpack "SmokeShellPurple";
player addItemToBackpack "SmokeShellRed";
for "_i" from 1 to 2 do {player addItemToBackpack "SatchelCharge_Remote_Mag";};
player addItemToBackpack "DemoCharge_Remote_Mag";
player addGoggles "G_B_Diving";

player addWeapon "arifle_SDAR_F";
player addWeapon "hgun_Pistol_heavy_01_F";
player addHandgunItem "muzzle_snds_acp";
player addWeapon "Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_rf7800str_7";
player linkItem "ItemAndroid";
