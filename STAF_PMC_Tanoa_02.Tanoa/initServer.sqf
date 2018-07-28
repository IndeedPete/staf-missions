IP_TESTMODE = false;

// Communicate dem Vars
publicVariable "IP_TESTMODE";

// Hide zhe Markerz
{
	if ((_x find "mMCC_Zone" >= 0) OR {_x find "mTAOR" >= 0} OR {_x find "mArty" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Weather
[0.5, 0.01, 0] call BIS_fnc_setFog;

// Tasks
[true, "tLocate", ["Locate Lt.Col. Francois Mignard somewhere around <marker name=""mCommander"">Hill 309</marker>!<br/><br/><img image='img\colonel.jpg' width='508' height='508'/>", "Locate Lt.Col. Mignard", "Hill 309"], "mCommander", true, 1, false, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[true, "tMeet", ["Hand over Lt.Col. Francois Mignard to the CTRG team at <marker name=""mMeet"">Point Brexit</marker>!", "Meet with CTRG", "Point Brexit"], "mMeet", false, 3, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[true, "tProtect", ["Lt.Col. Francois Mignard must survive!", "Protect Lt.Col. Mignard", ""], nil, false, 5, false, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Mission Flow
[] spawn {
	["mArty1", {true}, 0, 0, [0.5, 1], "ARTY"] spawn STAF_fnc_arty;
	//["mArty2", {true}, 0, 0, [0.75, 1.25], "ARTY"] spawn STAF_fnc_arty;
	["mArty3", {true}, 0, 0, [0.75, 1.25], "ARTY"] spawn STAF_fnc_arty;
	["mArty4", {true}, 0, 0, [0.75, 1.25], "ARTY"] spawn STAF_fnc_arty;
	
	waitUntil {!(isNil "IP_Located")};
	["tLocate", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	waitUntil {!(isNil "IP_Meet")};
	["tMeet", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	
	sleep 10;
	
	if (alive IP_Colonel) then {
		["tProtect", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	} else {
		["tProtect", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
};