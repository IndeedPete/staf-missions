// Variables
IP_TESTMODE = false;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_TimeLeft = 90 * 60;

// Communicate dem Vars
publicVariable "IP_TESTMODE";
publicVariable "IP_TimeLeft";

// Funtions

// Hide zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Respawn
[missionNamespace, "mStart", (markerText "mStart")] call BIS_fnc_addRespawnPosition;

// Tasks
[true, "tArty", ["Locate and neutralize the enemy mobile artillery somewhere in the <marker name=""mAO"">AO</marker>!", "Neutralize the Artillery", ""], objNull, true, 6, false, "target"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[true, "tRetreat", ["Retreat back <marker name=""mStart"">south of the red line</marker>!", "Retreat", ""], "mStart", false, 6, false, "run"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[true, "timeLimit", [(format ["Complete all tasks within %1 minutes!", round(IP_TimeLeft / 60)]), "Time Limit", ""], objNull, false, 3, false, "wait"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[true, "tRules", ["Mind the rules! Do not open fire at USMC staff wearing signal vests!", "Mind the Rules", ""], objNull, false, 1, false, "whiteboard"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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

// AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Le PPEffect
["STAF_FilmNoir"] call BIS_fnc_setPPeffectTemplate;

// Weather
[1, 0.02, 0] call BIS_fnc_setFog;

// Timer
[] spawn {
	waitUntil {(triggerActivated trgTimerStart) OR {!(isNil "IP_StartTimer")}};
	if (count(list trgTimerStart) > 0) then {
		(format ["%1 activated the time limit!", (name((list trgTimerStart) select 0))]) remoteExec ["systemChat", 0, false];
	};
	
	// Add Respawn Positions
	{[missionNamespace, _x, (markerText _x)] call BIS_fnc_addRespawnPosition} forEach ["mWest", "mNorth", "mEast"];
	
	IP_TimeEnd = if (isMultiplayer) then {
		(serverTime + IP_TimeLeft)
	} else {
		(time + IP_TimeLeft)
	};
	publicVariable "IP_TimeEnd";
	
	while {(isNil "IP_AllDone") && {IP_TimeLeft > 0}} do {
		IP_TimeLeft = if (isMultiplayer) then {
			(IP_TimeEnd - serverTime)
		} else {
			(IP_TimeEnd - time)
		};
		
		publicVariable "IP_TimeLeft";
		sleep 1;
	};
	
	if (("tArty" call BIS_fnc_taskState) != "SUCCEEDED") then {
		["tArty", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	if (("tRetreat" call BIS_fnc_taskState) != "SUCCEEDED") then {
		["tRetreat", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	if (IP_TimeLeft <= 0) then {
		["timeLimit", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
};

// Win Conditions
[] spawn {
	waitUntil {(IP_TimeLeft > 0) && {!(alive IP_Target) OR !(canMove IP_Target) OR !(canFire IP_Target)}};
	["tArty", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	waitUntil {(IP_TimeLeft > 0) && {triggerActivated trgEvac}};
	IP_AllDone = true;
	publicVariable "IP_AllDone";	
	["tRetreat", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["timeLimit", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

// ["STAF_Win"] call BIS_fnc_endMissionServer;