// Variables
IP_TESTMODE = true;
IP_Trucks = [IP_Truck1, IP_Truck2, IP_Truck3, IP_Truck4, IP_Truck5];
IP_HiddenUnits = [] call STAF_fnc_createKeyValueMap;
IP_CargoObjs = [];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Hide Zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

{
	_x setMarkerAlpha 0;
} forEach ["mSafehouse", "mSafehouseArea", "mContainer", "mContainerArea"];

// Tasks
[independent, "tTrucks", ["Pick up the five US trucks at the <marker name=""mDecomBase"">Decomissioned US Base</marker> and return them to the <marker name=""mNATOBase"">US FOB Central</marker>! Do not lose more than two trucks!", "Transport the Trucks", ""], nil, true, 6, false, "download"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Units
{	
	_key = _x getVariable ["IP_HiddenUnits", ""];
	if (_key != "") then {
		//_x allowDamage false;
		_objs = IP_HiddenUnits getVariable [_key, []];
		_objs pushBack _x;
		IP_HiddenUnits setVariable [_key, _objs];
		[_x] call STAF_fnc_disable;
	};//*/
	
	if (_x getVariable ["IP_CargoObjs", false]) then {
		IP_CargoObjs pushBack _x;
	};
} forEach (allMissionObjects "All");

// AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance
// [2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Respawn
[independent, "mBase", (markerText "mBase")] call BIS_fnc_addRespawnPosition; 
[independent, "mCheckpoint", (markerText "mCheckpoint")] call BIS_fnc_addRespawnPosition;
[independent, "mNATOBase", (markerText "mNATOBase")] call BIS_fnc_addRespawnPosition;

// Weather
[0.25, 0, 0.1] call BIS_fnc_setFog;
[] spawn {
	(60 * 60) setFog [0, 0, 0];
};

// Mission Flow
[] spawn {
	waitUntil {{alive _x} count IP_Trucks < 3};
	["tTrucks", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	sleep 5;
	["STAF_Fail"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {{(alive _x) && {_x in (list trgDropZone)}} count IP_Trucks == {alive _x} count IP_Trucks};
	["tTrucks", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	sleep 5;
	
	[independent, "tSafehouse", ["BONUS OBJECTIVE<br/><br/>The FIA managed to hijack a container full of weapons and ammunition. We do not know its current whereabouts but we do know that the cell responsible for the theft is operating from a <marker name=""mSafehouse"">Safe House near Aktinarki</marker>. Raid the Safe House for hints on where they brought the stolen cargo container to!", "Raid FIA Safe House", "FIA Safe House"], "mSafehouse", true, 6, true, "intel"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	{
		_x setMarkerAlpha 1;
	} forEach ["mSafehouse", "mSafehouseArea"];
	[(IP_HiddenUnits getVariable ["safehouse", []])] call STAF_fnc_enable;
	
	waitUntil {!(isNil "IP_ComputerChecked")};	
	["tSafehouse", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	sleep 5;
	
	[independent, "tContainer", ["Checking the computer of the FIA commander revaled that they have another hideout somewhere in the <marker name=""mContainer"">Limni Swamps</marker>. The intel further indicates that they likely brought the stolen cargo container there. Locate the cargo container and bring it back to the <marker name=""mNATOBase"">US FOB Central</marker>!", "Locate and Secure Container", "Limni Swamps"], "mContainer", true, 6, true, "download"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	{
		_x setMarkerAlpha 1;
	} forEach ["mContainer", "mContainerArea"];
	[(IP_HiddenUnits getVariable ["container", []])] call STAF_fnc_enable;
	
	[] spawn {
		waitUntil {!(alive IP_Container)};
		["tContainer", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
		sleep 5;
		["STAF_Fail"] call BIS_fnc_endMissionServer;
	};
	
	//waitUntil {(alive IP_Container) && {IP_Container distance (getMarkerPos "mNATOBase") <= 50} && {isTouchingGround IP_Container}};
	waitUntil {(alive IP_Container) && {IP_Container distance (getMarkerPos "mNATOBase") <= 50}};
	
	["tContainer", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};//*/