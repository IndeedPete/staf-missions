// Markers
//"mCrater" setMarkerAlpha 0;
//"mFarm" setMarkerAlpha 0;

// Weather
[0.5, 0.01, 0] call BIS_fnc_setFog;

// Tasks
[west, "tBriefing", ["Report in for briefing!", "Briefing", "Camp Teapot"], "respawn_west", "SUCCEEDED", 21, false, "whiteboard"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tPatrol", ["Conduct a recon patrol in the <marker name=""mAO"">AO</marker> between <marker name=""mPusta"">Pusta</marker> and <marker name=""mTulga"">Tulga</marker>!", "Patrol", ""], nil, false, 0, false, "scout"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tStart", "tPatrol"], ["Take the transport to <marker name=""mStart"">Point Cattywampus</marker>!", "Transport to Cattywampus", "Point Cattywampus"], "mStart", "SUCCEEDED", 19, false, "car"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tInvestigate", ["Find out what happened at <marker name=""mPusta"">Pusta</marker>!", "Investigate Pusta", "Pusta"], "mPusta", "SUCCEEDED", 19, false, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tPusta", "tPatrol"], ["Patrol through <marker name=""mPusta"">Pusta</marker> and scout the area!", "Patrol to Pusta", "Pusta"], "mPusta", "SUCCEEDED", 18, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tNight1", "tPatrol"], ["Patrol to <marker name=""mNight1"">Point Doohickey</marker> and camp the night there!", "Camp at Doohickey", "Point Doohickey"], "mNight1", "SUCCEEDED", 17, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tCheckpoint", "tPatrol"], ["Patrol to <marker name=""mCDFCheckpoint"">CDF Checkpoint Babushka</marker> and check in with the guard there!", "Patrol to Babushka", "CDF Checkpoint Babushka"], "mCDFCheckpoint", "SUCCEEDED", 16, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tDefendCheckpoint", ["Help the CDF defending the <marker name=""mCDFCheckpoint"">CDF Checkpoint Babushka</marker>!", "Defend Checkpoint Babushka", "CDF Checkpoint Babushka"], "mCDFCheckpoint", "SUCCEEDED", 30, false, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tNight2", "tPatrol"], ["Patrol to <marker name=""mNight2"">Point Flabbergast</marker> and camp until night there!", "Camp at Flabbergast", "Point Flabbergast"], "mNight2", "SUCCEEDED", 15, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tOP1", "tPatrol"], ["Patrol to <marker name=""mOP1"">Point Flibbertigibbet</marker> and scout the area!", "Patrol to Flibbertigibbet", "Point Flibbertigibbet"], "mOP1", "SUCCEEDED", 14, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tOP2", "tPatrol"], ["Patrol to <marker name=""mOP2"">Point Gobbledygook</marker> and scout the area!", "Patrol to Gobbledygook", "Point Gobbledygook"], "mOP2", "SUCCEEDED", 13, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tTulga", "tPatrol"], ["Patrol through <marker name=""mTulga"">Tulga</marker> and scout the area!", "Patrol to Tulga", "Tulga"], "mTulga", "SUCCEEDED", 12, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tNight3", "tPatrol"], ["Patrol to <marker name=""mNight3"">Point Hoosegow</marker> and camp the night there!", "Camp at Hoosegow", "Point Hoosegow"], "mNight3", "CANCELED", 11, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tRegroup", "tPatrol"], ["Abort the patrol, head to <marker name=""respawn_west"">Point Swashbuckler</marker> and regroup with friendly units!", "Regroup at Swashbuckler", "Point Swashbuckler"], "respawn_west", true, 10, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tArty", ["Opportunity target: locate and destroy the enemy artillery assumed to be somewhere in the <marker name=""mAO"">AO</marker>!", "Destroy Artillery", ""], nil, "SUCCEEDED", 13, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tContact", ["Commander's intent: avoid contact while patrolling in the <marker name=""mAO"">AO</marker>! Exception: engaging the artillery opportunity target.", "Avoid Contact", ""], nil, "CANCELED", 8, false, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tCar", "tContact"], ["Commander's intent: avoid using motorised transport while patrolling in the <marker name=""mAO"">AO</marker>!", "Avoid Motorised Transport", ""], nil, "CANCELED", 7, false, "car"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tRadio", "tContact"], ["Commander's intent: maintain radio silence to command while patrolling in the <marker name=""mAO"">AO</marker>! Only report on very important situations.", "Radio Silence", ""], nil, "CANCELED", 6, false, "radio"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Objects
private _exScenes = ["tulga", "end", "valley", "msta"]; // "tulga", "end", "valley", "msta"
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
IP_Regroup = true;
*/
[] spawn {
	private _completeTask = {
		[_this, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};

	private _cancelTask = {
		[_this, "CANCELED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};

	waitUntil {!(isNil "IP_Regroup")};
	"tPatrol" call _completeTask;
	"tRegroup" call _completeTask;
	300 setFog [0, 0, 0];

	/*/ Drive to Start
	waitUntil {!(isNil "IP_Go") && !(isNil "IP_Start")};
	"tStart" call _completeTask;

	waitUntil {!(isNil "IP_Investigate")};
	[west, "tInvestigate", ["Find out what happened at <marker name=""mPusta"">Pusta</marker>!", "Investigate Pusta", "Pusta"], "mPusta", true, 19, true, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	// Patrol to Pusta
	waitUntil {!(isNil "IP_Pusta")};
	"tInvestigate" call _completeTask;
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
	["STAF_Win"] call BIS_fnc_endMissionServer;*/
};