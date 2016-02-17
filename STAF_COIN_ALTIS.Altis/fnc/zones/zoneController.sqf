if (isNil "IP_ZoneInitDone" OR {!IP_ZoneInitDone}) exitWith {
	"Zone init must be run first!" call BIS_fnc_error;
};

{
	private "_assetCount";
	_GL = _x;
	_assetCount = 0;
	
	{
		_assetCount = _assetCount + ({alive _x} count(units _x));
	} forEach (_GL getVariable ["IP_ZoneAssets", []]);
	
	if (_assetCount <= 1) then {
		_assetCount = 1;
	};
	
	_GL setVariable ["IP_ZoneAssetCount", _assetCount];
} forEach IP_Zones;

while {count IP_Zones > 0} do {
	{
		private ["_assetCount", "_state"];
		_GL = _x;
		_commander = _GL getVariable ["IP_ZoneCommander", ObjNull];
		_state = _GL getVariable ["IP_ZoneState", 0];
		_assetCount = 0;
		
		{
			_assetCount = _assetCount + ({alive _x} count(units _x));
		} forEach (_GL getVariable ["IP_ZoneAssets", []]);
		
		_ratio = _assetCount / (_GL getVariable ["IP_ZoneAssetCount", 1]);
		switch (true) do {
			case ((_ratio < 0.75) && (_state < 1)): {
				if (IP_TESTMODE) then {
					systemChat format ["Zone %1 is below 75 percent!", _GL];
				};
				
				_state = 1;
			};
			
			case ((_ratio < 0.5) && (_state < 2)): {
				if (IP_TESTMODE) then {
					systemChat format ["Zone %1 is below 50 percent!", _GL];
				};
				
				_state = 2;
			};
			
			case ((_ratio < 0.25) && (_state < 3)): {
				if (IP_TESTMODE) then {
					systemChat format ["Zone %1 is below 25 percent!", _GL];
				};
				
				_state = 3;
			};
			
			default  {};
		};
		
		_GL setVariable ["IP_ZoneState", _state];
	} forEach IP_Zones;
	
	sleep 5;
};