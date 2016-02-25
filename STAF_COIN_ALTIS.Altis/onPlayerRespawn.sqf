// Automated Country Flag
[player] spawn IP_fnc_insignia;

// Automated TFR Radio
[player] execVM "radio.sqf";

// MASH
_respawnDelayMASH = getNumber(missionConfigFile >> "respawnDelayMASH");
if (_respawnDelayMASH > 0) then {
	player allowDamage false;
	private ["_stretcher", "_gear"];
	_respawnMessageMASH = getText(missionConfigFile >> "respawnMessageMASH");
	_stretcher = ObjNull;
	
	{
		if !(_x getVariable ["IP_StretcherTaken", false]) exitWith {
			_stretcher = _x;
		};
	} forEach IP_Stretchers;
	
	if !(isNull _stretcher) then {
		_stretcher setVariable ["IP_StretcherTaken", true, true];
		_gear = [player] call IP_fnc_getLoadout;
		_anim = selectRandom ["Acts_LyingWounded_loop1", "Acts_LyingWounded_loop2", "Acts_LyingWounded_loop3"];
		
		removeAllWeapons player;
		removeBackpack player;
		removeAllAssignedItems player;
		removeHeadgear player;
		removeGoggles player;
		removeVest player;
		
		player setDir (getDir _stretcher); 
		player setPos (getPos _stretcher); 
		player switchMove _anim;
	};
	
	[0] call BIS_fnc_cinemaBorder;
	
	systemChat _respawnMessageMASH;
	_t = time + _respawnDelayMASH;
	while {time < _t} do {
		systemChat format ["Release in %1 seconds.", round(_t - time)];
		sleep 5;
	};
	
	[1] call BIS_fnc_cinemaBorder;
	
	if !(isNull _stretcher) then {
		player switchMove "";
		[player, _gear] call IP_fnc_setLoadout;
		_stretcher setVariable ["IP_StretcherTaken", false, true];
	};
	
	player allowDamage true;
};