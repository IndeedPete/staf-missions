// Variables
IP_TESTMODE = false;
IP_Convoy = [IP_Convoy_MRAP, IP_Convoy_Ammo, IP_Convoy_Fuel, IP_Convoy_APC];
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Respawn
[west, "mCave", (markerText "mCave")] call BIS_fnc_addRespawnPosition;
[west, "mCTRG", (markerText "mCTRG")] call BIS_fnc_addRespawnPosition;
[west, "mIEDFactory", (markerText "mIEDFactory")] call BIS_fnc_addRespawnPosition;
[west, "mOverwatch", (markerText "mOverwatch")] call BIS_fnc_addRespawnPosition;
[west, "mHideout", (markerText "mHideout")] call BIS_fnc_addRespawnPosition;

// Tasks
[west, "tConvoy", ["Ambush and destroy the <marker name=""mConvoy_Start"">Supply Vehicles of the AAF Convoy coming from Panochori</marker>!", "Ambush AAF Convoy", "AAF Convoy"], "mConvoy_Start", true, 6, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tOfficer", ["Locate and capture the AAF Officer, code name 'Solomon'! He is either in the <marker name=""mAAF_South"">AAF Outpost South</marker> or in the <marker name=""mAAF_East"">AAF Outpost East</marker>. Bring Solomon to the <marker name=""mMeet"">CTRG Meeting Point</marker> after.", "Capture Solomon", ""], nil, false, 6, false, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		//_x allowDamage false;
		[_x] call STAF_fnc_disable;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
	};//*/
} forEach (allMissionObjects "All");

// AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

[] spawn {
	waitUntil {!(isNil "IP_StartConvoy") && {IP_StartConvoy}};
	_convoy = IP_Convoy;//IP_HiddenUnits getVariable ["convoy", []];
	[_convoy] call STAF_fnc_enable;
	
	[["mConvoy7","mConvoy8","mConvoy9","mConvoy1","mConvoy2","mConvoy3","mConvoy4","mConvoy5","mConvoy6","mConvoy_End"], _convoy, true] spawn STAF_fnc_convoyDefend;
	
	waitUntil {{alive _x} count [IP_Convoy_Ammo, IP_Convoy_Fuel] == 0};	
	["tConvoy", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};//*/

[] spawn {
	waitUntil {!(isNil "IP_CTRG") && {IP_CTRG}};
	[(IP_HiddenUnits getVariable ["CTRG", []])] call STAF_fnc_enable;
};

[] spawn {
	waitUntil {!(isNil "IP_AtCTRG") && {IP_AtCTRG}};
	["tOfficer", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_WIN"] call BIS_fnc_endMissionServer;
};