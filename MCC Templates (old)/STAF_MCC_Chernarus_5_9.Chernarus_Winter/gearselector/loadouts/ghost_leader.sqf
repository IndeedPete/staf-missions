removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "IP_U_B_CombatUniform_mcam_EFBlackWolf";
for "_i" from 1 to 3 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
player addItemToUniform "11Rnd_45ACP_Mag";
player addVest "IP_V_PlateCarrier2_blkEFWolf";
player addItemToVest "acc_flashlight";
for "_i" from 1 to 2 do {player addItemToVest "11Rnd_45ACP_Mag";};
for "_i" from 1 to 8 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_HuntIR_M203";};
for "_i" from 1 to 2 do {player addItemToVest "3Rnd_UGL_FlareCIR_F";};
player addItemToVest "Laserbatteries";
player addBackpack "B_TacticalPack_blk";
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 8 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "ACE_EarPlugs";
player addItemToBackpack "ACE_epinephrine";
player addItemToBackpack "ACE_HuntIR_monitor";
player addItemToBackpack "ACE_IR_Strobe_Item";
player addItemToBackpack "ACE_Flashlight_XL50";
player addItemToBackpack "ACE_MapTools";
player addItemToBackpack "ACE_morphine";
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_packingBandage";};
player addItemToBackpack "ACE_personalAidKit";
player addItemToBackpack "ACE_tourniquet";
for "_i" from 1 to 4 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
player addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 2 do {player addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_M14";};
for "_i" from 1 to 2 do {player addItemToBackpack "B_IR_Grenade";};
player addItemToBackpack "ACE_HandFlare_Green";
for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToBackpack "SmokeShell";};
player addItemToBackpack "Laserbatteries";
player addHeadgear "IP_H_HelmetB_Black";
player addGoggles "G_Balaclava_blk";

player addWeapon "IP_arifle_MX_GL_Black_F";
player addPrimaryWeaponItem "muzzle_snds_H";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Hamr";
player addWeapon "hgun_Pistol_heavy_01_F";
player addHandgunItem "muzzle_snds_acp";
player addWeapon "Laserdesignator_03";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_anprc152_1";
player linkItem "ItemcTab";
player linkItem "NVGoggles_OPFOR";