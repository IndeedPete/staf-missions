removeAllWeapons Player;
removeAllItems Player;
removeAllAssignedItems Player;
removeUniform Player;
removeVest Player;
removeBackpack Player;
removeHeadgear Player;
removeGoggles Player;

Player forceAddUniform "IP_U_B_CombatUniform_Splinter_Altis";
for "_i" from 1 to 4 do {Player addItemToUniform "30Rnd_65x39_caseless_mag";};
Player addVest "IP_V_PlateCarrier1_rgrEF";
Player addItemToVest "muzzle_snds_H";
Player addItemToVest "muzzle_snds_acp";
Player addItemToVest "11Rnd_45ACP_Mag";
for "_i" from 1 to 8 do {Player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 3 do {Player addItemToVest "3Rnd_HE_Grenade_shell";};
Player addBackpack "IP_B_AssaultPack_EFAltis";
for "_i" from 1 to 3 do {Player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 3 do {Player addItemToBackpack "ACE_CableTie";};
Player addItemToBackpack "ACE_EarPlugs";
Player addItemToBackpack "ACE_HuntIR_monitor";
for "_i" from 1 to 2 do {Player addItemToBackpack "ACE_IR_Strobe_Item";};
Player addItemToBackpack "ACE_Flashlight_XL50";
Player addItemToBackpack "ACE_MapTools";
Player addItemToBackpack "ACE_morphine";
for "_i" from 1 to 3 do {Player addItemToBackpack "ACE_packingBandage";};
Player addItemToBackpack "ACE_personalAidKit";
Player addItemToBackpack "ACE_tourniquet";
for "_i" from 1 to 2 do {Player addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {Player addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 5 do {Player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 2 do {Player addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
Player addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
for "_i" from 1 to 3 do {Player addItemToBackpack "UGL_FlareCIR_F";};
for "_i" from 1 to 3 do {Player addItemToBackpack "UGL_FlareWhite_F";};
for "_i" from 1 to 3 do {Player addItemToBackpack "ACE_HuntIR_M203";};
Player addItemToBackpack "B_IR_Grenade";
Player addItemToBackpack "ACE_M14";
Player addHeadgear "IP_H_HelmetSpecB_Green";

Player addWeapon "IP_arifle_MX_GL_Sage_F";
Player addPrimaryWeaponItem "acc_pointer_IR";
Player addPrimaryWeaponItem "optic_Hamr";
Player addWeapon "hgun_Pistol_heavy_01_F";
Player addWeapon "Binocular";

Player linkItem "ItemMap";
Player linkItem "ItemCompass";
Player linkItem "ItemWatch";
Player linkItem "tf_anprc152_3";
Player linkItem "ItemcTab";
Player linkItem "NVGoggles_INDEP";
