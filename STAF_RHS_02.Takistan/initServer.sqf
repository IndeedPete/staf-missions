// Variables
IP_TESTMODE = false;
IP_Wounded = [IP_Wounded1, IP_Wounded2, IP_Wounded3];
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Side Relations
West setFriend [East, 1];
East setFriend [West, 1];

// Hide Zhe Markerz
{
	//if ((markerType _x == "mil_dot") OR {_x find "mMCCZone" >= 0} OR {_x find "mTAOR" >= 0}) then {
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mIED" >= 0}) then {
		_x setMarkerAlpha 0;
	};
	/*
	if (markerType _x == "hd_dot") then {
		_x setMarkerAlpha 0.5;
	};*/
} forEach allMapMarkers;

// Tasks
[west, "tFARP", ["Pass the NTA-held <marker name=""mFARP"">FARP Mountain Lion</marker>!", "Pass FARP Mountain Lion", (markerText "mFARP")], "mFARP", true, 1, false, "move"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tSecure", ["Secure the immediate area around <marker name=""mTank"">Victor-2-2's position</marker>! Provide first aid to wounded crew members if required!", "Secure Victor-2-2", (markerText "mTank")], "mTank", false, 7, false, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tAA", ["Secure a ~300 metre radius around <marker name=""mLZ"">LZ Iron</marker>! Make sure no AA threats are in the area!", "Sweep for AA Threats", (markerText "mLZ")], "mLZ", false, 6, false, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tEvac", ["Call in Starforce-2-1 MEDEVAC on <marker name=""mLZ"">LZ Iron</marker> and evacuate wounded crew members if required!", "MEDEVAC Victor-2-2's Crew", (markerText "mLZ")], "mLZ", false, 5, false, "heal"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tRecover", ["Recover <marker name=""mTank"">Victor-2-2's M1A1FEP MBT</marker>!", "Recover Victor-2-2's MBT", (markerText "mTank")], "mTank", false, 4, false, "repair"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tRTB", ["Return to <marker name=""mFOB"">FOB Snow Leopard</marker>! If possible, bring <marker name=""mTank"">Victor-2-2's M1A1FEP MBT</marker>!", "RTB to FOB Snow Leopard", (markerText "mFOB")], "mFOB", false, 3, false, "exit"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tTank", ["Protect <marker name=""mTank"">Victor-2-2's M1A1FEP MBT</marker>!", "Protect Victor-2-2's MBT", (markerText "mTank")], "mTank", false, 1, false, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tCrew", ["Protect <marker name=""mTank"">Victor-2-2's M1A1FEP crew</marker>!", "Protect Victor-2-2's Crew", (markerText "mTank")], "mTank", false, 1, false, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true]; //*/

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
		[_x] call STAF_fnc_disable;
	};
} forEach (allMissionObjects "All");

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
//[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
[west, "mFOB", (markerText "mFOB")] call BIS_fnc_addRespawnPosition;

// Mission Flow
[] spawn {
	waitUntil {triggerActivated trgFARP};
	["tFARP", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[west, "mFARP", (markerText "mFARP")] call BIS_fnc_addRespawnPosition;
};

[] spawn {
	waitUntil {triggerActivated trgTankClear};
	["tSecure", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	#define CHECK ({alive _x} count IP_Wounded == 0)
	#define FAIL ["tCrew", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true]; ["tEvac", "CANCELED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true]; {deleteVehicle _x} forEach ((crew IP_MEDEVACHeli) + (crew IP_CASHeli) + [IP_MEDEVACHeli, IP_CASHeli])
	waitUntil {({alive _x} count (units IP_AAGroup1) == 0) && {{alive _x} count (units IP_AAGroup2) == 0}};
	["tAA", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[(IP_HiddenUnits getVariable ["W01", []])] call STAF_fnc_enable;
	
	waitUntil {(triggerActivated trgTankClear) OR CHECK};
	if CHECK exitWith {FAIL};
	
	_incoming = call(compile(preprocessFileLineNumbers "dta\incoming.sqf"));
	_hovering = call(compile(preprocessFileLineNumbers "dta\hovering.sqf"));
	_outgoing = call(compile(preprocessFileLineNumbers "dta\outgoing.sqf"));
	IP_MEDEVAC_TakeOff = true;
	sleep 3;
	[IP_MEDEVACHeli, _incoming] call IP_fnc_unitPlayMP;
	[(IP_HiddenUnits getVariable ["W02", []])] call STAF_fnc_enable;
	
	while {({(alive _x) && {_x in IP_MEDEVACHeli}} count IP_Wounded != {alive _x} count IP_Wounded) && !CHECK} do {
		[IP_MEDEVACHeli, _hovering] call IP_fnc_unitPlayMP;
	};
	
	IP_MEDEVACHeli lock 2;
	IP_MEDEVAC_RTB = true;
	_handle = [IP_MEDEVACHeli, _outgoing] spawn {
		_this call IP_fnc_unitPlayMP;
		{deleteVehicle _x} forEach ((crew IP_MEDEVACHeli) + [IP_MEDEVACHeli]);
	};
	
	if CHECK exitWith {
		["tCrew", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
		["tEvac", "CANCELED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	["tEvac", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {isNull IP_MEDEVACHeli};
	
	["tCrew", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {(isNull IP_MEDEVACHeli) && {triggerActivated trgAOClear}};
	[west, "tRegroup1", ["Regroup around <marker name=""mTank"">Victor-2-2's position</marker>!", "Regroup", (markerText "mTank")], "mTank", true, 6, true, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	waitUntil {{(_x distance (getMarkerPos "mTank")) > 50} count (allPlayers - (entities "HeadlessClient_F")) == 0};
	["tRegroup1", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	["IP_BlackScreen", true, 1] remoteExecCall ["STAF_fnc_blackOut", 0, false];
	sleep 1;
	{[_x] call STAF_fnc_ACEHeal} forEach (allPlayers - (entities "HeadlessClient_F"));
	skipTime 6;
	sleep 1;
	["IP_BlackScreen", true, 1] remoteExec ["STAF_fnc_blackIn", 0, false];
	sleep 5;
	[["Six Hours Later"]] remoteExec ["BIS_fnc_EXP_camp_SITREP", 0, false];
	[(IP_HiddenUnits getVariable ["W02", []])] call STAF_fnc_enable;
	sleep 30;
	[(IP_HiddenUnits getVariable ["W03", []])] call STAF_fnc_enable;
	[(getMarkerPos "mTank"), "F_40mm_White", 300] call STAF_fnc_launchFlare;
	sleep 30;
	
	[] spawn {
		while {(alive (gunner IP_Arty)) && !(isNull(gunner IP_Arty))} do {
			_pos = [IP_Tank, 100] call IP_fnc_SHKPos;
			(gunner IP_Arty) doArtilleryFire [_pos, ((getArtilleryAmmo [IP_Arty]) select 0), 1];
			sleep 30;
			IP_Arty setVehicleAmmo 1;
		};
	};
	
	[] spawn {
		IP_Flares = true;
		sleep 10;
		while {IP_Flares} do {
			_pos = [IP_Tank, 100] call IP_fnc_SHKPos;
			[_pos] call STAF_fnc_launchFlare;
			sleep 20;
		};
	};
	
	sleep 60;
	[west, "tArty", ["Locate and neutralise the enemy artillery likely present in <marker name=""mEnemyVillage"">Mulladost</marker>!", "Neutralise Artillery", "Mulladost"], "mEnemyVillage", true, 5, true, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	sleep 60;
	[(IP_HiddenUnits getVariable ["W04", []])] call STAF_fnc_enable;
	
	waitUntil {triggerActivated trgArtyClear};
	["tArty", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	sleep 180;
	
	[(IP_HiddenUnits getVariable ["W05", []])] call STAF_fnc_enable;
	
	sleep 180;
	
	[(IP_HiddenUnits getVariable ["W06", []])] call STAF_fnc_enable;
	
	sleep 180;
	waitUntil {triggerActivated trgAOClear};
	IP_Flares = false;
	
	[west, "tRegroup2", ["Regroup around <marker name=""mTank"">Victor-2-2's position</marker>!", "Regroup", (markerText "mTank")], "mTank", true, 6, true, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	waitUntil {{(_x distance (getMarkerPos "mTank")) > 50} count (allPlayers - (entities "HeadlessClient_F")) == 0};
	["tRegroup2", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	["IP_BlackScreen", true, 1] remoteExec ["STAF_fnc_blackOut", 0, false];
	sleep 1;
	{[_x] call STAF_fnc_ACEHeal} forEach (allPlayers - (entities "HeadlessClient_F"));
	skipTime 5;
	sleep 1;
	["IP_BlackScreen", true, 1] remoteExec ["STAF_fnc_blackIn", 0, false];
	sleep 5;
	[["Five Hours Later"]] remoteExec ["BIS_fnc_EXP_camp_SITREP", 0, false];
	[(IP_HiddenUnits getVariable ["W07", []])] call STAF_fnc_enable;
	sleep 30;
	
	IP_Tank setDamage 0;
	[IP_Tank, 1] remoteExec ["setFuel", 0, true];
	[IP_Tank, true] remoteExec ["allowDamage", 0, true];
	["tRecover", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	[] spawn {
		waitUntil {!(alive IP_Tank)};
		["tTank", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	
	waitUntil {{(_x distance (getMarkerPos "mFOB")) > 100} count (allPlayers - (entities "HeadlessClient_F")) == 0};
	
	["tRTB", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {(alive IP_Tank) && {(IP_Tank distance (getMarkerPos "mFOB")) < 100}};
	
	["tTank", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};