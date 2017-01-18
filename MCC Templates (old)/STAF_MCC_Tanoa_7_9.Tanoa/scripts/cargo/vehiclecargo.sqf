private ["_vehicle"];
_vehicle = param [0, ObjNull];

if (isNull _vehicle) exitWith {};

// Clear Inventory
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;

//Weapons
_vehicle addWeaponCargoGlobal ["IP_arifle_MX_Black_F", 1];
_vehicle addWeaponCargoGlobal ["launch_NLAW_F", 2];

//Magazines
_vehicle addMagazineCargoGlobal ["10Rnd_338_Mag", 7];
_vehicle addMagazineCargoGlobal ["130Rnd_338_Mag", 10];
_vehicle addMagazineCargoGlobal ["5Rnd_127x108_Mag", 10];
_vehicle addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
_vehicle addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 30];
_vehicle addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 15];
_vehicle addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 15];
_vehicle addMagazineCargoGlobal ["20Rnd_762x51_Mag", 7];
_vehicle addMagazineCargoGlobal ["Titan_AT", 3];
_vehicle addMagazineCargoGlobal ["Titan_AP", 2];
_vehicle addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 3];
_vehicle addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

//Items
_vehicle addItemCargoGlobal ["ACE_atropine", 10];
_vehicle addItemCargoGlobal ["ACE_epinephrine", 10];
_vehicle addItemCargoGlobal ["ACE_morphine", 10];
_vehicle addItemCargoGlobal ["ACE_fieldDressing", 15];
_vehicle addItemCargoGlobal ["ACE_packingBandage", 15];
_vehicle addItemCargoGlobal ["ACE_quikclot", 15];
_vehicle addItemCargoGlobal ["ACE_elasticBandage", 15];
_vehicle addItemCargoGlobal ["ACE_bloodIV", 5];
_vehicle addItemCargoGlobal ["ACE_bloodIV_500", 7];
_vehicle addItemCargoGlobal ["ACE_bloodIV_250", 10];
_vehicle addItemCargoGlobal ["ACE_personalAidKit", 5];
_vehicle addItemCargoGlobal ["ACE_tourniquet", 2];
_vehicle addItemCargoGlobal ["ACE_EarPlugs", 3];
_vehicle addItemCargoGlobal ["ACE_bodyBag", 5];
_vehicle addItemCargoGlobal ["ACE_Tripod", 1];
_vehicle addItemCargoGlobal ["ACE_wirecutter", 1];
_vehicle addItemCargoGlobal ["ACE_CableTie", 4];
_vehicle addItemCargoGlobal ["ACE_IR_Strobe_Item", 6];

//Repair Backpack
_vehicle addBackpackCargoGlobal ["B_AssaultPack_blk",2];
{if (typeof _x == "B_AssaultPack_blk") then {
      _x addItemCargoGlobal ["Toolkit",1];
     };
} forEach (everyBackpack _vehicle);