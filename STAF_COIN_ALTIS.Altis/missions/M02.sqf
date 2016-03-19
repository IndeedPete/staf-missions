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
';