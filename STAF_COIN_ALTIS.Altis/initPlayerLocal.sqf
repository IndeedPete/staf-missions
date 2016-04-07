// The HC does not need to process that shit below.
if !(hasInterface) exitWith {};

// Vars
IP_Stretchers = [];

// Automated Country Flag
// [player] spawn IP_fnc_insignia;

// Automated TFR Radio
// [] spawn IP_fnc_STAFRadio;

// Hide Markers
"mMeasure" setMarkerAlpha 0;
"mAO" setMarkerAlpha 0;

// Stretchers for MASH Respawn
{
	if (_x getVariable ["IP_Stretcher", false]) then {
		IP_Stretchers pushBack _x;
	};
} forEach (allMissionObjects "All");

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
		nul = [] execVM "scripts\3rdView Restrictions.sqf";
	};
};

// Default Loadout
[] spawn {
	waitUntil {!(isNull player)};
	[player, false] call IP_fnc_defaultLoadout;
};

// Ostereier
IP_Toilet addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\ico_cpt_thtl_idl_ca.paa'/> Take a Piss", {
	//(_this select 0) removeAction (_this select 2);
	(format ["%1 is going for a relieving piss, expect him to return soon.", (name player)]) remoteExec ["systemChat", 0, false];
	["IP_BlackScreen", true, 1.5, true] call IP_fnc_blackOut;
	sleep 1.5;
	
	playSound "STAF_Pee_And_Fart";
	//skipTime (5/60);
	sleep 20;
	
	sleep 1.5;
	["IP_BlackScreen", true] call IP_fnc_blackIn;
	//sleep 1.5;
	//["tPiss", "SUCCEEDED"] call BIS_fnc_taskSetState;
}, [], 1.5, false, true, "", "(_this distance _target < 3)"];