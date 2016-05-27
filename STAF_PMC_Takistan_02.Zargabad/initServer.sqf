// Variables
IP_TESTMODE = true;
IP_Vehicles = [IP_Car1, IP_Car2, IP_Car3, IP_MRAP, IP_Heli, IP_Heli2];
IP_EFObjects = [];

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
"mHostage" setMarkerAlpha 0;
{
	if ((markerType _x == "mil_dot") OR {_x find "mMCC_Zone" >= 0} OR {_x find "mTAOR" >= 0}) then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Contact
[IP_Contact, ["<img size='1' shadow='1' image='\a3\ui_f\data\igui\cfg\Actions\talk_ca.paa'/> Get Journalist Whereabouts", {
	IP_Contact remoteExec ["removeAllActions", 0, true];
	IP_MeetingDone = true;
	publicVariable "IP_MeetingDone";
}, [], 1.5, false, true, "", "(_this distance _target < 3)"]] remoteExec ["addAction", 0, true];

// Tasks
[independent, "tMeet", ["Meet with the ION contact in <marker name=""mMeet"">Central Zargabad</marker> in order to find out where the Journalist is being held! The contact should be in the first floor of the market buildings.", "Meet Contact", "Meeting Point"], "mMeet", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tClients", ["The Clients must not die or the mission will fail!", "Protect Clients", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tDetect", ["COMMANDER'S INTENT: do not get detected by the NTA until after meeting the contact! (OPTIONAL)", "Avoid Detection (OPTIONAL)", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// BLUFOR
{
	if (side(leader _x) == west) then {
		_x setVariable ["zbe_cacheDisabled", true];
	};
} forEach allGroups;

{
	if (((_x isKindOf "Man") && {side _x == west}) OR {_x getVariable ["IP_EFVehicle", false]}) then {
		[_x] call STAF_fnc_disable;
		IP_EFObjects pushBack _x;
	};
} forEach (allMissionObjects "All");

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Mission Flows
[] spawn {
	waitUntil {({alive _x} count [IP_Client, IP_Journalist] == 2) && {{(vehicle _x) inArea "mBaseArea"} count [IP_Client, IP_Journalist] == 2}};
	["tFree", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	["tClients", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["Won"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {({alive _x} count [IP_Client, IP_Journalist] < 2)};
	["tClients", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	[] call IP_fnc_m_saveProgress;
	sleep 5;
	["Lost"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {!(isNil "IP_MeetingDone") && {IP_MeetingDone}};
	["tMeet", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	if !(triggerActivated trgDetected) then {["tDetect", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true]};
	[independent, "tFree", ["Free the Journalist from the NTA-held <marker name=""mHostage"">President's Residence</marker> and bring him back to the <marker name=""mBase"">Base</marker>!", "Rescue Journalist", "Residence"], "mHostage", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	"mHostage" setMarkerAlpha 1;
	[] call IP_fnc_m_saveProgress;
};

[] spawn {
	waitUntil {triggerActivated trgDetected};
	if (isNil "IP_MeetingDone") then {
		["tDetect", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
};

[] spawn {
	waitUntil {daytime > 19};
	[(getMarkerPos "mFlyStart1"), (getMarkerPos "mFlyEnd1"), 150, "NORMAL", "IP_I_Plane_Fighter_03_CAS_F_EFSnow", west] call BIS_fnc_ambientFlyBy;
	sleep 1;
	[(getMarkerPos "mFlyStart2"), (getMarkerPos "mFlyEnd2"), 150, "NORMAL", "IP_I_Plane_Fighter_03_CAS_F_EFSnow", west] call BIS_fnc_ambientFlyBy;
	sleep 1;
	[(getMarkerPos "mFlyStart3"), (getMarkerPos "mFlyEnd3"), 150, "NORMAL", "IP_I_Plane_Fighter_03_CAS_F_EFSnow", west] call BIS_fnc_ambientFlyBy;	
	sleep 25;
	
	for "_i" from 0 to 19 do {
		_pos = "mMCC_Zone2" call IP_fnc_SHKPos;
		"Bo_GBU12_LGB_MI10" createVehicle _pos;
		sleep 2;
	};
	
	[IP_EFObjects] call STAF_fnc_enable;
	// sleep 30;
	IP_EFGo = true;
	publicVariable "IP_EFGo";
};