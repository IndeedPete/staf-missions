// Variables
IP_TESTMODE = false;
RscSpectator_allowFreeCam = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;

// Communicate dem vars
publicVariable "IP_TESTMODE";
publicVariable "RscSpectator_allowFreeCam";

// Funtions
IP_fnc_m_wave = {
	params [
		["_id", "", [""]],
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
	#include "ambientFlyBy.sqf"
};
["IP_fnc_m_ambientFlyBy"] call STAF_fnc_compileFinal;

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

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[west, "tArrive", ["Arrive at <marker name=""mBase"">Fort Koofra</marker> and take over command!", "Arrive at Fort Koofra", "Fort Koofra"], "mBase", true, 6, false, "move"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		//_x allowDamage false;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
		
		if (_key != "threat") then {
			[_x] call STAF_fnc_disable;
		}
	};//*/
} forEach (allMissionObjects "All");

{
	_x setCaptive true;
	_x allowFleeing 0;
} forEach allUnits;

// AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

[] spawn {
	#define HEAL_PLAYERS {[_x] call STAF_fnc_ACEHeal} forEach (allPlayers - (entities "HeadlessClient_F"));
	
	waitUntil {triggerActivated trgArrive};
	[west, "mBase", (markerText "mBase")] call BIS_fnc_addRespawnPosition; 
	["tArrive", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];	
	
	if !(IP_TESTMODE) then {
		sleep 600;
	} else {
		sleep 5;
	};
	
	[(IP_HiddenUnits getVariable ["threat", []])] call STAF_fnc_disable;
	[(IP_HiddenUnits getVariable ["scout", []])] call STAF_fnc_enable;
	
	waitUntil {!(isNil "IP_StartAttack") && {IP_StartAttack}};
	
	{
		_x setCaptive false;
	} forEach allUnits;
	
	sleep 60;
	
	[west, "tDefend", ["Defend <marker name=""mBase"">Fort Koofra</marker> against any attacker!", "Defend Fort Koofra", "Fort Koofra"], "mBase", true, 6, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	["wave1"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep 300;
	} else {
		sleep 5;
	};
	
	["IP_BlackScreen", true, 1] remoteExec ["STAF_fnc_blackOut", 0, false];
	sleep 1;
	
	["wave1"] call IP_fnc_m_killRemainers;	
	HEAL_PLAYERS
	[1] call BIS_fnc_setOvercast;
	//0 setRain 1;
	skipTime 12;
	
	sleep 1;
	["IP_BlackScreen", true, 1] remoteExec ["STAF_fnc_blackIn", 0, false];
	sleep 5;
	[["Twelve Hours Later"]] remoteExec ["BIS_fnc_EXP_camp_SITREP", 0, false];
	
	if !(IP_TESTMODE) then {
		sleep 120;
	} else {
		sleep 5;
	};
	
	["mBase", "F_40mm_White", 150] call STAF_fnc_launchFlare; 
	
	sleep 20;
	
	IP_Arty = true;
	["mMCC_Zone1", {IP_Arty}, 0, 0, [0.5, 1], "ARTY"] spawn STAF_fnc_arty;
	_wave = ["wave2"] spawn IP_fnc_m_wave;
	
	sleep 90;
	
	IP_Arty = false;
	IP_Flares = true;
	[] spawn {
		while {IP_Flares} do {
			_pos = "mMCC_Zone1" call STAF_fnc_SHKPos;
			[_pos] call STAF_fnc_launchFlare; 
			sleep 20;
		};
	};
	waitUntil {scriptDone _wave};
	
	if !(IP_TESTMODE) then {
		sleep 120;
	} else {
		sleep 5;
	};
	
	["wave3"] call IP_fnc_m_wave;
	IP_Flares = false;
	
	if !(IP_TESTMODE) then {
		sleep 300;
	} else {
		sleep 5;
	};
	
	["IP_BlackScreen", true, 1] remoteExec ["STAF_fnc_blackOut", 0, false];
	sleep 1;
	
	["wave3"] call IP_fnc_m_killRemainers;	
	HEAL_PLAYERS
	skipTime 5;
	[0.3] call BIS_fnc_setOvercast;
	[0.25, 0, 0.1] call BIS_fnc_setFog;
	
	sleep 1;
	["IP_BlackScreen", true, 1] remoteExec ["STAF_fnc_blackIn", 0, false];
	sleep 5;
	[["Five Hours Later"]] remoteExec ["BIS_fnc_EXP_camp_SITREP", 0, false];
	
	if !(IP_TESTMODE) then {
		sleep 120;
	} else {
		sleep 5;
	};
	
	["mBomb", 2000, 180, "", 100, "FULL", "RHS_Su25SM_CAS_vvsc", east] call IP_fnc_m_bombingRun;	
	sleep 15;	
	["mBomb", 2000, 90, "mBomb", 50, "FULL", "RHS_Su25SM_CAS_vvsc", east] call IP_fnc_m_bombingRun;
	sleep 15;
	["mBomb", 2000, 0, "", 100, "NORMAL", "RHS_Su25SM_CAS_vvsc", east] call IP_fnc_m_bombingRun;
	
	["wave4"] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep 60;
	} else {
		sleep 5;
	};
	
	["wave5", 0.1] call IP_fnc_m_wave;
	
	if !(IP_TESTMODE) then {
		sleep 60;
	} else {
		sleep 5;
	};
	
	["tDefend", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};//*/