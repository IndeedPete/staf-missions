// Variables
IP_TESTMODE = false;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[west, "tAA", ["Destroy the <marker name=""mAA"">Enemy Shilka</marker>!", "Destroy Shilka", (markerText "mAA")], "mAA", true, 6, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tRadar", ["Destroy the enemy air radar!", "Destroy Air Radar", ""], nil, false, 5, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tHostage", ["Secure the hostage and return to the <marker name=""mBase"">USS Khe Sanh</marker>!", "Secure Hostage", ""], nil, false, 4, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	/*_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
		[_x] call STAF_fnc_disable;
	};//*/
	
	if ((_x isKindOf "Man") && {side _x == independent}) then {
		_x addPrimaryWeaponItem "rhs_acc_2dpZenit";
		_x enableGunLights "forceOn";
	};
} forEach (allMissionObjects "All");

// Force Lights On
[] spawn {	
	while {true} do {
		{
			if ((side _x == independent) && {alive _x}) then {
				_x enableGunLights "forceOn";
			};
		} forEach allUnits;
		
		sleep 5;
	};
};

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
[west, "mDeploy", (markerText "mDeploy")] call BIS_fnc_addRespawnPosition;

// Weather
[1, 0.1, 0] call BIS_fnc_setFog;

// Mission Flow
[] spawn {
	waitUntil {!(alive IP_Hostage)};
	["tHostage", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {IP_Hostage distance (getMarkerPos "mBase") <= 100};
	["tHostage", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {!(alive IP_AA)};
	["tAA", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {!(alive IP_Radar)};
	["tRadar", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};