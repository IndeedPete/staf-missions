private ["_ammo"];
_ammo = param [0, ObjNull];

if (isNull _ammo) exitWith {};

// Clear Inventory
clearWeaponCargoGlobal _ammo;
clearMagazineCargoGlobal _ammo;
clearBackpackCargoGlobal _ammo;
clearItemCargoGlobal _ammo;

//Weapons

//Magazines
_ammo addMagazineCargoGlobal ["10Rnd_338_Mag", 7];
_ammo addMagazineCargoGlobal ["130Rnd_338_Mag", 10];
_ammo addMagazineCargoGlobal ["5Rnd_127x108_Mag", 10];
_ammo addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
_ammo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 30];
_ammo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 15];
_ammo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 15];
_ammo addMagazineCargoGlobal ["20Rnd_762x51_Mag", 7];
_ammo addMagazineCargoGlobal ["Titan_AT", 3];
_ammo addMagazineCargoGlobal ["Titan_AP", 2];
_ammo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 3];
_ammo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
_ammo addMagazineCargoGlobal ["HandGrenade", 8];
_ammo addMagazineCargoGlobal ["MiniGrenade", 8];
_ammo addMagazineCargoGlobal ["SmokeShell", 8];
_ammo addMagazineCargoGlobal ["SmokeShellRed", 4];
_ammo addMagazineCargoGlobal ["SmokeShellGreen", 6];
_ammo addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 8];
_ammo addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 4];
_ammo addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 4];
_ammo addMagazineCargoGlobal ["UGL_FlareCIR_F", 2];
_ammo addMagazineCargoGlobal ["B_IR_Grenade", 6];
_ammo addMagazineCargoGlobal ["UGL_FlareWhite_F", 4];


//Items


//Backpack