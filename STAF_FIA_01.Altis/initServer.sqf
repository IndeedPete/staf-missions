// Variables
IP_TESTMODE = true;
IP_CSATObjects = [];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCC_Zone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[west, "tCache", ["Reach the <marker name=""mCache"">FIA Weapon Cache</marker> and rearm!", "Rearm", "FIA Weapon Cache"], "mCache", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tCommandPost", ["Attack the <marker name=""mCommandPost"">AAF Command Post</marker> and eliminate the officer!", "Attack Command Post", "AAF Command Post"], "mCommandPost", false, 5, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tConvoy", ["Use the satellite phone at the <marker name=""mCommandPost"">AAF Command Post</marker> to call in the CSAT QRF and destroy their APC!", "Ambush CSAT QRF", ""], nil, false, 3, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// AAF
{
	if ((_x isKindOf "Man") && {side _x == independent}) then {
		_x unlinkItem "NVGoggles_INDEP";
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";
	};
	
	if (_x getVariable ["IP_CSATConvoy", false]) then {
		[_x] call STAF_fnc_disable;
		IP_CSATObjects pushBack _x;
	};
} forEach (allMissionObjects "All");

{
	if ((side(leader _x) == east) && {(leader _x) getVariable ["IP_CSATConvoy", false]}) then {
		_x setVariable ["zbe_cacheDisabled", true];
	};
} forEach allGroups;

// Weapon Cache
#include "weaponCache.hpp"

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;


/*/ Mission Flows
[] spawn {
	{deleteVehicle _x} forEach ((crew IP_PatrolCar) + [IP_PatrolCar]);
	[IP_CSATObjects] call STAF_fnc_enable;
	[["mConvoy1", "mConvoy2", "mConvoy3", "mConvoy4", "mConvoy5"], [IP_ConvoyMRAP, IP_ConvoyTruck, IP_ConvoyAPC], true] spawn IP_fnc_convoyDefend;
};

[] spawn {
	waitUntil {({alive _x} count [IP_Client, IP_Journalist] == 2) && {{(vehicle _x) inArea "mBaseArea"} count [IP_Client, IP_Journalist] == 2}};
	["tFree", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tClients", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["PMC_Win"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {({alive _x} count [IP_Client, IP_Journalist] < 2)};
	["tClients", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["PMC_Lose"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {!(isNil "IP_MeetingDone") && {IP_MeetingDone}};
	["tMeet", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	if !(triggerActivated trgDetected) then {["tDetect", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true]};
	[independent, "tFree", ["Free the Journalist from the NTA-held <marker name=""mHostage"">President's Residence</marker> and bring him back to the <marker name=""mBase"">Base</marker>!", "Rescue Journalist", "Residence"], "mHostage", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	"mHostage" setMarkerAlpha 1;
	[] call IP_fnc_m_saveProgress;
};

[] spawn {
	waitUntil {triggerActivated trgDetected};
	if (isNil "IP_MeetingDone") then {
		["tDetect", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
};

[] spawn {
	waitUntil {daytime > 19.75};
	[(getMarkerPos "mFlyStart1"), (getMarkerPos "mFlyEnd1"), 150, "NORMAL", "IP_I_Plane_Fighter_03_CAS_F_EFSnow", west] call BIS_fnc_ambientFlyBy;
	sleep 1;
	[(getMarkerPos "mFlyStart2"), (getMarkerPos "mFlyEnd2"), 150, "NORMAL", "IP_I_Plane_Fighter_03_CAS_F_EFSnow", west] call BIS_fnc_ambientFlyBy;
	sleep 1;
	[(getMarkerPos "mFlyStart3"), (getMarkerPos "mFlyEnd3"), 150, "NORMAL", "IP_I_Plane_Fighter_03_CAS_F_EFSnow", west] call BIS_fnc_ambientFlyBy;	
	sleep 25;
	
	for "_i" from 0 to 19 do {
		_pos = "mMCC_Zone2" call IP_fnc_SHKPos;
		"Bo_GBU12_LGB_MI10" createVehicle _pos;
		sleep 2;
	};
	
	[IP_EFObjects] call STAF_fnc_enable;
	// sleep 30;
	IP_EFGo = true;
	publicVariable "IP_EFGo";
};*/