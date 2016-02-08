//Automated Country Flag
[player] spawn IP_fnc_insignia;

//Automated TFR Radio
[player] execVM "radio.sqf";

//Restrict 3rd Person
nul=[] execVM "scripts\3rdView Restrictions.sqf";

// Clean up annoying bots in editor.
if (IP_TESTMODE && !isMultiplayer) then {
	{
		deleteVehicle _x;
	} forEach switchableUnits;
};