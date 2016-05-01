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
				//deleteVehicle _x;
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

// PPEffect
// ["STAF_GreenHell", 0, false] call BIS_fnc_setPPeffectTemplate;

/*/ Briefing
player createDiaryRecord ["Diary", ["Mission", "The only hope of the survivors now is to evade their Russian pursuers and make it to a known decomissioned depot of the United States Marine Corps from the 2010s in order to regroup, salvage leftover supplies and weapons, maybe even some vehicles, and make a run for the European border to the south for pick-up."]];
player createDiaryRecord ["Diary", ["Situation", "After returning from a covert operation in eastern Europe, a European Special Forces Group gets under AA fire over Russia-controlled Chernarus. The Airbus A400M carrying the troops is hit and torn into three pieces, going down in the hilly north of Chernarus. A few of the SF operators manage to survive, wounded and without weapons or comms, and with no clue where they are. To make it worse, the Russian Armed Forces send out a detachement of 500 of their finest paratroopers to secure the three crashsites and kill or capture every enemy combatant. The Russian troops have around 500 men in the AO, backed by transport and attack helicopters, armed vehicles, and light armour."]];
*/
// Ostereier
{
	_x addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\ico_cpt_thtl_idl_ca.paa'/> Take a Piss", {
		(format ["%1 is going for a relieving piss, expect him to return soon.", (name player)]) remoteExec ["systemChat", 0, false];
		["IP_BlackScreen", true, 1.5, true] call IP_fnc_blackOut;
		sleep 1.5;
		
		playSound "STAF_Pee_And_Fart";
		sleep 20;
		
		sleep 1.5;
		["IP_BlackScreen", true] call IP_fnc_blackIn;
	}, [], 1.5, false, true, "", "(_this distance _target < 3)"];
} forEach [IP_Toilet1, IP_Toilet2];