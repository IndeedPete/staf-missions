// The HC does not need to process that shit below.
if !(hasInterface) exitWith {};

// Functions
IP_fnc_m_formatTimeStr = {
	params ["_tl", "_min", "_sec", "_minStr", "_secStr"];
	_min = floor(_tl / 60);
	_sec = floor(_tl - (_min * 60));
	_minStr = if (_min < 10) then {("0" + str(_min))} else {str(_min)};
	_secStr = if (_sec < 10) then {("0" + str(_sec))} else {str(_sec)};
	(_minStr + ":" + _secStr)	
};

IP_fnc_m_displayTimeLeft = {
	waitUntil {!(isNil "IP_TimeLeft")};
	while {IP_TimeLeft > 0} do {
		hintSilent ("Time Left: " + ([IP_TimeLeft] call IP_fnc_m_formatTimeStr));
		sleep 1;
	};
};

// Debug
[] spawn {
	waitUntil {!(isNil "IP_TESTMODE")};
	if (IP_TESTMODE) then {
		player allowDamage false;
		player enableFatigue false;
		player enableStamina false;

		if !(isMultiplayer) then {
			{
				deleteVehicle _x;
			} forEach switchableUnits;
		};
		
		{
			[(leader _x)] call STAF_fnc_track;
		} forEach allGroups;
	} else {
		if (player != IP_Zeus) then {
			// Restrict 3rd Person
			[] spawn STAF_fnc_viewRestrictions;
		};
	};
};

// Player Loadout Restore and Respawn
[player, 100] call BIS_fnc_respawnTickets;
[] spawn {
	waitUntil {(time > 0) && {!(isNull player)}};
	
	if ({_x == "ACE_EarPlugs"} count (items player) == 0) then {
		player addItem "ACE_EarPlugs"; 
	};
	
	player addEventHandler ["Respawn", {
		player allowDamage false;
		if ({_x == "ACE_EarPlugs"} count (items player) == 0) then {
			player addItem "ACE_EarPlugs"; 
		};
		
		[] spawn {
			sleep 30;
			player allowDamage true;
		};
	}];
	
	[] call IP_fnc_m_displayTimeLeft;
};

// Snow Fall
[] spawn {
	waitUntil {!(player getVariable ["IP_ColdBreath", false])};
	[player] remoteExecCall ["IP_fnc_coldBreathACE", -2, true]; // Cold breath.
	[player] call STAF_fnc_coldBreathACE;

	waitUntil {((isNil "IP_snowFallRunning") OR {!(isNil "IP_snowFallRunning") && {!IP_snowFallRunning}})};
	[] call STAF_fnc_snowFall; // Actual snow fall.
};