// The HC does not need to process that shit below.
if !(hasInterface) exitWith {};

// Vars
IP_RespawnMarkers = [];

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

// Respawn Positions
{
	if (_x find "respawn_guerrila" >= 0) then {
		IP_RespawnMarkers pushBack _x;
	};
} forEach allMapMarkers;

// PPEffect
//["STAF_GreenHell", 0, false] call BIS_fnc_setPPeffectTemplate;

/*/ Ostereier
IP_Toilet addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\ico_cpt_thtl_idl_ca.paa'/> Take a Piss", {
	(format ["%1 is going for a relieving piss, expect him to return soon.", (name player)]) remoteExec ["systemChat", 0, false];
	["IP_BlackScreen", true, 1.5, true] call IP_fnc_blackOut;
	sleep 1.5;
	
	playSound "STAF_Pee_And_Fart";
	sleep 20;
	
	sleep 1.5;
	["IP_BlackScreen", true] call IP_fnc_blackIn;
}, [], 1.5, false, true, "", "(_this distance _target < 3)"];
*/

// Player Ladout Restore After Respawn
[] spawn {
	waitUntil {(time > 0) && {!(isNull player)}};
	player addEventHandler ["Respawn", {
		[(_this select 1), [missionNamespace, "IP_Inventory"]] call BIS_fnc_saveInventory;
		[(_this select 0), [missionNamespace, "IP_Inventory"]] call BIS_fnc_loadInventory;
	}];
};

// Post Init - Loadouts
if (isMultiplayer) then {
	[] spawn {
		waitUntil {(time > 0) && {!(isNull player)}};
		_template = switch (player) do {
			case (missionNamespace getVariable ["IP_Executive", ObjNull]): {"executive"};
			case (missionNamespace getVariable ["IP_Leader", ObjNull]): {"detail_leader"};
			case (missionNamespace getVariable ["IP_AR", ObjNull]): {"ar"};
			case (missionNamespace getVariable ["IP_Marksman", ObjNull]): {"marksman"};
			case (missionNamespace getVariable ["IP_LAT", ObjNull]): {"lat"};
			case (missionNamespace getVariable ["IP_Scout", ObjNull]): {"scout"};
			case (missionNamespace getVariable ["IP_Engineer", ObjNull]): {"engineer"};
			case (missionNamespace getVariable ["IP_Medic", ObjNull]): {"medic"};
			case (missionNamespace getVariable ["IP_GL", ObjNull]): {"GL"};
			case (missionNamespace getVariable ["IP_Rifleman_M4", ObjNull]): {"M4"};
			case (missionNamespace getVariable ["IP_Rifleman_AK12", ObjNull]): {"AK12"};
			case (missionNamespace getVariable ["IP_Pilot", ObjNull]): {"pilot"};
			default {""};
		};

		if (_template != "") then {
			_handle = player execVM ("cfg\loadouts\" + _template + ".sqf");
			waitUntil {scriptDone _handle};
		} else {
			systemChat "There is no default loadout defined for this class. Why don't you create one and send it to IndeedPete?";
		};
	};
};