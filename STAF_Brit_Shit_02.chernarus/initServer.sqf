// Functions
IP_fnc_m_launchFlare = {
		params [
		["_where", [], [[], ""]],
		["_colours", ["F_40mm_Red", "F_40mm_Green", "F_40mm_White", "F_40mm_Yellow"], [[], ""]],
		["_height", 150, [0]], 
		"_pos", 
		"_class", 
		"_flare"
	];

	_pos = if (typeName _where == "STRING") then {(getMarkerPos _where)} else {_where};
	_class = if (typeName _colours == "STRING") then {_colours} else {(_colours call BIS_fnc_selectRandom)};
	_flare = _class createVehicle [(_pos select 0), (_pos select 1), _height];
	_flare setVelocity [0, 0, -10];

	_flare
};

// Markers
"mAmbush" setMarkerAlpha 0;
"mAmbushArea" setMarkerAlpha 0;

// Weather
[0.5, 0.01, 0] call BIS_fnc_setFog;

// Tasks
[west, "tBriefing", ["Report in for briefing!", "Briefing", "Camp Teapot"], "respawn_west", "SUCCEEDED", 21, false, "whiteboard"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, "tPatrol", ["Conduct a recon patrol in the <marker name=""mAO"">AO</marker> between <marker name=""mPusta"">Pusta</marker> and <marker name=""mTulga"">Tulga</marker>!", "Patrol", ""], nil, false, 0, false, "scout"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tStart", "tPatrol"], ["Take the transport to <marker name=""mStart"">Point Cattywampus</marker>!", "Transport to Cattywampus", "Point Cattywampus"], "mStart", "SUCCEEDED", 19, false, "car"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tInvestigate", "tPatrol"], ["Find out what happened at <marker name=""mPusta"">Pusta</marker>!", "Investigate Pusta", "Pusta"], "mPusta", "SUCCEEDED", 19, false, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
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
private _exScenes = ["tulga", "end"]; // "tulga", "end", "valley", "msta"
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
IP_OP3 = true;
IP_Air = true;
IP_OP4 = true;
IP_Msta = true;
IP_Night = true;
IP_Ambush = true;
IP_Flares = true;
IP_End = true;
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
	[(IP_ObjectMap getVariable ["valley", []])] call STAF_fnc_enable;

	[west, "tValley", ["Neutralise the enemy's positions in the <marker name=""mValley"">Valley</marker>!", "Clear the Valley", "Valley"], "mValley", false, 0, true, "map"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tOP3", "tValley"], ["Patrol to <marker name=""mOP3"">Point Lollygag</marker> and scout the area!", "Patrol to Lollygag", "Point Lollygag"], "mOP3", true, 30, true, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tAir", "tValley"], ["Direct friendly air strikes from <marker name=""mOP3"">Point Lollygag</marker>!", "Direct Air Strikes", "Point Lollygag"], "mOP3", false, 28, true, "plane"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, ["tOP4", "tValley"], ["Patrol to <marker name=""mOP4"">Point Snickerdoodle</marker> and neutralise all enemies you encounter on the way!", "Patrol to Snickerdoodle", "Point Snickerdoodle"], "mOP4", false, 26, true, "walk"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, "tMsta", ["Join the tanks to attack and seize <marker name=""mMsta"">Msta</marker>!", "Seize Msta", "Msta"], "mMsta", false, 24, true, "attack"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[west, "tTanks", ["Protect the friendly tanks!", "Protect Tanks", ""], nil, false, 0, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	// Patrol to OP3
	waitUntil {!(isNil "IP_OP3")};
	"tOP3" call _completeTask;

	// Direct Air Strikes
	waitUntil {!(isNil "IP_Air")};
	"tAir" call _completeTask;

	// Patrol to OP4
	waitUntil {!(isNil "IP_OP4")};
	"tOP4" call _completeTask;
	"tValley" call _completeTask;
	[(IP_ObjectMap getVariable ["msta", []])] call STAF_fnc_enable;

	// Clear Msta
	waitUntil {!(isNil "IP_Msta")};
	"tMsta" call _completeTask;
	[west, "tDefendMsta", ["Dig in for the night and defend <marker name=""mMsta"">Msta</marker> against any counter attack!", "Defend Msta", "Msta"], "mMsta", true, 20, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_Night")};
	[[1997, 9, 21, 2, 24], true, true] call BIS_fnc_setDate;
	[0] call BIS_fnc_setOvercast;
	sleep 10;
	"mAmbush" setMarkerAlpha 1;
	"mAmbushArea" setMarkerAlpha 1;
	[west, ["tAmbush", "tDefendMsta"], ["Ambush the enemy convoy coming in from the <marker name=""mAmbushArea"">north-western road to Msta</marker>!", "Ambush Enemy Convoy", "Road"], "mAmbushArea", true, 22, true, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_Ambush")};
	"tAmbush" call _completeTask;

	waitUntil {!(isNil "IP_Flares")};
	[] spawn {
		while {IP_Flares} do {
			private _pos = [["mMstaArea"]] call BIS_fnc_randomPos;
			[_pos, ["ACE_40mm_Flare_white", "ACE_40mm_Flare_red", "ACE_40mm_Flare_green"]] call IP_fnc_m_launchFlare; 
			sleep (5 + (random 5));
		};
	};

	waitUntil {!(isNil "IP_End")};
	"tDefendMsta" call _completeTask;
	"tTanks" call _completeTask;
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};