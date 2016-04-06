// Init
[west, "tM01", [(format ["Callsign %1 reported a possible IED in <marker name=""mM01"">Koroni</marker>. Secure the area and clear the possible IED threat.", (groupID IP_M01_Group)]), "Clear IED Threat", "Possible IED"], "mM01", false, 1] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

if (["M01"] call IP_fnc_missionDone) exitWith {
	deleteVehicle trgM01;
	deleteMarker "mM01Display";
};

[] spawn {
	waitUntil {!(isNil "iedsAdded") && {iedsAdded}};
	["IED_Section_M01", ["mM01", [0, 0, 0, 100] , ["West", "CIV"]]] call CREATE_IED_SECTION;
};

// Main Flow
IP_mission_M01 = compileFinal '
	[] spawn {
		waitUntil {
			sleep 2;
			"IED_Section_M01" call GET_REMAINING_IED_COUNT == 0
		};
		
		// ["tM01", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
		["M01"] call IP_fnc_setMissionDone;
	};

	// Send Scout Team
	_scoutGrp = [(getMarkerPos "mM01Spawn2"), east, ["O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Sharpshooter_F"], [], ["CORPORAL", "PRIVATE", "PRIVATE"], [], [], [], [], (markerDir "mM01Spawn2")] call BIS_fnc_spawnGroup;
	//_scoutGrp setBehaviour "STEALTH";
	_scoutGrp setCombatMode "GREEN";

	_wp = _scoutGrp addWaypoint [(getMarkerPos "mM01Scout1"), 0, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "COLUMN";
	_wp setWaypointTimeout [20, 40, 60];

	_wp = _scoutGrp addWaypoint [(getMarkerPos "mM01Scout2"), 0, 1];
	_wp setWaypointType "MOVE";
	_wp setWaypointCombatMode "STEALTH";

	if (IP_TESTMODE) then {
		[(leader _scoutGrp)] call IP_fnc_track;
	};

	sleep (30 + random 30);
	if (({alive _x} count (units _scoutGrp) == 0) OR {("tM01" call BIS_fnc_taskState) == "SUCCEEDED"}) exitWith {
		if (IP_TESTMODE) then {
			systemChat "M01: Scout team eliminated, no reinforcements are spawned.";
		};
	};

	if (IP_TESTMODE) then {
		systemChat "M01: Reinforcements incoming.";
	};

	// Spawn Reinforcements
	{
		_grp = _x;	
		_grp setCombatMode "RED";

		_wp = _grp addWaypoint [(getMarkerPos "mM01"), 0, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointFormation "LINE";

		_wp = _grp addWaypoint [(getMarkerPos "mM01"), 0, 1];
		_wp setWaypointType "SAD";
		
		{
			[_x] call IP_fnc_createMerc;
		} forEach (units _grp);
		
		if (IP_TESTMODE) then {
			[(leader _grp)] call IP_fnc_track
		};
	} forEach [
		([(getMarkerPos "mM01Spawn3"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"), [], [], [], [], [], [], (markerDir "mM01Spawn3")] call BIS_fnc_spawnGroup),
		([(getMarkerPos "mM01Spawn4"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"), [], [], [], [], [], [], (markerDir "mM01Spawn4")] call BIS_fnc_spawnGroup),
		([(getMarkerPos "mM01Spawn5"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"), [], [], [], [], [], [], (markerDir "mM01Spawn5")] call BIS_fnc_spawnGroup)
	];
	
	_grp = (([(getMarkerPos "mM01Spawn2"), (markerDir "mM01Spawn2"), "O_G_Offroad_01_armed_F", east] call BIS_fnc_spawnVehicle) select 2);
	_wp = _grp addWaypoint [(getMarkerPos "mM01"), 0, 0];
	_wp setWaypointType "MOVE";

	_wp = _grp addWaypoint [(getMarkerPos "mM01"), 0, 1];
	_wp setWaypointType "SAD";
';