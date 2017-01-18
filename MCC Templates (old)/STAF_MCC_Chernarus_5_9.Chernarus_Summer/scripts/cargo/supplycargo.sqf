private ["_supply"];
_supply = param [0, ObjNull];

if (isNull _supply) exitWith {};

// Clear Inventory
clearWeaponCargoGlobal _supply;
clearMagazineCargoGlobal _supply;
clearBackpackCargoGlobal _supply;
clearItemCargoGlobal _supply;

//Weapons

//Magazines
_supply addMagazineCargoGlobal ["10Rnd_338_Mag", 4];
_supply addMagazineCargoGlobal ["130Rnd_338_Mag", 7];
_supply addMagazineCargoGlobal ["5Rnd_127x108_Mag", 7];
_supply addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 7];
_supply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 15];
_supply addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 7];
_supply addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 7];
_supply addMagazineCargoGlobal ["20Rnd_762x51_Mag", 4];
_supply addMagazineCargoGlobal ["Titan_AT", 1];
_supply addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
_supply addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 2];

//Items
_supply addItemCargoGlobal ["ACE_atropine", 7];
_supply addItemCargoGlobal ["ACE_epinephrine", 7];
_supply addItemCargoGlobal ["ACE_morphine", 7];
_supply addItemCargoGlobal ["ACE_fieldDressing", 15];
_supply addItemCargoGlobal ["ACE_packingBandage", 15];
_supply addItemCargoGlobal ["ACE_quikclot", 15];
_supply addItemCargoGlobal ["ACE_elasticBandage", 15];
_supply addItemCargoGlobal ["ACE_bloodIV", 5];
_supply addItemCargoGlobal ["ACE_bloodIV_500", 7];
_supply addItemCargoGlobal ["ACE_bloodIV_250", 10];
_supply addItemCargoGlobal ["ACE_personalAidKit", 5];
_supply addItemCargoGlobal ["ACE_tourniquet", 3];
_supply addItemCargoGlobal ["ACE_EarPlugs", 3];
_supply addItemCargoGlobal ["ACE_bodyBag", 3];
_supply addItemCargoGlobal ["ACE_wirecutter", 1];
_supply addItemCargoGlobal ["ACE_CableTie", 4];
_supply addItemCargoGlobal ["ACE_IR_Strobe_Item", 4];

//Repair Backpack
_supply addBackpackCargoGlobal ["B_AssaultPack_blk",1];
{if (typeof _x == "B_AssaultPack_blk") then {
      _x addItemCargoGlobal ["Toolkit",1];
     };
} forEach (everyBackpack _supply);