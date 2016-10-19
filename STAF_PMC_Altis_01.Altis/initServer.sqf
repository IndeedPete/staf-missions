// Variables
IP_TESTMODE = true;
IP_Trucks = [IP_Truck1, IP_Truck2, IP_Truck3, IP_Truck4, IP_Truck5];
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_CargoObjs = [];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
//[west, "tAidWorkers", ["Locate and evacuate the <marker name=""mAidWorkers"">Aid Workers</marker> in Katkoula!", "Evacuate Aid Workers", (markerText "mAidWorkers")], "mAidWorkers", true, 6, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
//[west, "tAgent", ["Locate and evacuate code name 'Horizon'!", "Evacuate Horizon", ""], nil, false, 6, false, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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
	
	if (_x getVariable ["IP_CargoObjs", false]) then {
		IP_CargoObjs pushBack _x;
	};
} forEach (allMissionObjects "All");

// AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
[west, "mBase", (markerText "mBase")] call BIS_fnc_addRespawnPosition;

// Weather
[] spawn {
	(60 * 60) setFog [0, 0, 0];
};

/*/ Mission Flow
[] spawn {
	waitUntil {{alive _x} count IP_AidWorkers == 0};
	["tAidWorkers", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_Fail"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {{(alive _x) && {_x distance IP_Centre <= 250}} count IP_AidWorkers == {alive _x} count IP_AidWorkers};
	["tAidWorkers", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	IP_HintFound = true;
	publicVariable "IP_HintFound";
	[(IP_HiddenUnits getVariable ["Russians", []])] call STAF_fnc_enable;
	
	// Garbage Collection
	[] spawn STAF_fnc_repetitiveCleanup;
};

[] spawn {
	waitUntil {!(alive IP_Agent)};
	["tAgent", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["STAF_Fail"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {(alive IP_Agent) && {IP_Agent distance IP_Centre <= 250}};
	["tAgent", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[west, "tSafehouse", ["Destroy Horizon's Safehouse on grid 036106!", "Destroy Safehouse", ""], nil, true, 6, true, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	IP_HintFound = true;
	publicVariable "IP_HintFound";
	[(IP_HiddenUnits getVariable ["Safehouse", []])] call STAF_fnc_enable;
};

[] spawn {
	waitUntil {!(alive IP_AmmoBox)};
	{deleteVehicle _x} forEach IP_SafehouseObjs;
	[(getPos IP_SafeHouse), "FIRE_BIG"] remoteExec ["STAF_fnc_createFireEffect", 0, true];
	["tSafehouse", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};*/