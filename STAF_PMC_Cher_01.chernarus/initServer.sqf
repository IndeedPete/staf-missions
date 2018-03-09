// Variables
IP_TESTMODE = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_TimeLeft = 90 * 60;

// Communicate dem Vars
publicVariable "IP_TESTMODE";
publicVariable "IP_TimeLeft";

// Funtions

// Hide zhe Markerz
"mCrash_Real" setMarkerAlpha 0;
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Respawn
[east, "mStart", (markerText "mStart")] call BIS_fnc_addRespawnPosition;

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

// Le PPEffect
["STAF_FilmNoir"] call BIS_fnc_setPPeffectTemplate;

// Weather
[1, 0.02, 0] call BIS_fnc_setFog;

// Timer
[] spawn {
	waitUntil {triggerActivated trgTimerStart};
	if (count(list trgTimerStart) > 0) then {
		systemChat (format ["%1 activated the time limit!", (name((list trgTimerStart) select 0))]);	
	};
	
	IP_TimeEnd = if (isMultiplayer) then {
		(serverTime + IP_TimeLeft)
	} else {
		(time + IP_TimeLeft)
	};
	publicVariable "IP_TimeEnd";
	
	while {IP_TimeLeft > 0} do {
		IP_TimeLeft = if (isMultiplayer) then {
			(IP_TimeEnd - serverTime)
		} else {
			(IP_TimeEnd - time)
		};
		publicVariable "IP_TimeLeft";
		sleep 1;
	};
};

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