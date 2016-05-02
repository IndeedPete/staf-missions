// Variables
IP_TESTMODE = true;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] execVM "zbe_cache\main.sqf";

// Hide Flight Path Dots
{
	if (markerType _x == "hd_dot") then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Track Units
if (IP_TESTMODE) then {
	{
		[(leader _x)] call IP_fnc_track;
	} forEach allGroups;
} else {
	for "_i" from 1 to 10 do {
		("mPat" + str(_i)) setMarkerAlpha 0;
	};
};

// Force Lights On
{
	if (side _x == west) then {
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";
	};
} forEach allUnits;

[] spawn {	
	while {true} do {
		{
			if ((side _x == west) && {alive _x}) then {
				_x enableGunLights "forceOn";
			};
		} forEach allUnits;
		
		sleep 5;
	};
};

// Rainy Season Weather
[] spawn {
	_min = 180;
	_max = 300;
	_transMin = 30;
	_tansMax = 60;
	
	while {true} do {
		_duration = _min + random(_max - _min);
		_trans = _transMin + random(_tansMax - _transMin);
		
		_trans setRain 1;
		_trans setFog [0, 0.01, 0];
		
		sleep (_duration + _trans);
		
		_trans setRain 0;
		_trans setFog [0.5, 0.01, 0];
		
		sleep (_duration + _trans);
	};	
};

/*/ Offload AI to HCs
{
	_zone = _x getVariable ["GAIA_ZONE_INTEND", []];
	if (count _zone > 0) then {
		if (((_zone select 0) == "mPat1") && {!(local IP_HC1)}) then {
			_x setGroupOwner (owner IP_HC1);
		};
		
		if (({(_zone select 0) == _x} count ["mPat2", "mPat3", "mPat4", "mPat5", "mPat6", "mPat7", "mPat8"] > 0) && {!(local IP_HC2)}) then {
			_x setGroupOwner (owner IP_HC2);
		};
	};
} forEach allGroups;*/

/*/ Tasks & Mission Flow
[west, "tDepot", ["Regroup at the <marker name=""mDepot"">Old USMC Depot</marker> and acquire leftover weapons and vehicles!", "Regroup at Depot", "Depot"], "mDepot", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tLZ", ["Reach the <marker name=""mLZ"">Pick-Up Point</marker> and extract from Chernarus! All units need to be there at the same time to complete the task, we leave no man behind!", "Reach the Pick-Up", "Pick-Up"], "mLZ", false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[] spawn {
	waitUntil {triggerActivated trgDepot};
	["tDepot", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	_pos = getMarkerPos "mDepot";
	{
		_x setMarkerPos _pos;
	} forEach ["respawn_west_1", "respawn_west_2", "respawn_west_3"];
	
	120 setRain 0;
	180 setFog [0.5, 0.01, 200];
	//240 setOvercast 0.75;
	//forceWeatherChange;
	
	waitUntil {triggerActivated trgEnd};
	["tLZ", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["Won"] call BIS_fnc_endMissionServer;
};*/