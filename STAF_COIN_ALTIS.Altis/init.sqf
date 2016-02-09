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

//Add everytjomg to Zeus
{ 
	_x addCuratorEditableObjects [( allMissionObjects "All" ), true ];
	false 
} count allCurators;

//_________________________________________Scripts_________________________________________//

//Interior Light
nul = [] execVM "scripts\IntLight.sqf";

//MHQ script
nul = [] execVM "MHQ\initMHQ.sqf";

//_________________________________________Post Processing && Weather_________________________________________//
0 setFog [0.1, 0.01, 0];

//_________________________________________AI Skill_________________________________________//

{
	_x setSkill ["aimingspeed", 0.5];
	_x setSkill ["spotdistance", 0.85];
	_x setSkill ["aimingaccuracy", 0.65];
	_x setSkill ["aimingshake", 0.5];
	_x setSkill ["spottime", 0.45];
	_x setSkill ["spotdistance", 0.5];
	_x setSkill ["commanding", 1];
	_x setSkill ["general", 1];
} forEach allUnits;