params [
	["_mission", "", [""]]
];

if (_mission == "") exitWith {
	["Mission key is empty!"] call BIS_fnc_error;
};

(_mission in (missionNamespace getVariable ["IP_COIN_MissionsDone", []]))