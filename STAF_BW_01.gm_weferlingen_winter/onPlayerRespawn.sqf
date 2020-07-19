params [
	"_newUnit",
	"_oldUnit",
	"_respawn",
	"_respawnDelay"
];

_var = _oldUnit getVariable ["STAF_Unit_Loadout", (getUnitLoadout _oldUnit)];
_newUnit setUnitLoadout [_var, true];