// Variables
IP_TESTMODE = true;
IP_Pilots = [IP_Pilot1, IP_Pilot2, IP_Pilot3, IP_Pilot4];
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;

// Communicate dem Vars
publicVariable "IP_TESTMODE";
publicVariable "IP_Pilots";

// Funtions
IP_fnc_m_wave = {
	params [
		["_id", "", [""]],
		["_ratio", 0.25, [0]],
		["_timeout", (30 * 60), [0]],
		["_handleAllowDamage", true, [false]],
		"_wave",
		"_objs"
	];
	
	IP_SkipWave = false;
	publicVariable "IP_SkipWave";
	
	_wave = IP_HiddenUnits getVariable [_id, []];
	_objs = [];
	{
		if (_x isKindOf "Man") then {
			_objs pushBackUnique _x;			
		} else {
			{
				_objs pushBackUnique _x;
			} forEach (crew _x);
		};
	} forEach _wave;
	
	[_wave, _handleAllowDamage] call STAF_fnc_enable;
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

IP_fnc_m_killRemainers = {
	params [
		["_wave", "", [""]]
	];
	
	{
		if (_x isKindOf "MAN") then {
			_x setDamage 1;
		} else {
			_crew = crew _x;
			if (count _crew > 0) then {
				{_x setDamage 1} forEach _crew;
			};
		};
	} forEach (IP_HiddenUnits getVariable [_wave, []]);
};
["IP_fnc_m_killRemainers"] call STAF_fnc_compileFinal;

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
[west, "tLocate", ["Locate the <marker name=""mCrash"">Crash Site in Zargabad</marker>!", "Locate the Crash Site", "Possible Crash Site"], "mCrash", true, 6, false, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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

// Destroy Le City
[(getMarkerPos "mCentre"), 1000] call BIS_fnc_destroyCity;

// Le PPEffect
["STAF_RealIsBrown"] call BIS_fnc_setPPeffectTemplate;

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
		sleep 180;
	} else {
		sleep 5;
	};
	
	["wave2"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep 300;
	} else {
		sleep 5;
	};
	
	_wave = ["wave3"] spawn IP_fnc_m_wave;
	
	[] spawn {
		while {(alive (gunner IP_Wave3Mortar)) && !(isNull(gunner IP_Wave3Mortar))} do {
			_pos = "mMCC_Zone3" call IP_fnc_SHKPos;
			(gunner IP_Wave3Mortar) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_Wave3Mortar]) select 0), 1];
			sleep 10;
			IP_Wave3Mortar setVehicleAmmo 1;
		};
	};
	
	waitUntil {scriptDone _wave};
	
	if !(IP_TESTMODE) then {
		sleep 180;
	} else {
		sleep 5;
	};
	
	["wave4"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep 180;
	} else {
		sleep 5;
	};
	
	["wave5", 0.1] call IP_fnc_m_wave;
	["tDefend", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};