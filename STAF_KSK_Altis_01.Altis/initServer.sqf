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
"mLZ_Area3" setMarkerAlpha 0;
"mEnd2" setMarkerAlpha 0;

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
_arsenal = compile(preprocessFileLineNumbers "arsenal.sqf");
[IP_Arsenal] call _arsenal;
[IP_Arsenal2] call _arsenal;

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
		if ((_x isKindOf "Man") && {_x == (leader _grp)}) then {
			_grp setVariable ["GAIA_ZONE_INTEND", ["mMCC_Zone7", "NOFOLLOW"]];
		};
	} forEach _units;
};

[] spawn {
	waitUntil {
		((({alive _x} count [IP_Device1, IP_Device2, IP_Device3, IP_Device4] == 0)) &&
		({(alive _x) && {(_x distance (getMarkerPos "mEnd")) <= 350}} count allPlayers > 0) &&
		({(alive _x) && {(_x distance (getMarkerPos "mEnd")) <= 350}} count allPlayers == {alive _x} count allPlayers)) ||
		!(isNil "IP_AtRefuge")
	};
	
	["tRetreat", "CANCELED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	
	"mEnd2" setMarkerAlpha 1;
	[west, "tRetreat2", ["<marker name=""mEnd"">Point Refuge</marker> has been compromised. For ex-filtration, link-up with an <marker name=""mEnd2"">FIA Contact</marker> to the west instead.", "Meet FIA", "FIA"], "mEnd2", true, 3, true, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	IP_DropMarker = "mLZ_Area3";
	publicVariable "IP_DropMarker";
	[(IP_HiddenUnits getVariable ["FIA_End", []]), false] call STAF_fnc_enable;
	
	_units = IP_HiddenUnits getVariable ["End_Pats2", []];
	[_units, false] call STAF_fnc_enable;	
	{
		_grp = group _x;
		if ((_x isKindOf "Man") && {_x == (leader _grp)}) then {
			_grp setVariable ["GAIA_ZONE_INTEND", ["mMCC_Zone9", "NOFOLLOW"]];
		};
	} forEach _units;
	
	waitUntil {
		({(alive _x) && {(_x distance (getMarkerPos "mEnd2")) <= 15}} count allPlayers > 0) &&
		({(alive _x) && {(_x distance (getMarkerPos "mEnd2")) <= 15}} count allPlayers == {alive _x} count allPlayers)
	};	
	
	["tRetreat2", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};