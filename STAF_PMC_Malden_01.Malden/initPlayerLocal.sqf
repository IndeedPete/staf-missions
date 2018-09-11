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

// Arsenal
[IP_Arsenal] call(compile(preprocessFileLineNumbers "arsenal\fn_pmcarsenal.sqf"));

/*/ Toilet
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
} forEach [IP_Toilet1, IP_Toilet2];*/

// Actions
IP_Laptop addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\Obsolete\ui_action_exit_ca.paa'/> Download Radio Protocols", {
	IP_LaptopStarted = true;
	publicVariable "IP_LaptopStarted";
	(format ["%1 started downloading files from the police chief's laptop.", (name player)]) remoteExec ["systemChat", 0, false];
	
	sleep 1;
	
	private ["_txts", "_exts"];
	_txts = ["FileA", "FileB", "FileC", "FileD", "FileE", "Drugs", "Bitchez", "Moneyz", "SolomonStories"];
	_exts = [".dta", ".txt", ".png"];
	for "_i" from 0 to 299 do {
		(format ["Downloading: %1", ((selectRandom _txts) + (str _i) + (selectRandom _exts))]) remoteExec ["systemChat", 0, false];
		sleep 1;
	};
	
	"Download finished." remoteExec ["systemChat", 0, false];
	sleep 1;
	IP_LaptopDone = true;
	publicVariable "IP_LaptopDone";
}, [], 1.5, false, true, "", "(_this distance _target < 3) && (isNil 'IP_LaptopStarted')"];