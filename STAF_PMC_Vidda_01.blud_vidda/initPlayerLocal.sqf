// The HC does not need to process that shit below.
if !(hasInterface) exitWith {};

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

// Player Loadout Restore and Respawn
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

/*/ Arsenal
_fnc_arsenal = compile(preprocessFileLineNumbers "arsenal\fn_pmcarsenal.sqf");
{
	[_x] call _fnc_arsenal;
} forEach [IP_Arsenal1, IP_Arsenal2];*/

/*/ Teleport
IP_Arsenal addAction ["<img size='1' shadow='1' image='\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa'/> Teleport to the Front Line", {
	["IP_BlackScreen", true, 1.5, true] call STAF_fnc_blackOut;
	sleep 1.5;
	player setPos (getMarkerPos IP_FrontLine);
	sleep 1.5;
	["IP_BlackScreen", true] call STAF_fnc_blackIn;
}];*/

// Toilet
{
	_x addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\ico_cpt_thtl_idl_ca.paa'/> Take a Piss", {
		(format ["%1 is going for a relieving piss, expect him to return soon.", (name player)]) remoteExec ["systemChat", 0, false];
		["IP_BlackScreen", true, 1.5, true] call STAF_fnc_blackOut;
		sleep 1.5;
		
		playSound "STAF_Pee_And_Fart";
		sleep 20;
		
		sleep 1.5;
		["IP_BlackScreen", true] call STAF_fnc_blackIn;
	}, [], 1.5, false, true, "", "(_this distance _target < 3)"];
} forEach [IP_Toilet1, IP_Toilet2];