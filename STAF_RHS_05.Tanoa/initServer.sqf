// Variables
IP_TESTMODE = true;
IP_AidWorkers = [IP_AidWorker1, IP_AidWorker2, IP_AidWorker3];
IP_Centre = [9388.47,895.406,72.1035];
IP_ArtyFire = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_SafehouseObjs = [];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[west, "tAidWorkers", ["Locate and evacuate the <marker name=""mAidWorkers"">Aid Workers</marker> in Katkoula!", "Evacuate Aid Workers", (markerText "mAidWorkers")], "mAidWorkers", true, 6, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tAgent", ["Locate and evacuate code name 'Horizon'!", "Evacuate Horizon", ""], nil, false, 6, false, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		//_x allowDamage false;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
		[_x] call STAF_fnc_disable;
	};//*/
	
	if (_x getVariable ["IP_SafeHouse", false]) then {
		IP_SafehouseObjs pushBack _x;
	};
	
	if ((_x isKindOf "Man") && {side _x == independent}) then {
		_x addPrimaryWeaponItem "acc_flashlight"; // "rhs_acc_2dpZenit";
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

// AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
[west, IP_Centre, (markerText "mBase")] call BIS_fnc_addRespawnPosition;

// Weather
[] spawn {
	(90 * 60) setFog [0, 0, 0];
};

// Mission Flow
[] spawn {
	while {IP_ArtyFire && {alive(gunner IP_ArtyTruck1)} && !(isNull(gunner IP_ArtyTruck1))} do {
		_pos = "mArty" call STAF_fnc_SHKPos;
		enableEngineArtillery true;
		(gunner IP_ArtyTruck1) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_ArtyTruck1]) select 0), 40];
		sleep 60;
		IP_ArtyTruck1 setVehicleAmmo 1;
	};
};

[] spawn {
	sleep 20;
	while {IP_ArtyFire && {alive(gunner IP_ArtyTruck2)} && !(isNull(gunner IP_ArtyTruck2))} do {
		_pos = "mArty" call STAF_fnc_SHKPos;
		enableEngineArtillery true;
		(gunner IP_ArtyTruck2) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_ArtyTruck2]) select 0), 40];
		sleep 60;
		IP_ArtyTruck2 setVehicleAmmo 1;
	};
};

[] spawn {
	sleep 40;
	while {IP_ArtyFire && {alive(gunner IP_ArtyTruck3)} && !(isNull(gunner IP_ArtyTruck3))} do {
		_pos = "mArty" call STAF_fnc_SHKPos;
		enableEngineArtillery true;
		(gunner IP_ArtyTruck3) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_ArtyTruck3]) select 0), 40];
		sleep 60;
		IP_ArtyTruck3 setVehicleAmmo 1;
	};
};

[] spawn {
	waitUntil {{alive _x} count IP_AidWorkers == 0};
	["tAidWorkers", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_Fail"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {{(alive _x) && {_x distance IP_Centre <= 250}} count IP_AidWorkers == {alive _x} count IP_AidWorkers};
	["tAidWorkers", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	IP_HintFound = true;
	publicVariable "IP_HintFound";
	[(IP_HiddenUnits getVariable ["Russians", []])] call STAF_fnc_enable;
	
	// Garbage Collection
	[] spawn STAF_fnc_repetitiveCleanup;
};

[] spawn {
	waitUntil {!(alive IP_Agent)};
	["tAgent", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["STAF_Fail"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {(alive IP_Agent) && {IP_Agent distance IP_Centre <= 250}};
	["tAgent", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[west, "tSafehouse", ["Destroy Horizon's Safehouse on grid 036106!", "Destroy Safehouse", ""], nil, false, 6, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	IP_HintFound = true;
	publicVariable "IP_HintFound";
	[(IP_HiddenUnits getVariable ["Safehouse", []])] call STAF_fnc_enable;
};

[] spawn {
	waitUntil {!(alive IP_AmmoBox)};
	{deleteVehicle _x} forEach IP_SafehouseObjs;
	["tSafehouse", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};