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
_this forceAddUniform "U_BG_leader";
for "_i" from 1 to 4 do {_this addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 2 do {_this addItemToUniform "ACE_morphine";};
_this addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_CableTie";};
_this addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 3 do {_this addItemToUniform "ACE_IR_Strobe_Item";};
for "_i" from 1 to 2 do {_this addItemToUniform "16Rnd_9x21_Mag";};
_this addVest "V_Chestrig_khk";
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
_this addItemToVest "Chemlight_green";
for "_i" from 1 to 13 do {_this addItemToVest "10Rnd_762x54_Mag";};
_this addBackpack "B_FieldPack_oli";
for "_i" from 1 to 4 do {_this addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_this addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 3 do {_this addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_this addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 3 do {_this addItemToBackpack "ACE_quikclot";};
_this addItemToBackpack "ACE_NVG_Gen2";
_this addItemToBackpack "acc_pointer_IR";
_this addItemToBackpack "muzzle_snds_L";
_this addItemToBackpack "muzzle_snds_B";
_this addItemToBackpack "ACE_Clacker";
for "_i" from 1 to 2 do {_this addItemToBackpack "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToBackpack "SmokeShell";};
for "_i" from 1 to 4 do {_this addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
for "_i" from 1 to 2 do {_this addItemToBackpack "10Rnd_762x54_Mag";};
_this addHeadgear "H_Booniehat_oli";
_this addGoggles "G_Tactical_Black";

comment "Add weapons";
_this addWeapon "srifle_DMR_01_F";
_this addPrimaryWeaponItem "acc_flashlight";
_this addPrimaryWeaponItem "optic_DMS";
_this addPrimaryWeaponItem "bipod_02_F_tan";
_this addWeapon "hgun_Rook40_F";
_this addWeapon "Rangefinder";
_this addMagazine "10Rnd_762x54_Mag";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemAndroid";