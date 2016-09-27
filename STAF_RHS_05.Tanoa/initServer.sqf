// Variables
IP_TESTMODE = true;
IP_ArtyFire = true;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0} OR {_x find "mMeet" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
//[west, "tDefend", ["Defend <marker name=""mDva"">Position Dva</marker>! The enemy must not break through to <marker name=""mBase"">FOB Kuna</marker>.", "Hold the Line", (markerText "mDva")], "mDva", true, 6, false, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		_x allowDamage false;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
		[_x] call STAF_fnc_disable;
	};//*/
	
	if ((_x isKindOf "Man") && {side _x == independent}) then {
		_x addPrimaryWeaponItem "acc_flashlight";//"rhs_acc_2dpZenit";
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
[west, "mBase", (markerText "mBase")] call BIS_fnc_addRespawnPosition;

// Weather
// [1, 0.1, 0] call BIS_fnc_setFog;

// Mission Flow
[] spawn {
	while {IP_ArtyFire && {alive(gunner IP_ArtyTruck1)} && !(isNull(gunner IP_ArtyTruck1))} do {
		_pos = "mArty" call STAF_fnc_SHKPos;
		(gunner IP_ArtyTruck1) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_ArtyTruck1]) select 0), 40];
		sleep 60;
		IP_ArtyTruck1 setVehicleAmmo 1;
	};
};

[] spawn {
	sleep 20;
	while {IP_ArtyFire && {alive(gunner IP_ArtyTruck2)} && !(isNull(gunner IP_ArtyTruck2))} do {
		_pos = "mArty" call STAF_fnc_SHKPos;
		(gunner IP_ArtyTruck2) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_ArtyTruck2]) select 0), 40];
		sleep 60;
		IP_ArtyTruck2 setVehicleAmmo 1;
	};
};

[] spawn {
	sleep 40;
	while {IP_ArtyFire && {alive(gunner IP_ArtyTruck3)} && !(isNull(gunner IP_ArtyTruck3))} do {
		_pos = "mArty" call STAF_fnc_SHKPos;
		(gunner IP_ArtyTruck3) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_ArtyTruck3]) select 0), 40];
		sleep 60;
		IP_ArtyTruck3 setVehicleAmmo 1;
	};
};

/*
[] spawn {
	sleep 10;
	while {IP_ArtyFire && {alive(gunner IP_Arty2)} && !(isNull(gunner IP_Arty2))} do {
		_pos = "mArty" call STAF_fnc_SHKPos;
		(gunner IP_Arty2) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_Arty2]) select 0), 1];
		sleep 20;
		IP_Arty2 setVehicleAmmo 1;
	};
};

[] spawn {
	#define BREAK(N) sleep (N * 60);
	#define BREAK_DEFAULT BREAK(5)
	waitUntil {triggerActivated trgInAO};
	
	if !(IP_TESTMODE) then {BREAK(1)};
	
	["mArty2", {IP_ArtyFire}, 0, 0, [5, 10]] spawn STAF_fnc_arty;
	
	if !(IP_TESTMODE) then {BREAK(1)};
	
	["W01"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {BREAK_DEFAULT};
	
	["W02"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {BREAK_DEFAULT};
	
	["W03"] call IP_fnc_m_wave;
	
	["tDefend", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	IP_ArtyFire = false;
	IP_AddTicket = true;
	publicVariable "IP_AddTicket";
	[west, "mDva", (markerText "mDva")] call BIS_fnc_addRespawnPosition;
	
	if !(IP_TESTMODE) then {BREAK_DEFAULT};
	
	"mMeet" setMarkerAlpha 1;
	[west, "tMeet", ["Link-up with the rest of the forces at the <marker name=""mMeet"">Meeting Point</marker> for a counter attack!", "Link-Up", (markerText "mMeet")], "mMeet", true, 5, true, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[(IP_HiddenUnits getVariable ["B01", []])] call STAF_fnc_enable;
	[(IP_HiddenUnits getVariable ["P01", []])] call STAF_fnc_enable;
	{_x allowDamage true} forEach (IP_HiddenUnits getVariable ["P01", []]);
	
	waitUntil {triggerActivated trgMeet};
	IP_AddTicket = true;
	publicVariable "IP_AddTicket";
	
	[(IP_HiddenUnits getVariable ["E01", []])] call STAF_fnc_enable;
	{
		_x allowDamage true;
		_x allowFleeing 0;
	} forEach ((IP_HiddenUnits getVariable ["B01", []]) + (IP_HiddenUnits getVariable ["E01", []]));	
	["tMeet", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[west, "mMeet", (markerText "mMeet")] call BIS_fnc_addRespawnPosition;
	[west, "tRadar", ["Capture the <marker name=""mEnemyRadar"">Enemy Radar</marker>!", "Capture Radar", (markerText "mEnemyRadar")], "mEnemyRadar", true, 5, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, "tBase", ["Seize the <marker name=""mEnemyBase"">Enemy Base</marker>!", "Capture Enemy Base", (markerText "mEnemyBase")], "mEnemyBase", false, 5, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	[] spawn {
		waitUntil {triggerActivated trgDetected};
		IP_ArtyFire = true;
		
		while {IP_ArtyFire && {alive(gunner IP_Arty3)} && !(isNull(gunner IP_Arty3))} do {
			_pos = "mArty3" call STAF_fnc_SHKPos;
			(gunner IP_Arty3) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_Arty3]) select 0), 1];
			sleep 10;
			IP_Arty3 setVehicleAmmo 1;
		};
	};
	
	waitUntil {triggerActivated trgRadarClear};
	IP_AddTicket = true;
	publicVariable "IP_AddTicket";
	["tRadar", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {triggerActivated trgBaseClear};
	IP_ArtyFire = false;
	["tBase", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	IP_AddTicket = true;
	publicVariable "IP_AddTicket";
	[west, "mEnemyBase", (markerText "mEnemyBase")] call BIS_fnc_addRespawnPosition;
	[west, "tTrain", ["If you still can, scout the <marker name=""mTrain"">Train Station</marker>! If possible, take action against any enemy encountered there.", "Scout Train Station (OPTIONAL)", (markerText "mTrain")], "mTrain", true, 5, true, "scout"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[(IP_HiddenUnits getVariable ["E02", []])] call STAF_fnc_enable;
	{
		_x allowDamage true;
	} forEach (IP_HiddenUnits getVariable ["E02", []]);
	
	[] spawn {
		waitUntil {triggerActivated trgRockets};
		IP_ArtyFire = true;
		
		while {IP_ArtyFire && {alive(gunner IP_Arty4)} && !(isNull(gunner IP_Arty4))} do {
			_pos = "mArty2" call STAF_fnc_SHKPos;
			(gunner IP_Arty4) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_Arty4]) select 0), 40];
			sleep 30;
			IP_Arty4 setVehicleAmmo 1;
		};
	};
	
	waitUntil {triggerActivated trgTrainClear};
	["tTrain", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};*/