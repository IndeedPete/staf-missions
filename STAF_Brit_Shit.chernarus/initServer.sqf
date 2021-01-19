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
[west, ["tNight1", "tPatrol"], ["Patrol to <marker name=""mNight1"">Point Doohickey</marker> and camp the night there!", "Camp at Doohickey", "Doohickey"], "mNight1", false, 17, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tCheckpoint", "tPatrol"], ["Patrol to <marker name=""mCDFCheckpoint"">CDF Checkpoint Babushka</marker> and check in with the guard there!", "Patrol to Checkpoint Babushka", "CDF Checkpoint Babushka"], "mCDFCheckpoint", false, 16, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
// Defend
[west, ["tNight2", "tPatrol"], ["Patrol to <marker name=""mNight2"">Point Flabbergast</marker> and camp until night there!", "Camp at Flabbergast", "Point Flabbergast"], "mNight2", false, 15, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tOP1", "tPatrol"], ["Patrol to <marker name=""mOP1"">Point Flibbertigibbet</marker> and scout the area!", "Patrol to Flibbertigibbet", "Point Flibbertigibbet"], "mOP1", false, 14, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tOP2", "tPatrol"], ["Patrol to <marker name=""mOP2"">Point Gobbledygook</marker> and scout the area!", "Patrol to Gobbledygook", "Point Gobbledygook"], "mOP2", false, 13, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tTulga", "tPatrol"], ["Patrol through <marker name=""mTulga"">Tulga</marker> and scout the area!", "Patrol to Tulga", "Tulga"], "mTulga", false, 12, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tNight3", "tPatrol"], ["Patrol to <marker name=""mNight3"">Point Hoosegow</marker> and camp the night there!", "Camp at Hoosegow", "Point Hoosegow"], "mNight3", false, 11, false, "backpack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tEnd", "tPatrol"], ["Patrol to <marker name=""mEnd"">Point Swashbuckler</marker> and regroup with friendly units!", "Patrol to Swashbuckler", "Point Swashbuckler"], "mEnd", false, 10, false, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tArty", ["Opportunity target: locate and destroy the enemy artillery assumed to be somewhere in the <marker name=""mAO"">AO</marker>!", "Destroy Artillery", ""], nil, false, 9, false, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tContact", ["Commander's intent: avoid contact while patrolling in the <marker name=""mAO"">AO</marker>!", "Avoid Contact", ""], nil, false, 8, false, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tCar", ["Commander's intent: avoid using motorised transport while patrolling in the <marker name=""mAO"">AO</marker>!", "Avoid Motorised Transport", ""], nil, false, 7, false, "car"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tRadio", ["Commander's intent: maintain radio silence to command while patrolling in the <marker name=""mAO"">AO</marker>!", "Radio Silence", ""], nil, false, 6, false, "radio"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

/* Mission Flow
Drive to Start
Patrol to Pusta
Find Dead Civies
Patrol to Camp1
Next Noon --> Rain
Enemies depending on Radio Message
Patrol to Checkpoint
Attack on Checkpoint
Patrol to Camp2
Stragglers in the Woods
Disarm / Explode Mines --> Attack based on explosion
Middle of Night --> Clear
Patrol to OP1 --> Something to See
Patrol to OP2 --> Arty to See
Clear Tulga, Destroy Arty --> Helicopter Attack --> Dig In
Next Morning --> Foggy / Sunrise?
Ambush Enemies / Defend
Escape / Exfil
End
*/
[] spawn {
	private _completeTask = {
		[_this, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};

	waitUntil {!(isNil "IP_Briefing")};
	"tBriefing" call _completeTask;

	// Drive to Start
	waitUntil {!(isNil "IP_Start")};
	"tStart" call _completeTask;

	// Patrol to Pusta
	waitUntil {!(isNil "IP_Pusta")};
	"tPusta" call _completeTask;

	// Patrol to Camp1
	waitUntil {!(isNil "IP_Night1")};
	[[1997, 9, 19, 12, 0], true, true] call BIS_fnc_setDate;
	[0, 0, 0] call BIS_fnc_setFog;
	[0.8] call BIS_fnc_setOvercast;
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
	"tNight2" call _completeTask;

	// Patrol to OP1
	waitUntil {!(isNil "IP_OP1")};
	"tOP1" call _completeTask;

	// Patrol to OP2
	waitUntil {!(isNil "IP_OP2")};
	"tOP2" call _completeTask;

	/*
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;*/
};