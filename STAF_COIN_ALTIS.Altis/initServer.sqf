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

// Mission
call(compileFinal(preProcessFileLineNumbers "missions\missions.sqf")); // Compile Main Mission Flows