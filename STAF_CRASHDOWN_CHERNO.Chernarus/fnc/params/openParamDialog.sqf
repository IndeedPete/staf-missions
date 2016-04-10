private ["_setRandom", "_params"];
_setRandom = param [0, false, [true]];
_params = [] call IP_fnc_getParameters;

if !(_setRandom) then {
	createDialog "IP_DLG_PARAMS";
};
	
{
	_cfg = _x;
	_idc = getNumber(_cfg >> "idc");
	_texts = getArray(_cfg >> "texts");
	_values = getArray(_cfg >> "values");
	_default = getNumber(_cfg >> "default");
	_index = if (_setRandom) then {
		(floor(random(count _values)))
	} else {
		(_values find _default)
	};
	
	{
		_val = _values select _forEachIndex;
		_i = lbAdd [_idc, _x];
		lbSetValue [_idc, _i, _val];
	} forEach _texts;
	
	lbSetCurSel [_idc, _index];
} forEach _params;