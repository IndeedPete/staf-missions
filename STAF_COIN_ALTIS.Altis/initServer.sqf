// Variables
IP_TESTMODE = true;
IP_Persistence = if (isMultiplayer) then {
	([false, true] select (paramsArray select 0))
} else {
	false
};

// Communicate dem vars
publicVariable "IP_TESTMODE";

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] execVM "zbe_cache\main.sqf";

// Init Zones. // Moved to init.sqf for HC.
// [] call IP_fnc_initZones;

// DB Access / Load last game's progress.
if (IP_Persistence) then {
	call(compile(preProcessFile "\iniDB\init.sqf"));
	
	if ("STAF_COIN_ALTIS" call iniDB_exists) then {
		_missionsDone = ["STAF_COIN_ALTIS", "STAF_COIN", "IP_COIN_MissionsDone", "ARRAY"] call iniDB_read;
		IP_COIN_MissionsDone = _missionsDone;
		publicVariable "IP_COIN_MissionsDone";
		
		{
			_mission = _x getVariable ["IP_Mission", ""];
			if ((_mission != "") && {[_mission] call IP_fnc_missionDone}) then {
				// [_x] call IP_fnc_disable;
				_x enableSimulationGlobal false;
				_x hideObjectGlobal true;
				deleteVehicle _x;
			};
		} forEach (allMissionObjects "ALL");
		
		if (IP_TESTMODE) then {
			_missionsDone spawn {
				waitUntil {time > 0};
				systemChat ("Already completed missions: " + str(_this));
			};
		};
	};
};

// Missions
call(compile(preProcessFileLineNumbers "missions\missions.sqf")); // Compile Main Mission Flows

// Update Completed Tasks
if (!(isNil "IP_COIN_MissionsDone") && {count IP_COIN_MissionsDone > 0}) then {
	{
		_task = "t" + _x;
		if (_task call BIS_fnc_taskExists) then {
			[_task, "SUCCEEDED", false] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
		};
	} forEach IP_COIN_MissionsDone;
};