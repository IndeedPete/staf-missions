// Variables
IP_TESTMODE = false;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_LaterMarkers = ["mLZ"];

// Communicate dem Vars
publicVariable "IP_TESTMODE";

// Hide zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;
{_x setMarkerAlpha 0} forEach IP_LaterMarkers;

// Respawn
[missionNamespace, "mStart", (markerText "mStart")] call BIS_fnc_addRespawnPosition;

// Tasks
[west, "tEvidence", ["Find evidence for or against the Norwegian government co-operating with CSAT!", "Find Evidence", ""], objNull, false, 1, false, "intel"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tYankee", ["The files and protocols downloaded indicate that a meeting is taking place between a Norwegian government official and a high-ranking officer of a yet unknown party at <marker name=""mMeet"">Object Yankee</marker>. Secure <marker name=""mMeet"">Object Yankee</marker>, kill or capture the government official, and identify the other party!", "Investigate Object Yankee", "Object Yankee"], "mMeet", true, 1, true, "y"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tSecure", "tYankee"], ["Secure <marker name=""mMeet"">Object Yankee</marker>. Neutralise all enemy forces!", "Secure Object Yankee", "Object Yankee"], "mMeet", true, 10, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tHVI", "tYankee"], ["Capture the Norwegian government official at <marker name=""mMeet"">Object Yankee</marker>!", "Capture HVI", "Object Yankee"], "mMeet", false, 9, true, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tSuitcase", "tYankee"], ["Secure all evidence the Norwegian government official at <marker name=""mMeet"">Object Yankee</marker> carries (suitcases, files, etc.)!", "Secure Evidence", "Object Yankee"], "mMeet", false, 8, true, "documents"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tIdentify", "tYankee"], ["Identify the other party at <marker name=""mMeet"">Object Yankee</marker>!", "Identify Other Party", "Object Yankee"], "mMeet", false, 7, true, "whiteboard"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		[_x, true] call STAF_fnc_disable;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
	};//*/
} forEach (allMissionObjects "All");

// Weather
[1, 0.02, 0] call BIS_fnc_setFog;

// Mission Flow
[] spawn {
	[(IP_HiddenUnits getVariable ["end", []]), true] call STAF_fnc_enable;
	waitUntil {!(isNil "IP_YankeeStarted") && {IP_YankeeStarted}};
	[west, ["tTruck", "tYankee"], ["Secure the device truck at <marker name=""mMeet"">Object Yankee</marker>!", "Secure Truck", "Object Yankee"], "mMeet", false, 6, true, "car"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	[] spawn {
		waitUntil {!(isNil "IP_SecureDone") && {IP_SecureDone}};
		["tSecure", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	[] spawn {
		waitUntil {!(isNil "IP_HVIDone") && {IP_HVIDone}};
		if (alive IP_HVI) then {
			["tHVI", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
		} else {
			["tHVI", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
		};
	};
	
	[] spawn {
		waitUntil {!(isNil "IP_SuitcaseDone") && {IP_SuitcaseDone}};
		["tSuitcase", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	[] spawn {
		waitUntil {!(isNil "IP_IdentifyDone") && {IP_IdentifyDone}};
		["tIdentify", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	[] spawn {
		waitUntil {!(isNil "IP_TruckStarted") && {IP_TruckStarted}};
		"mLZ" setMarkerAlpha 1;
		[(IP_HiddenUnits getVariable ["lz", []]), true] call STAF_fnc_enable;
		["tTruck", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
		[west, ["tLZ", "tYankee"], ["A NATO team has secured an <marker name=""mLZ"">LZ called X-Ray</marker>. Deliver the device truck to them!", "Deliver Truck", "LZ X-Ray"], "mLZ", false, 5, true, "takeoff"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
		waitUntil {!(isNil "IP_TruckDone") && {IP_TruckDone}};
		["tLZ", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	waitUntil {!(isNil "IP_SecureDone") && {IP_SecureDone} && !(isNil "IP_HVIDone") && {IP_HVIDone} && !(isNil "IP_SuitcaseDone") && {IP_SuitcaseDone} && !(isNil "IP_IdentifyDone") && {IP_IdentifyDone} && !(isNil "IP_TruckDone") && {IP_TruckDone}};
	sleep 5;
	["tYankee", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {!(isNil "IP_EvidenceDone") && {IP_EvidenceDone}};
	["tEvidence", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};