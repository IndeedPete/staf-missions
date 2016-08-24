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
			[(leader _x)] call IP_fnc_track;
		} forEach allGroups;
	} else {
		// Restrict 3rd Person
		[] spawn STAF_fnc_viewRestrictions;
	};
};

// Player Loadout Restore and Respawn
[player, 4] call BIS_fnc_respawnTickets;
[] spawn {
	waitUntil {(time > 0) && {!(isNull player)}};
	player addEventHandler ["Respawn", {
		//[(_this select 1), [missionNamespace, "IP_Inventory"]] call BIS_fnc_saveInventory;
		//[(_this select 0), [missionNamespace, "IP_Inventory"]] call BIS_fnc_loadInventory;
		if ({_x == "ACE_EarPlugs"} count (items player) == 0) then {
			player addItem "ACE_EarPlugs"; 
		};
	}];
};

// Ostereier
IP_Toilet addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\ico_cpt_thtl_idl_ca.paa'/> Take a Piss", {
	(format ["%1 is going for a relieving piss, expect him to return soon.", (name player)]) remoteExec ["systemChat", 0, false];
	["IP_BlackScreen", true, 1.5, true] call STAF_fnc_blackOut;
	sleep 1.5;
	
	playSound "STAF_Pee_And_Fart";
	sleep 20;
	
	sleep 1.5;
	["IP_BlackScreen", true] call STAF_fnc_blackIn;
}, [], 1.5, false, true, "", "(_this distance _target < 3)"];

// Post Start
[] spawn {
	waitUntil {serverTime > 0};
	player addItem "ACE_EarPlugs";
};