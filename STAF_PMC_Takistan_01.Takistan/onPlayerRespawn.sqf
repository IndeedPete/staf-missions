private [
	"_nearestMarker",
	"_min"
];

player allowDamage false;
_min = 1e100;
_nearestMarker = "respawn_guerrila_1";
{
	_dist = (getMarkerPos _x) distance (vehicle IP_Client);
	if (_dist < _min) then {
		_min = _dist;
		_nearestMarker = _x;
	};
} forEach IP_RespawnMarkers;

player setPos (getMarkerPos _nearestMarker);
if !(IP_TESTMODE) then {
	sleep 30;
	player allowDamage true;
};