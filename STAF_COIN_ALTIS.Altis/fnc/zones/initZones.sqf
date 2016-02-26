private ["_returnSide", "_zoneConfigs"];
_returnSide = {
	private "_res";	
	_res = switch (toUpper(_this)) do {
		case "WEST": {west};
		case "EAST": {east};
		case "INDEPENDENT": {independent};
		case "RESISTANCE": {independent};
		case "CIVILIAN": {civilian};
		default {west};
	};
	
	_res
};

if !(isNil "IP_ZoneInitDone") exitWith {
	"Zone init already processed!" call BIS_fnc_error;
};

IP_ZoneInitDone = false;
publicVariable "IP_ZoneInitDone";

IP_Zones = [];
_zoneConfigs = "getNumber(_x >> 'active') == 1" configClasses (missionConfigFile >> "CfgZones");

{
	_cfg = _x;
	_zone = configName _cfg;
	_GL = missionNamespace getVariable [("IP_" + _zone), ObjNull];
	
	if !(isNull _GL) then {
		_centre = getPos _GL;
		_dir = getDir _GL; 
		_shape = if (getNumber(_cfg >> "isRectangle") == 1) then {"RECTANGLE"} else {"ELLIPSE"};
		_size = getArray(_cfg >> "size");
		
		_marker = createMarker [("m" + _zone), [(_centre select 0), (_centre select 1)]];
		_marker setMarkerDir _dir;
		_marker setMarkerShape _shape;
		_marker setMarkerSize _size;
		_marker setMarkerColor "ColorPink";
		_marker setMarkerBrush "Cross";
		
		if (IP_TESTMODE) then {
			_centreMarker = createMarker [("mCentre" + _zone), [(_centre select 0), (_centre select 1)]];
			_centreMarker setMarkerShape "ICON";
			_centreMarker setMarkerColor "ColorPink";
			_centreMarker setMarkerType "mil_flag";
			_centreMarker setMarkerText _zone;
		} else {
			_marker setMarkerAlpha 0;
		};
		
		_commanderCfg = _cfg >> "Commander";
		_className = getText(_commanderCfg >> "className");
		_groupInit = getText(_commanderCfg >> "groupInit");
		_isMerc = [false, true] select getNumber(_commanderCfg >> "isMerc");
		_mode = getText(_commanderCfg >> "mode");
		_rank = getText(_commanderCfg >> "rank");
		_side = [(getNumber(configFile >> "CfgVehicles" >> _className >> "side"))] call BIS_fnc_sideType;
		_unitInit = getText(_commanderCfg >> "unitInit");
		
		_pos = _marker call IP_fnc_SHKPos;
		_grp = createGroup _side;
		_commander = _grp createUnit [_className, _pos, [], 0, "NONE"];
		_commander setRank _rank;

		if (_isMerc) then {
			[_commander] call IP_fnc_createMerc;
		};
		
		_grp setVariable ["GAIA_ZONE_INTEND", [_marker, _mode], true];
		
		if (_groupInit != "") then {
			_grp call (compile _groupInit);
		};		
		
		if (_unitInit != "") then {
			_commander call (compile _unitInit);
			_commander setVariable ["NOAI", true, true];
		};
		
		_GL setVariable ["IP_ZoneCommander", _commander];
		if (IP_TESTMODE) then {
			[_commander] call IP_fnc_track;
		};
		
		private ["_assetConfigs", "_assets"];
		_assetConfigs = "getNumber(_x >> 'active') > 0" configClasses (missionConfigFile >> "CfgZones" >> _zone >> "Assets");
		_assets = [];
		
		{
			_groupCfg = _x;	
			_probability = getNumber(_groupCfg >> "probability");
			
			if ((random 1) <= _probability) then {
				_active = getNumber(_groupCfg >> "active");	
				_configPath = getArray(_groupCfg >> "configPath");				
				_groupInit = getText(_groupCfg >> "groupInit");
				_isMerc = [false, true] select getNumber(_groupCfg >> "isMerc");
				_mode = getText(_groupCfg >> "mode");
				_side = (_configPath select 0) call _returnSide;
				_unitInit = getText(_groupCfg >> "unitInit");
				_pos = _marker call IP_fnc_SHKPos;
				
				_grp = switch (_active) do {
					case 2: {
						_config = ([configFile, "CfgGroups"] + _configPath) call BIS_fnc_getCfg;
						([_pos, _side, _config] call BIS_fnc_spawnGroup)
					};
					
					case 3: {
						private ["_range", "_road"];					
						_className = getText(_groupCfg >> "className");						
						_range = (_size select 0) min (_size select 1);
						
						while {isNil "_road"} do {
							_roads = _pos nearRoads _range;
							
							if (count _roads > 0) then {
								_road = _roads select 0;
							} else {
								_range = _range * 2;
							};
						};
						
						_roadPos = getPos _road;
						_connectedRoad = (roadsConnectedTo _road) select 0;
						_dir = _road getDir _connectedRoad;
						(([_roadPos, _dir, _className, _side] call BIS_fnc_spawnVehicle) select 2)					
					};
					
					default {						
						_classNames = getArray(_groupCfg >> "classNames");
						([_pos, _side, _classNames] call BIS_fnc_spawnGroup)
					};
				};
				
				_grp setVariable ["GAIA_ZONE_INTEND", [_marker, _mode], true];
				
				if (_groupInit != "") then {
					_grp call (compile _groupInit);
				};	
				
				{
					if (_unitInit != "") then {
						_x call (compile _unitInit);
					};
					
					if (_isMerc) then {
						[_x] call IP_fnc_createMerc;
					};
					
					_x setVariable ["NOAI", true, true];
				} forEach (units _grp);
				
				_assets pushBack _grp;
				if (IP_TESTMODE) then {
					[(leader _grp)] call IP_fnc_track;
				};
			};			
		} forEach _assetConfigs;
		
		_GL setVariable ["IP_ZoneAssets", _assets];
		IP_Zones pushBack _GL;
	};
} forEach _zoneConfigs;

{
	_grp = _x;
	_assignedZone = _grp getVariable ["IP_Zone", []];
	if (count _assignedZone == 2) then {
		_zone = _assignedZone select 0;
		_GL = missionNamespace getVariable [("IP_" + _zone), ObjNull];		
		
		if !(isNull _GL) then {
			_mode = _assignedZone select 1;
			_marker = "m" + _zone;			
			_assets = _GL getVariable ["IP_ZoneAssets", []];
			_assets pushBackUnique _grp;
			_GL setVariable ["IP_ZoneAssets", _assets];
			_grp setVariable ["GAIA_ZONE_INTEND", [_marker, _mode], true];
			
			{
				_x setVariable ["NOAI", true, true];
			} forEach (units _grp);
		};
	};
} forEach allGroups;

IP_ZoneInitDone = true;
publicVariable "IP_ZoneInitDone";
publicVariable "IP_Zones";

[] spawn IP_fnc_zoneController;