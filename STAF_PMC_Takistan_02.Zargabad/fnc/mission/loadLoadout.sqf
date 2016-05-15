params [
	["_unit", ObjNull, [ObjNull]],
	["_db", "STAF_CMP_PMC_TAKISTAN", [""]],
	["_table", "TBL_Players", [""]],
	"_inidbi",
	"_loadout"
];

_inidbi = ["new", _db] call OO_INIDBI;
_key = str(_unit);
_loadout = ["read", [_table, _key, []]] call _inidbi;

if (count _loadout > 0) then {
	if (isNil "BIS_fnc_saveInventory_data") then {
		BIS_fnc_saveInventory_data = [];
	};
	
	if (BIS_fnc_saveInventory_data find _key < 0) then {
		BIS_fnc_saveInventory_data pushBackUnique _key;
		BIS_fnc_saveInventory_data pushBackUnique _loadout;
	};
	
	[_unit, [missionNamespace, _key]] call BIS_fnc_loadInventory;
} else {
	_template = switch (_unit) do {
		case (missionNamespace getVariable ["IP_Executive", ObjNull]): {"executive"};
		case (missionNamespace getVariable ["IP_Leader", ObjNull]): {"detail_leader"};
		case (missionNamespace getVariable ["IP_AR", ObjNull]): {"ar"};
		case (missionNamespace getVariable ["IP_Marksman", ObjNull]): {"marksman"};
		case (missionNamespace getVariable ["IP_LAT", ObjNull]): {"lat"};
		case (missionNamespace getVariable ["IP_Scout", ObjNull]): {"scout"};
		case (missionNamespace getVariable ["IP_Engineer", ObjNull]): {"engineer"};
		case (missionNamespace getVariable ["IP_Medic", ObjNull]): {"medic"};
		case (missionNamespace getVariable ["IP_GL", ObjNull]): {"GL"};
		case (missionNamespace getVariable ["IP_Rifleman_M4", ObjNull]): {"M4"};
		case (missionNamespace getVariable ["IP_Rifleman_AK12", ObjNull]): {"AK12"};
		case (missionNamespace getVariable ["IP_Pilot", ObjNull]): {"pilot"};
		default {""};
	};

	if (_template != "") then {
		_handle = player execVM ("cfg\loadouts\" + _template + ".sqf");
		//waitUntil {scriptDone _handle};
	//} else {
	//	systemChat "There is no default loadout defined for this class. Why don't you create one and send it to IndeedPete?";
	};
};