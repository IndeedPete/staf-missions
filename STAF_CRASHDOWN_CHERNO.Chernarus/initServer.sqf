// Variables
IP_TESTMODE = true;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] execVM "zbe_cache\main.sqf";

// Track Units
if (IP_TESTMODE) then {
	{
		[(leader _x)] call IP_fnc_track;
	} forEach allGroups;
} else {
	"mPat1" setMarkerAlpha 0;
};

// Force Lights On
{
	if (side _x == east) then {
		_x addPrimaryWeaponItem "rhs_acc_2dpZenit";
		_x enableGunLights "forceOn";
	};
} forEach allUnits;

[] spawn {	
	while {true} do {
		{
			if ((side _x == east) && {alive _x}) then {
				_x enableGunLights "forceOn";
			};
		} forEach allUnits;
		
		sleep 5;
	};
};

// Tasks & Mission Flow
[west, "tDepot", ["Regroup at the <marker name=""mDepot"">Old USMC Depot</marker> and acquire leftover weapons and vehicles!", "Regroup at Depot", "Depot"], "mDepot", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[] spawn {
	waitUntil {triggerActivated trgDepot};
	["tDepot", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	/*
	for "_i" from 0 to 2 do {
		[west, _i] call BIS_fnc_removeRespawnPosition;
	};
	[west, "mDepot"] call BIS_fnc_addRespawnPosition;
	*/
	
	_pos = getMarkerPos "mDepot";
	{
		_x setMarkerPos _pos;
	} forEach ["respawn_west_1", "respawn_west_2", "respawn_west_3"];
	
	120 setRain 0;
	180 setFog [0.5, 0.01, 200];
	//240 setOvercast 0.75;
	//forceWeatherChange;
};