// Variables
IP_TESTMODE = true;
IP_CSAT_QRF = [[], []];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCC_Zone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[true, "tLink", ["Link up with the Syndikat at the <marker name=""mMeet"">Forest Clearing</marker>!", "Link-Up", "Forest Clearing"], "mMeet", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[true, "tVTOL", ["Destroy the grounded <marker name=""mVTOL"">VTOL/marker>!", "Destroy VTOL", "VTOL"], "mVTOL", false, 5, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tExit", ["Reach the <marker name=""mKSK"">Exfiltration Point</marker>!", "Reach Exfil", "Exfil"], "mKSK", false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", west, true];

// AAF
{
	if ((_x isKindOf "Man") && {!(isPlayer _x)} && {_x hasWeapon "SMG_05_F"}) then {
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";
	};
	
	if (_x getVariable ["IP_CSAT_QRF", -1] >= 0) then {
		[_x] call STAF_fnc_disable;
		(IP_CSAT_QRF select (_x getVariable "IP_CSAT_QRF")) pushBack _x;
	};
} forEach (allMissionObjects "All");

// Weapon Cache
#include "weaponCache.hpp"

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
[west, "mKSK", "KSK Insertion"] call BIS_fnc_addRespawnPosition;
[independent, "mSyndikat", "Syndikat Hideout"] call BIS_fnc_addRespawnPosition;

// Weather
[0.5, 0.01, 0] call BIS_fnc_setFog;
[] spawn {
	(60 * 60) setRain 0;
	waitUntil {dayTime > 6};
	(60 * 60) setFog [0, 0, 0];
};

// Solomon Maru
[] spawn {
	waitUntil {(time > 0) && {!(isNull IP_Commander)}};
	[IP_Commander, "Syndikat_Boss_F"] remoteExec ["setIdentity", 0, true];
}; 

// Mission Flow
[] spawn {
	waitUntil {triggerActivated trgAlert};
	[(getMarkerPos "mVTOL"), "F_40mm_Red"] call IP_fnc_launchFlare;
	
	sleep 600;
	
	[(IP_CSAT_QRF select 0)] call STAF_fnc_enable;
	if (IP_TESTMODE) then {
		systemChat "QRF deployed.";
	};
	
	[(getMarkerPos "mVTOL"), "F_40mm_Red"] call IP_fnc_launchFlare;
	
	sleep 600;	
	
	[(IP_CSAT_QRF select 1)] call STAF_fnc_enable;
	if (IP_TESTMODE) then {
		systemChat "Reinforcements deployed.";
	};
};

[] spawn {
	waitUntil {daytime > 7};
	if (alive IP_VTOL) then {
		["tVTOL", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
		sleep 5;
		["KSK_Fail"] call BIS_fnc_endMissionServer;
	};
};

[] spawn {
	waitUntil {(triggerActivated trgMeet) OR {!(isNil "IP_Meeting")}};
	["tLink", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[missionNamespace, "mMeet", "Forest Clearing"] call BIS_fnc_addRespawnPosition;
	[independent, "mKSK", "KSK Insertion"] call BIS_fnc_addRespawnPosition;
	[west, "mSyndikat", "Syndikat Hideout"] call BIS_fnc_addRespawnPosition;
	
	waitUntil {!(alive IP_VTOL)};
	["tVTOL", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {triggerActivated trgExit};
	["tExit", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", west, true];
	sleep 5;
	["KSK_Win"] call BIS_fnc_endMissionServer;
};