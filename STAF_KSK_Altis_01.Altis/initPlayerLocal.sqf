// The HC does not need to process that shit below.
if !(hasInterface) exitWith {};

// Parajump Wrapper
IP_fnc_m_paraJumpWrapper = {
	_dude = _this select 0;
	if (_dude == leader(group _dude)) then {
		IP_LeaderJumped = true;
		publicVariable "IP_LeaderJumped";
	};
	
	_pos = IP_DropMarker call STAF_fnc_SHKPos;		
	["IP_Blackscreen"] call STAF_fnc_blackOut;
	sleep 2;
	(format ["%1 parajumped into the AO.", (name player)]) remoteExec ["systemChat", 0, false];
	_dude setPos _pos;
	_dude setDir 180;
	[_dude, _dude] call STAF_fnc_paradrop;	
	["IP_Blackscreen"] call STAF_fnc_blackIn;
};

// Parajump Action
[
	IP_Pilot,
	"Parajump Into AO",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff2_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
	"_this distance _target <= 3",
	"
		(IP_LeaderJumped OR (_caller == leader(group _caller)))
	",
	{
		if (!IP_LeaderJumped && (_caller != leader(group _caller))) then {
			hint "You are not allowed to jump yet. The group leader must jump first.";
		};
	},
	{},
	{[(_this select 1)] spawn IP_fnc_m_paraJumpWrapper;},
	{},
	[],
	3
] call BIS_fnc_holdActionAdd;

// Debug
[] spawn {
	waitUntil {!(isNil "IP_TESTMODE")};
	if (IP_TESTMODE) then {
		player allowDamage false;
		player enableFatigue false;
		player enableStamina false;

		if !(isMultiplayer) then {
			{
				deleteVehicle _x;
			} forEach switchableUnits;
		};
		
		{
			[(leader _x)] call STAF_fnc_track;
		} forEach allGroups;
	} else {
		// Restrict 3rd Person
		[] spawn STAF_fnc_viewRestrictions;
	};
};

// Player Loadout Restore and Respawn
[player, 100] call BIS_fnc_respawnTickets;
[] spawn {
	waitUntil {(time > 0) && {!(isNull player)}};
	
	if ({_x == "ACE_EarPlugs"} count (items player) == 0) then {
		player addItem "ACE_EarPlugs"; 
	};
	
	player addEventHandler ["Respawn", {
		player allowDamage false;
		if ({_x == "ACE_EarPlugs"} count (items player) == 0) then {
			player addItem "ACE_EarPlugs"; 
		};
		
		[] spawn {
			sleep 30;
			player allowDamage true;
		};
	}];
};