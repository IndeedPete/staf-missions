params [
	["_vehicles", [], [[]]],
	"_res",
	"_br"
];
if (count _vehicles == 0) exitWith {"No vehicles given!" call BIS_fnc_error};
_res = "";
_br = toString [13, 10];

{
	private ["_backpackCargo", "_itemCargo", "_magazineCargo", "_weaponCargo"];
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
	_backpackCargo = "Backpack Cargo" + _br;
	_itemCargo = "Item Cargo" + _br;
	_magazineCargo = "Magazine Cargo" + _br;
	_weaponCargo = "Weapon Cargo" + _br;
	
	{
		_element = _x select 0;
		_count = _x select 1;
		_name = getText(configFile >> "CfgVehicles" >> _element >> "displayName");
		_backpackCargo = _backpackCargo + str(_count) + "x " + _name + _br;
	} forEach ([(backpackCargo _x)] call STAF_fnc_clusterArray);
	
	{
		_element = _x select 0;
		_count = _x select 1;
		_name = getText(configFile >> "CfgWeapons" >> _element >> "displayName");
		_itemCargo = _itemCargo + str(_count) + "x " + _name + _br;
	} forEach ([(itemCargo _x)] call STAF_fnc_clusterArray);
	
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
	
	_res = _res + _displayName + _br + _br + _backpackCargo + _br + _br + _itemCargo + _br + _br + _magazineCargo + _br + _br + _weaponCargo + _br + _br + _br;
} forEach _vehicles;

copyToClipboard _res;
hint "Copied vehicle loadouts to clipboard!";
_res