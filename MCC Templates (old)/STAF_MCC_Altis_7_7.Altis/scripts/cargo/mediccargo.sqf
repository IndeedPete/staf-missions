private ["_medic"];
_medic = param [0, ObjNull];

if (isNull _medic) exitWith {};

// Clear Inventory
clearWeaponCargoGlobal _medic;
clearMagazineCargoGlobal _medic;
clearBackpackCargoGlobal _medic;
clearItemCargoGlobal _medic;

//Weapons


//Magazines


//Items
_medic addItemCargoGlobal ["ACE_atropine", 10];
_medic addItemCargoGlobal ["ACE_epinephrine", 10];
_medic addItemCargoGlobal ["ACE_morphine", 10];
_medic addItemCargoGlobal ["ACE_fieldDressing", 20];
_medic addItemCargoGlobal ["ACE_packingBandage", 40];
_medic addItemCargoGlobal ["ACE_quikclot", 20];
_medic addItemCargoGlobal ["ACE_elasticBandage", 25];
_medic addItemCargoGlobal ["ACE_salineIV", 8];
_medic addItemCargoGlobal ["ACE_salineIV_500", 10];
_medic addItemCargoGlobal ["ACE_salineIV_250", 14];
_medic addItemCargoGlobal ["ACE_personalAidKit", 10];
_medic addItemCargoGlobal ["ACE_tourniquet", 2];
_medic addItemCargoGlobal ["ACE_EarPlugs", 3];
_medic addItemCargoGlobal ["ACE_bodyBag", 5];

//Backpack