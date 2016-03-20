// Variables
IP_TESTMODE = true;
IP_Persistence = if (isMultiplayer) then {
	([false, true] select (paramsArray select 0))
} else {
	true
};

// Communicate dem vars
{publicVariable _x} forEach ["IP_TESTMODE", "IP_Persistence"];

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] execVM "zbe_cache\main.sqf";

// Init Zones. // Moved to init.sqf for HC.
// [] call IP_fnc_initZones;

// Date / Daytime
if (isMultiplayer) then {
	_date = date;
	_date set [3, (paramsArray select 1)];
	[_date] call BIS_fnc_setDate;
};

// DB Access / Load last game's progress.
if (IP_Persistence) then {
	call(compile(preProcessFile "\iniDB\init.sqf"));
	
	if ("STAF_COIN_ALTIS" call iniDB_exists) then {
		_date = ["STAF_COIN_ALTIS", "STAF_COIN", "IP_COIN_Date", "ARRAY"] call iniDB_read;
		[_date] call BIS_fnc_setDate;
		
		/*
		_weather = ["STAF_COIN_ALTIS", "STAF_COIN", "IP_COIN_Weather", "ARRAY"] call iniDB_read;
		if (count _weather > 0) then {
			wcweather = _weather;
			publicVariable "wcweather";
		};
		*/
		
		ACE_RAIN_PARAMS = ["STAF_COIN_ALTIS", "STAF_COIN", "IP_COIN_ACE_RAIN_PARAMS", "ARRAY"] call iniDB_read;
		ACE_WIND_PARAMS = ["STAF_COIN_ALTIS", "STAF_COIN", "IP_COIN_ACE_WIND_PARAMS", "ARRAY"] call iniDB_read;
		ACE_MISC_PARAMS = ["STAF_COIN_ALTIS", "STAF_COIN", "IP_COIN_ACE_MISC_PARAMS", "ARRAY"] call iniDB_read;
		{publicVariable _x} forEach ["ACE_RAIN_PARAMS", "ACE_WIND_PARAMS", "ACE_MISC_PARAMS"];
	
		_missionsDone = ["STAF_COIN_ALTIS", "STAF_COIN", "IP_COIN_MissionsDone", "ARRAY"] call iniDB_read;
		IP_COIN_MissionsDone = _missionsDone;
		publicVariable "IP_COIN_MissionsDone";
		
		if (count _missionsDone > 0) then {
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
		
		// Create DB Backup
		["STAF_COIN_ALTIS_BACKUP"] call IP_fnc_saveProgress;
	} else {
		[0.1, 0.01, 0] call BIS_fnc_setFog;
	};
	
	["IP_DiscoEH", "onPlayerDisconnected", {
		//if (count(allPlayers - (entities "HeadlessClient_F")) == 0) then {
			[] call IP_fnc_saveProgress;
			//["Won"] call BIS_fnc_endMissionServer;
		//};
	}] call BIS_fnc_addStackedEventHandler;
} else {
	[0.1, 0.01, 0] call BIS_fnc_setFog;
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