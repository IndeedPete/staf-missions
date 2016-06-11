// Variables
IP_TESTMODE = false;
IP_CSATObjects = [];
IP_ConvoyVehicles = [IP_ConvoyMRAP, IP_ConvoyTruck, IP_ConvoyAPC];

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
[west, "tExit", ["Reach the <marker name=""mExit"">Evac Point</marker>!", "Reach Evac", "Evac"], "mExit", false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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


// Mission Flow
[] spawn {
	waitUntil {triggerActivated trgCache};
	["tCache", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	"respawn_west" setMarkerPos [5560.05,12580.6];
	
	waitUntil {!(alive IP_Officer)};
	["tCommandPost", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	"respawn_west" setMarkerPos [3874.19,12011.6];
	
	[IP_SatPhone, ["<img size='1' shadow='1' image='\a3\ui_f\data\igui\cfg\Actions\talk_ca.paa'/> Call CSAT QRF", {
		IP_SatPhone remoteExec ["removeAllActions", 0, true];
		(format ["%1 has called the CSAT QRF!", (name player)]) remoteExec ["systemChat", 0, false];
		IP_ConvoyCalled = true;
		publicVariable "IP_ConvoyCalled";
	}, [], 1.5, false, true, "", "(_this distance _target < 3)"]] remoteExec ["addAction", 0, true];
	
	waitUntil {!(isNil "IP_ConvoyCalled")};
	{deleteVehicle _x} forEach ((crew IP_PatrolCar) + [IP_PatrolCar]);
	[IP_CSATObjects] call STAF_fnc_enable;
	[["mConvoy1", "mConvoy2", "mConvoy3", "mConvoy4", "mConvoy5"], IP_ConvoyVehicles, true] spawn IP_fnc_convoyDefend;
	
	waitUntil {!(alive IP_ConvoyAPC)};
	["tConvoy", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {{isPlayer _x} count (list trgExit) == count (allPlayers - entities "HeadlessClient_F")};
	["tExit", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["FIA_Win"] call BIS_fnc_endMissionServer;
};