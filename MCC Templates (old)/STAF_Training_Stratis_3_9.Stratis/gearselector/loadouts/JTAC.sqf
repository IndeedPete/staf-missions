removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "IP_U_B_CombatUniform_Splinter_Altis";
for "_i" from 1 to 3 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
player addItemToUniform "11Rnd_45ACP_Mag";
player addVest "IP_V_PlateCarrier1_rgrEF";
player addItemToVest "muzzle_snds_H";
player addItemToVest "muzzle_snds_acp";
player addItemToVest "ACE_personalAidKit";
for "_i" from 1 to 2 do {player addItemToVest "ACE_packingBandage";};
player addItemToVest "ACE_tourniquet";
player addItemToVest "ACE_morphine";
for "_i" from 1 to 2 do {player addItemToVest "ACE_elasticBandage";};
player addItemToVest "ACE_EarPlugs";
player addItemToVest "ACE_IR_Strobe_Item";
for "_i" from 1 to 8 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addItemToVest "HandGrenade";
for "_i" from 1 to 2 do {player addItemToVest "ACE_HuntIR_M203";};
player addBackpack "STAF_tf_rt1523g_big_altis";
player addItemToBackpack "ACE_HuntIR_monitor";
player addItemToBackpack "ACE_MapTools";
player addItemToBackpack "ACE_IR_Strobe_Item";
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellPurple";};
player addItemToBackpack "SmokeShellGreen";
for "_i" from 1 to 2 do {player addItemToBackpack "B_IR_Grenade";};
player addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_HuntIR_M203";};
for "_i" from 1 to 2 do {player addItemToBackpack "Laserbatteries";};
player addHeadgear "IP_H_HelmetSpecB_Green";

player addWeapon "IP_arifle_MX_GL_Sage_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Hamr";
player addWeapon "hgun_Pistol_heavy_01_F";
player addWeapon "Laserdesignator_03";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_rf7800str_4";
player linkItem "ItemcTab";
player linkItem "NVGoggles_INDEP";
