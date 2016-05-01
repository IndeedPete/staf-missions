// Variables
IP_TESTMODE = true;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Track Units
if (IP_TESTMODE) then {
	{
		[(leader _x)] call IP_fnc_track;
	} forEach allGroups;
};

/*/ Rainy Season Weather
[] spawn {
	_min = 180;
	_max = 300;
	_transMin = 30;
	_tansMax = 60;
	
	while {true} do {
		_duration = _min + random(_max - _min);
		_trans = _transMin + random(_tansMax - _transMin);
		
		_trans setRain 1;
		_trans setFog [0, 0.01, 0];
		
		sleep (_duration + _trans);
		
		_trans setRain 0;
		_trans setFog [0.5, 0.01, 0];
		
		sleep (_duration + _trans);
	};	
};*/

/*/ Tasks & Mission Flow
[west, "tDepot", ["Regroup at the <marker name=""mDepot"">Old USMC Depot</marker> and acquire leftover weapons and vehicles!", "Regroup at Depot", "Depot"], "mDepot", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tLZ", ["Reach the <marker name=""mLZ"">Pick-Up Point</marker> and extract from Chernarus! All units need to be there at the same time to complete the task, we leave no man behind!", "Reach the Pick-Up", "Pick-Up"], "mLZ", false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[] spawn {
	waitUntil {triggerActivated trgDepot};
	["tDepot", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	_pos = getMarkerPos "mDepot";
	{
		_x setMarkerPos _pos;
	} forEach ["respawn_west_1", "respawn_west_2", "respawn_west_3"];
	
	120 setRain 0;
	180 setFog [0.5, 0.01, 200];
	//240 setOvercast 0.75;
	//forceWeatherChange;
	
	waitUntil {triggerActivated trgEnd};
	["tLZ", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["Won"] call BIS_fnc_endMissionServer;
};*/