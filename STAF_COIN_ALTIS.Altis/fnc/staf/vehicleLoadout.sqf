if !(isServer) exitWith {};

params [
	["_veh", ObjNull, [ObjNull]],
	["_template", "", [""]],
	"_cfg"
];

if (_template == "") then {
	_template = _veh getVariable ["IP_LoadoutTemplate", "vehicleDefault"];
};

_cfg = missionConfigFile >> "CfgVehicleLoadouts" >> _template;
if (isClass _cfg) then {
	_backpackCargo = getArray(_cfg >> "backpackCargo");
	_itemCargo = getArray(_cfg >> "itemCargo");
	_magazineCargo = getArray(_cfg >> "magazineCargo");
	_weaponCargo = getArray(_cfg >> "weaponCargo");
	_attachments = "true" configClasses _cfg;
	
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	
	{_veh addBackpackCargoGlobal _x} forEach _backpackCargo;
	{_veh addItemCargoGlobal _x} forEach _itemCargo;
	{_veh addMagazineCargoGlobal _x} forEach _magazineCargo;
	{_veh addWeaponCargoGlobal _x} forEach _weaponCargo;
	
	{
		_attachTo = getArray(_x >> "attachTo");
		_className = getText(_x >> "className");
		_vectorDirAndUp = getArray(_x >> "vectorDirAndUp");
		
		_object = _className createVehicle (getPos _veh);
		_wh = nearestObject [_object, "GroundWeaponHolder"];
		_wh attachTo [_veh, _attachTo];
		_wh setVectorDirAndUp _vectorDirAndUp;
	} forEach _attachments;
};