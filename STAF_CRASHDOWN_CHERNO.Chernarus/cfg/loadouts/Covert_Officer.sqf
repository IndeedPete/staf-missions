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
_this forceAddUniform "STAF_U_BG_Guerilla2_1_Steppentarn";
for "_i" from 1 to 4 do {_this addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_morphine";};
_this addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_CableTie";};
_this addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_IR_Strobe_Item";};
for "_i" from 1 to 2 do {_this addItemToUniform "11Rnd_45ACP_Mag";};
_this addVest "V_TacVestIR_blk";
for "_i" from 1 to 5 do {_this addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
_this addItemToVest "Chemlight_green";
_this addItemToVest "Chemlight_red";
_this addItemToVest "Chemlight_yellow";
_this addItemToVest "Chemlight_blue";
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellYellow";
_this addItemToVest "SmokeShellRed";
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShellPurple";
_this addItemToVest "SmokeShellBlue";
_this addItemToVest "SmokeShellOrange";
for "_i" from 1 to 2 do {_this addItemToVest "HandGrenade";};
_this addBackpack "B_TacticalPack_oli";
for "_i" from 1 to 4 do {_this addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_this addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 3 do {_this addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_this addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 3 do {_this addItemToBackpack "ACE_quikclot";};
_this addItemToBackpack "muzzle_snds_M";
_this addItemToBackpack "muzzle_snds_acp";
_this addItemToBackpack "ACE_NVG_Gen2";
_this addItemToBackpack "acc_pointer_IR";
for "_i" from 1 to 2 do {_this addItemToBackpack "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToBackpack "SmokeShell";};
for "_i" from 1 to 3 do {_this addItemToBackpack "B_IR_Grenade";};
for "_i" from 1 to 10 do {_this addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
for "_i" from 1 to 2 do {_this addItemToBackpack "Laserbatteries";};
_this addHeadgear "H_Watchcap_cbr";
_this addGoggles "G_Bandanna_aviator";

comment "Add weapons";
_this addWeapon "arifle_TRG21_F";
_this addPrimaryWeaponItem "acc_flashlight";
_this addPrimaryWeaponItem "optic_MRCO";
_this addWeapon "hgun_Pistol_heavy_01_F";
_this addWeapon "Laserdesignator";
_this addMagazine "30Rnd_556x45_Stanag_Tracer_Red";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemcTab";