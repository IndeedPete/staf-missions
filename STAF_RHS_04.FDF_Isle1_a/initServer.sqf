// Variables
IP_TESTMODE = true;
IP_ArtyFire = true;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Functions
IP_fnc_m_wave = {
	params [
		["_id", "W01", [""]],
		["_ratio", 0.25, [0]],
		["_timeout", (30 * 60), [0]],
		"_wave",
		"_objs"
	];
	
	IP_SkipWave = false;
	publicVariable "IP_SkipWave";
	
	_wave = IP_HiddenUnits getVariable [_id, []];
	_objs = [];	
	{
		_x allowDamage true;
		if (_x isKindOf "Man") then {
			_x allowFleeing 0;
			_objs pushBackUnique _x;			
		} else {
			{
				_objs pushBackUnique _x;
			} forEach (crew _x);
		};
	} forEach _wave;
	
	[_wave] call STAF_fnc_enable;
	_win = floor((count _objs) * _ratio);
	_time = time + _timeout;
	
	waitUntil {
		_alive = {!(isNull _x) && {alive _x}} count _objs;
		
		IP_WaveTimeout = _time - time;
		publicVariable "IP_WaveTimeout";
		
		if (IP_TESTMODE) then {
			(format ["Wave: %4\nEnemies left: %1\nWin amount: %2\nTimeout in: %3", _alive, _win, IP_WaveTimeout, _id]) remoteExec ["systemChat", 0, false];
		};
		sleep 3;
		(_alive <= _win)
		OR {time > _time}
		OR {IP_SkipWave}
	};
	
	true
};
["IP_fnc_m_wave"] call STAF_fnc_compileFinal;

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0} OR {_x find "mMeet" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[west, "tDefend", ["Defend <marker name=""mDva"">Position Dva</marker>! The enemy must not break through to <marker name=""mBase"">FOB Kuna</marker>.", "Hold the Line", (markerText "mDva")], "mDva", true, 6, false, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
//[west, "tHostage", ["Secure the hostage and return to the <marker name=""mBase"">USS Khe Sanh</marker>!", "Secure Hostage", ""], nil, false, 4, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true]; //*/

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
	
	/*if ((_x isKindOf "Man") && {side _x == independent}) then {
		_x addPrimaryWeaponItem "rhs_acc_2dpZenit";
		_x enableGunLights "forceOn";
	};//*/
} forEach (allMissionObjects "All");

/*/ Force Lights On
[] spawn {	
	while {true} do {
		{
			if ((side _x == independent) && {alive _x}) then {
				_x enableGunLights "forceOn";
			};
		} forEach allUnits;
		
		sleep 5;
	};
}; //*/

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
[west, "mBase", (markerText "mBase")] call BIS_fnc_addRespawnPosition;

// Weather
// [1, 0.1, 0] call BIS_fnc_setFog;

// Mission Flow
[] spawn {
	while {IP_ArtyFire && {alive(gunner IP_Arty1)} && !(isNull(gunner IP_Arty1))} do {
		_pos = "mArty" call STAF_fnc_SHKPos;
		(gunner IP_Arty1) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_Arty1]) select 0), 1];
		sleep 20;
		IP_Arty1 setVehicleAmmo 1;
	};
};

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
	
	if !(IP_TESTMODE) then {BREAK(2)};
	
	["mArty2", {IP_ArtyFire}, 0, 0, [5, 10]] spawn STAF_fnc_arty;
	
	if !(IP_TESTMODE) then {BREAK(3)};
	
	["W01"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {BREAK_DEFAULT};
	
	["W02"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {BREAK_DEFAULT};
	
	["W03"] call IP_fnc_m_wave;
	
	["tDefend", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	IP_ArtyFire = false;
	[west, "mDva", (markerText "mDva")] call BIS_fnc_addRespawnPosition;
	"mMeet" setMarkerAlpha 1;
	[west, "tMeet", ["Link-up with the rest of the forces at the <marker name=""mMeet"">Meeting Point</marker> for a counter attack!", "Link-Up", (markerText "mMeet")], nil, true, 5, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
};

/*
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
//*/