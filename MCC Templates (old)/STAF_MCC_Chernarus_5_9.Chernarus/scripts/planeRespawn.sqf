#define DECK 18
private ["_plane"];
_plane = param [0, ObjNull];
_foldWings = param [1, false];

if (isNull _plane) exitWith {};

// the plane actually starts flying, so we stop that ...

_plane setVelocity [0,0,0];
_plane hideObject true;
_plane engineOn false;
createVehicleCrew _plane;
(driver _plane) action ["LandGear", _plane];
{deleteVehicle _x} forEach crew _plane;


if (_foldWings) then {
	// fold wings of F/A-18 and F-14
	/*[_plane] execVM "JS_JC_FA18\scripts\MISC\FA18_foldwings.sqf";*/
	_plane animate ["l_wingfold",1,true];
	_plane animate ["r_wingfold",1,true];
	_plane animate ["leftwing_parking",1,true];
	_plane animate ["rightwing_parking",1,true];
};

sleep 3;
_plane hideObject false;