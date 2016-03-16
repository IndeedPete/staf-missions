params [
	["_key", "", [""]],
	["_params", [], [[], "", ObjNull, GrpNull, 0]],
	"_missionFlow"
];

if (_key == "") exitWith {
	["No mission key given!"] call BIS_fnc_error;
};

_missionFlow = "IP_mission_" + _key;
_params remoteExec [_missionFlow, 2];

if (IP_TESTMODE) then {
	systemChat (format ["Mission %1 has been started.", _key]);
};