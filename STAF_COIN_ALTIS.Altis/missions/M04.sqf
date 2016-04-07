// Init
[west, "tM04", [(format ["Intel received reports about an enemy %1 attack helicopter which seems to be stationed somewhere in the <marker name=""mAO"">AO</marker>. Its exact location is unknown but since its presence forms a major threat, it needs to be neutralised immediately. If TF COIN cannot determine the %1's exact location, a large scale vehicular assault on one of the enemy's known hideouts might lure him into calling it in.", (getText(configFile >> "CfgVehicles" >> "O_Heli_Attack_02_black_F" >> "displayName"))]), (format ["Neutralise the %1", (getText(configFile >> "CfgVehicles" >> "O_Heli_Attack_02_black_F" >> "displayName"))]), ""], nil, false, 1] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

if (["M04"] call IP_fnc_missionDone) exitWith {};

IP_M04_Heli addEventHandler ["Killed", {
	if (isServer) then {
		["M04"] call IP_fnc_setMissionDone;
	};
}];