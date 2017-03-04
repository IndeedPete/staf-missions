// Variables
IP_TESTMODE = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;

// Communicate dem Vars
publicVariable "IP_TESTMODE";

// Hide zhe Markerz
"mCrash_Real" setMarkerAlpha 0;
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Respawn
[west, "mBase", (markerText "mBase")] call BIS_fnc_addRespawnPosition;

// Tasks
//[west, "tLocate", ["Locate the <marker name=""mCrash"">Crash Site in Zargabad</marker>!", "Locate the Crash Site", "Possible Crash Site"], "mCrash", true, 6, false, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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

/*/ Le Mission Flow
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
			sleep 10;
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
};