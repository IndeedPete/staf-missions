//_________________________________________Mission Settings_________________________________________//

//TFR
tf_no_auto_long_range_radio = true;
tf_same_sw_frequencies_for_side = true;
tf_give_personal_radio_to_regular_soldier = true;
tf_same_lr_frequencies_for_side = true;
tF_give_microdagr_to_soldier = false;
tF_speakerDistance = 30;

//Disable Saving and Auto Saving
enableSaving [false, false];

//Mute Orders and Reports
enableSentences false;

//No "XXX is now Zeus" Message
zeusmodule1 setVariable ["showNotification", false];
zeusmodule2 setVariable ["showNotification", false];
zeusmodule3 setVariable ["showNotification", false];
zeusmodule4 setVariable ["showNotification", false];
zeusmodule5 setVariable ["showNotification", false];

//Add everything to Zeus
{ _x addCuratorEditableObjects [( allMissionObjects "All" ), true ]; false } count allCurators;

//_________________________________________Scripts_________________________________________//

//Interior Light
nul=[] execVM "scripts\IntLight.sqf";

//IgiLoad
nul=[] execVM "IgiLoad\IgiLoadInit.sqf";

//_________________________________________Post Processing_________________________________________//


//_________________________________________AI Skill_________________________________________//

/*{
_x setSkill ["aimingspeed", 0.5];
_x setSkill ["spotdistance", 0.85];
_x setSkill ["aimingaccuracy", 0.65];
_x setSkill ["aimingshake", 0.5];
_x setSkill ["spottime", 0.45];
_x setSkill ["spotdistance", 0.5];
_x setSkill ["commanding", 1];
_x setSkill ["general", 1];
} forEach allUnits;*/

//_________________________________________MHQ Marker_________________________________________//

	if (isServer) then {
		marker1 = createMarker ["MHQMarker1", position MHQ1];
		"MHQMarker1" setMarkerText "MHQ 1";
		"MHQMarker1" setMarkerType "b_hq";

		[] spawn {
			while {not isnull MHQ1} do {
				"MHQMarker1" setmarkerpos getpos MHQ1;
				sleep 0.5;
			};
		};
	};
	if (isServer) then {
		marker2 = createMarker ["MHQMarker2", position MHQ2];
		"MHQMarker2" setMarkerText "MHQ 2";
		"MHQMarker2" setMarkerType "b_hq";

		[] spawn {
			while {not isnull MHQ2} do {
				"MHQMarker2" setmarkerpos getpos MHQ2;
				sleep 0.5;
			};
		};
	};
	if (isServer) then {
		marker3 = createMarker ["MHQMarker3", position MHQ3];
		"MHQMarker3" setMarkerText "MHQ 3";
		"MHQMarker3" setMarkerType "b_hq";

		[] spawn {
			while {not isnull MHQ3} do {
				"MHQMarker3" setmarkerpos getpos MHQ3;
				sleep 0.5;
			};
		};
	};
