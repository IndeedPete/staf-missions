params [
	["_grp", grpNull, [grpNull]],
	["_delay", 0.5, [0]],
	"_veh"
];

_veh = vehicle (leader _grp);
if (_veh == (leader _grp)) exitWith {};
_grp leaveVehicle _veh;

{
	[_x, _veh] call IP_fnc_paradrop;
	sleep _delay;
} forEach (units _grp);