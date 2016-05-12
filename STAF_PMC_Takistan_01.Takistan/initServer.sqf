// Variables
IP_TESTMODE = true;
IP_Vehicles = [IP_Car1, IP_Car2, IP_MRAP, IP_Heli];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Hide Zhe Markerz
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCC_Zone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Destroyed Houses
[IP_DestructionCentre, 6000] spawn BIS_fnc_destroyCity;

// Tasks
[independent, "tTransport", ["Escort the Client to a <marker name=""mDest"">Road to Zargabad in Northern Takistan</marker>!", "Escort Client", "Road to Zargabad"], "mDest", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tClient", ["The Client must not die or the mission will fail!", "Protect Client", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tVehicles", ["COMMANDER'S INTENT: do not lose more than one vehicle! (OPTIONAL)", "Preserve Vehicles (OPTIONAL)", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Mission Flows
[] spawn {
	waitUntil {(alive IP_Client) && {(vehicle IP_Client) inArea "mDestArea"}};
	["tTransport", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tClient", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	if ({alive _x} count IP_Vehicles >= 3) then {
		["tVehicles", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};	
	["Won"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {!(alive IP_Client)};
	["tClient", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tTransport", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tVehicles", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["Lost"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {{alive _x} count IP_Vehicles < 3};
	["tVehicles", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};