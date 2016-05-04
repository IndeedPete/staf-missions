// Variables
IP_TESTMODE = true;

// Communicate dem vars
publicVariable "IP_TESTMODE";

// [AiCacheDistance(players), TargetFPS(-1 for Auto), Debug, CarCacheDistance, AirCacheDistance, BoatCacheDistance] execVM "zbe_cache\main.sqf";
//[2000, -1, IP_TESTMODE, 100, 1000, 1000] execVM "zbe_cache\main.sqf";
[2000, -1, IP_TESTMODE, 100, 1000, 1000] spawn ZBE_fnc_main;

// Hide Flight Path Dots
{
	if (markerType _x == "hd_dot") then {
		_x setMarkerAlpha 0;
	};
} forEach allMapMarkers;

// Track Units
if (IP_TESTMODE) then {
	{
		[(leader _x)] call IP_fnc_track;
	} forEach allGroups;
} else {
	for "_i" from 1 to 10 do {
		("mPat" + str(_i)) setMarkerAlpha 0;
	};
};

// Force Lights On
{
	if (side _x == west) then {
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "forceOn";
	};
} forEach allUnits;

[] spawn {	
	while {true} do {
		{
			if ((side _x == west) && {alive _x}) then {
				_x enableGunLights "forceOn";
			};
		} forEach allUnits;
		
		sleep 5;
	};
};

// Rainy Season Weather
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
};

// Tasks
[independent, "tSatPhone", ["Shut down the communication facilities at the <marker name=""mRadio"">Radio Relay</marker>! Find and secure the satellite phone!", "Shut Down Comms", "Radio Relay"], "mRadio", true, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[independent, "tContact", ["Locate the contact in one of the four villages <marker name=""mContact1"">Ban Khe</marker>, <marker name=""mContact2"">Bahnar</marker>, <marker name=""mContact3"">Long Vinh</marker>, or <marker name=""mContact4"">Khe Luoi</marker> and extract him back to the <marker name=""mFARP"">FARP</marker>!", "Extract the Contact", ""], nil, false, 1, false] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

//  Mission Flow / Contact
[] spawn {
	IP_Contact allowDamage false;
	
	private "_buildingPositions";
	_buildingPositions = [];
	{
		_centre = getMarkerPos _x;
		_radius = (getMarkerSize _x) select 0;
		_rawBuildings = _centre nearObjects ["House", _radius];
		
		{
			_building = _x;
			_positions = [_building] call BIS_fnc_buildingPositions;
			
			if (count _positions > 0) then {
				_buildingPositions = _buildingPositions + _positions;
			};
		} forEach _rawBuildings;
	} forEach ["mVillage_Area1", "mVillage_Area2", "mVillage_Area3", "mVillage_Area4"];
	
	IP_Contact setPos (selectRandom _buildingPositions);
	IP_Contact setDir (random 359);
	
	IP_Contact addEventHandler ["Killed", {
		["tContact", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	}];
	
	sleep 5;	
	if !(IP_TESTMODE) then {
		IP_Contact allowDamage true;
	};
	
	waitUntil {(IP_Contact inArea "mFARP_Area")};
	if (alive IP_Contact) then {
		["tContact", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};
};

// Sat Phone
[IP_SatPhone, ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\take_ca.paa'/> 'Secure Satellite Phone.'", {IP_SatPhoneTaken = true; publicVariable "IP_SatPhoneTaken";}, [], 1.5, false, true, "", "(_this distance _target < 3)"]] remoteExec ["addAction", 0, true];
[] spawn {
	waitUntil {!(isNil "IP_SatPhoneTaken") && {IP_SatPhoneTaken}};
	deleteVehicle IP_SatPhone;
	["tSatPhone", "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

// End Mission
[] spawn {
	waitUntil {(("tSatPhone" call BIS_fnc_taskState) == "SUCCEEDED") && {(("tContact" call BIS_fnc_taskState) == "SUCCEEDED") OR (("tContact" call BIS_fnc_taskState) == "FAILED")} && {{_x inArea "mFARP_Area"} count (allPlayers - entities "HeadlessClient_F") == count (allPlayers - entities "HeadlessClient_F")}};
	sleep 5;
	["Won"] call BIS_fnc_endMissionServer;
};