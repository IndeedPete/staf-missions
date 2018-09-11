// Variables
IP_TESTMODE = true;
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_LaterMarkers = ["mBlacksite", "mBlacksiteArr"];

// Communicate dem Vars
publicVariable "IP_TESTMODE";

// Hide zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;
{_x setMarkerAlpha 0} forEach IP_LaterMarkers;

// Respawn
[missionNamespace, "mStart", (markerText "mStart")] call BIS_fnc_addRespawnPosition;

// Tasks
[east, "tRescue", ["Locate and rescue Asset Strawberry. Bring him back to the <marker name=""mStart"">PMC Safe House</marker>!<br/><br/><img image='img\hvi.jpg' width='400' height='400'/>", "Rescue Strawberry", ""], objNull, false, 1, false, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[east, "tPolice", ["Search the <marker name=""mPolice"">Police Station</marker> for Asset Strawberry!", "Investigate Police Station", "Police Station"], "mPolice", false, 4, false, "p"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[east, ["tRaid", "tPolice"], ["Raid the <marker name=""mPolice"">Police Station</marker>. Neutralise all enemies!", "Raid Police Station", "Police Station"], "mPolice", true, 7, false, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[east, ["tHolding", "tPolice"], ["Search the <marker name=""mHolding"">Holding Cell</marker> for Asset Strawberry!", "Search Holding Cell", "Holding Cell"], "mHolding", false, 6, false, "exit"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[east, ["tDownload", "tPolice"], ["Download files from the police chief's computer in the <marker name=""mOffice"">Offices</marker>!", "Download Data", "Offices"], "mOffice", false, 5, false, "download"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		[_x, true] call STAF_fnc_disable;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
	};//*/
	
	if ((_x isKindOf "Man") && {side _x == west} && {_key != "blacksite"}) then {
		_x removeMagazines "HandGrenade";
	};
} forEach (allMissionObjects "All");

// Weather
// [1, 0.02, 0] call BIS_fnc_setFog;

// Mission Flow
[] spawn {
	// Radio Protocols
	waitUntil {!(isNil "IP_RaidDone") && {IP_RaidDone}};
	["tRaid", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {!(isNil "IP_HoldingDone") && {IP_HoldingDone}};
	["tHolding", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {!(isNil "IP_LaptopDone") && {IP_LaptopDone}};
	sleep 5;
	["tPolice", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	{_x setMarkerAlpha 1} forEach IP_LaterMarkers;
	[(IP_HiddenUnits getVariable ["blacksite", []]), true] call STAF_fnc_enable;
	[east, "tBlacksite", ["Search the <marker name=""mBlacksite"">Blacksite</marker> for Asset Strawberry!", "Investigate Blacksite", "Blacksite"], "mBlacksite", true, 7, true, "b"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	waitUntil {!(isNil "IP_BlacksiteDone") && {IP_BlacksiteDone}};
	["tBlacksite", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[(IP_HiddenUnits getVariable ["end", []]), true] call STAF_fnc_enable;
	
	waitUntil {!(isNil "IP_EndDone") && {IP_EndDone}};
	_state = if (alive IP_HVI) then {"SUCCEEDED"} else {"FAILED"};
	["tRescue", _state] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {!(isNil "IP_LaptopDone") && {IP_LaptopDone}};
	["tDownload", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};