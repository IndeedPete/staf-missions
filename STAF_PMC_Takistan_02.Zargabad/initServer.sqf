// Variables
IP_TESTMODE = true;
IP_Vehicles = [IP_Car1, IP_Car2, IP_Car3, IP_MRAP, IP_Heli, IP_Heli2];

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
		_var = str(_x);
		if !(isNull _x) then {		
			_alive = alive _x;
			_damage = damage _x;
			_fuel = fuel _x;
			/*_ammo = ammo _x;*/
			_cargo = [([(backpackCargo _x)] call STAF_fnc_clusterArray), ([(itemCargo _x)] call STAF_fnc_clusterArray), ([(magazineCargo _x)] call STAF_fnc_clusterArray), ([(weaponCargo _x)] call STAF_fnc_clusterArray)];
			_toSave = [_alive, _damage, _fuel, _cargo];
			["write", ["TBL_Vehicles", _var, _toSave]] call _inidbi;
		} else {
			["write", ["TBL_Vehicles", _var, [false]]] call _inidbi;
		};
	} forEach IP_Vehicles;
};
["IP_fnc_m_saveProgress"] call STAF_fnc_compileFinal;

// Persistence
["IP_DiscoEH", "onPlayerDisconnected", {
	[] call IP_fnc_m_saveProgress;
}] call BIS_fnc_addStackedEventHandler;

// Load Vehicle Data
_inidbi = ["new", "STAF_CMP_PMC_TAKISTAN"] call OO_INIDBI;
{
	_veh = _x;
	_loadout = ["read", ["TBL_Vehicles", str(_veh), []]] call _inidbi;
	if (count _loadout > 0) then {
		if (_loadout select 0) then {
			clearBackpackCargoGlobal _veh;
			clearItemCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;
			clearWeaponCargoGlobal _veh;
			
			_veh setDamage (_loadout select 1);
			_veh setFuel (_loadout select 2);
			_cargo = _loadout select 3;
			{_veh addBackpackCargoGlobal _x} forEach (_cargo select 0);
			{_veh addItemCargoGlobal _x} forEach (_cargo select 1);
			{_veh addMagazineCargoGlobal _x} forEach (_cargo select 2);
			{_veh addWeaponCargoGlobal _x} forEach (_cargo select 3);
		} else {
			deleteVehicle _x;
		};
	};
} forEach [IP_Car1, IP_Car2, IP_MRAP, IP_Heli];

// Hide Zhe Markerz
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCC_Zone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Tasks
//[independent, "tTransport", ["Escort the Client to a <marker name=""mDest"">Road to Zargabad in Northern Takistan</marker>!", "Escort Client", "Road to Zargabad"], "mDest", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tClient", ["The Client must not die or the mission will fail!", "Protect Client", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
//[independent, "tVehicles", ["COMMANDER'S INTENT: do not lose more than one vehicle! (OPTIONAL)", "Preserve Vehicles (OPTIONAL)", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Destroyed Houses
//[IP_DestructionCentre, 6000] spawn BIS_fnc_destroyCity;

/*/ Mission Flows
[] spawn {
	waitUntil {(alive IP_Client) && {(vehicle IP_Client) inArea "mDestArea"}};
	["tTransport", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tClient", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	if ({alive _x} count IP_Vehicles >= 3) then {
		["tVehicles", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["Won"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {!(alive IP_Client)};
	["tClient", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tTransport", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tVehicles", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["Lost"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {{alive _x} count IP_Vehicles < 3};
	["tVehicles", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
};*/