player allowDamage false;	
for "_i" from 1 to 8 do {player addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 6 do {player addItemToUniform "ACE_elasticBandage";};
player addItemToUniform "ACE_tourniquet";
player addItemToUniform "ACE_morphine";
player unlinkItem "ItemGPS";
//player addItemToUniform "ACE_EarPlugs";
	
if ((getNumber(configFile >> "CfgVehicles" >> (typeOf player) >> "attendant")) == 1) then {
	removeBackpack player;
	player addBackPack "B_Kitbag_rgr";
	//for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 30 do {player addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 20 do {player addItemToBackpack "ACE_elasticBandage";};
	//for "_i" from 1 to 8 do {player addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 4 do {player addItemToBackpack "ACE_tourniquet";};
	for "_i" from 1 to 10 do {player addItemToBackpack "ACE_morphine";};
	//for "_i" from 1 to 5 do {player addItemToBackpack "ACE_atropine";};
	for "_i" from 1 to 3 do {player addItemToBackpack "ACE_epinephrine";};
	player addItemToBackpack "ACE_personalAidKit";
	player addItemToBackpack "ACE_surgicalKit";
	//for "_i" from 1 to 5 do {player addItemToBackpack "ACE_EarPlugs";};
	for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_500";};
	//for "_i" from 1 to 4 do {player addItemToBackpack "ACE_bodyBag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV";};
	for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_250";};
};

if !(IP_TESTMODE) then {
	sleep 60;
	player allowDamage true;
};