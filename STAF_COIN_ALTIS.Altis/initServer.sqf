// Variables
IP_TESTMODE = true;

// Communicate dem vars
{publicVariable _x} forEach ["IP_TESTMODE"];

// Shop init, for Mercs. Probably not even needed.
[true, true, [], [[],[],[]], true] call IP_fnc_shopInit;

// Init Zones.
"mMeasure" setMarkerAlpha 0;
[] call IP_fnc_initZones; 