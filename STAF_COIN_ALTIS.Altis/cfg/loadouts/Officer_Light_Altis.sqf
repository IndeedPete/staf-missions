comment "Exported from Arsenal by IndeedPete";

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add containers";
_this forceAddUniform "IP_U_B_CombatUniform_mcam_EFAltis";
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_tourniquet";
_this addItemToUniform "ACE_morphine";
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_IR_Strobe_Item";};
_this addItemToUniform "ACE_EarPlugs";
_this addItemToUniform "Chemlight_green";
_this addItemToUniform "Chemlight_red";
_this addItemToUniform "Chemlight_yellow";
_this addItemToUniform "Chemlight_blue";
for "_i" from 1 to 2 do {_this addItemToUniform "MiniGrenade";};
_this addVest "IP_V_TacVest_EFAltis";
_this addItemToVest "ACE_morphine";
_this addItemToVest "ACE_elasticBandage";
_this addItemToVest "ACE_packingBandage";
_this addItemToVest "ACE_fieldDressing";
_this addItemToVest "ACE_quikclot";
_this addItemToVest "16Rnd_9x21_Mag";
for "_i" from 1 to 4 do {_this addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellYellow";
_this addItemToVest "SmokeShellRed";
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShellPurple";
_this addItemToVest "SmokeShellBlue";
_this addBackpack "STAF_tf_anarc210_Sage";
for "_i" from 1 to 3 do {_this addItemToBackpack "ACE_CableTie";};
_this addItemToBackpack "ACE_personalAidKit";
_this addItemToBackpack "SmokeShellOrange";
_this addHeadgear "IP_H_MilCap_mcamoEFAltis";

comment "Add weapons";
_this addWeapon "IP_arifle_MXC_Sage_F";
_this addPrimaryWeaponItem "ACE_muzzle_mzls_H";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addPrimaryWeaponItem "optic_Aco";
_this addWeapon "hgun_P07_F";
_this addWeapon "Rangefinder";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemcTab";
_this linkItem "NVGoggles";