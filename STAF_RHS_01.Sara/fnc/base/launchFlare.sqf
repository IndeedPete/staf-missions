private ["_where", "_colours", "_height", "_pos", "_class", "_flare"];
_where = [_this, 0, [], [[], ""]] call BIS_fnc_param;
_colours = [_this, 1, ["F_40mm_Red", "F_40mm_Green", "F_40mm_White", "F_40mm_Yellow"], [[], ""]] call BIS_fnc_param;
_height = [_this, 2, 200, [0]] call BIS_fnc_param;

_pos = if (typeName _where == "STRING") then {(getMarkerPos _where)} else {_where};
_class = if (typeName _colours == "STRING") then {_colours} else {(_colours call BIS_fnc_selectRandom)};
_flare = _class createVehicle [(_pos select 0), (_pos select 1), _height];
_flare setVelocity [0, 0, -10];

_flare