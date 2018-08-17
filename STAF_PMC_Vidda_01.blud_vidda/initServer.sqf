// Variables
IP_TESTMODE = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_LaterMarkers = [];

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
// [west, "tOversee", ["Oversee the unloading of US military equipment by the ESF.", "Oversee Logistics", ""], objNull, true, 1, false, "container"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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

/*/ Mission Flow
[] spawn {
	waitUntil {!(isNil "IP_StartDone") && {IP_StartDone}};
	["tOversee", "CANCELED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
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