/*
	Author: Larrow (based on a script by Karel Moricky (based on a script by Martin Melicharek) ) :D

	Description:
	Plays back input movement data on input unit in MP. Is executed on the server.

	Parameter(s):
		0: OBJECT - unit to play movement data on
		1: ARRAY - movement data recorder by BIS_fnc_unitCapture
		2: ARRAY (Optional) - variable to set once playback has finished. The array is in the following format:
			0: NAMESPACE, GROUP or OBJECT
			1: STRING - variable name
		3: BOOL - true to allow playaback on destroyed objects (normally the playback will stop once the object is destroyed)
		4: NOTHING - obsolete param, preserved because of backward compatibility
		5: NOTHING - obsolete param, preserved because of backward compatibility
		6: NUMBER - seconds to skip at the start of playback

	Returns:
	BOOL - always true. The script is completed once the playback is finished.
*/

//If called from non server, pass to server for execution
if !( isServer ) exitWith { [ _this, "IP_fnc_unitPlayMP", false ] call BIS_fnc_MP };

if (typename _this != typename "") then {

	//--- Initialize
	waituntil {time > 0};
	private ["_object","_recording","_endParams","_ignoreDisabled","_startRecordingTime","_endSpace","_endVar","_dataVar","_handlerDraw3D","_data"];

	_object = [_this,0,objnull,[objnull]] call bis_fnc_param;

	//exit if the vehicle is already playing a recording
	if !( isNil { missionNamespace getVariable [ format [ "unitPlayOEF_%1", netId _object ], nil ] } ) exitWith {};
	//exit if vehicle ownership is locked to a client
	if ( isPlayer driver _object ) exitWith {};
	//else take ownership of the vehicle
	if !( owner _object isEqualTo 2 ) then {
		_object setOwner 2;
	};

	_recording = [_this,1,[],[[]]] call bis_fnc_param;
	_endParams = [_this,2,[],[[]]] call bis_fnc_param;
	_ignoreDisabled = [_this,3,false,[false]] call bis_fnc_param;
	_startRecordingTime = [_this,6,0,[0]] call bis_fnc_param;

	_object setvariable ["BIS_fnc_unitPlay_terminate",nil];

	_endSpace = [_endParams,0,missionnamespace,[missionnamespace,objnull,grpnull]] call bis_fnc_paramin;
	_endVar = [_endParams,1,"",[""]] call bis_fnc_paramin;

	_dataVar = "bis_fnc_unitPlay" + str (["bis_fnc_unitPlay_counter",1] call bis_fnc_counter);
	missionnamespace setvariable [
		_dataVar,
		[
			_object,		//--- 0: Object
			_recording,		//--- 1: Recording
			count _recording,	//--- 2: Recording count
			_ignoreDisabled,	//--- 3: Ignore disabled
			_startRecordingTime,	//--- 4: Start time
			time,			//--- 5: Start playback time
			-1,			//--- 6: Step
			0,			//--- 7: Current time
			0,			//--- 8: Next time
			[],			//--- 9: Velocity transformation
			[_endSpace,_endVar]	//--- 10: End params
		]
	];

	//--- Initial execution (repeated one is added from within)
	_dataVar call IP_fnc_unitPlayMP;
	//_handler = addmissioneventhandler ["loaded",format ["'%1' call IP_fnc_unitPlayMP';",_dataVar]];
	_data = missionnamespace getvariable _dataVar;
	//_data set [11,_handler];

	waituntil {isnil _dataVar};
	true
} else {

	//--- Loop
	_dataVar = _this;
	if (isnil _dataVar) exitwith {};
	_data = missionnamespace getvariable _dataVar;
	_object = _data select 0;
	_recording = _data select 1;
	_recordingCount = _data select 2;
	_ignoreDisabled = _data select 3;
	_startRecordingTime = _data select 4;
	_startPlaybackTime = _data select 5;
	_step = _data select 6;
	_currentTime = _data select 7;
	_nextTime = _data select 8;
	_velocityTransformation = _data select 9;

	_playbackTime = time - _startPlaybackTime + _startRecordingTime;

	//--- Terminate when the recording is finished or when the object is disabled
	if (_step >= _recordingCount - 2 || (!_ignoreDisabled && (!alive _object || !canmove _object)) || _object getvariable ["BIS_fnc_unitPlay_terminate",false]) exitwith {

		//--- Terminate
		//_handler = _data select 11;
		//removemissioneventhandler ["loaded",_handler];
		missionnamespace setvariable [_dataVar,nil];
		[ missionNamespace getVariable format [ "unitPlayOEF_%1", netId _object ], "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;
		missionNamespace setVariable [ format [ "unitPlayOEF_%1", netId _object ], nil ];

		_endParams = _data select 10;
		(_endParams select 0) setvariable [_endParams select 1,true];
	};

	//--- Select step (skip multiple if necessary)
	while {(_nextTime <= _playbackTime || _currentTime < _startRecordingTime) && _step < _recordingCount - 2} do {
		_step = _step + 1;

		_currentData = _recording select _step;
		_currentTime = _currentData select 0;

		_nextData = _recording select (_step + 1);
		_nextTime = _nextData select 0;

		_velocityTransformation = [
			_currentData select 1,_nextData select 1,
			_currentData select 4,_nextData select 4,
			_currentData select 2,_nextData select 2,
			_currentData select 3,_nextData select 3
		];

		_data set [6,_step];
		_data set [7,_currentTime];
		_data set [8,_nextTime];
		_data set [9,_velocityTransformation];
	};

	_stepProgress = linearConversion [_currentTime,_nextTime,_playbackTime,0,1];
	_velocityTransformation set [8,_stepProgress];
	_object setvelocitytransformation _velocityTransformation;

	//--- Add event handler for repeated call
	//Is the event already running
	if (isNil { missionNamespace getvariable [format [ "unitPlayOEF_%1", netId _object ],nil] } ) then {
		//Add OEF EH
		missionNamespace setvariable [format [ "unitPlayOEF_%1", netId _object ],[ format [ "unitPlayOEF_%1", netId _object ], "onEachFrame",
			compile format ["'%1' call IP_fnc_unitPlayMP;",_dataVar]
		] call BIS_fnc_addStackedEventHandler];
	};

};