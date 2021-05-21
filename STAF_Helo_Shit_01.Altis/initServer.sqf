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

IP_fnc_m_completeTask = {
	[_this, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

 IP_fnc_m_cancelTask = {
	[_this, "CANCELED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
};

// Markers
{_x setMarkerAlpha 0} forEach ["mPolice", "mInjured", "mMines", "mAACaches", "mAACachesArr", "mWreck", "mAmbush1", "mAmbush2"];

// Weather
// [0.5, 0.01, 0] call BIS_fnc_setFog;

// Tasks
[independent, "tPatrol", ["Conduct an air patrol in the <marker name=""mAO"">AO</marker> and stand-by for additional tasks!", "Patrol", ""], nil, true, 0, false, "heli"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Objects
private _exScenes = ["end"]; // "end", "arrest", "mine", "supply", "aaCaches", "wreck"
{
	private _scene = _x getVariable ["IP_Scene", ""];
	if ((_scene != "") && {!(_scene in _exScenes)}) then {
		private _objs = (IP_ObjectMap getVariable [_scene, []]);
		_objs pushBack _x;
		IP_ObjectMap setVariable [_scene, _objs];
		[_x] call STAF_fnc_disable;
	};
} forEach (allMissionObjects "All");

// Arrest
[] spawn {
	waitUntil {!(isNil "IP_ArrestStart")};
	[independent, ["tArrest", "tPatrol"], ["Support the <marker name=""mPolice"">Police Unit in Chalkeia Bay</marker> in arresting a fugitive that tries to flee by boat!", "Arrest Fugitive on Boat", "Police Unit"], "mPolice", true, 100, true, "boat"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	"mPolice" setMarkerAlpha 1;
	[(IP_ObjectMap getVariable ["arrest", []])] call STAF_fnc_enable;

	waitUntil {!(isNil "IP_ArrestEnd")};
	"tArrest" call IP_fnc_m_completeTask;
};

// Mines
[] spawn {
	waitUntil {!(isNil "IP_MinesStart")};
	[independent, ["tMine", "tPatrol"], ["Clear the <marker name=""mMines"">Quarry south of Pyrgos</marker> of mines!", "Clear Mines", "Quarry"], "mMines", true, 90, true, "mine"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	"mInjured" setMarkerAlpha 1;
	"mMines" setMarkerAlpha 1;
	[(IP_ObjectMap getVariable ["mine", []])] call STAF_fnc_enable;

	waitUntil {!(isNil "IP_MinesEnd")};
	"tMine" call IP_fnc_m_completeTask;
};

// Injured
// [_this, true] call ace_medical_fnc_setUnconscious;
[] spawn {
	waitUntil {!(isNil "IP_InjuredStart")};
	[independent, ["tInjured", "tPatrol"], ["Evacuate the injured civilian to the <marker name=""mHospital"">Kavala Hospital</marker>!", "Evacuate Civilian", "Kavala Hospital"], "mHospital", true, 88, true, "heal"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	
	waitUntil {!(isNil "IP_InjuredEnd")};
	"tInjured" call IP_fnc_m_completeTask;
};

// Supply
[] spawn {
	waitUntil {!(isNil "IP_SupplyStart")};
	[independent, ["tSupply", "tPatrol"], ["Resupply <marker name=""mOutpostBig"">Outpost Greatview</marker> with supplies from <marker name=""respawn_guerrila"">FARP Dry Sand</marker>!", "Resupply Outpost Greatview", "Outpost Greatview"], "mOutpostBig", true, 80, true, "container"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[(IP_ObjectMap getVariable ["supply", []])] call STAF_fnc_enable;

	waitUntil {!(isNil "IP_SupplyEnd")};
	"tSupply" call IP_fnc_m_completeTask;
};

// Mortar
[] spawn {
	waitUntil {!(isNil "IP_MortarStart")};
	[independent, ["tMortar", "tPatrol"], ["Locate and destroy the enemy mortar attacking <marker name=""mOutpostBig"">Outpost Greatview</marker>!", "Locate and Destroy Mortar", "Outpost Greatview"], nil, true, 78, true, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_MortarEnd")};
	"tMortar" call IP_fnc_m_completeTask;
};

// Defend
[] spawn {
	waitUntil {!(isNil "IP_DefendStart")};
	[independent, ["tDefend", "tPatrol"], ["Help defend <marker name=""mOutpostBig"">Outpost Greatview</marker>!", "Defend Outpost Greatview", "Outpost Greatview"], "mOutpostBig", true, 76, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_DefendEnd")};
	"tDefend" call IP_fnc_m_completeTask;
};

// CASEVAC
// [_this, true] call ace_medical_fnc_setUnconscious;
[] spawn {
	waitUntil {!(isNil "IP_CasevacStart")};
	[independent, ["tCasevac", "tPatrol"], ["Provide CASEVAC for <marker name=""mOutpostSmall"">Outpost Smallview</marker> and transport casualties to the <marker name=""mAAFHQ"">AAF HQ</marker>!", "CASEVAC Outpost Smallview", "Outpost Smallview"], "mOutpostSmall", true, 74, true, "heal"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_CasevacEnd")};
	"tCasevac" call IP_fnc_m_completeTask;
};

// AA Cache
[] spawn {
	waitUntil {!(isNil "IP_AACachesStart")};
	[independent, ["tAACaches", "tPatrol"], ["Locate and destroy all FIA AA launcher caches <marker name=""mAACaches"">in the North</marker>!", "Destroy AA Caches", "AA Caches"], "mAACaches", true, 72, true, "destroy"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
	[(IP_ObjectMap getVariable ["aaCache", []])] call STAF_fnc_enable;
	{_x setMarkerAlpha 1} forEach ["mAACaches", "mAACachesArr"];

	waitUntil {!(isNil "IP_AACachesEnd")};
	"tAACaches" call IP_fnc_m_completeTask;
};

// End
[] spawn {
	waitUntil {!(isNil "IP_End")};
	"tPatrol" call IP_fnc_m_completeTask;
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};