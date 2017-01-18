removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "IP_U_B_CombatUniform_mcam_EFBlackWolf";
for "_i" from 1 to 2 do {player addItemToUniform "20Rnd_762x51_Mag";};
for "_i" from 1 to 2 do {player addItemToUniform "11Rnd_45ACP_Mag";};
player addVest "IP_V_PlateCarrier2_blkEFWolf";
player addItemToVest "acc_flashlight";
for "_i" from 1 to 3 do {player addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_CableTie";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_EarPlugs";};
player addItemToVest "ACE_epinephrine";
player addItemToVest "ACE_IR_Strobe_Item";
player addItemToVest "ACE_morphine";
for "_i" from 1 to 3 do {player addItemToVest "ACE_packingBandage";};
player addItemToVest "ACE_personalAidKit";
player addItemToVest "ACE_tourniquet";
player addItemToVest "ACE_ATragMX";
for "_i" from 1 to 7 do {player addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
player addBackpack "B_AssaultPack_blk";
player addItemToBackpack "ACE_Kestrel4500";
player addItemToBackpack "ACE_Clacker";
player addItemToBackpack "ACE_DefusalKit";
player addItemToBackpack "ACE_MapTools";
player addItemToBackpack "ACE_Flashlight_XL50";
for "_i" from 1 to 3 do {player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "APERSBoundingMine_Range_Mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "APERSTripMine_Wire_Mag";};
player addHeadgear "IP_H_HelmetB_Black";
player addGoggles "G_Balaclava_blk";

player addWeapon "srifle_DMR_03_F";
player addPrimaryWeaponItem "muzzle_snds_B";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_DMS";
player addPrimaryWeaponItem "bipod_01_F_blk";
player addWeapon "hgun_Pistol_heavy_01_F";
player addHandgunItem "muzzle_snds_acp";
player addWeapon "Rangefinder";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_rf7800str_3";
player linkItem "ItemAndroid";
player linkItem "NVGoggles_OPFOR";
