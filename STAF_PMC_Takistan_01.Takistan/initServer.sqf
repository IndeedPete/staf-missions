// Variables
IP_TESTMODE = true;
IP_Vehicles = [IP_Car1, IP_Car2, IP_MRAP, IP_Heli];
IP_VehiclesStr = ["IP_Car1", "IP_Car2", "IP_MRAP", "IP_Heli"];

// Communicate dem vars
publicVariable "IP_TESTMODE";

// Functions
IP_fnc_m_saveProgress = {
	private ["_inidbi", "_players"];
	_inidbi = ["new", "STAF_CMP_PMC_TAKISTAN"] call OO_INIDBI;
	_players = allPlayers - entities "HeadlessClient_F";
	
	{
		_var = str(_x);
		_gear = [_x, [missionNamespace, (_var + "_Gear")]] call BIS_fnc_saveInventory;
		["write", ["TBL_Players", _var, _gear]] call _inidbi;
	} forEach _players;
	
	{
		_veh = missionNamespace getVariable [_x, ObjNull];
		if !(isNull _veh) then {		
			_alive = alive _veh;
			_damage = damage _veh;
			_fuel = fuel _veh;
			/*_ammo = ammo _veh;*/
			_cargo = [([(backpackCargo _veh)] call STAF_fnc_clusterArray), ([(itemCargo _veh)] call STAF_fnc_clusterArray), ([(magazineCargo _veh)] call STAF_fnc_clusterArray), ([(weaponCargo _veh)] call STAF_fnc_clusterArray)];
			_toSave = [_alive, _damage, _fuel, _cargo];
			["write", ["TBL_Vehicles", _x, _toSave]] call _inidbi;
		} else {
			["write", ["TBL_Vehicles", _x, [false]]] call _inidbi;
		};
	} forEach IP_VehiclesStr;
};
["IP_fnc_m_saveProgress"] call STAF_fnc_compileFinal;

// Persistence
["IP_DiscoEH", "onPlayerDisconnected", {
	[] call IP_fnc_m_saveProgress;
}] call BIS_fnc_addStackedEventHandler;

// Hide Zhe Markerz
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCC_Zone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
[independent, "tTransport", ["Escort the Client to a <marker name=""mDest"">Road to Zargabad in Northern Takistan</marker>!", "Escort Client", "Road to Zargabad"], "mDest", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tClient", ["The Client must not die or the mission will fail!", "Protect Client", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tVehicles", ["COMMANDER'S INTENT: do not lose more than one vehicle! (OPTIONAL)", "Preserve Vehicles (OPTIONAL)", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Destroyed Houses
[IP_DestructionCentre, 6000] spawn BIS_fnc_destroyCity;

// Mission Flows
[] spawn {
	waitUntil {(alive IP_Client) && {(vehicle IP_Client) inArea "mDestArea"}};
	["tTransport", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tClient", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	if ({alive _x} count IP_Vehicles >= 3) then {
		["tVehicles", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["PMC_Win"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {!(alive IP_Client)};
	["tClient", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tTransport", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tVehicles", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["PMC_Lose"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {{alive _x} count IP_Vehicles < 3};
	["tVehicles", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
};