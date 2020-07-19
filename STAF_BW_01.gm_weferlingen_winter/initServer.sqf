// Markers
"mSchematics" setMarkerAlpha 0;

// Weather
0 setFog [1, 0.02, 0];

// Tasks
[west, "tSchematics", ["Secure the schematics of Objekt 188!", "Secure Schematics", ""], objNull, false, 1, false, "intel"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tInsert", "tSchematics"], ["Insert into the GDR at <marker name=""mCrossingIn"">Crossing Alpha</marker>!", "Insert", "Crossing Alpha"], "mCrossingIn", true, 7, false, "getin"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tMeet", "tSchematics"], ["Meet with code name 'Seemöwe' <marker name=""mMeet"">north-west of Walbeck</marker> to receive the schematics!", "Meet Seemöwe", "Meeting Point"], "mMeet", false, 6, false, "meet"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];
[west, ["tExfil", "tSchematics"], ["Exfil from the GDR at <marker name=""mCrossingOut"">Crossing Bravo</marker>!", "Exfil", "Crossing Bravo"], "mCrossingOut", false, 2, false, "getout"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

// Mission Flow
[] spawn {
	private _completeTask = {
		[_this, "SUCCEEDED"] remoteExecCall ["BIS_fnc_taskSetState", 0, true];
	};

	waitUntil {!(isNil "IP_Inserted")};
	"tInsert" call _completeTask;

	waitUntil {!(isNil "IP_Met")};
	"tMeet" call _completeTask;
	[west, ["tBorderGuardHQ", "tSchematics"], ["Free Seemöwe's contact in the <marker name=""mBorderGuardHQ"">Border Guard HQ in Walbeck</marker> in order to learn the location of the schematics!", "Raid Border Guard HQ", "Border Guard HQ"], "mBorderGuardHQ", true, 5, true, "kill"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_Raided")};
	"tBorderGuardHQ" call _completeTask;
	"mSchematics" setMarkerAlpha 1;
	[west, ["tIntel", "tSchematics"], [" Find the schematics hidden at the <marker name=""mSchematics"">ruins in east Walbeck</marker>!", "Find Schematics", "Ruins"], "mSchematics", true, 4, true, "search"] remoteExecCall ["BIS_fnc_taskCreate", 0, true];

	waitUntil {!(isNil "IP_IntelTaken")};
	"tIntel" call _completeTask;

	waitUntil {!(isNil "IP_Exfiled")};
	"tExfil" call _completeTask;

	waitUntil {!(isNil "IP_End")};
	"tSchematics" call _completeTask;
	sleep 10;
	["STAF_Win"] call BIS_fnc_endMissionServer;
};