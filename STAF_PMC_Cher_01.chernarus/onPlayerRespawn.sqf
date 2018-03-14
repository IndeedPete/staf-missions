params ["_unit"];
waitUntil {!(isNull _unit) && {!(_unit getVariable ["IP_ColdBreath", false])}};
[_unit] remoteExecCall ["STAF_fnc_coldBreathACE", -2, true]; // Cold breath.
[player] call STAF_fnc_coldBreathACE;

waitUntil {((isNil "IP_snowFallRunning") OR {!(isNil "IP_snowFallRunning") && {!IP_snowFallRunning}})};
[_unit] call STAF_fnc_snowFall;