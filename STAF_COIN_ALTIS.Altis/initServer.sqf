// Variables
IP_TESTMODE = true;

// Communicate dem vars
{publicVariable _x} forEach ["IP_TESTMODE"];

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] execVM "zbe_cache\main.sqf";

// Shop init, for Mercs. Probably not even needed.
// [true, true, [], [[],[],[]], true] call IP_fnc_shopInit;

// Init Zones. // Moved to init.sqf for HC.
// [] call IP_fnc_initZones;

// Missions
call(compileFinal(preProcessFileLineNumbers "missions\missions.sqf")); // Compile Main Mission Flows

// Throw Away!
[] spawn {
	waitUntil {!(isNil "iedsAdded") && {iedsAdded}};
	["IED_Section_M01", ["mM01", [0.33, 0, 0, 100] , ["West", "CIV"]]] call CREATE_IED_SECTION;
};

// Tasks
{
	_x remoteExecCall ["BIS_fnc_taskCreate", 0, true];
} forEach [
	[west, "tM01", [(format ["Callsign %1 reported a possible IED in <marker name=""mM01"">Koroni</marker>. Secure the area and clear the possible IED threat.", (groupID IP_M01_Group)]), "Clear IED Threat", "Possible IED"], "mM01", false, 1]
];