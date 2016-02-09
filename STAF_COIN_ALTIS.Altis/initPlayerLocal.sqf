//Automated Country Flag
[player] spawn IP_fnc_insignia;

//Automated TFR Radio
[player] execVM "radio.sqf";

// Debug
[] spawn {
	waitUntil {!isNil "IP_TESTMODE"};
	if (IP_TESTMODE) then {
		player allowDamage false;
		player enableFatigue false;
		player enableStamina false;

		if (!isMultiplayer) then {
			{
				deleteVehicle _x;
			} forEach switchableUnits;
		};
		
		{
			[(leader _x)] call IP_fnc_track;
		} forEach allGroups;
	} else {
		//Restrict 3rd Person
		nul=[] execVM "scripts\3rdView Restrictions.sqf";
	};
};