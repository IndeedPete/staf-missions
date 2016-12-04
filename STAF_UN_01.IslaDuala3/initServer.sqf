// Variables
IP_TESTMODE = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[west, "tArrive", ["Arrive at <marker name=""mBase"">Fort Koofra</marker> and take over command!", "Arrive at Fort Koofra", "Fort Koofra"], "mBase", true, 6, false, "move"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tDefend", ["Hold <marker name=""mBase"">Fort Koofra</marker>!", "Hold Fort Koofra", "Fort Koofra"], "mBase", false, 6, false, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		//_x allowDamage false;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
		[_x] call STAF_fnc_disable;
	};//*/
} forEach (allMissionObjects "All");

// AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
//

/*/ Mission Flow
[] spawn {
	waitUntil {{alive _x} count IP_Trucks < 3};
	["tTrucks", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_Fail"] call BIS_fnc_endMissionServer;
};*/

[] spawn {
	waitUntil {triggerActivated trgArrive};
	[west, "mBase", (markerText "mBase")] call BIS_fnc_addRespawnPosition; 
	["tArrive", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];	
	
	sleep 5;
	
};//*/