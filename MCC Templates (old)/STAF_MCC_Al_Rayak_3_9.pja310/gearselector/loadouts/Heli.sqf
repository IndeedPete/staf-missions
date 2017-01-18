removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "IP_U_B_HeliPilotCoveralls_EF";
for "_i" from 1 to 4 do {player addItemToUniform "30Rnd_9x21_Mag_SMG_02";};
player addVest "V_TacVest_oli";
for "_i" from 1 to 3 do {player addItemToVest "ACE_elasticBandage";};
player addItemToVest "ACE_EarPlugs";
player addItemToVest "ACE_epinephrine";
player addItemToVest "ACE_IR_Strobe_Item";
player addItemToVest "ACE_morphine";
player addItemToVest "ACE_personalAidKit";
for "_i" from 1 to 3 do {player addItemToVest "ACE_packingBandage";};
player addItemToVest "ACE_tourniquet";
player addItemToVest "B_IR_Grenade";
player addItemToVest "ACE_HandFlare_Green";
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addItemToVest "SmokeShellGreen";
player addHeadgear "H_PilotHelmetHeli_O";

player addWeapon "SMG_02_F";
player addPrimaryWeaponItem "ACE_muzzle_mzls_smg_02";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Aco_smg";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_anprc152_8";
player linkItem "ItemAndroid";
player linkItem "NVGoggles_INDEP";
