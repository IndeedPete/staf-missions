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
	[west, "tYankee", ["The files and protocols downloaded indicate that a meeting is taking place between a Norwegian government official and a high-ranking officer of a yet unknown party at <marker name=""mMeet"">Object Yankee</marker>. Secure <marker name=""mMeet"">Object Yankee</marker>, kill or capture the government official, and identify the other party!", "Investigate Object Yankee", "Object Yankee"], "mMeet", true, 1, true, "y"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tSecure", "tYankee"], ["Secure <marker name=""mMeet"">Object Yankee</marker>. Neutralise all enemy forces!", "Secure Object Yankee", "Object Yankee"], "mMeet", true, 10, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tHVI", "tYankee"], ["Kill or capture the Norwegian government official at <marker name=""mMeet"">Object Yankee</marker>!", "Download Data", "Object Yankee"], "mMeet", false, 9, true, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tSuitcase", "tYankee"], ["Secure all evidence the Norwegian government official at <marker name=""mMeet"">Object Yankee</marker> carries (suitcases, files, etc.)!", "Secure Evidence", "Object Yankee"], "mMeet", false, 8, true, "documents"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tIdentify", "tYankee"], ["Identify the other party at <marker name=""mMeet"">Object Yankee</marker>!", "Identify Other Party", "Object Yankee"], "mMeet", false, 7, true, "whiteboard"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	waitUntil {!(isNil "IP_YankeeStarted") && {IP_YankeeStarted}};
	[west, ["tTruck", "tYankee"], ["Secure the device truck at <marker name=""mMeet"">Object Yankee</marker>!", "Secure Truck", "Object Yankee"], "mMeet", false, 6, true, "car"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
};

/*	
[] spawn {	
	[west, "tInvestigate", ["Investigate what happened at the <marker name=""mDock"">Dock</marker>!", "Investigate Dock", "Dock"], "mDock", true, 6, true, "scout"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	waitUntil {!(isNil "IP_DockDone") && {IP_DockDone}};
	["tInvestigate", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[(IP_HiddenUnits getVariable ["ambush", []]), true] call STAF_fnc_enable;
	[(IP_HiddenUnits getVariable ["meet", []]), true] call STAF_fnc_enable;
	{_x setMarkerAlpha 1} forEach IP_LaterMarkers;
	IP_FrontLine = "mDock";
	publicVariable "IP_FrontLine";
	
	[west, "tTrucks", ["Recover the two stolen trucks full of equipment! Return them back to the <marker name=""mStart"">ESF Military Base</marker>!", "Recover Trucks", ""], objNull, false, 3, true, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, "tMeet", ["Meet with the <marker name=""mMeet"">ESF unit in Eponia</marker>!", "Meet ESF", "ESF Unit"], "mMeet", true, 6, true, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[] spawn {
		waitUntil {
			sleep 5;
			({alive _x} count IP_Trucks == 0)
		};
		
		["tTrucks", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	waitUntil {!(isNil "IP_MeetDone") && {IP_MeetDone}};
	["tMeet", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[(IP_HiddenUnits getVariable ["pass", []]), true] call STAF_fnc_enable;
	IP_FrontLine = "mMeet";
	publicVariable "IP_FrontLine";
	
	[west, "tValley", ["Together with the ESF, secure the <marker name=""mQuest2"">Valley east of the Pico de Revolucion</marker>!", "Secure Valley", "Valley"], "mQuest2", true, 6, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
		
	waitUntil {!(isNil "IP_ValleyDone") && {IP_ValleyDone}};
	["tValley", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {!(isNil "IP_TrucksDone") && {IP_TrucksDone}};
	if ({alive _x} count IP_Trucks > 0) then {
		["tTrucks", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	[west, "tAbandoned", ["A group of Russian stragglers has been sighted at the <marker name=""mAbandoned"">Abandoned ESF Military Base</marker>. Search the area and neutralise the enemy threat! Try to take prisoners for questioning if possible! (Bonus Objective)", "BONUS: Secure Abandoned Military Base", "Abandoned Military Base"], "mAbandoned", true, 6, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[(IP_HiddenUnits getVariable ["abandoned", []]), true] call STAF_fnc_enable;
	IP_Captive allowDamage false;
	
	IP_FrontLine = "mLast";
	publicVariable "IP_FrontLine";
	
	waitUntil {!(isNil "IP_BaseDone") && {IP_BaseDone}};
	
	["tAbandoned", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	// ["STAF_Win"] call BIS_fnc_endMissionServer;
};