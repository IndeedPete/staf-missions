params [
	["_mission", "", [""]],
	"_task",
	"_missionsDone"
];

if (_mission == "") exitWith {
	["Mission key is empty!"] call BIS_fnc_error;
};

_task = "t" + _mission;
if (_task call BIS_fnc_taskExists) then {
	[_task, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

_missionsDone = missionNamespace getVariable ["IP_COIN_MissionsDone", []];
_missionsDone pushBackUnique _mission;
IP_COIN_MissionsDone = _missionsDone;
publicVariable "IP_COIN_MissionsDone";

if (!(isNil "IP_Persistence") && {IP_Persistence}) then {
	[] call IP_fnc_saveProgress;
};