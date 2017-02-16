// Variables
IP_TESTMODE = true;
IP_Pilots = [IP_Pilot1, IP_Pilot2, IP_Pilot3, IP_Pilot4];
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;

// Communicate dem Vars
publicVariable "IP_TESTMODE";
publicVariable "IP_Pilots";

// Hide zhe Markerz
"mCrash_Real" setMarkerAlpha 0;
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Respawn
[west, "mBase", (markerText "mBase")] call BIS_fnc_addRespawnPosition;

// Tasks
[west, "tLocate", ["Locate the <marker name=""mCrash"">Crash Site in Zargabad</marker>!", "Locate the Crash Site", "Possible Crash Site"], "mCrash", true, 6, false, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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

// Destroy Le City
[(getMarkerPos "mCentre"), 1000] call BIS_fnc_destroyCity;

// Le PPEffect
["STAF_RealIsBrown"] call BIS_fnc_setPPeffectTemplate;

// Le Mission Flow
[] spawn {
	waitUntil {triggerActivated trgLocate};	
	["tLocate", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	"mCrash_Real" setMarkerAlpha 1;
	[west, "tDefend", ["Defend the <marker name=""mCrash_Real"">Crash Site in Zargabad</marker> until the pioneers arrive!", "Defend the Crash Site", "Crash Site"], "mCrash_Real", true, 6, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
};