// Variables
IP_TESTMODE = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_LaterMarkers = ["mMeet", "mLZ"];

// Communicate dem Vars
publicVariable "IP_TESTMODE";
publicVariable "IP_FrontLine";

// Hide zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;
{_x setMarkerAlpha 0} forEach IP_LaterMarkers;

// Respawn
// [missionNamespace, "mStart", (markerText "mStart")] call BIS_fnc_addRespawnPosition;

// Tasks
[west, "tEvidence", ["Find evidence for or against the Norwegian government co-operating with CSAT!", "Find Evidence", ""], objNull, false, 1, false, "intel"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tAlpha", ["Search <marker name=""mEBase1"">Base Alpha</marker> for evidence!", "Investigate Base Alpha", "Base Alpha"], "mEBase1", false, 7, false, "a"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tRadio", "tAlpha"], ["Download the radio protocols of the <marker name=""mOffice1"">Comm Centre</marker>!", "Download Protocols", "Comm Centre"], "mOffice1", true, 7, false, "radio"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tBravo", ["Search <marker name=""mEBase2"">Base Bravo</marker> for evidence!", "Investigate Base Bravo", "Base Bravo"], "mEBase2", false, 6, false, "b"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tZulu", ["Search <marker name=""mFacility"">Object Zulu</marker> for evidence!", "Investigate Object Zulu", "Object Zulu"], "mFacility", false, 5, false, "z"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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
// [1, 0.02, 0] call BIS_fnc_setFog;

// Mission Flow
[] spawn {
	// Radio Protocols
	waitUntil {!(isNil "IP_RadioDone") && {IP_RadioDone}};
	["tRadio", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {!(isNil "IP_AlphaDone") && {IP_AlphaDone}};
	["tAlpha", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {!(isNil "IP_BravoDone") && {IP_BravoDone}};
	["tBravo", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {!(isNil "IP_ZuluStarted") && {IP_ZuluStarted}};
	[west, ["tFiles", "tZulu"], ["Download files from <marker name=""mFacility"">Object Zulu's</marker> main frame!", "Download Data", "Object Zulu"], "mFacility", true, 7, true, "download"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	waitUntil {!(isNil "IP_ZuluDone") && {IP_ZuluDone}};
	["tFiles", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tZulu", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	sleep 10;
	
	waitUntil {!(isNil "IP_AlphaDone") && {IP_AlphaDone}};
	"mMeet" setMarkerAlpha 1;
	[(IP_HiddenUnits getVariable ["end", []]), true] call STAF_fnc_enable;
	[west, "tYankee", ["The files and protocols downloaded indicate that a meeting is taking place between a Norwegian government official and a high-ranking officer of a yet unknown party at <marker name=""mMeet"">Object Yankee</marker>. Secure <marker name=""mMeet"">Object Yankee</marker>, kill or capture the government official, and identify the other party!", "Investigate Object Yankee", "Object Yankee"], "mMeet", true, 1, true, "y"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tSecure", "tYankee"], ["Secure <marker name=""mMeet"">Object Yankee</marker>. Neutralise all enemy forces!", "Secure Object Yankee", "Object Yankee"], "mMeet", true, 10, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tHVI", "tYankee"], ["Capture the Norwegian government official at <marker name=""mMeet"">Object Yankee</marker>!", "Capture HVI", "Object Yankee"], "mMeet", false, 9, true, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tSuitcase", "tYankee"], ["Secure all evidence the Norwegian government official at <marker name=""mMeet"">Object Yankee</marker> carries (suitcases, files, etc.)!", "Secure Evidence", "Object Yankee"], "mMeet", false, 8, true, "documents"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tIdentify", "tYankee"], ["Identify the other party at <marker name=""mMeet"">Object Yankee</marker>!", "Identify Other Party", "Object Yankee"], "mMeet", false, 7, true, "whiteboard"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
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