// Init
[west, "tM02", [(format ["The enemy uses a <marker name=""mM02"">Decommissioned Airfield North of Abdera</marker> for illegal smuggling operations and human trafficking. Two currently grounded %1 transport helicopters have been sighted and need to be destroyed. Intel indicates possible <marker name=""mM02AA"">Static and Mobile AA are West of the Airfield</marker>, as well as civilians around the airfield which must not be harmed.", (getText(configFile >> "CfgVehicles" >> "I_Heli_Transport_02_F" >> "displayName"))]), "Destroy the Transport Helicopters", "Transport Helicopters"], "mM02", false, 1] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

if (["M02"] call IP_fnc_missionDone) exitWith {
	deleteMarker "mM02AA";
	deleteMarker "mM02AAArea";
};

IP_M02_Helis = [IP_M02_Heli1, IP_M02_Heli2];

{
	_x addEventHandler ["Killed", {
		if (isServer && {!(missionNamespace getVariable [("IP_M02_Started"), false])}) then {
			["M02"] call IP_fnc_startMission;
		};
	}];
} forEach IP_M02_Helis;

// Main Flow
IP_mission_M02 = compileFinal '
	_dropSequence = {
		params [
			"_units",
			"_veh"
		];
		
		waitUntil {((_veh distance (getMarkerPos "mM02")) <= 500) OR !(alive _veh) OR !(canMove _veh)};		
		if (!(alive _veh) OR !(canMove _veh)) exitWith {};		
		
		{
			[_x, _veh] call IP_fnc_paradrop;
			sleep 0.5;
		} forEach _units;
	};
	
	[] spawn {
		waitUntil {
			sleep 2;
			{alive _x} count IP_M02_Helis == 0
		};
		
		["M02"] call IP_fnc_setMissionDone;
	};

	if (IP_TESTMODE) then {
		systemChat "M02: Reinforcements incoming.";
	};
	
	// Spawn Reinforcements
	_grp = (([(getMarkerPos "mM02Spawn1"), (markerDir "mM02Spawn1"), "O_Heli_Light_02_unarmed_F", east] call BIS_fnc_spawnVehicle) select 2);
	_veh1 = vehicle(leader _grp);
	_grp setBehaviour "CARELESS";
	_grp setCombatMode "BLUE";
	
	_wp = _grp addWaypoint [(getMarkerPos "mM02"), 0, 0];
	_wp setWaypointType "MOVE";
	
	_wp = _grp addWaypoint [(getMarkerPos "mM02Spawn1End"), 0, 1];
	_wp setWaypointType "MOVE";
	
	_wp setWaypointStatements ["true", "if (isServer) then {{deleteVehicle _x} forEach ([(vehicle this)] + (units(group this)))};"];
	
	{
		_x setVariable ["NOAI", true, true];
	} forEach (units _grp);
	
	_grp = (([(getMarkerPos "mM02Spawn2"), (markerDir "mM02Spawn2"), "O_Heli_Attack_02_black_F", east] call BIS_fnc_spawnVehicle) select 2);
	_veh2 = vehicle(leader _grp);
	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
	
	_wp = _grp addWaypoint [(getMarkerPos "mM02"), 0, 0];
	_wp setWaypointType "MOVE";
	
	_wp = _grp addWaypoint [(getMarkerPos "mM02"), 0, 1];
	_wp setWaypointType "SAD";
	
	_wp = _grp addWaypoint [(getMarkerPos "mM02"), 0, 2];
	_wp setWaypointType "CYCLE";

	{
		_index = _forEachIndex;
		_grp = _x;	
		_grp setCombatMode "RED";

		_wp = _grp addWaypoint [(getMarkerPos "mM02"), 0, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointFormation "LINE";

		_wp = _grp addWaypoint [(getMarkerPos "mM02"), 0, 1];
		_wp setWaypointType "SAD";
		
		_wp = _grp addWaypoint [(getMarkerPos "mM02"), 0, 2];
		_wp setWaypointType "CYCLE";
		
		_units = units _grp;
		{
			[_x] call IP_fnc_createMerc;
			
			if (_index == 0) then {
				_x moveInCargo _veh1;
			} else {
				_x moveInCargo _veh2;
			};
		} forEach _units;
		
		if (_index == 0) then {
			[_units, _veh1] spawn _dropSequence;
		} else {
			[_units, _veh2] spawn _dropSequence;
		};
		
		if (IP_TESTMODE) then {
			[(leader _grp)] call IP_fnc_track
		};
	} forEach [
		([(getMarkerPos "mM02Spawn2"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"), [], [], [], [], [], [], (markerDir "mM02Spawn2")] call BIS_fnc_spawnGroup),
		([(getMarkerPos "mM02Spawn2"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"), [], [], [], [], [], [], (markerDir "mM02Spawn2")] call BIS_fnc_spawnGroup)
	];
';