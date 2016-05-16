params [
	["_units", [], [[]]],
	"_res",
	"_br"
];
if (count _units == 0) exitWith {"No units given!" call BIS_fnc_error};
_res = "";
_br = toString [13, 10];

{
	private ["_containers", "_weapons", "_loadedMags", "_magazines", "_items", "_assignedItems"];
	_displayName = str(_x);//getDescription _x;
	_containers = "Wearables" + _br;
	_backpack = if (backpack _x != "") then {"Backpack" + _br + (getText(configFile >> "CfgVehicles" >> (backpack _x) >> "displayName"))} else {"Backpack"};
	_weapons = "Weapons" + _br;
	_loadedMags = [];
	_magazines = "Magazines" + _br;
	_items = "Items" + _br;
	_assignedItems = "Assigned Items" + _br;
	
	{
		_element = _x;
		_name = if (isClass(configFile >> "CfgWeapons" >> _element)) then {(getText(configFile >> "CfgWeapons" >> _element >> "displayName"))} else {(getText(configFile >> "CfgGlasses" >> _element >> "displayName"))};
		_containers = _containers + _name + _br;
	} forEach [(headgear _x), (goggles _x), (vest _x), (uniform _x)];
	
	{
		_weapon = getText(configFile >> "CfgWeapons" >> (_x select 0) >> "displayName");
		_muzzle = getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName");
		_pointer = getText(configFile >> "CfgWeapons" >> (_x select 2) >> "displayName");
		_optic = getText(configFile >> "CfgWeapons" >> (_x select 3) >> "displayName");
		_bipod = if (typeName (_x select 5) == typeName "") then {
			(getText(configFile >> "CfgWeapons" >> (_x select 5) >> "displayName"))
		} else {
			if (typeName (_x select 5) == typeName []) then {
				_loadedMags pushBack ((_x select 5) select 0);
			};
			""
		};
		
		{
			if (typeName _x == typeName "") then {
				_loadedMags pushBack _x;
			};
		} forEach (_x select 4);
		
		_weapons = _weapons + (format ["%1 (%2, %3, %4, %5)", _weapon, _muzzle, _pointer, _optic, _bipod]) + _br;
	} forEach (weaponsItems _x);
	
	{
		_element = _x select 0;
		_count = _x select 1;
		_name = getText(configFile >> "CfgMagazines" >> _element >> "displayName");
		_magazines = _magazines + str(_count) + "x " + _name + _br;
	} forEach ([((magazines _x) + _loadedMags)] call STAF_fnc_clusterArray);
	
	{
		_element = _x select 0;
		_count = _x select 1;
		_name = getText(configFile >> "CfgWeapons" >> _element >> "displayName");
		_items = _items + str(_count) + "x " + _name + _br;
	} forEach ([(items _x)] call STAF_fnc_clusterArray);
	
	{
		_name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		_assignedItems = _assignedItems + _name + _br;
	} forEach ((assignedItems _x) - [(binocular _x)]);
	
	_res = _res + _displayName + _br + _br + _containers + _br + _br + _backpack + _br + _br + _weapons + _br + _br + _magazines + _br + _br + _items + _br + _br + _assignedItems + _br + _br + _br;
} forEach _units;

copyToClipboard _res;
hint "Copied unit loadouts to clipboard!";
_res