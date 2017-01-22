removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_B_FullGhillie_ard";
for "_i" from 1 to 4 do {player addItemToUniform "20Rnd_762x51_Mag";};
player addItemToUniform "11Rnd_45ACP_Mag";
player addVest "IP_V_PlateCarrier1_khkEF";
player addItemToVest "ACE_personalAidKit";
for "_i" from 1 to 10 do {player addItemToVest "ACE_elasticBandage";};
player addItemToVest "ACE_EarPlugs";
player addItemToVest "ACE_DefusalKit";
player addItemToVest "ACE_epinephrine";
player addItemToVest "ACE_MapTools";
player addItemToVest "ACE_Clacker";
player addItemToVest "ACE_morphine";
for "_i" from 1 to 3 do {player addItemToVest "ACE_packingBandage";};
player addItemToVest "ACE_tourniquet";
player addItemToVest "11Rnd_45ACP_Mag";
for "_i" from 1 to 8 do {player addItemToVest "20Rnd_762x51_Mag";};
player addBackpack "B_Kitbag_cbr";
player addItemToBackpack "ACE_surgicalKit";
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_salineIV";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_250";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_salineIV_500";};
player addItemToBackpack "B_IR_Grenade";
player addItemToBackpack "ACE_HandFlare_Green";
player addItemToBackpack "ACE_Kestrel4500";
Player addItemToBackpack "ACE_ATragMX";
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellGreen";};
player addItemToBackpack "SmokeShellPurple";
for "_i" from 1 to 3 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 3 do {player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
for "_i" from 1 to 3 do {player addItemToBackpack "10Rnd_338_Mag";};
player addHeadgear "IP_H_HelmetSpecB_khaki";

player addWeapon "srifle_DMR_03_tan_F";
player addPrimaryWeaponItem "muzzle_snds_B";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_LRPS";
player addPrimaryWeaponItem "bipod_01_F_blk";
player addWeapon "hgun_Pistol_heavy_01_F";
player addHandgunItem "muzzle_snds_acp";
player addWeapon "Laserdesignator";

player linkItem "tf_anprc152_7";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemAndroid";
player linkItem "NVGoggles";