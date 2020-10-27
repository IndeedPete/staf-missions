// Markers
"mCrater" setMarkerAlpha 0;
"mFarm" setMarkerAlpha 0;

// Weather
0 setFog [1, 0.1, 25];

// Tasks
[west, "tDeliver", ["Deliver the prisoner to <marker name=""respawn_west"">Blacksite 67</marker>!", "Deliver Prisoner", "Blacksite 67"], "respawn_west", true, 7, false, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

/*/ Mission Flow
Drop Off Prisoner
Stay / Wait
Defend <-- Guerillas
Investigate Crater <-- Zombies
Defend <-- Zombies
Rescue Scouts
Wendigo at Shop
Defend <-- Zombies, Guerillas & Prisoner
End
*/
[] spawn {
	private _completeTask = {
		[_this, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};

	waitUntil {!(isNil "IP_Delivered")};
	"tDeliver" call _completeTask;
	[west, "tWait", ["A tunnel on the mountain pass you came through collapsed and you cannot return. Wait at <marker name=""respawn_west"">Blacksite 67</marker> for extraction!", "Wait", "Blacksite 67"], "respawn_west", true, 7, true, "wait"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_Attack")};
	"tWait" call _completeTask;
	[west, "tDefend", ["Defend <marker name=""respawn_west"">Blacksite 67</marker>!", "Defend Blacksite 67", "Blacksite 67"], "respawn_west", true, 7, true, "defend"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_Defended")};
	"tDefend" call _completeTask;
	"mCrater" setMarkerAlpha 1;
	[west, "tInvestigate", ["Investigate the <marker name=""mCrater"">Crater</marker>!", "Investigate Crater", "Crater"], "mCrater", true, 7, true, "scout"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_InCrater")};
	"tInvestigate" call _completeTask;
	[west, "tSurvive", ["Survive the night!", "Survive", ""], nil, true, 5, true, "run"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_BackAtBase")};
	"mFarm" setMarkerAlpha 1;
	[west, "tScouts", ["Look for the missing scouts at the <marker name=""mFarm"">Old Farm</marker>!", "Rescue Scouts", "Old Farms"], "mFarm", true, 7, true, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_ScoutsFound")};
	"tScouts" call _completeTask;

	waitUntil {!(isNil "IP_End")};
	"tSurvive" call _completeTask;
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};