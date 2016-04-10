// Init
[west, "tM00", ["Clear the <marker name=""mAO"">AO</marker> of enemy presence. Red flag markers indicate hostile zones while blue flags stand for cleared ones. Expect hostile presence even when close to a blue flag marker!", "Clear the AO", "AO"], "mAO", false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
if (["M00"] call IP_fnc_missionDone) exitWith {};

// Main Flow
[] spawn {
	_zoneCount = count("getNumber(_x >> 'active') == 1" configClasses (missionConfigFile >> "CfgZones"));
	
	waitUntil {
		sleep 60;
		!(isNil "IP_Zones") && {!(isNil "IP_COIN_ZonesCleared")} && {(count IP_COIN_ZonesCleared) == _zoneCount}
	};

	["M00"] call IP_fnc_setMissionDone;
};