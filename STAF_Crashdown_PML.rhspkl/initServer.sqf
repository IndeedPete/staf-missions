// Markers
"mMeet" setMarkerAlpha 0;
"mShelter" setMarkerAlpha 0;

// Weather
//0 setFog [1, 0.02, 0];

// Tasks
[west, "tSurvive", ["Survive long enough to be extracted!", "Survive", ""], objNull, false, 1, false, "run"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tRegroup", "tSurvive"], ["Make your way to the <marker name=""mRegroup"">Emergency Beacon</marker> and regroup with other survivors!", "Regroup", "Emergency Beacon"], "mRegroup", true, 7, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tContact", "tSurvive"], ["Find a radio and contact HQ on channel 4, frequency 150!", "Contact HQ", ""], objNull, false, 6, false, "radio"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Mission Flow
[] spawn {
	private _completeTask = {
		[_this, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};

	waitUntil {!(isNil "IP_Regrouped")};
	"tRegroup" call _completeTask;

	waitUntil {!(isNil "IP_Contacted")};
	"tContact" call _completeTask;
	/*[west, ["tBorderGuardHQ", "tSurvive"], ["Free Seemöwe's contact in the <marker name=""mBorderGuardHQ"">Border Guard HQ in Walbeck</marker> in order to learn the location of the schematics of Objekt 188!", "Raid Border Guard HQ", "Border Guard HQ"], "mBorderGuardHQ", true, 5, true, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_Raided")};
	"tBorderGuardHQ" call _completeTask;
	"mSchematics" setMarkerAlpha 1;
	[west, ["tIntel", "tSurvive"], [" Find the schematics of Objekt 188 hidden at the <marker name=""mSchematics"">ruins in east Walbeck</marker>!", "Find Schematics", "Ruins"], "mSchematics", true, 4, true, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_IntelTaken")};
	"tIntel" call _completeTask;

	waitUntil {!(isNil "IP_Exfiled")};
	"tExfil" call _completeTask;

	waitUntil {!(isNil "IP_End")};
	"tSurvive" call _completeTask;
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;*/
};