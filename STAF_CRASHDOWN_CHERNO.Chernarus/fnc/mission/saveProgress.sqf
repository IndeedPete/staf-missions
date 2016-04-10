if (isNil "IP_Persistence" OR {!IP_Persistence}) exitWith {};
if (isNil "iniDB_write") exitWith {
	"The iniDB framework is not initialised! Exiting..." call BIS_fnc_error;
};

params [
	["_file", "STAF_COIN_ALTIS", [""]]
];

if (isNil "IP_COIN_MissionsDone") then {
	IP_COIN_MissionsDone = [];
};

if (isNil "IP_COIN_ZonesCleared") then {
	IP_COIN_ZonesCleared = [];
};

[_file, "STAF_COIN", "IP_COIN_MissionsDone", IP_COIN_MissionsDone] call iniDB_write;
[_file, "STAF_COIN", "IP_COIN_ZonesCleared", IP_COIN_ZonesCleared] call iniDB_write;
[_file, "STAF_COIN", "IP_COIN_Date", date] call iniDB_write;
[_file, "STAF_COIN", "IP_COIN_Overcast", overcast] call iniDB_write;
[_file, "STAF_COIN", "IP_COIN_Fog", fogParams] call iniDB_write;
[_file, "STAF_COIN", "IP_COIN_ACE_RAIN_PARAMS", ACE_RAIN_PARAMS] call iniDB_write;
[_file, "STAF_COIN", "IP_COIN_ACE_WIND_PARAMS", ACE_WIND_PARAMS] call iniDB_write;
[_file, "STAF_COIN", "IP_COIN_ACE_MISC_PARAMS", ACE_MISC_PARAMS] call iniDB_write;