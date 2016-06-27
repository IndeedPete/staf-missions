// Variables
IP_TESTMODE = true;
IP_Vehicles = [IP_Car1, IP_Car2, IP_Car3, IP_MRAP, IP_Heli, IP_Heli2];
IP_Waves = [[],[],[],[],[],[],[],[],[],[],[]];
IP_BombMainTargets = [];
IP_BombDefenceTargets = [];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Functions
IP_fnc_m_saveProgress = {
	private ["_inidbi", "_players"];
	_inidbi = ["new", "STAF_CMP_PMC_TAKISTAN"] call OO_INIDBI;
	_players = allPlayers - entities "HeadlessClient_F";
	
	{
		_var = str(_x);
		_gear = [_x, [missionNamespace, (_var + "_Gear")]] call BIS_fnc_saveInventory;
		["write", ["TBL_Players", _var, _gear]] call _inidbi;
	} forEach _players;
	
	{
		_var = str(_x);
		if !(isNull _x) then {		
			_alive = alive _x;
			_damage = damage _x;
			_fuel = fuel _x;
			/*_ammo = ammo _x;*/
			_cargo = [([(backpackCargo _x)] call STAF_fnc_clusterArray), ([(itemCargo _x)] call STAF_fnc_clusterArray), ([(magazineCargo _x)] call STAF_fnc_clusterArray), ([(weaponCargo _x)] call STAF_fnc_clusterArray)];
			_toSave = [_alive, _damage, _fuel, _cargo];
			["write", ["TBL_Vehicles", _var, _toSave]] call _inidbi;
		} else {
			["write", ["TBL_Vehicles", _var, [false]]] call _inidbi;
		};
	} forEach IP_Vehicles;
};
["IP_fnc_m_saveProgress"] call STAF_fnc_compileFinal;

IP_fnc_m_wave = {
	params [
		["_id", 0, [0]],
		["_ratio", 0.25, [0]],
		["_timeout", (30 * 60), [0]],
		"_wave",
		"_objs"
	];
	
	IP_SkipWave = false;
	publicVariable "IP_SkipWave";
	
	_wave = IP_Waves select _id;
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

IP_fnc_m_bombingRun = {
	params [
		["_anchor", [0, 0, 0], [[], ""]],
		["_radius", 500, [0]],
		["_angle", 0, [0]],
		["_fireAt", "", [""]],
		["_height", 100, [0]],
		["_speed", "FULL", [""]],
		["_class", "IP_I_Plane_Fighter_03_CAS_F_EFSnow", [""]],
		["_side", west, [west]],
		"_startPos",
		"_endPos",
		"_expDist"
	];
	
	_anchorPos = if (typeName _anchor == typeName "") then {getMarkerPos _anchor} else {_anchor};
	_startPos = [_anchorPos, _radius, _angle] call BIS_fnc_relPos;
	_endPos = [_anchorPos, _radius, ((_angle + 180) mod 360)] call BIS_fnc_relPos;
	_veh = [_startPos, _endPos, _height, _speed, _class, _side] call IP_fnc_m_ambientFlyBy;
	_timeout = time + 60;
	
	if (typeName _veh == typeName ObjNull) then {
		_expDist = (_endPos distance _anchorPos) - 500;
		if (_expDist < 500) then {_expDist = 500};
		waitUntil {(isNull _veh) OR {(_veh distance _endPos) <= _expDist} OR {!(alive _veh)} OR {time > _timeout}};
	};
	
	if (_fireAt != "") then {
		"Bo_GBU12_LGB_MI10" createVehicle (getMarkerPos _fireAt);
	};
};
["IP_fnc_m_bombingRun"] call STAF_fnc_compileFinal;

IP_fnc_m_ambientFlyBy = {
	#include "fnc\ambientFlyBy.sqf"
};
["IP_fnc_m_ambientFlyBy"] call STAF_fnc_compileFinal;

// Persistence
["IP_DiscoEH", "onPlayerDisconnected", {
	[] call IP_fnc_m_saveProgress;
}] call BIS_fnc_addStackedEventHandler;

// Load Vehicle Data
_inidbi = ["new", "STAF_CMP_PMC_TAKISTAN"] call OO_INIDBI;
{
	_veh = _x;
	_loadout = ["read", ["TBL_Vehicles", str(_veh), []]] call _inidbi;
	if (count _loadout > 0) then {
		if (_loadout select 0) then {
			clearBackpackCargoGlobal _veh;
			clearItemCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;
			clearWeaponCargoGlobal _veh;
			
			_veh setDamage (_loadout select 1);
			_veh setFuel (_loadout select 2);
			_cargo = _loadout select 3;
			{_veh addBackpackCargoGlobal _x} forEach (_cargo select 0);
			{_veh addItemCargoGlobal _x} forEach (_cargo select 1);
			{_veh addMagazineCargoGlobal _x} forEach (_cargo select 2);
			{_veh addWeaponCargoGlobal _x} forEach (_cargo select 3);
		} else {
			deleteVehicle _x;
		};
	};
} forEach [IP_Car1, IP_Car2, IP_MRAP, IP_Heli];

// Hide Zhe Markerz
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCC_Zone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
	
	if (_x find "mBombMain" >= 0) then {
		IP_BombMainTargets pushBackUnique _x;
	};
	
	if (_x find "mBombDefences" >= 0) then {
		IP_BombDefenceTargets pushBackUnique _x;
	};
} forEach allMapMarkers;

// Weather
[1, 0.1, 20] call BIS_fnc_setFog;

// Tasks
[independent, "tSecure", ["Secure the <marker name=""mFacility"">Underground Facility</marker>!", "Secure Facility", "Underground Facility"], "mFacility", false, 7, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tPlace", ["Move the Clients close to the <marker name=""mFacility"">Underground Facility</marker> so they can begin their investigation!", "Move Clients to Facility", "Underground Facility"], "mFacility", false, 4, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tHold", ["Hold the <marker name=""mFacility"">Underground Facility</marker> until the investigation is complete!", "Hold Facility", "Underground Facility"], "mFacility", false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tClients", ["The Clients must not die or the mission will fail!", "Protect Clients", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// BLUFOR
{
	if (side(leader _x) == west) then {
		_x setVariable ["zbe_cacheDisabled", true];
		_x allowFleeing 0;
	};
} forEach allGroups;

{
	if (_x getVariable ["IP_Wave", -1] >= 0) then {
		[_x] call STAF_fnc_disable;
		(IP_Waves select (_x getVariable ["IP_Wave", 0])) pushBack _x;
	};
} forEach (allMissionObjects "All");

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Mission Flows
[] spawn {
	waitUntil {({alive _x} count [IP_Client, IP_Journalist] < 2)};
	["tClients", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["PMC_Lose"] call BIS_fnc_endMissionServer;
};

[] spawn {
	#define BREAK(N) sleep (N * 60);
	#define BREAK_DEFAULT BREAK(1)
	(15 * 60) setFog [0, 0, 0];
	waitUntil {triggerActivated trgSecure};
	["tSecure", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	waitUntil {triggerActivated trgPlace};
	["tPlace", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 60;
	
	// Attacks Start
	["mFacility", 2000, 180, "", 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mFacility", 2000, 315, (selectRandom IP_BombMainTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mFacility", 2000, 90, (selectRandom IP_BombMainTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mDefences", 2000, 225, (selectRandom IP_BombDefenceTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mBombSpecialDefence", 2000, 0, "mBombSpecialDefence", 50] call IP_fnc_m_bombingRun;
	BREAK(1)
	[0] call IP_fnc_m_wave;
	BREAK_DEFAULT
	[1] call IP_fnc_m_wave;
	BREAK_DEFAULT
	[2] call IP_fnc_m_wave;
	BREAK_DEFAULT
	["mDefences", 2000, 180, (selectRandom IP_BombDefenceTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mDefences", 2000, 90, (selectRandom IP_BombDefenceTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mDefences", 2000, 315, (selectRandom IP_BombDefenceTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mDefences", 2000, 0, (selectRandom IP_BombDefenceTargets), 50] call IP_fnc_m_bombingRun;
	BREAK_DEFAULT
	[3] call IP_fnc_m_wave;
	BREAK_DEFAULT
	[4] call IP_fnc_m_wave;
	BREAK_DEFAULT
	[5] call IP_fnc_m_wave;	
	
	IP_Sandstorm = true;
	publicVariable "IP_Sandstorm";
	
	BREAK_DEFAULT
	["mFacility", 2000, 315, (selectRandom IP_BombMainTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mFacility", 2000, 45, (selectRandom IP_BombMainTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mFacility", 2000, 270, (selectRandom IP_BombMainTargets), 50] call IP_fnc_m_bombingRun;
	sleep 15;
	["mFacility", 2000, 0, (selectRandom IP_BombMainTargets), 50] call IP_fnc_m_bombingRun;
	BREAK_DEFAULT
	[6] call IP_fnc_m_wave;
	[7] call IP_fnc_m_wave;
	[8] call IP_fnc_m_wave;	
	BREAK_DEFAULT
	
	["tHold", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["PMC_Win"] call BIS_fnc_endMissionServer;
};