private ["_template", "_commit", "_config"];
_template = [_this, 0, "", [""]] call BIS_fnc_param;
if (_template == "") exitWith {["Template parameter empty!"] call BIS_fnc_error};
_commit = [_this, 1, 0, [1]] call BIS_fnc_param;
if (_commit < 0) then {_commit = 0};
_config = [_this, 2, (missionConfigFile >> "PPEffects"), [(missionConfigFile >> "PPEffects")]] call BIS_fnc_param;
_config = (_config >> _template);
if (!isClass _config) exitWith {["Given config %1 does not exist!", _config] call BIS_fnc_error};

if (isNil "IP_PPEffectHandles") then {IP_PPEffectHandles = []};
if (count IP_PPEffectHandles > 0) then {
	ppEffectDestroy IP_PPEffectHandles;
	IP_PPEffectHandles = [];
};

if (_template == "NONE") exitWith {};
if ((!isNil "IP_ICE_PPEffects") && {!IP_ICE_PPEffects}) exitWith {IP_PPEffect = _template};

{
	_type = _x select 0;
	_priority = _x select 1;
	_cfg = (_config >> _type);

	if (isText _cfg) then {
		_params = call(compile(getText _cfg));
		_handle = ppEffectCreate [_type, 2005];
		_handle ppEffectAdjust _params;
		_handle ppEffectCommit _commit;
		_handle ppEffectEnable true;
		IP_PPEffectHandles pushBack _handle;
	};
} forEach [["colorCorrections", 1550], ["filmGrain", 2050]]; // ToDo: Implement all the effects!

IP_PPEffect = _template;
