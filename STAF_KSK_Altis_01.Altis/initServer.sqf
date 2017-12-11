// Variables
IP_TESTMODE = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_LeaderJumped = false;
IP_DropMarker = "mLZ_Area";

// Communicate dem Vars
{publicVariable _x} forEach ["IP_TESTMODE", "IP_LeaderJumped", "IP_DropMarker"];

// Hide zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;
"mLZ_Area2" setMarkerAlpha 0;

// Force Lights On
{
	_zone = (group _x) getVariable ["GAIA_ZONE_INTEND", []];
	if ((count _zone > 0) && {side _x == independent}) then {
		_x removeWeapon "NVGoggles_INDEP";
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";
	};
} forEach allUnits;

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

// Respawn
[west, (getPosASL IP_Can), "USS Freedom"] call BIS_fnc_addRespawnPosition;

// Arsenal
[IP_Arsenal] call(compile(preprocessFileLineNumbers "arsenal.sqf"));

// Tasks
[west, "tDeploy", ["Deploy into the <marker name=""mDrop"">AO</marker> by parajump!", "Deploy", "Parajump"], (getPosASL IP_Pilot), true, 7, false, "takeoff"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tAlpha", ["Destroy <marker name=""mTarget1"">Objective Alpha</marker>!", "Obj. Alpha", "Alpha"], "mTarget1", false, 6, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tBravo", ["Destroy <marker name=""mTarget2"">Objective Bravo</marker>!", "Obj. Bravo", "Bravo"], "mTarget2", false, 5, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tCharlie", ["Destroy <marker name=""mTarget3"">Objective Charlie</marker>!", "Obj. Charlie", "Charlie"], "mTarget3", false, 4, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tDelta", ["Destroy <marker name=""mTarget4"">Objective Delta</marker>!", "Obj. Delta", "Delta"], "mTarget4", false, 3, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tRetreat", ["Retreat to <marker name=""mEnd"">Point Refuge</marker>!", "Retreat", "Point Refuge"], "mEnd", false, 3, false, "run"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		[_x, true] call STAF_fnc_disable;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
	};//*/
} forEach (allMissionObjects "All");

// AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Weather
0 setFog [1, 0.05, 0];

// Le Mission Flow
[] spawn {
	waitUntil {!(isNil "IP_LeaderJumped") && {IP_LeaderJumped}};
	sleep 5;
	["tDeploy", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {!(isNil "IP_Detected") && {IP_Detected}};
	if (IP_TESTMODE) then {
		"AAF QRF deployed." remoteExec ["systemChat", 0, false];
	} else {
		sleep 600;
	};
	[(IP_HiddenUnits getVariable ["AAF_QRF", []]), false] call STAF_fnc_enable;
};

// Devices
_chk = {
	params [
		"_dev",
		"_t"
	];
	
	waitUntil {!(alive _dev)};
	IP_QRF_CSAT = true;
	publicVariable "IP_QRF_CSAT";
	sleep 3;
	[_t, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[IP_Device1, "tAlpha"] spawn _chk;
[IP_Device2, "tBravo"] spawn _chk;
[IP_Device3, "tCharlie"] spawn _chk;
[IP_Device4, "tDelta"] spawn _chk;

[] spawn {
	waitUntil {!(isNil "IP_QRF_CSAT") && {IP_QRF_CSAT}};
	if (IP_TESTMODE) then {
		"CSAT QRF deployed." remoteExec ["systemChat", 0, false];
	} else {
		sleep 300;
	};
	[(IP_HiddenUnits getVariable ["CSAT_QRF", []]), false] call STAF_fnc_enable;
};

[] spawn {
	waitUntil {{alive _x} count [IP_Device1, IP_Device2, IP_Device3, IP_Device4] == 0};
	sleep 15;
	_units = IP_HiddenUnits getVariable ["End_Pats", []];
	[_units, false] call STAF_fnc_enable;
	
	{
		_grp = group _x;
		((_x isKindOf "Man") && {_x == (leader _grp)}) then {
			_grp setVariable ["GAIA_ZONE_INTEND", ["mMCC_Zone7", "NOFOLLOW"]];
		};
	} forEach _units;
};

[] spawn {
	waitUntil {
		(({alive _x} count [IP_Device1, IP_Device2, IP_Device3, IP_Device4] == 0)) &&
		({(alive _x) && {_x distance (getMarkerPos "mEnd")}} count allPlayers > 0) &&
		({(alive _x) && {_x distance (getMarkerPos "mEnd")}} count allPlayers == {alive _x} count allPlayers)
	};
	
	["tRetreat", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};

/*
[] spawn {
	waitUntil {triggerActivated trgLocate};	
	["tLocate", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	"mCrash_Real" setMarkerAlpha 1;
	[west, "tDefend", ["Defend the <marker name=""mCrash_Real"">Crash Site in Zargabad</marker> until the pioneers arrive!", "Defend the Crash Site", "Crash Site"], "mCrash_Real", true, 6, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	if !(IP_TESTMODE) then {
		sleep 120;
	} else {
		sleep 5;
	};
	
	["wave1"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep 60;
	} else {
		sleep 5;
	};
	
	["wave2"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep 60;
	} else {
		sleep 5;
	};
	
	_wave = ["wave3"] spawn IP_fnc_m_wave;
	
	[] spawn {
		while {(alive (gunner IP_Wave3Mortar)) && !(isNull(gunner IP_Wave3Mortar))} do {
			_pos = "mMCC_Zone3" call STAF_fnc_SHKPos;
			(gunner IP_Wave3Mortar) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_Wave3Mortar]) select 0), 1];
			sleep 20;
			IP_Wave3Mortar setVehicleAmmo 1;
		};
	};
	
	waitUntil {scriptDone _wave};
	
	if !(IP_TESTMODE) then {
		sleep 120;
	} else {
		sleep 5;
	};
	
	["wave4"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep 180;
	} else {
		sleep 5;
	};
	
	_wave = ["wave5", 0.1] spawn IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep (10 * 60);
	} else {
		sleep 5;
	};
	
	[(IP_HiddenUnits getVariable ["end", []]), false] call STAF_fnc_enable;	
	waitUntil {scriptDone _wave};
	["tDefend", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};*/