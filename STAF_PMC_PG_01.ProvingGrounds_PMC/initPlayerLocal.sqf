IP_Toilet addAction ["<img size='2' shadow='2' image='\a3\ui_f\data\igui\cfg\Actions\ico_cpt_thtl_idl_ca.paa'/> Take a Piss", {
	(format ["%1 is going for a relieving piss, expect him to return soon.", (name player)]) remoteExec ["systemChat", 0, false];
	["IP_BlackScreen", true, 1.5] call BIS_fnc_blackOut;
	sleep 1.5;
	
	playSound "STAF_Pee_And_Fart";
	sleep 20;
	
	sleep 1.5;
	["IP_BlackScreen", true] call BIS_fnc_blackIn;
}, [], 1.5, false, true, "", "(_this distance _target < 3)"];

private _ppEffect = ppEffectCreate ["ColorCorrections", 2000];
_ppEffect ppEffectEnable true;
_ppEffect ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [0.9, 0.9, 1, 0.4],  [0.199, 0.587, 0.114, 0.0]];
_ppEffect ppEffectCommit 0;

private _ppEffect = ppEffectCreate ["FilmGrain", 2000];
_ppEffect ppEffectEnable true;
_ppEffect ppEffectAdjust [0.03, 1, 1, 0.1, 1, false];
_ppEffect ppEffectCommit 0;

 player setVariable ["STAF_Unit_Loadout", (getUnitLoadout player)];
["ace_arsenal_displayClosed", {
  _loadout = getUnitLoadout player;
  player setVariable ["STAF_Unit_Loadout", (getUnitLoadout player)];
}] call CBA_fnc_addEventHandler;