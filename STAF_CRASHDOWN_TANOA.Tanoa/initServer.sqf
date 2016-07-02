// Variables
IP_TESTMODE = true;
IP_RespawnMarkers = [];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCC_Zone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
	
	if (_x find "respawn_west" >= 0) then {
		IP_RespawnMarkers pushBack _x;
	};
} forEach allMapMarkers;

// Weather
// [1, 0.1, 20] call BIS_fnc_setFog;

// Tasks & Mission Flow
[west, "tRegroup", ["Regroup at the <marker name=""mRegroup"">Regroup Point</marker>!", "Regroup", "Regroup"], "mRegroup", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tExit", ["Raid the <marker name=""mFly"">Tanoa Airport</marker> for an airborne vehicle and <marker name=""mExit"">escape from Tanoa</marker>!", "Escape from Tanoa", "Pick-Up"], "mExit", false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

[] spawn {
	waitUntil {triggerActivated trgRegroup};
	["tRegroup", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	/*
	for "_i" from 0 to 2 do {
		[west, _i] call BIS_fnc_removeRespawnPosition;
	};
	[west, "mRegroup"] call BIS_fnc_addRespawnPosition;
	*/
	
	_pos = getMarkerPos "mRegroup";
	{
		_x setMarkerPos _pos;
	} forEach IP_RespawnMarkers;	
	180 setFog [0, 0, 0];
	
	waitUntil {triggerActivated trgExit};
	["tExit", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["CTRG_Win"] call BIS_fnc_endMissionServer;
};