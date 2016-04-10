player allowDamage false;

// Respawn before and after arriving at the depot.
if !(triggerActivated trgDepot) then {
	removeAllWeapons player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	removeVest player;
	player unlinkItem "NVGoggles_INDEP";
	player unlinkItem "ItemGPS";
	player unlinkItem "ItemRadio";
	
	for "_i" from 1 to 4 do {player addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 3 do {player addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 3 do {player addItemToUniform "ACE_elasticBandage";};
	player addItemToUniform "ACE_tourniquet";
	player addItemToUniform "ACE_morphine";
	for "_i" from 1 to 3 do {player addItemToUniform "ACE_quikclot";};
	player addItemToUniform "ACE_EarPlugs";
	player addItemToUniform "SmokeShell";
	player addItemToUniform "Chemlight_green";
	player addItemToUniform "Chemlight_red";
	player addItemToUniform "Chemlight_yellow";
	player addItemToUniform "Chemlight_blue";
	player addItemToUniform "16Rnd_9x21_Mag";
	player addItemToUniform "ACE_Flashlight_XL50";
	player addWeapon "hgun_P07_F";
	player addItemToUniform "16Rnd_9x21_Mag";
	
	if ((getNumber(configFile >> "CfgVehicles" >> (typeOf player) >> "attendant")) == 1) then {
		player addBackPack "STAF_B_Kitbag_medic_rgr";
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 15 do {player addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 8 do {player addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 3 do {player addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 9 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 5 do {player addItemToBackpack "ACE_atropine";};
		for "_i" from 1 to 6 do {player addItemToBackpack "ACE_epinephrine";};
		player addItemToBackpack "ACE_personalAidKit";
		player addItemToBackpack "ACE_surgicalKit";
		for "_i" from 1 to 5 do {player addItemToBackpack "ACE_EarPlugs";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_bodyBag";};
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_250";};
	};
};

if !(IP_TESTMODE) then {
	sleep 60;
	player allowDamage true;
};