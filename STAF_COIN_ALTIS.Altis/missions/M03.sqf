// Init
[west, "tM03", [(format ["The enemy uses a <marker name=""mM02"">Decommissioned Airfield North of Abdera</marker> for illegal smuggling operations and human trafficking. Two currently grounded %1 transport helicopters have been sighted and need to be destroyed. Intel indicates possible <marker name=""mM02AA"">Static and Mobile AA are West of the Airfield</marker>, as well as civilians around the airfield which must not be harmed.", (getText(configFile >> "CfgVehicles" >> "I_Heli_Transport_02_F" >> "displayName"))]), "Attack and Hold Syrta", "Transport Helicopters"], "mM03", false, 1] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

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
	if ((side _x == civilian) && {(_x getVariable ["IP_Mission", ""]) == "M03"}) then {
		IP_M03_BLUFOR_Units pushBack _x;
	};
} forEach allUnits;

// Main Flow
IP_mission_M03 = compileFinal '
	{
		_x enableAI "TARGET";
		_x enableAI "AUTOTARGET"; 
		_x enableAI "FSM"; 
		_x setCaptive false;
		_x allowDamage true;
	} forEach IP_M03_BLUFOR_Units;
	
	IP_M03_Go = true;
	publicVariable "IP_M03_Go";
';