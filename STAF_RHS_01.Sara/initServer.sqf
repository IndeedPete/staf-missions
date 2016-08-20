// Variables
IP_TESTMODE = false;
IP_HiddenUnits = [[], [], [], []];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCCZone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[west, "tAlpha", ["Seize the SLA-held <marker name=""mAlpha"">Objective Alpha</marker>!", "Seize Alpha", (markerText "mAlpha")], "mAlpha", true, 1, false, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{
	/*if ((_x isKindOf "Man") && {!(isPlayer _x)} && {_x hasWeapon "SMG_05_F"}) then {
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";
	};*/
	
	if (_x getVariable ["IP_HiddenUnits", -1] >= 0) then {
		[_x] call STAF_fnc_disable;
		(IP_HiddenUnits select (_x getVariable "IP_HiddenUnits")) pushBack _x;
	};
} forEach (allMissionObjects "All");

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
//[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
[west, "mStart", (markerText "mStart")] call BIS_fnc_addRespawnPosition;

// Weather
[0.5, 0.05, 0] call BIS_fnc_setFog;
/*[] spawn {
	(60 * 60) setRain 0;
	waitUntil {dayTime > 6};
	(60 * 60) setFog [0, 0, 0];
};
*/

// Mission Flow
[] spawn {
	waitUntil {triggerActivated trgAlphaClear};
	["tAlpha", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[west, "mHQAlpha", (markerText "mHQAlpha")] call BIS_fnc_addRespawnPosition;
	[west, "tDefendAlpha", ["An armoured SLA unit just departed at <marker name=""mBravo"">Objective Bravo</marker> and is on the way to <marker name=""mAlpha"">Objective Alpha</marker>. Defend <marker name=""mAlpha"">Objective Alpha</marker>!", "Defend Alpha", (markerText "mAlpha")], "mAlpha", true, 1, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	sleep 60;
	
	[(IP_HiddenUnits select 0)] call STAF_fnc_enable;
	//IP_BackupGo = true;
	if (IP_TESTMODE) then {
		"Backup Alpha deployed." remoteExec ["systemChat", 0, false];
	};
	
	waitUntil {{(_x isKindOf "MAN") && {alive _x}} count (units(group((IP_HiddenUnits select 0) select 0))) == 0};
	["tDefendAlpha", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[west, "tBravo", ["A friendly unit encountered a T-80 MBT at <marker name=""mBravo"">Objective Bravo</marker> and is on hold until your arrival. Help them to seize the SLA-held <marker name=""mBravo"">Objective Bravo</marker>!", "Seize Bravo", (markerText "mBravo")], "mBravo", true, 1, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[(IP_HiddenUnits select 1)] call STAF_fnc_enable;
	
	waitUntil {triggerActivated trgBravoClear};
	["tBravo", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[west, "mHQBravo", (markerText "mHQBravo")] call BIS_fnc_addRespawnPosition;
	[west, "tDefendBravo", ["The SLA deployed an armoured convoy in an attempt to re-take <marker name=""mBravo"">Objective Bravo</marker>. It's coming through the mountain pass to the east. Repel the attack!", "Defend Bravo", (markerText "mBravo")], "mBravo", true, 1, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	sleep 60;
	IP_AmbientArty = true;
	["mBravoArea", {IP_AmbientArty}, 0, 0, [5, 10]] spawn IP_fnc_arty;
	sleep 120;
	IP_AmbientArty = false;
	
	[(IP_HiddenUnits select 3)] call STAF_fnc_enable;
	if (IP_TESTMODE) then {
		"Backup Bravo deployed." remoteExec ["systemChat", 0, false];
	};
	
	waitUntil {{(_x isKindOf "MAN") && {alive _x}} count ((units(group((IP_HiddenUnits select 3) select 0))) + (units(group((IP_HiddenUnits select 3) select 1)))) == 0};
	["tDefendBravo", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];	
	sleep 5;
	["Win"] call BIS_fnc_endMissionServer;
};