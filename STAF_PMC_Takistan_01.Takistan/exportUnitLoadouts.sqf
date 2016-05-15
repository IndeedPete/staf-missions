params [
	["_units", [], [[]]],
	"_res",
	"_br"
];
if (count _units == 0) exitWith {"No vehicles given!" call BIS_fnc_error};
_res = "";
_br = toString [13, 10];

{
	private ["_containers", "_weapons", "_magazineCargo", "_weaponCargo"];
	_displayName = getDescription _x;
	_containers = "Wearables" + _br;
	_backpack = "Backpack" + _br + (getText(configFile >> "CfgVehicles" >> (backpack _x) >> "displayName"));
	_weapons = "Weapons" + _br;
	_magazineCargo = "Magazine Cargo" + _br;
	_weaponCargo = "Weapon Cargo" + _br;
	
	{
		_element = _x;
		_name = getText(configFile >> "CfgWeapons" >> _element >> "displayName");
		_containers = _containers + _name + _br;
	} forEach [(headgear _x), (goggles _x), (vest _x), (uniform _x)];
	
	{
		_element = _x select 0;
		_count = _x select 1;
		_name = getText(configFile >> "CfgWeapons" >> _element >> "displayName");
		_weapons = _weapons + str(_count) + "x " + _name + _br;
	} forEach (weapons _x);
	
	{
		_element = _x select 0;
		_count = _x select 1;
		_name = getText(configFile >> "CfgMagazines" >> _element >> "displayName");
		_magazineCargo = _magazineCargo + str(_count) + "x " + _name + _br;
	} forEach ([(magazineCargo _x)] call STAF_fnc_clusterArray);
	
	{
		_element = _x select 0;
		_count = _x select 1;
		_name = getText(configFile >> "CfgWeapons" >> _element >> "displayName");
		_weaponCargo = _weaponCargo + str(_count) + "x " + _name + _br;
	} forEach ([(weaponCargo _x)] call STAF_fnc_clusterArray);
	
	_res = _res + _displayName + _br + _br + _containers + _br + _br + _backpack + _br + _br + _weapons + _br + _br + _magazineCargo + _br + _br + _weaponCargo + _br + _br + _br;
} forEach _units;

copyToClipboard _res;
hint "Copied vehicle loadouts to clipboard!";
_res