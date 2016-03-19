params [
	["_mission", "", [""]],
	["_params", [], [[], "", ObjNull, GrpNull, 0]],
	"_missionFlow"
];

if (_mission == "") exitWith {
	["No mission key given!"] call BIS_fnc_error;
};

if (missionNamespace getVariable [("IP_" + _mission + "_Started"), false]) exitWith {
	if (IP_TESTMODE) then {
		systemChat (format ["Mission %1 is already running.", _mission]);
	};
};

if ([_mission] call IP_fnc_missionDone) exitWith {
	if (IP_TESTMODE) then {
		systemChat (format ["Mission %1 has been completed already.", _mission]);
	};
};

_missionFlow = "IP_mission_" + _mission;
_params remoteExec [_missionFlow, 2];
missionNamespace setVariable [("IP_" + _mission + "_Started"), true, true];

if (IP_TESTMODE) then {
	systemChat (format ["Mission %1 has been started.", _mission]);
};