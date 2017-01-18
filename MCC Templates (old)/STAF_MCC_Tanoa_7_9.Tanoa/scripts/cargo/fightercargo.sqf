private ["_fighter"];
_fighter = param [0, ObjNull];

if (isNull _fighter) exitWith {};

// Clear Inventory
clearWeaponCargoGlobal _fighter;
clearMagazineCargoGlobal _fighter;
clearBackpackCargoGlobal _fighter;
clearItemCargoGlobal _fighter;

//Weapons

//Magazines

//Items

//Backpack
_fighter addBackpackCargoGlobal ["B_AssaultPack_blk",1];
{if (typeof _x == "B_AssaultPack_blk") then {
      _x addItemCargoGlobal ["Toolkit",1];
     };
} forEach (everyBackpack _fighter);

_fighter addBackpackCargoGlobal ["STAF_tf_rt1523g_Green", 1];
_fighter addBackpackCargoGlobal ["B_B_Parachute_02_F", 2];