// Variables
IP_TESTMODE = true;

// Communicate dem vars
{publicVariable _x} forEach ["IP_TESTMODE"];

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] execVM "zbe_cache\main.sqf";

// Shop init, for Mercs. Probably not even needed.
// [true, true, [], [[],[],[]], true] call IP_fnc_shopInit;

// Init Zones.
[] call IP_fnc_initZones; 