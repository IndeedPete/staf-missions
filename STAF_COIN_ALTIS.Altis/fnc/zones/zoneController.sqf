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
		private ["_assetCount", "_newState", "_nearestEnemies"];
		_GL = _x;
		_zone = _GL getVariable ["IP_Zone", ""];
		_commander = _GL getVariable ["IP_ZoneCommander", ObjNull];
		_assets = _GL getVariable ["IP_ZoneAssets", []];
		_state = _GL getVariable ["IP_ZoneState", 0];
		_displayName = getText(missionConfigFile >> "CfgZones" >> _zone >> "displayName");
		_newState = _state;
		_assetCount = 0;
		_nearestEnemies = [];		
		
		{
			_units = units _x;
			_count = {alive _x} count _units;			
			if (_count > 0) then {
				_assetCount = _assetCount + _count;
				_leader = leader _x;
				_nearestEnemy = _leader findNearestEnemy _leader;
				if !(isNull _nearestEnemy) then {
					_nearestEnemies pushBack _nearestEnemy;
					
					{
						_x setVariable ["NOAI", false, true];
					} forEach _units;
				} else {
					{
						_x setVariable ["NOAI", true, true];
					} forEach _units;
				};
			};
		} forEach _assets;
		
		_ratio = _assetCount / (_GL getVariable ["IP_ZoneAssetCount", 1]);
		switch (true) do {
			case ((_ratio < 0.75) && (_state < 1)): {
				if (IP_TESTMODE) then {
					(format ["Zone %1 is below 75 percent!", _GL]) remoteExec ["systemChat", 0, false];
				};
				
				_newState = 1;
			};
			
			case ((_ratio < 0.5) && (_state < 2)): {
				if (IP_TESTMODE) then {
					(format ["Zone %1 is below 50 percent!", _GL]) remoteExec ["systemChat", 0, false];
				};
				
				_newState = 2;
			};
			
			case ((_ratio < 0.25) && (_state < 3)): {
				if (IP_TESTMODE) then {
					(format ["Zone %1 is below 25 percent!", _GL]) remoteExec ["systemChat", 0, false];
				};
				
				_newState = 3;
			};
			
			case ((_ratio < 0.1) && (_state < 4)): {
				if (IP_TESTMODE) then {
					(format ["Zone %1 is below 10 percent!", _GL]) remoteExec ["systemChat", 0, false];
				};
				
				_newState = 4;
			};
			
			default  {};
		};
		
		if (count _nearestEnemies > 0) then {
			if (IP_TESTMODE) then {
				(format ["Enemies detected in zone %1!", _GL]) remoteExec ["systemChat", 0, false];
			};
			
			{
				_grp = _x;
				{
					_grp reveal _x;
				} forEach _nearestEnemies;
			} forEach _assets;
			
			if ((_state < _newState) && {alive _commander}) then {	
				if (_newState < 4) then {
					if (IP_TESTMODE) then {
						(format ["Zone %1 is calling for backup!", _GL]) remoteExec ["systemChat", 0, false];
					};
					// ToDo: Handle Backup
				} else {
					if (IP_TESTMODE) then {
						(format ["Zone %1 is trying to evacuate!", _GL]) remoteExec ["systemChat", 0, false];
					};
					
					private ["_evacTo", "_min"];
					_evacTo = ObjNull;
					_min = 999999;
					{
						_dist = _GL distance _x;
						if ((_dist < _min) && {(_x getVariable ["IP_ZoneState", 0]) < 4}) then {
							_min = _dist;
							_evacTo = _x;
						};
					} forEach (IP_Zones - [_GL]);
					
					if !(isNull _evacTo) then {
						_marker = _evacTo getVariable ["IP_ZoneMarker", ""];
						_evacAssets = _evacTo getVariable ["IP_ZoneAssets", []];
						
						{
							_x setVariable ["GAIA_ZONE_INTEND", [_marker, "FORTIFY"], true];
							_evacAssets pushBack _x;
						} forEach (_assets + [(group _commander)]);
						
						_evacTo getVariable ["IP_ZoneAssets", _evacAssets];						
						if (IP_TESTMODE) then {
							(format ["Zone %1 is evacuating to zone %2!", _GL, _evacTo]) remoteExec ["systemChat", 0, false];
						};
					} else {
						if (IP_TESTMODE) then {
							(format ["Zone %1 cannot evacuate!", _GL]) remoteExec ["systemChat", 0, false];
						};
					};
				};
			};
		};
		
		if ((_newState >= 4) && {!(alive _commander)}) then {
			if (isNil "IP_COIN_ZonesCleared") then {
				IP_COIN_ZonesCleared = [_zone];
			} else {
				IP_COIN_ZonesCleared pushBack _zone;
			};
			
			IP_Zones = IP_Zones - [_GL];
			("mCentre" + _zone) setMarkerColor "ColorBLUFOR";
			publicVariable "IP_Zones";
			publicVariable "IP_COIN_ZonesCleared";
			
			if (isServer) then {
				[] call IP_fnc_saveProgress;
			};
			
			["ZoneCleared", [_displayName]] remoteExec ["BIS_fnc_showNotification", 0, false];
		};
		
		_GL setVariable ["IP_ZoneState", _newState, true];
	} forEach IP_Zones;
	
	sleep 15;
};