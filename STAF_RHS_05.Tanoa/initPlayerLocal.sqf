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

// Hint
[] spawn {
	waitUntil {!(isNil "IP_HintFound")};
	hint "Briefing Updated!";
	player createDiaryRecord ["Diary", ["Aid Worker Report", "'Thanks for your help! We thought we wouldn't make it. The other guy, blue shirt? Yeah, the Syndikat paramilitary took him away by Offroad. My French is really bad but I think they talked about Russians. And about an airfield or so.'"]];
	IP_HintFound = false;
	
	waitUntil {IP_HintFound};
	hint "Briefing Updated!";
	player createDiaryRecord ["Diary", ["Horizon Report", "'Good job getting me out of there. God damn Ivan! I knew they were supporting the Syndikat forces. But we've got another problem. I had a safehouse on the south-eastern island, in the jungle. Grid 036106. There's all kinds of compromising evidence in there Ivan must not get his hands on. Do Uncle Sam a favour and blow it up, will you? There should be plenty of explosives inside the house.'"]];
};