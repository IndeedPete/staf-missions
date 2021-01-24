// Markers
//"mCrater" setMarkerAlpha 0;
//"mFarm" setMarkerAlpha 0;

// Weather
0 setFog [0.5, 0.05, 0];

// Tasks
[west, "tBriefing", ["Report in for briefing!", "Briefing", "Camp Teapot"], "respawn_west", true, 21, false, "whiteboard"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tPatrol", ["Conduct a recon patrol in the <marker name=""mAO"">AO</marker> between <marker name=""mPusta"">Pusta</marker> and <marker name=""mTulga"">Tulga</marker>!", "Patrol", ""], nil, false, 0, false, "scout"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tStart", "tPatrol"], ["Take the transport to <marker name=""mStart"">Point Cattywampus</marker>!", "Transport to Cattywampus", "Point Cattywampus"], "mStart", false, 19, false, "car"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tPusta", "tPatrol"], ["Patrol through <marker name=""mPusta"">Pusta</marker> and scout the area!", "Patrol to Pusta", "Pusta"], "mPusta", false, 18, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tNight1", "tPatrol"], ["Patrol to <marker name=""mNight1"">Point Doohickey</marker> and camp the night there!", "Camp at Doohickey", "Point Doohickey"], "mNight1", false, 17, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tCheckpoint", "tPatrol"], ["Patrol to <marker name=""mCDFCheckpoint"">CDF Checkpoint Babushka</marker> and check in with the guard there!", "Patrol to Babushka", "CDF Checkpoint Babushka"], "mCDFCheckpoint", false, 16, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
// Defend
[west, ["tNight2", "tPatrol"], ["Patrol to <marker name=""mNight2"">Point Flabbergast</marker> and camp until night there!", "Camp at Flabbergast", "Point Flabbergast"], "mNight2", false, 15, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tOP1", "tPatrol"], ["Patrol to <marker name=""mOP1"">Point Flibbertigibbet</marker> and scout the area!", "Patrol to Flibbertigibbet", "Point Flibbertigibbet"], "mOP1", false, 14, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tOP2", "tPatrol"], ["Patrol to <marker name=""mOP2"">Point Gobbledygook</marker> and scout the area!", "Patrol to Gobbledygook", "Point Gobbledygook"], "mOP2", false, 13, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tTulga", "tPatrol"], ["Patrol through <marker name=""mTulga"">Tulga</marker> and scout the area!", "Patrol to Tulga", "Tulga"], "mTulga", false, 12, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tNight3", "tPatrol"], ["Patrol to <marker name=""mNight3"">Point Hoosegow</marker> and camp the night there!", "Camp at Hoosegow", "Point Hoosegow"], "mNight3", false, 11, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tEnd", "tPatrol"], ["Patrol to <marker name=""mEnd"">Point Swashbuckler</marker> and regroup with friendly units!", "Patrol to Swashbuckler", "Point Swashbuckler"], "mEnd", false, 10, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tArty", ["Opportunity target: locate and destroy the enemy artillery assumed to be somewhere in the <marker name=""mAO"">AO</marker>!", "Destroy Artillery", ""], nil, false, 9, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tContact", ["Commander's intent: avoid contact while patrolling in the <marker name=""mAO"">AO</marker>! Exception: engaging the artillery opportunity target.", "Avoid Contact", ""], nil, false, 8, false, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tCar", "tContact"], ["Commander's intent: avoid using motorised transport while patrolling in the <marker name=""mAO"">AO</marker>!", "Avoid Motorised Transport", ""], nil, false, 7, false, "car"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tRadio", "tContact"], ["Commander's intent: maintain radio silence to command while patrolling in the <marker name=""mAO"">AO</marker>! Only report on very important situations.", "Radio Silence", ""], nil, false, 6, false, "radio"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Objects
private _exScenes = []; // "checkpoint", "op1", "tulga", "end"
{
	private _scene = _x getVariable ["IP_Scene", ""];
	if ((_scene != "") && {!(_scene in _exScenes)}) then {
		private _objs = (IP_ObjectMap getVariable [_scene, []]);
		_objs pushBack _x;
		IP_ObjectMap setVariable [_scene, _objs];
		[_x] call STAF_fnc_disable;
	};
} forEach (allMissionObjects "All");

/*
IP_Briefing = true;
IP_Go = true;
IP_Start = true;
IP_Pusta = true;
IP_Night1 = true;
IP_Checkpoint = true;
IP_DefendCheckpoint = true;
IP_Night2 = true;
IP_OP1 = true;
IP_OP2 = true;
IP_Tulga = true;
IP_Night3 = true;
IP_DefendTulga = true;
IP_End = true;
/////////////////////////////
IP_Contact = true;
IP_CarTaken = true;
IP_RadioSilenceBroken = true;
*/
[] spawn {
	private _completeTask = {
		[_this, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};

	private _cancelTask = {
		[_this, "CANCELED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};

	waitUntil {!(isNil "IP_Briefing")};
	"tBriefing" call _completeTask;

	// Drive to Start
	waitUntil {!(isNil "IP_Go") && !(isNil "IP_Start")};
	"tStart" call _completeTask;

	// Patrol to Pusta
	waitUntil {!(isNil "IP_Pusta")};
	"tPusta" call _completeTask;

	// Patrol to Camp1
	waitUntil {!(isNil "IP_Night1")};
	[[1997, 9, 19, 12, 0], true, true] call BIS_fnc_setDate;
	[0, 0, 0] call BIS_fnc_setFog;
	[0.8] call BIS_fnc_setOvercast;
	[(IP_ObjectMap getVariable ["checkpoint", []])] call STAF_fnc_enable;
	"tNight1" call _completeTask;

	// Patrol to Checkpoint
	waitUntil {!(isNil "IP_Checkpoint")};
	"tCheckpoint" call _completeTask;	
	[west, "tDefendCheckpoint", ["Help the CDF defending the <marker name=""mCDFCheckpoint"">CDF Checkpoint Babushka</marker>!", "Defend Checkpoint Babushka", "CDF Checkpoint Babushka"], "mCDFCheckpoint", true, 30, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	// Attack on Checkpoint
	waitUntil {!(isNil "IP_DefendCheckpoint")};
	"tDefendCheckpoint" call _completeTask;

	// Patrol to Camp2
	waitUntil {!(isNil "IP_Night2")};
	[[1997, 9, 20, 0, 0], true, true] call BIS_fnc_setDate;
	[0, 0, 0] call BIS_fnc_setFog;
	[0] call BIS_fnc_setOvercast;
	0 setRain 0;
	forceWeatherChange;
	[(IP_ObjectMap getVariable ["op1", []])] call STAF_fnc_enable;
	[(IP_ObjectMap getVariable ["tulga", []])] call STAF_fnc_enable;
	"tNight2" call _completeTask;

	// Patrol to OP1
	waitUntil {!(isNil "IP_OP1")};
	"tOP1" call _completeTask;

	// Patrol to OP2
	waitUntil {!(isNil "IP_OP2")};
	"tOP2" call _completeTask;

	if !("tRadio" call BIS_fnc_taskCompleted) then {
		"tRadio" call _cancelTask;
	};

	if !("tCar" call BIS_fnc_taskCompleted) then {
		"tCar" call _cancelTask;
	};

	if !("tContact" call BIS_fnc_taskCompleted) then {
		"tContact" call _cancelTask;
	};

	waitUntil {!(isNil "IP_Tulga")};
	"tTulga" call _completeTask;
	"tArty" call _completeTask;
	"tNight3" call _cancelTask;
	[west, "tDefendTulga", ["Dig in at <marker name=""mTulga"">Tulga</marker> and hold out until morning!", "Defend Tulga", "Tulga"], "mTulga", true, 30, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_Night3")};
	[[1997, 9, 20, 7, 0], true, true] call BIS_fnc_setDate;
	[0.5, 0.01, 0] call BIS_fnc_setFog;

	waitUntil {!(isNil "IP_DefendTulga")};
	[(IP_ObjectMap getVariable ["end", []])] call STAF_fnc_enable;
	"tDefendTulga" call _completeTask;
	300 setFog [0, 0, 0];

	waitUntil {!(isNil "IP_End")};
	"tEnd" call _completeTask;
	"tPatrol" call _completeTask;
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};

[] spawn {
	waitUntil {!(isNil "IP_Contact")};
	["tContact", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {!(isNil "IP_CarTaken")};
	["tCar", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

[] spawn {
	waitUntil {!(isNil "IP_RadioSilenceBroken")};
	["tRadio", "FAILED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};