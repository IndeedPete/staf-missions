// Init
[west, "tM03", [(format ["The enemy recently took over the <marker name=""mM03"">Village of Syrta</marker> and command fears this might just be the beginning of a larger offensive with insurgents and mercenaries pushing further south. To counter this development, a mechanised company has been diverted to the area in order to re-take <marker name=""mM03"">Syrta</marker>. TF COIN has been ordered to assist and support the regular troops in their efforts. The command of this mission has been assigned to Captain %1 who is waiting for a representative of TF COIN at an <marker name=""mM03_RV"">RV South of Syrta</marker>. The Captain will brief the TF COIN representative about the situation and the plan of action. In any case, due to the absence of civilians in the AO, a pre-emptive artillery strike will be carried out in order to soften the enemy's defences shortly before the attack.", (name IP_M03_Commander)]), "Seize Syrta", "Meet"], "mM03_RV", false, 1] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

if (["M03"] call IP_fnc_missionDone) exitWith {
	deleteVehicle trgM03Go;
	
	private "_arrows";
	_arrow = [];
	
	for _i from 1 to 11 do {
		_arrows pushBack ("mM03_Arr" + str(_i));
	};
	
	{
		deleteMarker _x;
	} forEach (["mM03_RV", "mM03_AO", "mM03_OP1", "mM03_OP2", "mM03_OP3"] + _arrows);
};

IP_M03_BLUFOR_Units = [];
{
	if ((side _x == civilian) && {(_x getVariable ["IP_Mission", ""]) == "M03"} && {!(_x in units(group IP_M03_Commander))}) then {
		IP_M03_BLUFOR_Units pushBack _x;
	};
} forEach allUnits;

[IP_M03_Commander, "M03Opener"] remoteExecCall ["IP_fnc_addConversation", 0, true];

// Main Flow
IP_mission_M03 = compileFinal '
	[IP_M03_Commander, "M03Opener"] remoteExecCall ["IP_fnc_removeConversation", 0, true];
	private ["_handles", "_allUnits"];
	_handles = [];
	_allUnits = [];
	["tM03", (getMarkerPos "mM03")] remoteExecCall ["BIS_fnc_taskSetDestination", 0, true];
	
	{
		_handles pushBack (_x spawn {
			_this setVehicleAmmo 1;
			for "_i" from 1 to 12 do { 
				_pos = "mM03_AO" call IP_fnc_SHKPos;
				_this doArtilleryFire [_pos, "12Rnd_230mm_rockets", 1];
				waitUntil {(_this ammo ((weapons _this) select 0)) == (12 - _i)};
			};
		});
		
		sleep 3;
	} forEach [IP_M03_Arty, IP_M03_Arty2];
	
	waitUntil {{scriptDone _x} count _handles == count _handles};
	sleep 50;
	{deleteVehicle _x} forEach [IP_M03_ArtyG, IP_M03_Arty2G];
	
	if (IP_TESTMODE) then {
		systemChat "M03: Artillery completed, spawning OFPOR units.";
	};
	
	// Spawn Reinforcements
	{
		_grp = _x;
		_units = units _grp;
		_grp setVariable ["GAIA_ZONE_INTEND", ["mM03_AO", "FORTIFY"], true];
		
		{
			_allUnits pushBack _x;
			[_x] call IP_fnc_createMerc;
		} forEach _units;
		
		if (IP_TESTMODE) then {
			[(leader _grp)] call IP_fnc_track;
		};
	} forEach [
		([(getMarkerPos "mM03Spawn1"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"), [], [], [], [], [], [], (markerDir "mM03Spawn1")] call BIS_fnc_spawnGroup),
		([(getMarkerPos "mM03Spawn2"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"), [], [], [], [], [], [], (markerDir "mM03Spawn2")] call BIS_fnc_spawnGroup),
		([(getMarkerPos "mM03Spawn3"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"), [], [], [], [], [], [], (markerDir "mM03Spawn3")] call BIS_fnc_spawnGroup)
	];
	
	{
		_grp = _x;
		_units = units _grp;
		_grp setVariable ["GAIA_ZONE_INTEND", ["mM03_AO", "MOVE"], true];
		
		{
			_allUnits pushBack _x;
			[_x] call IP_fnc_createMerc;
		} forEach _units;
		
		if (IP_TESTMODE) then {
			[(leader _grp)] call IP_fnc_track;
		};
	} forEach [
		([(getMarkerPos "mM03Spawn1"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"), [], [], [], [], [], [], (markerDir "mM03Spawn1")] call BIS_fnc_spawnGroup),
		([(getMarkerPos "mM03Spawn2"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"), [], [], [], [], [], [], (markerDir "mM03Spawn2")] call BIS_fnc_spawnGroup),
		([(getMarkerPos "mM03Spawn3"), east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"), [], [], [], [], [], [], (markerDir "mM03Spawn3")] call BIS_fnc_spawnGroup)
	];
	
	["IED_Section_M03", ["mM03_AO", (5 + round(random 5)), ["West", "CIV"]]] call CREATE_IED_SECTION;
	sleep 10;
	if (IP_TESTMODE) then {
		systemChat "M03: BLUFOR is moving in.";
	};
	
	{
		_x enableAI "TARGET";
		_x enableAI "AUTOTARGET"; 
		_x enableAI "FSM"; 
		_x setCaptive false;
		_x allowDamage true;
	} forEach IP_M03_BLUFOR_Units;
	
	IP_M03_Go = true;
	publicVariable "IP_M03_Go";
	
	_allCount = {alive _x} count _allUnits;
	waitUntil {
		_count = {alive _x} count _allUnits;
		if (IP_TESTMODE) then {
			systemChat (format ["M03: Enemies left %1/%2.", _count, _allCount]);
		};
		sleep 10;
		(_count <= (_allCount / 10))
	};
	
	["M03"] call IP_fnc_setMissionDone;
';