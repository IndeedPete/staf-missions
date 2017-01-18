//Restrict 3rd Person
nul=[] execVM "scripts\3rdView Restrictions.sqf";

profileNamespace setVariable ["MCC_FCtutorialLogisticsHeli",false];

//___Snow script
// Disable the rain permanently.
[] spawn {
	while {true} do {
		0 setRain 0;
		sleep 1;
	};
};

[] spawn {
	// waitUntil {!(player getVariable ["IP_MonitorLifeSignsRunning", false])};
	// [] call IP_fnc_monitorLifeSigns; // Basic life sign monitoring, needed for cold breath.

	waitUntil {!(player getVariable ["IP_ColdBreath", false])};
	[player] remoteExecCall ["IP_fnc_coldBreathACE", -2, true]; // Cold breath.
	[player] call IP_fnc_coldBreathACE;

	waitUntil {((isNil "IP_snowFallRunning") OR {!(isNil "IP_snowFallRunning") && {!IP_snowFallRunning}})};
	[] call IP_fnc_snowFall; // Actual snow fall.
};
