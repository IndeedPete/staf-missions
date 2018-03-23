// The HC does not need to process that shit below.
if !(hasInterface) exitWith {};

// Telepört
IP_fnc_m_teleport = {
	_dude = _this select 0;
	_pos = IP_Van getRelPos [3, (random 360)];	
	
	["IP_Blackscreen"] call STAF_fnc_blackOut;
	sleep 2;
	//(format ["%1 parajumped into the AO.", (name player)]) remoteExec ["systemChat", 0, false];
	_dude setPos _pos;
	//_dude setDir 180;
	["IP_Blackscreen"] call STAF_fnc_blackIn;
};

// Teleport Action
[
	IP_Laptop,
	"Teleport MHQ to Van",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff2_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
	"_this distance _target <= 3",
	"true",
	{
		if (!(alive IP_Van)) then {
			hint "The van has been destroyed. Enjoy your walk.";
		};
	},
	{},
	{[(_this select 1)] spawn IP_fnc_m_teleport;},
	{},
	[],
	1
] call BIS_fnc_holdActionAdd;
IP_Laptop addAction ["Teleport to MHQ Van (Backup Action)", {[player] spawn IP_fnc_m_teleport;}, [], 1.5, false, true, "", "(_this distance _target < 3) && (alive IP_Van)"];

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
		[] spawn {
			waitUntil {!(isNil "IP_Zeus") && {!(isNull IP_Zeus)}};
			if (player != IP_Zeus) then {
				// Restrict 3rd Person
				[] spawn STAF_fnc_viewRestrictions;
			};
		};
	};
};

// Player Respawn
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
		
		if (!(isNil "IP_InitialGear")) then {
			player setUnitLoadout IP_InitialGear;
		};
	}];
	
	IP_InitialGear = getUnitLoadout player;
};